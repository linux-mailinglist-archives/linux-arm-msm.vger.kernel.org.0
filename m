Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5B92EBE07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 13:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbhAFMzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 07:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbhAFMzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 07:55:49 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43441C061372
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 04:54:41 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id g3so1516228plp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ss2w8RtuPlA2YyEul7yH/oRV2xkdzOLZR02ZknSfhJE=;
        b=ThcBf1ptqd2E+91w+xNrcZvckTLtcC2af676Ai+7YFSMB+wXqtoFZfJgWZPpBYa5cS
         F8wXfmq0d1uFBX1mH3ub/bJGCrDJuVi5gLono24yKxVbIN0X5PjUaLKpwGU4mbxI0BPJ
         RzE7gRm1bjQxVLDbMw8/j7rDJYo8o+e/Xmyy1w8QwAg733KL2QOruVT5FaUzgJKGoWQ0
         ZXPO2jkP/NBBDajfZnBVsF/pJIBEHR4HF+K/AAc+WwVwUIYi82Qfk+47MPvc9IxyCBkZ
         bBWHTHMbyZBA3QkMkXESrZbc533tqwMh5l/6rq0RbAruMcfb1p6TJ5SweGa0ZW9/MWz9
         yV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ss2w8RtuPlA2YyEul7yH/oRV2xkdzOLZR02ZknSfhJE=;
        b=b5Iqsp+N5Gz+r5F7zhg9YRFNxHWmJCNlZDv4feniAsUZRMZdfOBoSp45PqEVwXE0cZ
         dtJgWwLtKUDLb5OjiYDWVCuk5Y876wv+kBop9oLkkMsWBafUEzn2gu0ABAsd6mSKComf
         ivkE7GH8VsK2AyAUSu6/l0IEhVjexGFYHDv68wJ1gE3ot+2Cf0oFWT2BpzKJ0fjvHB8C
         IrzPdrntZYf/+6iX8zPv09N8S/BvYlYei+l+zpl3js3exuiwjCgWnbRLk2oGsAF1SiL4
         pFUz6aR853hujuO4dG/R2N1hjPoFuGs+UxfjDnHK5d/rpxsX4cs2cDLht2W7Iy9NN5oo
         r0mw==
X-Gm-Message-State: AOAM530VW+zwNHi9RacYjonHy75wO0DCDvqn7W5S6ed3iCgIzyy8AggL
        /t+mYdHQzTa6Ozl6rs8FpVuI
X-Google-Smtp-Source: ABdhPJx8v+gqCzFMMohdeHquuux5D6tjzRJGg6xBHw20rz0T7LwaXQ/Mqh8QQyq8AoCYiAPY6R30SQ==
X-Received: by 2002:a17:902:ac90:b029:da:fd0c:53ba with SMTP id h16-20020a170902ac90b02900dafd0c53bamr4349501plr.23.1609937680795;
        Wed, 06 Jan 2021 04:54:40 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id n128sm2918182pga.55.2021.01.06.04.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 04:54:40 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 15/18] ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
Date:   Wed,  6 Jan 2021 18:23:19 +0530
Message-Id: <20210106125322.61840-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
References: <20210106125322.61840-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SDX55-mtp features PMX55 pmic, so include the dts as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index 6ec0c3f1f275..5b247f628d18 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -8,6 +8,7 @@
 
 #include "qcom-sdx55.dtsi"
 #include <arm64/qcom/pm8150b.dtsi>
+#include "qcom-pmx55.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SDX55 MTP";
-- 
2.25.1

