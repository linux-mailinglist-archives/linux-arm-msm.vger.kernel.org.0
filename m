Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5650967CB22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 13:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbjAZMrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 07:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbjAZMrF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:05 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBFF6A302
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:47:02 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r2so1647453wrv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyPrSMFBYn0iwPXiaB/l7uEf04HZxiQUDbWs+6Uo9Jg=;
        b=L/93Vwq2DYsH5Fuip7RMUioRoTbyGhTeZc6pIcvcX6EG8B1PKblZ72ENY5I19vMFz/
         E8/aoDWMUVqs8a4ku5sIL0NY+sfbQ8UP0Dzea37+wqAmg2rZxN4X72lzmuoZAKbG82BD
         vzaYZ1nXGC3jlpMxwowHhuX6ykVW/6WBikkoW87FcbDLKePYsFb1qKDncbv+4r0/4H/p
         VxDZiRC1jpQQFCm8OwvUKJC2qMvSJpSEF9r7+s67RZMVIecIWhMWd7WElaS5rWuwwDpo
         k3GpJfgqRMQ1ZDLlH9GUvh4DV+SfaTtga8Kj9TqkxTB0AggQiKEu08jCiEZAc1UwxQIa
         6HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyPrSMFBYn0iwPXiaB/l7uEf04HZxiQUDbWs+6Uo9Jg=;
        b=PWgJCDj08abfVim8ZWRPpLNsJnpTzczBl+NqBwu1ScBcOWRS7B8K/00I7O68ZyOZ7t
         /net2ouiGWTJLMITFLvsZqZhaOfpl+6F/r0nyFwlV41LBfilQmZ1+3kylRk5i1AvX0f7
         B6jsnnZMWJYKH/HWIABam6X05llq4o3Qqqhnknf1FV3hxVdWeRvS61fQsUGdVAzrN74F
         F4+H3rKkFyT0na1aoy0+52KdYwq68uJS99gASHOahDodLUIRLw8uAUV8Wax4/+odf0Eu
         +nVYeqD1HJtos9wz7TaS7yC5qTz/NikrX4D91afIX3XdCMZOieH7NSDDkuRKmLs3k9cq
         9FMw==
X-Gm-Message-State: AFqh2kpzG12ZKiLpPTUAkGeuSgGzHlRATeknOSYAZjAIR743CfjBeynD
        ho3Z2rGOIp8bDUjm9JxCjwbTXA==
X-Google-Smtp-Source: AMrXdXusIANBGuRNCiIv3AYVY08YeFBbvM0wB+jvBth6ndFnVBIuxxsdhLRclEefBlnylmVCUKZh1A==
X-Received: by 2002:adf:ec4f:0:b0:2bd:ffc1:3f16 with SMTP id w15-20020adfec4f000000b002bdffc13f16mr31317156wrn.8.1674737221442;
        Thu, 26 Jan 2023 04:47:01 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v11-20020adff68b000000b002bfb8f829eesm1198681wrp.71.2023.01.26.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:47:00 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v2 3/8] dt-bindings: phy: qcom,qmp-usb: Document SM8550 compatible
Date:   Thu, 26 Jan 2023 14:46:46 +0200
Message-Id: <20230126124651.1362533-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126124651.1362533-1-abel.vesa@linaro.org>
References: <20230126124651.1362533-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM8550 compatible to the list.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v1 version of this patch was here:
https://lore.kernel.org/all/20221116120157.2706810-5-abel.vesa@linaro.org/

Changes since v1:
 * moved to sc8280xp bindings

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 6f31693d9868..ec00fbc06abe 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sm8550-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

