Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB64582094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 08:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiG0G6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 02:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiG0G6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 02:58:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65028237D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:58:37 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a13so18627419ljr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zf+Atw6W9ce++rwB/xGOClK+4e2ERQWgmlZE86UF1IM=;
        b=pWEXfRpu4h+qdx1v4koHmcFO0UMlVVqZfQOqzNjlU/ITs69iC5dpx9CDW+pSe0DwUz
         Q+clVhbX0xpJI2x15bh5zNWqm7HPA6yA+mZEypEHjhGaMV7Mq7vi8KDLgFUCDXRux6Xx
         2D9kBDMzqPGQRQuPEB439yBvroL1T1Za9HvrtnaB+NtPfXxqIQ5PJDGqN9h3VvlUei0n
         Mz37Ee1DdolFLG1NPcFXpzOoFxZdsYcNfcxKJp4rVFQHZdLgQ3bl/WnwnAS1065xck8q
         OJIFHShXUjEuBmHCNRTFElC8vzFZrkVfxK2So4lNBOOeOO+t10U2Bd3LwUH9FtNypW4t
         BvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zf+Atw6W9ce++rwB/xGOClK+4e2ERQWgmlZE86UF1IM=;
        b=uT3RSl0kph7IVFdMxOsGvEFmXizLv1ge9FLBT1Xi82Y9lGRz7ufrFA9+tsbcYY5/iU
         Yp9jZw9nySVJ54NZsp5NZia9B5D6JONVQDjFmYnSQXA666bqrsMYx5vChZAfgqffGHhW
         avuIjcCFooluPFCbSNgZWIzHvqazslVznV6cyOsm7/ZzoF+WmbvkgzJF7kXgECBOte0c
         43zjicVmJJ0AMs2E82th1j1wL7u5wqL3roKCHlrZgA1ZvaEZ2UPVRAbcpmtlnaEKm83h
         phdPEWh95y1UWfLLD7gOWWIJlNqPWaxfVHF/SX64t6yQ7K/vaIj1b4pYC9/WCWUI/ubv
         bETg==
X-Gm-Message-State: AJIora/nI8iYiMFgKTjjSmgL+jAcAE42uJZWI2G/pcELdJrAqEmgRnNY
        i8n10fSKX1qe8nQqQ6JvzWzPEg==
X-Google-Smtp-Source: AGRyM1uoZKDq+iMybJKb7vij/n3rKU9b1HMxqMPWDCzZjTtM1aIne7HA6CGk30k+0G/F9/mMIf5JtQ==
X-Received: by 2002:a2e:b88d:0:b0:25e:5aa:749d with SMTP id r13-20020a2eb88d000000b0025e05aa749dmr5142163ljp.48.1658905115779;
        Tue, 26 Jul 2022 23:58:35 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id w29-20020a197b1d000000b0047f647414efsm3623827lfc.190.2022.07.26.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:58:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/5] ARM: multi_v7_defconfig: enable more Qualcomm drivers
Date:   Wed, 27 Jul 2022 08:58:27 +0200
Message-Id: <20220727065830.10681-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org>
References: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org>
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

Enable Qualcomm drivers:
1. Command DB (used in SDX55 and SDX65).
2. On Chip Memory - OCMEM (used in MSM8974)
3. RPMh and RPMh Power domain (used in SDX55 and SDX65).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5a5c772eedab..a23cdd352d23 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1070,9 +1070,13 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_RASPBERRYPI_POWER=y
+CONFIG_QCOM_COMMAND_DB=m
 CONFIG_QCOM_CPR=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_RMTFS_MEM=m
+CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_RPMPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.34.1

