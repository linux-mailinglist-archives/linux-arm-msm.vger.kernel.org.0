Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305FA659BBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 20:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiL3TtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 14:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiL3TtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 14:49:07 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2DA2A1;
        Fri, 30 Dec 2022 11:49:06 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id p2so7334106ljn.7;
        Fri, 30 Dec 2022 11:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOmJmYOBiG68qj6TPpNoTgW/9MywGZDQxwnw/+RB/i8=;
        b=fnBnAdO+Dyjo5SIxFbo3W2ESfDgebBCPqPr6Egs/BnV+Scr0LF7Ufy25ENbJinJhl1
         1bkDLTC9zgEhCXMwJUQSIZRwV+ryc4Gtt1EQnR+e5m8VsOote2GAlMhQH0VMDyIRqWy9
         msIXDyWh/LwzRxDf0lqMa8qtZFNMpJc/2ahHlqS2jZTGfwVNoEk78ZHd+YFb6VQL/res
         dFrLWDglSdS7KDTr+u2E1/jtZXFmKJoZpICFVzl9MFXhO3EdnAsT3hRQiWPevJL6fNOE
         SyysCguVzlX+L4HYQ4ZCFQRrOOScPKSdNoOSSSQ30VGlna2/L6+AZBmRe1WNXSs8Z3as
         5P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOmJmYOBiG68qj6TPpNoTgW/9MywGZDQxwnw/+RB/i8=;
        b=mjEB8Q/jmC+grREt3I70PozerRhMXSzc67M8yudBkMbPGj9UF64gCJmI9lhxE3vIxu
         7lnn7PkAFaYbJwoHYb9ouk3t0354Qwz7fnQTUUlEy8g2VnfG6NjKgVS4m+IYo9gK29+8
         TkfA2H0tDmgQn8xcOcjNeY3d5gEF89AQCKJOX1uR2kg2FPc2BoZ5vdvta5K+jdy+hYnR
         d17LGP6Y+L+Fz1IuuXeQUTOFUFna2zhGSWxvyTXWr6iGupVCdnBBTYwmHS+LeYTn/9zE
         gGFd5dd1XGdf+itbs3sSWyEVnhoL59cCCeghECQWo9lGvcfl3PzkDDBnH3Wb21ysyP2E
         NTWg==
X-Gm-Message-State: AFqh2kqOM9EUP9CQmv0Ac7HZDvzKDdzAYZhP85+QXKmpMJFJfccRPZhP
        ECu/1BP+w5vkKgy6vcqFg3+bHKdpIcj30ZLS
X-Google-Smtp-Source: AMrXdXvGcgGEaeSCyQIx6X34cyqTAHc8AqAlxdMnnkGE8NunbAXZ0xNmySxIBUUiCSgMFoHjQWqjOQ==
X-Received: by 2002:a2e:9d03:0:b0:27f:dea2:9b34 with SMTP id t3-20020a2e9d03000000b0027fdea29b34mr1426077lji.12.1672429744697;
        Fri, 30 Dec 2022 11:49:04 -0800 (PST)
Received: from localhost.localdomain ([176.106.35.69])
        by smtp.gmail.com with ESMTPSA id o15-20020a2e9b4f000000b0027fbfe2e45csm1711494ljj.107.2022.12.30.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 11:49:04 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     pevik@seznam.cz, agross@kernel.org, alexeymin@postmarketos.org,
        quic_bjorande@quicinc.com, bribbers@disroot.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        petr.vorel@gmail.com,
        Dominik Kobinski <dominikkobinski314@gmail.com>
Subject: [PATCH] arm64: dts: msm8994-angler: fix the memory map
Date:   Fri, 30 Dec 2022 20:48:45 +0100
Message-Id: <20221230194845.57780-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add reserved regions for memory hole and tz app mem to prevent
rebooting. Also enable cont_splash_mem, it is the same as the
generic 8994 one.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 .../qcom/msm8994-huawei-angler-rev-101.dts    | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index dbfbb77e9ff5..108bac7d22f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -8,9 +8,6 @@
 
 #include "msm8994.dtsi"
 
-/* Angler's firmware does not report where the memory is allocated */
-/delete-node/ &cont_splash_mem;
-
 / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
@@ -27,6 +24,22 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tzapp_mem: tzapp@4800000 {
+			reg = <0 0x04800000 0 0x1900000>;
+			no-map;
+		};
+
+		removed_region: reserved@6300000 {
+			reg = <0 0x06300000 0 0xD00000>;
+			no-map;
+		};
+	};
 };
 
 &blsp1_uart2 {
-- 
2.30.2

