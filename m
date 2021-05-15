Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4363818F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 15:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhEONNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 09:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhEONNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 09:13:40 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E4CC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m11so2263779lfg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9DuEWMm5M2L6gmXMhOgxeE1Pc1jdVhMtQW/eO8kuudI=;
        b=YTlDcQtpIGhYfIB8prq1IELgZ+d5AxNsl5HguR7DaUjzQKhpbH//wP3ODP4UdFxLed
         Ge4gZe09AIw5yFRGuRg7tJfWVU0m9g4pXdyDyJPahka/W7Hp5hi8WdiK4ngAirxYhBED
         m4aFs0Ex1jGAsHtaKT8i4SVN2rAuXzrwyaWmfUuwvpV5X6GeG9Pwo5PB5M8n+yBZQQKq
         Q5iBlAEvy/L0+YfaPoLUU584SMLnMZFwcYvrOPIBoYfbnW84BXPsFCHevH/gNMljxTvY
         6HSlHmqmJqr3NRDPxsi6P5KlI4CnUl06zaFRyIUNX7OTEeZTWjyHRUjjgv4ZfoMoFinS
         puOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9DuEWMm5M2L6gmXMhOgxeE1Pc1jdVhMtQW/eO8kuudI=;
        b=SiGxDq9gYYc7pDIQeYAlgQKIbEYRkC/jKKo5ojaWPN0lKxkRevwBWollAWz9JrvR7H
         EnWG20dnT09s3qreS8m3qlfdWPpbytb1ZlJtz8mgo9S/dBN9NubgNREMLM7kN2D8y2+M
         6kWddfVTIqQaqtVuqnXJKdP3UvdFFhAw41TsRZR1bhz/EPtj62GuNInieJwPc/ZAoO6j
         R3+bXGyU+ClspampY2x8CEKgB+VDs5qoOdHAjLleMuWBBMhukdqBElAEMIBhFnHCQu1I
         xT4FQyoy8tX6e9s5mJBLAVOKg/PuD1vnBNWxQ8BHdisbCKqliozrZ5M7flg33NvRH/GV
         H0vA==
X-Gm-Message-State: AOAM530nswQBSiMdFpJcxAmyuqd75AtHCOnI7mI7bwUmP3zrUXL/aLXL
        RakjR9ubIKKiPI7HKOC4vTxhcA==
X-Google-Smtp-Source: ABdhPJzHr0ZVfCnO+L4b6T13R8FUWySgHybpSM5MK8z1CaFvksAsRSafWpMgUuty7M00da1nGSlQAg==
X-Received: by 2002:a05:6512:3252:: with SMTP id c18mr34985282lfr.11.1621084342214;
        Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:12:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/8] arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
Date:   Sat, 15 May 2021 16:12:12 +0300
Message-Id: <20210515131217.1540412-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1372fe8601f5..9e550e3ad678 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -413,6 +413,9 @@ &dsi1 {
 
 	qcom,dual-dsi-mode;
 
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 	ports {
 		port@1 {
 			endpoint {
-- 
2.30.2

