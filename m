Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976013A1EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhFIVT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFIVT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:19:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1C5C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 14:17:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id r198so36935389lff.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
        b=veUbKvFuP+oeRBedT0sA1vDhr4e4ydtyhtT3/h7V+gSmDwiyvxR6zHy3SMEQMoXoMW
         AK1RfF4RGMC9Uzgk6KOOJW+9P2pHXupJrfbdYU22wah55kA7pFU2VhQMtgpc+4kaaBmz
         I8wg8lepdj50/CpnLfAYxgp0C5ERqGNQUzaAKIjj5WDo0k0lQndM9RBREnHDGwnSHsUd
         0VL7eN8NZYseDCmb3V3Z2qob5Z2/Q484J83/lMXNR8fXjaWKvY0oK6KpiM1Asj+R0tQ1
         1H3wkdotJlWItvokNG0gcd81i/ZQwq1HgST2YBxnH1TR+xvptHf1PAkP5VsElPAsPWZv
         wEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
        b=Od9Uzad3EakVZ0nA5/+y4mOqHOjI2M4MiMhCO9p2IAQATrxGWYgNnBYJcqBBDET2e2
         cHY8fz1bD6C2BeZNF7vUyHpxvOWc7AF8jhxXpn6sNx8yC2jpDVaFiVxjkeDSkiIss6u6
         TUqSHgP9mKkhPgMxGHsmBfaHn2/Vs3Lhzt6sfIvNRWk6l1FCCgiOYxX3i4yANlCgMDEC
         UBftU2F8k+9e+O7nYWpo8RRwRGDNsttM7UGFAB0RjDEBEqFvdAPjJX8+CchEBRpBsb5n
         5vlPT+qVuN4XQpx0fhXmWkli+HHWQS2zfLTKoVp27HEiem5OO9dKS0xn6jSTpuithVCO
         bjLQ==
X-Gm-Message-State: AOAM532jznI1hsgiCNNVdlKunf3jRWaBz6enJZzz4TPoBmbAHOF5DCUV
        SeJNJ9Z/HqrgEaXPPeVK4Zg10Q==
X-Google-Smtp-Source: ABdhPJzudnpj/64IqWAGrrfaxZulORJw5W1hzbM1Fow+AwNmT786V1WzHSUiw8NLtKZtLD/Ai9wa2w==
X-Received: by 2002:a19:7d82:: with SMTP id y124mr906597lfc.76.1623273449059;
        Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 4/6] drm/msm/dp: stop calling set_encoder_mode callback
Date:   Thu, 10 Jun 2021 00:17:21 +0300
Message-Id: <20210609211723.2565105-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

