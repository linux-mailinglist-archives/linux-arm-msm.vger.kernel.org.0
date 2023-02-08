Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C57968F7A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 20:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjBHTCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 14:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjBHTCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 14:02:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40710521FB
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 11:02:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso2225809wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXn1ogE9xf12HQp/S/g01Ga91SzlSkMt5w5+myYC8Ik=;
        b=DnNvwM1HNT74gz4mLjUKMjUfy6FtNoVMpbWVmwiMxRZfP80MPZf28EsGdwnVhFbaKN
         nCJP/V94VRMv1jACM1Y7TzBLsfP2o+54GoChiOJRwXAEfVzSeJ5i/NZkLXP4D/Go+/Ck
         zc/YDc7u0ENrJ19WTRFYDIOnTWMvLq363AMG9pU9XSRM1MOT747eD0SNQbvRvGFm0S5j
         09e4Guzk3Jl++8263r27MgXn6COt8vydfpdBGEYIlU1d2aNNyucxTpy0/f9q9zknBap4
         m99KpzFQdiY5S20lSYYu1TyX0VUKRy9JChNwwl5tnILECMP3LXNk5/HGDi8I3ksXi4EU
         t9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXn1ogE9xf12HQp/S/g01Ga91SzlSkMt5w5+myYC8Ik=;
        b=Efq2y6InBKmw1WnIswiC1cRPQ8kAszX4qjeN8O6vBsHRwpCgEVpqNCLFOtyMtvFVEH
         HmaK21ax3Jq1uS3xgnwfQb1Xlrvy/TacdpAqoDvybJWl7VpnCo1xcPOlzHQj5CZ6tYCb
         D0uGOeAyxd3BbEU6HsW3ljAiBptGlTcZexRSU977f9R3imTE4w4gn9nzK+NhOra+KNL7
         Yk903JhBPB5nhk1n0cgU6F9qqyGBYZBPzshoBt2Z737GIs8IrRQo3MjDZq1j5L6ex0EY
         T3271Rs+Z8MADcDuT3prBKTwxVhLFYB3D9vyf2rtQzVD1lKSCOKU9xvKQd4lQ+8V1LA4
         v3Lg==
X-Gm-Message-State: AO0yUKVFuRuB++SViGkkTvluG6ldMXAuZM+UQmW42dlTm2b44AKbIJOD
        LWEpaC1d8hE/bZ4tmwwbDd+ZPg==
X-Google-Smtp-Source: AK7set9lb9+Qa05MNpj+m+C25BEZGPxEGNgImF2JJzfKCaEdItzhfXwChMvflZhKFxUV1ACea0WteA==
X-Received: by 2002:a05:600c:43c4:b0:3dc:5302:ad9 with SMTP id f4-20020a05600c43c400b003dc53020ad9mr10116874wmn.27.1675882928813;
        Wed, 08 Feb 2023 11:02:08 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm2650327wmc.10.2023.02.08.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:02:08 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/7] dt-bindings: phy: qcom,snps-eusb2-phy: Add phys property for the repeater
Date:   Wed,  8 Feb 2023 21:01:56 +0200
Message-Id: <20230208190200.2966723-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208190200.2966723-1-abel.vesa@linaro.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
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

The phys property is used for allowing the eusb2 to interface
with the repeater, which is modelled as a phy driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

The v4 is here:
https://lore.kernel.org/all/20230207135551.1418637-4-abel.vesa@linaro.org/

Changes since v4:
 * added Krzysztof's A-b tag

Changes since v3:
 * dropped the phy-names property and changed the commit message
   accordingly

 .../devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index de72577e34a4..c53bab107b6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -33,6 +33,11 @@ properties:
   resets:
     maxItems: 1
 
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 to USB 2.0 repeater
+
   vdd-supply:
     description:
       Phandle to 0.88V regulator supply to PHY digital circuit.
-- 
2.34.1

