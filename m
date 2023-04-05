Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4486D759D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 09:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbjDEHce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 03:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237211AbjDEHcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 03:32:10 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8CC4C25
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 00:31:34 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id ja10so33654335plb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680679893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=sP7sS68h2FAazHX86fDCKwccRvVNAqMaPtueSGthkXm+M4INc6oWeaYuqNy5Yxj9xf
         0Nqlcj206UEBHRHRy96fvpZbds+vcFHbJpIVtrXxqla62gsr964OcUGmQxzUvxV+AMIH
         hLpMymzQmkryiE3MhEy8xq6LzEZLvQ70j4gOL/scP0IMO9KqA+7G+/ZtjuiBugO4+BnU
         qEj2PaBiAIRcUevZYkHQaKigfNhi1j4c9AhQfGaGwt9Ni8fyeXRTWmYIjZp0KN1j9sVE
         MgawJ1N6nycm5N2BW8WnfFBkou4dm9/WGMKzudX/6b+8e6VBnBN/bk2GhcQzqs5/ya0M
         RP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680679893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gaq2pRYkVNQyPJ3XRF2sgEEJ7K2B6BxZF4eeMfjNR0=;
        b=J96nBvQraoDd7bnPPMDPUeh5CFhWGExJOWIVOUsD9hyOZ2g5xjPDAhr4MY696cYZFY
         NyGbSC+x0KeU90PI0NUmCnfjrr6o/+x+C2Mi1Gg4S2dBCT8ssG+RXh3y0cKm2IIAPtuw
         8LM7Cpyq1zh6L6eHb+K6fWg+XWz2t3TErmwu5OXk2y77S3zL6SkwoaQMQabO4Qa8Qia8
         9SLzcqKnx1MrfsUxz/eOzekLGcL3yXkMEZ+9uZsEZObFKOtWza+IjAa0c3LHfYhwTYwx
         /LsWPJdFDZ3FvxqlSNJ5eXKAH/dGB1BsegSp8oD8o0s0SmaZjZTl1u6vn/ZiV/Twcbpr
         zf7w==
X-Gm-Message-State: AAQBX9chKAl6+91cKPP8eGs+nwzKglSLXT8XmdmsTBGIc8RuuL5YxCp4
        EIsYkn81lyS5LcR6OmLZ+lSAWW8eReWGNyztDrg=
X-Google-Smtp-Source: AKy350adv+o8rMmY867fVNwkpjlN3fYKfA7m6+V113Rz8covwlxSMtvH9Uy4aJ6oam3OvFLw/8x6fQ==
X-Received: by 2002:a17:902:d2c9:b0:19d:7a4:4063 with SMTP id n9-20020a170902d2c900b0019d07a44063mr6858595plc.46.1680679893677;
        Wed, 05 Apr 2023 00:31:33 -0700 (PDT)
Received: from localhost.localdomain ([223.233.67.41])
        by smtp.gmail.com with ESMTPSA id l7-20020a635b47000000b004facdf070d6sm8781507pgm.39.2023.04.05.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 00:31:33 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org
Subject: [PATCH v6 09/11] arm64: dts: qcom: sm8250: Add Crypto Engine support
Date:   Wed,  5 Apr 2023 12:58:34 +0530
Message-Id: <20230405072836.1690248-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
References: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add crypto engine (CE) and CE BAM related nodes and definitions to
'sm8250.dtsi'.

Co-developed-by and Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7b78761f2041..2f6b8d4a2d41 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2222,6 +2222,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8250-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.38.1

