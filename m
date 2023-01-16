Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928DA66C247
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 15:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjAPOer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 09:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbjAPOeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 09:34:24 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1F825E34
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:14:59 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n5so29568294ljc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ficsldgz1V74n51gnUvukrDpVMvxEkIQD2f4d4LFj4=;
        b=P1FspR5njyIiraQNtqdfe9hJKpnalbbp9WRYjEmC3hECF8zuaeICcPakMEw9Vrug6l
         i8FEbDe7Ew4S1mbifUu/FZMhif0s13LiAOi+Tl5QFDFSivISP3WCRkr7cgJdE2n47weK
         R68kqe75bPbXJu+dMpeCZOh4vhtk3uxO/UF9ev7z9fOkJ52uNEMCsHHZj5z3X8nkNBMS
         WRLRwLdwf0AJ0ZzEnknYKzCOKP6Q9khNb0wDTnHlAekr1iMRWoJTKn2mqCMjj5AvsQ4m
         S9z9TU08fal1aHZbGTSINOeTwB3j8V4/cvWrGA53V9okmKe043LLXAGfJKOu56n3iWzE
         Eo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ficsldgz1V74n51gnUvukrDpVMvxEkIQD2f4d4LFj4=;
        b=tYFBll2S0zM1YQ+9/FlZPhB0KG1wIUSqGSJPF4qPK6YroRGRbYeofq9ZQ3Ld81Qnnv
         NCTLigs3fRZN+qsd5ANYmG1DhpgN9+ZKgzQVyPCMru3dify3wQ/szYOLnHKj/r3W0QM4
         ZcLIE2Hd68DbxwBIQUwuC/JNTBldYc4REsUL1Fe5K4nW7M7Iodf8S2fX3h79i3LoBGLh
         OSfai7IYQ6oC4U+KlpML2suRpyo0+lxDszyZuTfa48gD9YJ0o4dg1drYKgd9n4mZT5DL
         6x3VDkUXxCukgYrV7QQLfE79NS+6KubaU2y79hKgYKSVWYDIjZiB3S+9gW02UmfqASoE
         qbXw==
X-Gm-Message-State: AFqh2kohBgRR9dphHUv4tK+yimRc06Yc/yNmqGFlf4Frpc6X55Joj5KB
        vPII4qGwmnwmz92u0guyYMNW/Cmne0I9kNqB
X-Google-Smtp-Source: AMrXdXtZ8rR829D0MqKWhPH2C4/psGp6mr5iBMWLIQ05tq9vUWCGJttMa5xAtOo54W3ut6i6bT7h7g==
X-Received: by 2002:a05:651c:198e:b0:284:3b7f:9b7 with SMTP id bx14-20020a05651c198e00b002843b7f09b7mr11497297ljb.48.1673878497742;
        Mon, 16 Jan 2023 06:14:57 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id s27-20020a05651c201b00b0028b85d0e705sm483717ljo.136.2023.01.16.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 06:14:57 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm630-nile: Reserve simplefb memory
Date:   Mon, 16 Jan 2023 15:14:51 +0100
Message-Id: <20230116141451.470158-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116141451.470158-1-konrad.dybcio@linaro.org>
References: <20230116141451.470158-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reserve the bit of memory that simplefb uses to ensure it can always
probe.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes

 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi        | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
index 71b448978e88..9425b2d9536e 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
@@ -21,6 +21,11 @@ framebuffer@9d400000 {
 	};
 };
 
+/* Reserve a bigger chunk of RAM for the higher-res display */
+&cont_splash_mem {
+	reg = <0 0x9d400000 0 (2520 * 1080 * 4)>;
+};
+
 /* Ganges devices feature a Novatek touchscreen instead. */
 /delete-node/ &touchscreen;
 /delete-node/ &vreg_l18a_1v8;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 763b1df692f2..e52580acd5c8 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -142,6 +142,11 @@ reserved@85800000 {
 			reg = <0x00 0x85800000 0x00 0x3700000>;
 			no-map;
 		};
+
+		cont_splash_mem: splash@9d400000 {
+			reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
+			no-map;
+		};
 	};
 
 	/*
-- 
2.39.0

