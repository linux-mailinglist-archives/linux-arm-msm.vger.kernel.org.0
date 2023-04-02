Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177D46D36FD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjDBKI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjDBKIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:08:24 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E2676BB
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:08:01 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u10so25384097plz.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MVums2xGimULwLAksXbnkYaopPwvTqx5iwZKEFGpjA=;
        b=JT63Rdhv/c5JJ5GCMTVSXvcZVx4bC/BZrzg1L8YflrpvJhy83hlbx+Xq5LAfxEkOv6
         ws8KXu9cULU4hHrByxg/rEX4R+VQgHOj9uLYiMCpUlOdHRXkNjBePqyIAi1bD6JMvmk0
         vy2xfk7ziuSDm7zwYt9DNnhIinKUKAvTLU8/Az6Pb4LNjFI7B/5xGhGTek7OB5PZDboR
         HlYRM6Dy2upjTDMaW4QQz/dJLM9S/U177RksXavoVJGi4cTWhV/pSAoRAN/B0OXuS0xO
         FBPUzajRoqzoF/J9Y1TxkKHDM429XvjVuBnT44KlrrgCUcKfOXdMUt2gswsCoDP0yGZ6
         cizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MVums2xGimULwLAksXbnkYaopPwvTqx5iwZKEFGpjA=;
        b=pooVG9Z1/vOXgs4nAxcPjv0Jki47o1490Oo2qivvb+G+Zms2VeQWbvPAa5WbD5e5UB
         KzmDEMqCId0mkbTRzWIpSlA5LysM6QKArwt3KVl7uU7VKhnn4fhQtwfWA9wrBRc3g9TL
         AHpVXfqwrTYXnLH+iRZqVxTVYJNOz8R2DtmTlfrQCoaFiRQ14snxQM1bk5Tj09YX9Yrb
         ZK+iE1dB1Potw3Suou/OmEDfGOcw/RVD7c+GCYwdgCBpF2lfF+BoQFMrNMew/wJOgoYK
         NeBc3Txfhyz8Hu1uVSQDjILV8hJ18sSmOff5NeiuPAjgzfBT/QIyHIJ2W4TYdAAa13o8
         Lhdg==
X-Gm-Message-State: AO0yUKWVuYyWEHMMf6QmfAzw5x52JF44QjZgYHZlEyCoam2IQUhl50NC
        yzMbmZJJdXfBO0EBp/kw+XPxiqq1UkP9k6QdfeA=
X-Google-Smtp-Source: AK7set/a4NgE5LwbYfh0ahtKl9foMp+tcXqTh0MqHAh8T0+VmTx9clHTv5xmJZ45GCuvFvhLcIqVbA==
X-Received: by 2002:a05:6a20:1222:b0:db:a03c:713d with SMTP id v34-20020a056a20122200b000dba03c713dmr25718269pzf.23.1680430075466;
        Sun, 02 Apr 2023 03:07:55 -0700 (PDT)
Received: from localhost.localdomain ([223.233.66.184])
        by smtp.gmail.com with ESMTPSA id a26-20020a62bd1a000000b0062dba4e4706sm4788739pff.191.2023.04.02.03.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 03:07:55 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v5 08/11] arm64: dts: qcom: sm8150: Add Crypto Engine support
Date:   Sun,  2 Apr 2023 15:35:06 +0530
Message-Id: <20230402100509.1154220-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
References: <20230402100509.1154220-1-bhupesh.sharma@linaro.org>
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
'sm8150.dtsi'.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 9491be4a6bf0..c104d0b12dc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2081,6 +2081,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0 0x01dc4000 0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x514 0x0011>,
+				 <&apps_smmu 0x516 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.38.1

