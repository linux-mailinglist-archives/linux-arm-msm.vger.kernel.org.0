Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4440369F9F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjBVRW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbjBVRWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:22:54 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D293C0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:22:52 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s20so10706082lfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677086570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cQTcEdA6/1Tvp2AynCxy/uYQRIV6AL4re0IqB5Qt5w=;
        b=fHuuyouzTvGCL0sWP47s89a0eK5uxjT/81Lp7+j0Bqslh/YSxDXoB8XEDpmyvIch8c
         V+/4PKq/0aACOzIYjBB0cpfHZnOvtoTXF8gKDJIMJ9ENo2TO8xY1aavA4CCxvTTJoxVj
         V1DwYI1G1hyy1wWaQZ7EpZEBbtoJUaUIbTn2lBPlpmJO9DlP8qwQliMJAl+nwEkci3nI
         tUng7XNoV8BFJS3VJdg18TguACaihRglbMNRruaGqc/Pgcw/M266oifMqoyVTQQzf8qQ
         UTZtUtz5N0LPjraSMSRG5+SAyxENnu+/TdpargPXiO+HXSQrKngdRGBb9YR2mMh7IZkV
         GqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677086570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cQTcEdA6/1Tvp2AynCxy/uYQRIV6AL4re0IqB5Qt5w=;
        b=T2fkNtwX1OcrhI1AU4ncy9T7mVmGf2ziVj9E0RNKeofGTQ1W81bfKbF4xBWNVszi09
         cvrlmmls6s4aJw9F80Lkuz6S//7e8j3VUVWx742ybSsIK23sFMx0UUPkgq/Xf+5g4bhW
         a2/eL/YDfwvJMhhpXP3WYnW8hejRT7/8ujw+avuI+oDcMzW/N5ycH6nY3hBvA2Klc1C2
         Y28AUEnkdQ03xGqJQb52xuXEDFYmpNPP4isWMOTpzS0DK9BF5/hH5ehsbKe4rELotnSk
         UO6SiTOCNuJ4g3f8f1Mb7oZlxjai+Qau0A7yUlgx3cmeOTtf1udYkJ5tgChrbY0W3gnp
         CY6w==
X-Gm-Message-State: AO0yUKWW7K69PmfRcXcb905O6juXRU8BCffAfcDW5PbDCk7vrVJ1rGnJ
        +bYm4GdwEWAPJu0IT3V0Z+w8ww==
X-Google-Smtp-Source: AK7set9cQxIEC+FQ+YBVsN0qLM18D1ZUsClXkUtfswdmz9265xp3gXUVKlEVwex4GmbRawJ0r8uTfA==
X-Received: by 2002:ac2:5106:0:b0:4cc:96f8:f9c2 with SMTP id q6-20020ac25106000000b004cc96f8f9c2mr3194374lfb.2.1677086570194;
        Wed, 22 Feb 2023 09:22:50 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r3-20020a2e80c3000000b0029358afcc9esm805233ljg.34.2023.02.22.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 09:22:49 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v11 03/10] dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
Date:   Wed, 22 Feb 2023 19:22:33 +0200
Message-Id: <20230222172240.3235972-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Add 'interconnects' and 'interconnect-names' as optional properties
to the device-tree binding documentation for Qualcomm crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

Cc: Bjorn Andersson <andersson@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 8df47e8513b8..94f96ebc5dac 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -32,6 +32,14 @@ properties:
       - const: bus
       - const: core
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path between qce crypto and main memory.
+
+  interconnect-names:
+    const: memory
+
   dmas:
     items:
       - description: DMA specifiers for rx dma channel.
-- 
2.33.0

