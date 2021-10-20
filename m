Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1EA4342D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 03:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhJTB05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 21:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhJTB05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 21:26:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5BBC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:24:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u21so11463196lff.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ScUDD7aihsr5j2zsrm0f+Y3vYQ6YnNqYwyltABZwstY=;
        b=hG15aV6Ah5NZpALQFKlWDzZnDK4qEEXzJhWSbdpVrqfVEmFEakIRcu2zOjFBZSdwuv
         c+1/ue0IoEz3lSOCZRqc7pqPB/4hECPwVBEoZ7uW4cw2z8QaB1V9MthKSYdP63OcNKSL
         +TqmjxT3JokutiFEaO8NhQY1djl+WwZtn4XgjWNw+U1xpT37WTQIUmdXHo9dhb8+93vI
         pqFgV8WlPuA+bnD8132XbJjtsLqFyhSLyd2Yd+VHis+gs2Aj/vQccTok59PMqL7KwkU0
         r9bsgyauX/p4FUPOWQxpnIGt+GT96awd/phWB0SLVamEWnjp7CS5Lh4AaC0EBcdgIFXf
         /7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ScUDD7aihsr5j2zsrm0f+Y3vYQ6YnNqYwyltABZwstY=;
        b=2VDuK/kMHO0JvzQTjkIJ2eDBLL9adJXubwA6wHpo0VODEmTYUPUbYHx+9RX7VGjfIN
         EXjdzPDJR4/qrXAd6YHMG+tuYSh4Jf5rpCNL+wXyV1cX3RxpSTGwRiFuG2Dhlbj5POIN
         8U28sEPgsAStQ4R9wl1rNZBT4m3Ozo/vcf5Rj+Wz5RZXmBL/BqzambEewT4Fbq+Hs1b4
         5THI8cP8TrOzNs2SXxlttPhu5G0iPG9K2TIWe3dFWSktcdZ8/JBYDioA1nFTKDVb/QxB
         MtqgBzD9Bxz1/ocqcd0Z9L9PCa47NW+ME/socZjhoHJ1yAHam2jfpewjokmNGKmc04jo
         yi8g==
X-Gm-Message-State: AOAM530Hv2W9PoJxM4EOQDz6N/8V+vtmpbqx7yM/jbjrGy8rf3wZjhww
        +cBdxtQso+WCui38vhpnVZfYJw==
X-Google-Smtp-Source: ABdhPJwaC6Ho3QMoVW/P2ng8/aJdZL8LfWNApWiFB1DQj+Di1iVrEP9QYyXOwCm8xAN9MnRmoRmSOw==
X-Received: by 2002:a05:6512:31cc:: with SMTP id j12mr9298401lfe.299.1634693081936;
        Tue, 19 Oct 2021 18:24:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o21sm63978ljg.93.2021.10.19.18.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 18:24:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2] soc: qcom: rpmhpd: fix sm8350_mxc's peer domain
Date:   Wed, 20 Oct 2021 04:24:40 +0300
Message-Id: <20211020012440.1183075-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sm8350_mxc's domain description incorrectly references
sm8150_mmcx_ao as a peer instead of sm8350_mxc_ao. Correct this typo.

Fixes: 639c85628757 ("soc: qcom: rpmhpd: Add SM8350 power domains")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index fa209b479ab3..5fc5f04249d4 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -204,7 +204,7 @@ static const struct rpmhpd_desc sm8250_desc = {
 static struct rpmhpd sm8350_mxc_ao;
 static struct rpmhpd sm8350_mxc = {
 	.pd = { .name = "mxc", },
-	.peer = &sm8150_mmcx_ao,
+	.peer = &sm8350_mmcx_ao,
 	.res_name = "mxc.lvl",
 };
 
-- 
2.33.0

