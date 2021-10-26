Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5A243B3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 16:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbhJZO1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 10:27:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235005AbhJZO1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 10:27:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B744F610E5;
        Tue, 26 Oct 2021 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635258323;
        bh=CCPB4RRkX6JYEDol0ilOJjnvgGwsxTWxj1m6hC9Unvg=;
        h=From:To:Cc:Subject:Date:From;
        b=FevFKkkahfcBvXUluNFV8XWL623aVtESiXqX5+x96qnnwfRJBZ/7DgzssX5MBy5VU
         SO9qRZiztot16VLlmrX5qYhPxNr9Ht2VTtI9VeA53kV3S7X3cM9NPti87IijfZzcMC
         8Ez4VSqWyhhWYgeo+toa3SCXy80tAPh11PSplvfJjHyiPIfz0S1a4ufPdDYIEKrcVm
         xOZ8qZoLOpHrP5BI5831gMUH9WipGyRqNm7nfAMD8VreZXjAmT3q9XkNVG7OuNCRN7
         +NSc7FNZzsW+jckAoZGdPMk4lziNnka1QUQeiMDTJw48CqLL/RET09ZmK65H2wcy+E
         DDLowRuKtETnw==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: [PATCH] drm/msm/dpu: Remove commit and its uses in dpu_crtc_set_crc_source()
Date:   Tue, 26 Oct 2021 07:24:36 -0700
Message-Id: <20211026142435.3606413-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.1.637.gf443b226ca
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang warns:

drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:162:6: error: variable 'commit' is uninitialized when used here [-Werror,-Wuninitialized]
        if (commit)
            ^~~~~~
drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:106:32: note: initialize the variable 'commit' to silence this warning
        struct drm_crtc_commit *commit;
                                      ^
                                       = NULL
1 error generated.

The assignment and use of commit in the main body of
dpu_crtc_set_crc_source() were removed from v1 to v2 but the call to
drm_crtc_commit_put() at the end was not. Do that now so there is no
more warning.

Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
Link: https://github.com/ClangBuiltLinux/linux/issues/1493
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2523e829f485..967245b8cc02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -103,7 +103,6 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	enum dpu_crtc_crc_source current_source;
-	struct drm_crtc_commit *commit;
 	struct dpu_crtc_state *crtc_state;
 	struct drm_device *drm_dev = crtc->dev;
 	struct dpu_crtc_mixer *m;
@@ -159,8 +158,6 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 
 cleanup:
-	if (commit)
-		drm_crtc_commit_put(commit);
 	drm_modeset_unlock(&crtc->mutex);
 
 	return ret;

base-commit: 00326bfa4e6363e4b0b8b019ecd2556fdda5ad1c
-- 
2.33.1.637.gf443b226ca

