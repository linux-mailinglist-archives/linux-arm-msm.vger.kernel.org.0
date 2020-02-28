Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1D9173110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgB1Gc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:32:59 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:34790 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgB1Gc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:32:59 -0500
Received: by mail-pl1-f175.google.com with SMTP id j7so856747plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L0WGdBs/BRtkbt1VGWWlFtU3iVs0rs7BsxsJ0Z9JuEQ=;
        b=ZAia9GV/LWifb6zdeE5SJiRiN/n4SwcK8pV3wASoAfhP1RbYa862t+9EohzfH/xQPH
         RLF0pFbp7EDishXlm95n4HIiMxBEd3iw1Ycads7g1/WAo0rgvzew9G+1xg8k7NZTQpMO
         6UzItqBGp63a4fs/Wxj9Ja8V50xyOjH3kn+mEsm2CDORJbQuyYz0zSYFgj9qCvubSjdt
         hVvdKpKtmLTOh95UYH1wRhSHDLZIPwWw2RacSdmzJO6lGDSmBq/xhlRdrgRQSFDnpAf2
         +6juUKu2TCZd+U1wSYA+RzMC2f7gCA5+SoJd6U8tdFuxEcS1ANlK9nAa9WWCAwztkT+0
         eJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L0WGdBs/BRtkbt1VGWWlFtU3iVs0rs7BsxsJ0Z9JuEQ=;
        b=DmBNVpsY38+PzbnMQnKgzu+p7/VPIPNfVFWOR6Y/I7WMNNCbJrT9CC6vK19VbL3YJM
         kKDCQqN1wHgWWDKYUleL/2vN8cX4XJBo9ur2A+ZUOtAzJXmuAFMP1v1u5QQwb6k48HGd
         bqXrahEwGLKXmkBpTLwNnbeZxnEA2xvR44laQuEuKuxusu36aBPZFzsTGCKcZKuxLopd
         UsVeaez0QzA39OA0Ol/7Qw+ZDKuNUofG3n8Gh3GaqB+WacL3qbyGyrNCjcW4ow7h6UeY
         fzg9Uej9/ryyGH6KOCTt6vCItfJz3UV6bZs1p6hjDKHfBs5idMJNOVntXwLM+u1REiQV
         7Tbw==
X-Gm-Message-State: APjAAAVXzRIrUQstq1LiacTXAYi5+i7Y6hxgIbMIq5mV5JI+9FGqGRgH
        NM6n5j9MZKcUewbZfcYjyVjdMg==
X-Google-Smtp-Source: APXvYqx7AUCLBuZ9ybD3qob3gdKTf/mKwDN3LwBOrf1HM/wCDoM0koyjqn/cGzXaUa0vBUGSBwOmow==
X-Received: by 2002:a17:90a:d986:: with SMTP id d6mr3063278pjv.78.1582871577873;
        Thu, 27 Feb 2020 22:32:57 -0800 (PST)
Received: from localhost ([103.249.89.56])
        by smtp.gmail.com with ESMTPSA id d4sm763369pjz.12.2020.02.27.22.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:32:56 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
Date:   Fri, 28 Feb 2020 12:02:40 +0530
Message-Id: <8309e39737c480b0835454cbc6db345c5a27ecd4.1582871139.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582871139.git.amit.kucheria@linaro.org>
References: <cover.1582871139.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom-tsens binding requires a SoC-specific and a TSENS
family-specific binding to be specified in the compatible string.

Since qcom,sc7180-tsens is not listed in the YAML binding, we see the
following warnings in 'make dtbs_check'. Fix them.

builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible: ['qcom,sc7180-tsens',
'qcom,tsens-v2'] is not valid under any of the given schemas (Possible
causes of the failure):
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,sdm845-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible:1: 'qcom,tsens-v0_1' was expected
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c263000: compatible:1: 'qcom,tsens-v1' was expected

builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible: ['qcom,sc7180-tsens',
'qcom,tsens-v2'] is not valid under any of the given schemas (Possible
causes of the failure):
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible:0: 'qcom,sc7180-tsens' is not one of
['qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,sdm845-tsens']
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible:1: 'qcom,tsens-v0_1' was expected
builds/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml:
thermal-sensor@c265000: compatible:1: 'qcom,tsens-v1' was expected

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index eef13b9446a8..13e294328932 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,sdm845-tsens
+              - qcom,sc7180-tsens
           - const: qcom,tsens-v2
 
   reg:
-- 
2.20.1

