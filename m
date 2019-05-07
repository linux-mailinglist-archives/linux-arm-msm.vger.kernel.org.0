Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F12A16B23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 21:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfEGTSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 15:18:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfEGTSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 15:18:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 26C8A60452; Tue,  7 May 2019 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256699;
        bh=Q/mJwJuOJwy/EQv6iKT7QRDV1FjoviOEpC04L2Tcpzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=clytPUMUyQJU9mZ3iQJhSorKr4bLOcP19X/kXHXhWA5QX1Mn9B5TzrYviStSM/Nnm
         M/cPXKYfoYMTpL6i8+uqASwLRSYqdQoYoXcdrng1VTA56bDviWXJsiqbMuIZ8zQSAh
         B4Gt8uAXZLu25DYls9DvzEO2gELrALW4Cmxny6/4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FC3061194;
        Tue,  7 May 2019 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557256697;
        bh=Q/mJwJuOJwy/EQv6iKT7QRDV1FjoviOEpC04L2Tcpzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eF8zL64FNZTGzDK9ZVMecOUGA2iNRn2Jc8k37M/rPgQq742AAsyBP6rCz7puQVNAY
         TYI1gGniTkn5FVCIzdmk0WaxThd4R+ipmv+dfqGdm+ihRkyWhUsp+WKM2NxtyOwsbq
         nXzAjIFCB1ZgUal4J6Ct1Er17YcC8QJnthfZL4Rw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FC3061194
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Kees Cook <keescook@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/msm/dpu: Fix error recovery after failing to enable clocks
Date:   Tue,  7 May 2019 13:18:09 -0600
Message-Id: <1557256691-25798-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If enabling clocks fails in msm_dss_enable_clk() the code to unwind the
settings starts at 'i' which is the clock that just failed. While this
isn't harmful it does result in a number of warnings from the clock
subsystem while trying to unpreare/disable the very clock that had
just failed to prepare/enable. Skip the current failed clock during
the unwind to to avoid the extra log spew.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
index 78833c2..a40a630 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
@@ -114,9 +114,9 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
 				rc = -EPERM;
 			}
 
-			if (rc) {
-				msm_dss_enable_clk(&clk_arry[i],
-					i, false);
+			if (rc && i) {
+				msm_dss_enable_clk(&clk_arry[i - 1],
+					i - 1, false);
 				break;
 			}
 		}
-- 
2.7.4

