Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A4616FE6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 12:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgBZL6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 06:58:19 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45]:38674 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgBZL6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 06:58:16 -0500
Received: by mail-pj1-f45.google.com with SMTP id j17so1184362pjz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L0WGdBs/BRtkbt1VGWWlFtU3iVs0rs7BsxsJ0Z9JuEQ=;
        b=YCRaNKiqn8A6Ik8MNA4or/RUYmxDGYg7Azq43QnTOJb072o2gSUC84849DJoU7dHOm
         WfN5tLjxAyIX09+yR7aMwjmJPfKFFRYkysEP9rvaOAKIqEhnbhyaq1Z/vowEHjvHhaGC
         t4VtIAfon1DKKlndFkHRz4m+MBoI9oxe2bED6/awfDrQirFtVq2cy/poGHivHfOl+2Nj
         jYXyRc8CIAWZT8qRg8D7axN1a5+BZQQjz1gpfenmbd8S6vrSioPC11UFutbt2XMaG4Eh
         TYwAGwwQwOdcVjeXjJm/0Kp8E+uuZ6Niau/yZhrVhWSllyjvtz4+aI2sA85AenDAQUjQ
         /WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L0WGdBs/BRtkbt1VGWWlFtU3iVs0rs7BsxsJ0Z9JuEQ=;
        b=tEkMAFPJATHVjRJ3knDaSQSiGxvqqi+bWI/d7engwohWIA+yHOi9PEAS1WLjHUDaoe
         G7kcgO7LqKPZ77FZyj2d/iUB+rqYU4bJURq6ik2TElcliCvf3qAw1R7BAGjTMBKaEuf8
         8bhaY/mcXU8C+l7plOLHGEHsdI8Eha6IYHADzFkpl1R4PgRU7hcCR0ewQdYMSTyhocp5
         ZFzgceiV8PZQrKg7r5RZM+W4rrS+UvGdPzMof2BJjW3tmvsl0aSYZRnhlYL60pc/Gm36
         4eiSIZ1NtBI5D7Gp8lATrppqbrV0aM9uQ2rEO6T8F3imRe1yu5rDHDFoUxLWWMBOFqH+
         XPBA==
X-Gm-Message-State: APjAAAUWNqHWzjG4JuxkMjW7m6kHAJcpXe7vaTDFhmtPI5Bq6HylTZdA
        FuznI7l07EsMcTEEYEf6UGfjfw==
X-Google-Smtp-Source: APXvYqyx1/PM5idU+c0uhvRnjfHFpRh/gIAwi9fme8XqqGmGzyeCZiRiVeTdSTowiPjOjVGSFItaxQ==
X-Received: by 2002:a17:90a:a406:: with SMTP id y6mr4996011pjp.115.1582718293538;
        Wed, 26 Feb 2020 03:58:13 -0800 (PST)
Received: from localhost ([2401:4900:1b38:7f42:3530:df3:7e53:a029])
        by smtp.gmail.com with ESMTPSA id s206sm2946912pfs.100.2020.02.26.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:58:12 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
Date:   Wed, 26 Feb 2020 15:01:11 +0530
Message-Id: <8309e39737c480b0835454cbc6db345c5a27ecd4.1582705101.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582705101.git.amit.kucheria@linaro.org>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
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

