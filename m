Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630ED68D9E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjBGN4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjBGN4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:56:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7751E38E8E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:56:15 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ba1so9568855wrb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtkmhwFT5j7wowMrMh6FyT6x9TPEWHJ6LPVu2crAaaY=;
        b=yeueLFHd13NZAGnJvHZuHiRYVpoEhoTeSIVMwEFaDaXr5X0uS8p6ut2gDavnB5/VgO
         ufg7Wc06MA0b55lSEfpMo6PFPe22YZHwbfC+LPFuRehpLt4mL/7ka4vKc+wUAqcXsExZ
         3rD5ih/CiTv+4pHMalF8CDQmrrx/ptBvrb/sXDseu+uTw6/uIUtwSYRKlzKlbpxmO3zf
         qUgFykksZcGNShdv57SOn3leRwxKfRKZS1Q9tviP5zlMXE6vCgu+ZEVhel9qvsIXP4pJ
         d+Y8YODSm/EZ8foMFeFgaPwklYAoaCl1MqU8XD8bXpouzbOjMBs1T+2k7T2r4UzyJY2E
         e6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtkmhwFT5j7wowMrMh6FyT6x9TPEWHJ6LPVu2crAaaY=;
        b=v7XpjRDkb9gypRHDDmLZWWNMIhofv+yXRamSNfgnE+NrSjA/TvQWkyDNGfMOvcQUev
         qJTuYtNCV9M4VSKRGuiFO8C2MK4CCvtW00UHyrZmB4zE02mk07MG2hM0jHoEpMPHlDQf
         VJcvKEjomF5CL+UXzy3h///roM8VNLyNn1yKaYYK7oglGzX3RVrxvuh4HYtHy6oSS42m
         UTxMxxcLAlrCvjSEx74m8e5ZHjkhG2jOTnz7FUrKNE7IrT6QdtlroGpgnH3tEUR1A1vB
         UCaEVK0rIrQXEQr5Jufo0PMDiBEF/5dtFdnrxNgb+lZFEFHjkIa51wuoTtr7nNwDS0X/
         KTXQ==
X-Gm-Message-State: AO0yUKVC3Ymsubeq4qhGcJw4j4mNLUrgqsQJkiY+jdZ9XhfnwoHy+6ik
        luI/REzyxDz2UhrDtaz8XtgXAA==
X-Google-Smtp-Source: AK7set8sX8qVfXWnL7rMwHmKqSHv+hoK0KTIKBOfrnCPm2yh0mFF/nczg+iG/jdmQKu8ghiXhTpjCQ==
X-Received: by 2002:a5d:49c9:0:b0:2bf:9656:d1a8 with SMTP id t9-20020a5d49c9000000b002bf9656d1a8mr2270813wrs.32.1675778159182;
        Tue, 07 Feb 2023 05:55:59 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d59aa000000b002be5401ef5fsm11611312wrr.39.2023.02.07.05.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:55:58 -0800 (PST)
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/7] dt-bindings: phy: qcom,snps-eusb2-phy: Add phys property for the repeater
Date:   Tue,  7 Feb 2023 15:55:47 +0200
Message-Id: <20230207135551.1418637-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207135551.1418637-1-abel.vesa@linaro.org>
References: <20230207135551.1418637-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phys property is used for allowing the eusb2 to interface
with the repeater, which is modelled as a phy driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 (rfc) is here:
https://lore.kernel.org/all/20230202133816.4026990-4-abel.vesa@linaro.org/

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

