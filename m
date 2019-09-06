Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CB1AC06F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388818AbfIFTX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:23:58 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:47078 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390263AbfIFTX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:23:57 -0400
Received: by mail-io1-f67.google.com with SMTP id x4so15179938iog.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/k1s41Cd84FscFUH5HHkD4volUIZMrS8vWB51FggFg=;
        b=RVUr+41FgmB62dAmBtO1Yq+z6nYqWpcb7vKjFfyJhjKwnK2zetlCIe4aATNsLL5Igw
         63by+MASskqj+6jzFzFqSsjREa0+GkcMUAoeg4H9GmmkSkEDivCEm46WJVBXxXlYGmlH
         NVFZ/59Xrc+sZiOFTXGT5XjfVM+a7JzT0eVK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/k1s41Cd84FscFUH5HHkD4volUIZMrS8vWB51FggFg=;
        b=LDyc5e61z5S2pu8IzTAhxHncq7f4wur9/LzibUqLXwJ537WX/7xwwXELtrmKRizkWY
         KVwhS25ct9L7glt2I2Oau+30pKdYcMIycf7xsPM2mVMS1Q485gTc9uKWEzMDz417Hx6O
         rzk4OvTRMJdzsoHTp4G8uV6ezOQ6zZW2zOWNd9gdFVAzG9rZdRpR9ezuFDZBzigMVo62
         NhB1uDNcIQ6Jhen4W0ah4347rm7PprLUBnmhiUDEhVNsB5cUix0dgL/iDeoHKQuEUr73
         +1WEn0RXFJD6gZds3AQxf0/WdRoTfMETR/mnglvBifXDWBvY6PA7a3oSehHoDuXgCTqR
         +dSA==
X-Gm-Message-State: APjAAAXYdlZ8cT0feWYvEzrFH1YveWwHyFTKNR2Oixb826QE0o/Cp++d
        TUeOqjcAzBCUr/rIk7PgXKzLPg==
X-Google-Smtp-Source: APXvYqxqS6QiXdDk5JDrakHdF9YlW8kNKtcmhtlrPTEYPW9EklfJ+iKnRmaedLHEBp6mDxHHlcHM/w==
X-Received: by 2002:a02:cad1:: with SMTP id f17mr8739258jap.18.1567797836589;
        Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Sep 2019 13:23:42 -0600
Message-Id: <20190906192344.223694-4-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

drm_crtc.dev will never be NULL, so no need to check it.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 6 +++---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 094d74635fb7..839887a3a80c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -33,11 +33,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
 
-	if (!crtc->dev) {
-		DPU_ERROR("invalid device\n");
-		return NULL;
-	}
-
 	priv = crtc->dev->dev_private;
 	if (!priv->kms) {
 		DPU_ERROR("invalid kms\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ead7d657097c..0b9dc042d2e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -266,7 +266,7 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
 
-	if (!crtc || !crtc->dev) {
+	if (!crtc) {
 		DPU_ERROR("invalid crtc\n");
 		return INTF_MODE_NONE;
 	}
@@ -694,7 +694,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	unsigned long flags;
 	bool release_bandwidth = false;
 
-	if (!crtc || !crtc->dev || !crtc->state) {
+	if (!crtc || !crtc->state) {
 		DPU_ERROR("invalid crtc\n");
 		return;
 	}
@@ -766,7 +766,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	struct msm_drm_private *priv;
 	bool request_bandwidth;
 
-	if (!crtc || !crtc->dev) {
+	if (!crtc) {
 		DPU_ERROR("invalid crtc\n");
 		return;
 	}
-- 
2.20.1

