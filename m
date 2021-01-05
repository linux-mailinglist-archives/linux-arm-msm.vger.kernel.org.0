Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FB92EAACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbhAEM2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730229AbhAEM2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:50 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244D0C061388
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:46 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j13so1604408pjz.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99rzKTlTSe9qUr5y9f4oV2o3y4JbKLKmKgTDd+AN/bw=;
        b=WVmf9JSz7yJ198Fn3wKNX7a19UhtUQCONzxBdN7hqzYlbcde2FWwPVL3RspvD5voCj
         6WNr0DV1vN61sTcyTUkgL+nxi/m4W5/074YWySI/PCLbNgs/KcL1HZFs0qBILiwT4vS3
         sTd/XgKTGAHkQIHb8Tn0HnEMJATuYaZMsT/szqs/GW0UAMpFD5BO8dh6zmeZ6qtHZ2ia
         JTQaa0hx8Qo2FabiK56lSQZZYwtj3g9r62HcqbIxUjERIwK6T/btWlNCo8tleI3EFark
         WTDxRJvln+hQ6DrodF2L3GY/uV98qZWhk0y7/q3I2Rd7KnRg7xHii79YL+X4EjMxzol3
         hdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99rzKTlTSe9qUr5y9f4oV2o3y4JbKLKmKgTDd+AN/bw=;
        b=Sc3BcsPHyobuBAkq04WcCICjEtYo5H0M1PoTyZnWL54yG1ZS5bRW46g5pPSCZ1c3G2
         vgDeiXoeUzMxVn1+2dDcdtYxJVCaH4+NNUgjaDnfRW4829eo/9dLuPGv+DfXwjFOZdG0
         YNqu+7KP6pmJmcHwCN4wnFD+zffcAKS99DCCXI5hqYSBsrebdzkggvrF/L59JkGC83er
         4LRFJVpXqTFv391IP6KHzh+oQowHk0mDxc7OE5K98fNZWj3/bjXarjvzViBoHiOdvuAB
         kJj//ngIZF3BQp56dPSu83Iu+Q2qLEsp8mGq8X06MXSFF24eLJKem3HNz075hqrIYEEP
         Jc4A==
X-Gm-Message-State: AOAM5325pLiRqb7geMrT3aPlSc+RHeJWoCcJjAIYrsR8HeBQfsBxxvol
        WaqXC6f2ocQrODh15UcPkev6
X-Google-Smtp-Source: ABdhPJwURrB/isL7UwKJt24kr1Jv5j8BUpTvyXwRvO9qt1UZZCWAUfePI7bNZx5UiB4ABgq0/1ehkw==
X-Received: by 2002:a17:90a:ff03:: with SMTP id ce3mr3826646pjb.44.1609849665677;
        Tue, 05 Jan 2021 04:27:45 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 15/18] ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
Date:   Tue,  5 Jan 2021 17:56:46 +0530
Message-Id: <20210105122649.13581-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
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
index 09aeeb14be37..825cc7d0ba18 100644
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

