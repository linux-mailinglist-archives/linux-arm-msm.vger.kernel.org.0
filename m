Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647D2419334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 13:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbhI0LiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 07:38:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:43108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234075AbhI0LiP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 07:38:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED57060F58;
        Mon, 27 Sep 2021 11:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632742597;
        bh=Rl3OTC7V1DvxO5S+CLcKb/G4xypiFLCG7rhJzIouM9o=;
        h=From:To:Cc:Subject:Date:From;
        b=GIRQdOlWtQeOMLb+VYfzHERHrDKA38VhnFhqfoB27L2ZztW1kG/YwfGnx8+bG5m2w
         tIDcTjzg8OBfBy9I1T9duPEeXgoEHSjzRE69zF4UJ7AN7s9NWuE0m658Wci7xL0xai
         ea0aXKeWWRmrVH1JbjRfizMoUuLHo3hr8X0TrZixmNsPDHbeeIng78GbIcOuvMrqu8
         SE4vg9tVwLTVvaJB9O6sjiGoXNzhsd0WjChOtXE+Iu3PjfXtqu4Gt2Iej5V8WYyQ4x
         +/9bhZDBAYhH7wIdixdaYvEL5yVXxdw563oV7wHam7QvEezxKicYyfyS58W33vgEEx
         LNh6HRkSCn50A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH] drm/msm/submit: fix overflow check on 64-bit architectures
Date:   Mon, 27 Sep 2021 13:36:23 +0200
Message-Id: <20210927113632.3849987-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The overflow check does causes a warning from clang-14 when 'sz' is a type
that is smaller than size_t:

drivers/gpu/drm/msm/msm_gem_submit.c:217:10: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                if (sz == SIZE_MAX) {

Change the type accordingly.

Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fdc5367aecaa..ac23bbdb0bab 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -171,7 +171,8 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
-	unsigned i, sz;
+	unsigned i;
+	size_t sz;
 	int ret = 0;
 
 	for (i = 0; i < args->nr_cmds; i++) {
-- 
2.29.2

