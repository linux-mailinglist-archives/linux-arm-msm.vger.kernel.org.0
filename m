Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B070B358AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDHRFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbhDHRFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C8BC061761
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:27 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id ay2so1383142plb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=twy+/YT43L8O7f37bIAuxQ9pdmnuUZbowFVhGwUSlwA=;
        b=ppa1ZY9gYLjg6mh/M7wcGyDQ/a6C9JbryK1DtakJIxIJugQQlRYRWG/dL1Y777j4v0
         8VnGFaPfYNwAbwPIExyjhMvLkrI4jvLDKmwaPxKJ0+OALxDoaV6q3S11yMWfkLaHMSvq
         igndrGo8AzZZoIYtUtnKjBGCzL0NYTECbrFNSDP7KZwI/YTCoaTACUrr2fO3GHCDFY9C
         Hz+JbqjZGbhvTuOqhiPRCpvKJ4auwC4CA4lpkNnKn3fL44oVVacYAi2U6ddEL+xvbfEJ
         dxq041qdUcCLcv4B+3VvOV1S61+v5SYVZ5S4JPwC/N+59sO+T0x2cNcL4ldO3tAPH9AY
         JNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twy+/YT43L8O7f37bIAuxQ9pdmnuUZbowFVhGwUSlwA=;
        b=TQrlb05quy+hmLf7OWMqFV0UPyM6DytWwg8+8IBtI3tH7oLQvcgg51wEJvxnwwI350
         rcSvCdrAV4qFiXgHPT0A4TbFeAdcIKeyQVMY9TNP9h6xpVPV7/Fek64wMGAWVGBnZxaK
         FAx8VmqDtCml//CqXQqlkt8+m8hdbJyaMzNFSFKLjy19JIN+UTrwxsEDdlcAqYe5zhrr
         qz49FjZes8y3wQ5PXrRZTy1R/J91BLhZaqUNbCjK05vbNHsrVbhQbyFvWJeBAHBzMsvC
         +dCJsl4rXrUjNn66Ypi88ayHRJGk06sRAYPI/BhMoknNxCs1rlrTLmFF3zlWS4OIFtRD
         6XJA==
X-Gm-Message-State: AOAM531jAzfQ7PNSg1UTiYgF38TRqyGhBBnCtzG/T6Qk57bJtRsmfPAM
        dlkMHg+Cg/KdNA7JxMrzVpsH
X-Google-Smtp-Source: ABdhPJzTWBSRNcFxQTtTAAVfPU1/oOqeRJQHPzqTiqbzdXiF1PVXZZRWu8ff3jGA763B7pPl6g/z4w==
X-Received: by 2002:a17:90a:4290:: with SMTP id p16mr9458366pjg.120.1617901526658;
        Thu, 08 Apr 2021 10:05:26 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/15] ARM: dts: qcom: sdx55: Add SCM node
Date:   Thu,  8 Apr 2021 22:34:49 +0530
Message-Id: <20210408170457.91409-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SCM node to enable SCM functionality on SDX55 platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 4ca871735025..daf34f24a5d3 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -85,6 +85,12 @@ opp-1555200000 {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-sdx55", "qcom,scm";
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.25.1

