Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A66F6C32A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjCUNW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjCUNWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:22:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CB6298DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:56 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso721217wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0orW1CTnM6DAdshwwXX6e/Knv2tholAvEuPEyPRFIo=;
        b=k2KHeyYRaAD9BKXWZUzoXLAkj2c079EZnM91AumaR5e1KxFxGityJJW3TOfLKVmNR7
         4K8J+XuUaT7EWYyfRZB224fQUtDe//2mHt+8aSQX5HSrRfxtrgBCjzlbUELPYpJ1WPAt
         ocB4X/3gM6LM2pnEaMTL/LS4WlxlFyT32yEOOG5X1mTF+Hdd8ku6wZY79JC1vakzVCOY
         xL5vWOVKBlfc9g0a9vBqVhfX2tRD+C74NG0R1b3+n5spp1jqF6NA9wh5off/1MiF6knC
         9zlAC+PyTIhaZ2+KIEptI59XzrIZM8JOoWGGYkfaNHkgS7iZRPijYhzXwDhfbaTPGWNt
         0jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0orW1CTnM6DAdshwwXX6e/Knv2tholAvEuPEyPRFIo=;
        b=KZVmr+Ba/TYyGuzIYcCwyI/JmIgIyDQReLUAdsCjzdcegjWIt1qhZOQeQoENLa0Vl8
         wF87+J0dePl0RdIGiwx+k46ObComk+0QWfv5cJElb1BQbWnquWO8GYwFRjWlAzQorcUH
         STtUwtQnT46ZxHTrP4ru8haitNcAhAR9QAvVbfNI+9Cby41PkfWfA5w5ZkNGzjloXHGk
         ldPcNb/JGBbGEQnblMvp4RziKXvOnVUzOPyluEtv6WcuO9CCRCZFxSAFndi5YU+t3rHJ
         FQLeGsCJYgQyRocE7sRairezDPa9+nd/7mKMXz8i7J4F8moJUysS/MWddn2nsJ1brAwi
         fqmA==
X-Gm-Message-State: AO0yUKXssndovFCvsoy5iG7UX3oSt0/Oa2mJ5IXquT/vl/LEhxgrsNyt
        m7QmRahlOSUTE6sVluNGuIR7TQ==
X-Google-Smtp-Source: AK7set/uyeF2W9Z8js7YvAE/pvM3fkWzRXbZwkQqbcnFIO0wslkp472DFDu/CCFsROolNv7vOw0Yvg==
X-Received: by 2002:a1c:7c0f:0:b0:3ed:2937:90c1 with SMTP id x15-20020a1c7c0f000000b003ed293790c1mr2464388wmc.34.1679404913477;
        Tue, 21 Mar 2023 06:21:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:53 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:52 +0100
Subject: [PATCH v5 12/12] arm64: defconfig: add PMIC GLINK modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-12-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMIC GLINK core, altmode, battery and UCSI
aux drivers as module to enable USB Type-C management
over the PMIC GLINK protocol on modern Qcom platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a6d995384d9..d849fa2ca852 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -273,6 +273,10 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
+CONFIG_BATTERY_QCOM_BATTMGR=m
+CONFIG_QCOM_PMIC_GLINK=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_PMIC_GLINK=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m

-- 
2.34.1

