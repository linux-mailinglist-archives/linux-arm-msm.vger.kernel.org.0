Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E1965105B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 17:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbiLSQ0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 11:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiLSQ0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 11:26:31 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0A2101DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:26:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bf43so14440983lfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVcuzSa6ITgbiUXQ3/VszXDRCE6tsh7BmKWstibWurk=;
        b=DYsU6Lnc6nmHgXbqdcXxuc97r9RnkxPdHkR8XCseBv39UrwTvs6sQ8/iewYJZQjV7P
         ABsXSGAhEjZHL+WZcSlrR2MKzblzjjTaNG54K3dUyj2qdzs9Je9qK0sJMGnK8qStTXct
         V5e6R+UYO9xS0ELz3cb5OUn2PvSMtDX9elF/IJ8vOhZ72B0EXm4XcSIpYsNh9EiS/zFZ
         /WT5N5LONztJu1fHZzPWrXmcZHeCAYuoXWj5IdVZMesgUgBA2XqDGIpXFB4hjB2JIbd6
         6rMaTfAaYmY+w/r2ygbt6pniTo6hjdQN0r4dVuW11LGhxXMBfw4Ywfdelrw4FabaIDbJ
         Qp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVcuzSa6ITgbiUXQ3/VszXDRCE6tsh7BmKWstibWurk=;
        b=EoQIquhNNCvsI1jescW+80ipaqWSBWhv+m83G9uzxf0XP5eIY49q+HV4Jx5XImH1dB
         L1UkduA3OrBrBx31HFOPmGe9rG8R8T/MDY+85mQqsxkfXM4UmlUJW2+gsfF3WXOyGuS2
         EX4pOz6UovgJS4MTNtGk2QUrfX7eA6fn9V03Y7pGh25ywKt0OsA8xc3elomuty+N5arV
         /V3IZpvDcn48/sVl8lMFHPShppjriqazSATMwRwN+H22VG6bdN+P2MMNb3w6EWjl7TZN
         e3gAfObDJogNjDxRMyu1jMSfLN0Tyt5DFQRCVKQSiIyhGJkHIXnhvVB2nIfE1OX01hJu
         +X6w==
X-Gm-Message-State: ANoB5pnK8FAqtfdlYqCBQit22WYzacFfq3/F4DdyJzy+VRdN8j3UGXOM
        SBJY+JmdgiBO3Czp1UZRjZ9skVsBFgDQFAxN
X-Google-Smtp-Source: AA0mqf7zS/oZ/AeLWrqigs8m70l+8YN+UnPxfXQ5V9qKKgPnb1jrN9n239LevfnQnsIU9Ab3VIIJmQ==
X-Received: by 2002:a05:6512:1501:b0:4b5:90be:33c8 with SMTP id bq1-20020a056512150100b004b590be33c8mr16294678lfb.48.1671467188289;
        Mon, 19 Dec 2022 08:26:28 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id v6-20020a2ea606000000b002775d0ae776sm799631ljp.14.2022.12.19.08.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 08:26:27 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: Drop standalone smem node
Date:   Mon, 19 Dec 2022 17:26:18 +0100
Message-Id: <20221219162618.873117-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

SM8350 is one of the last SoCs whose DTSI escaped the smem node
conversion. Use the newer memory-node binding instead of a memory *and*
smem node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 245dce24ec59..16b07d209e66 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -406,8 +406,10 @@ reserved_xbl_uefi_log: memory@80880000 {
 			no-map;
 		};
 
-		smem_mem: memory@80900000 {
+		smem@80900000 {
+			compatible = "qcom,smem";
 			reg = <0x0 0x80900000 0x0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
 
@@ -516,12 +518,6 @@ removed_mem: memory@d8800000 {
 		};
 	};
 
-	smem: qcom,smem {
-		compatible = "qcom,smem";
-		memory-region = <&smem_mem>;
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
 	smp2p-adsp {
 		compatible = "qcom,smp2p";
 		qcom,smem = <443>, <429>;
-- 
2.39.0

