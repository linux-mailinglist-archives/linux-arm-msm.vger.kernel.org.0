Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1006A16C04A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 13:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbgBYMIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 07:08:39 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:33699 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730582AbgBYMIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 07:08:39 -0500
Received: by mail-pg1-f173.google.com with SMTP id 6so6811636pgk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 04:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xfx584LrBv4WX0vT3v72U+yclaJIeCwqAoJbx9o5Qoc=;
        b=aAkVe5JmYZiDIr/2nEc84qsSP5jsJ+M1N3g8Yz21BPTGVopBd7PEy+bZB1lleV4hoC
         Isy2oTPb46YbqEjZ/BhDOe8tO/y+DACT4U8WvMqZzwpXPbARz+8/bLD3whd1xgoJsbKl
         wzfkELd16Z3l+GaEnIY/RHNzB4qTS7cvPaaHkaIhBkB6INgl8ZjPOdNLqSIL/H1kRzuu
         wWEE52+HomMg03CQtvYaI/N/AnMse6QBc15DEt68MQOKjlDLHEgxrnX6a1MdZCIZBhT5
         DsG+KAwgVGdcGxBfm6XyaNXADFNtySAxY2CicEdo5tC2+ewwRFoeRnVZzl9yRhyPl1I+
         //fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xfx584LrBv4WX0vT3v72U+yclaJIeCwqAoJbx9o5Qoc=;
        b=uPP5LXRVhrQSY70mnriK3nwFdIMO2MM9r+kXII6wEPYD0MB5YYTsbE+uVX34Z6GB8f
         /jbXXqeHloEaEIA4qaDp2mTE+sBQKjJ+4xcgo0evGDDaUbbMkelLjvisZrHA2oJF6VKo
         Q3TJlMlDBhylgfRjppny/2vrws2dqL0NKaJu5RvqSqdVDhVtdi9tMvHfQ6pONDWEDH0j
         Eys7dbYPyZ0wLh1H0xmk0X9FLCTBF50o4avd0tthcjJrACGXwyZHrEGyBIvCbadMf42t
         oSt9hbpquv+jE9nXZwSIjEAeY/GLfzn3iBKPOa1YzDi+6zxQ9erAY2tIZHaXDGTcC7DM
         4zbg==
X-Gm-Message-State: APjAAAVWAPRfnv2fuxywy10oUib/9g5XAPBQiOYP0fA+1JTGvCSejCHL
        32pQAMld7j45PrO9rgJLg7fOaw==
X-Google-Smtp-Source: APXvYqy99/wauPvYWlyEJpL9RlnRlWTUqhz/ze8Q72fwPISSUO6/izFHfrsJNRv1Jv5XvECtq3TYug==
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr61623830pgm.112.1582632518431;
        Tue, 25 Feb 2020 04:08:38 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id l2sm13189971pgp.0.2020.02.25.04.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 04:08:37 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
Date:   Tue, 25 Feb 2020 17:38:27 +0530
Message-Id: <3e760279e7152825d56f8b35160a9a55a5083ce1.1582632110.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582632110.git.amit.kucheria@linaro.org>
References: <cover.1582632110.git.amit.kucheria@linaro.org>
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

