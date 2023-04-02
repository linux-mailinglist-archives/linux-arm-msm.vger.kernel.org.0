Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43E16D36FF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjDBKJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjDBKIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:08:30 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBBFCC07
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:08:05 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id z19so25403117plo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQeWB7xzGpVsc7eSrbLdl2ydZmcfTTPBoAGH1zyjD1o=;
        b=vRPZr3p4VpgQ6vXed9A7xF4IPQ8CIb+6EzV250PkoDWrBcaUYh57h6rmRB/49T2etT
         6KHQaERageVbRqWbT5+tQVWQI2rFlztY3UTrutyY3TvB+/iBU5Ut04T3JuhX3NjMVSyv
         BAIo9ThPK/D2Dfs92UlXXT0gm5C/rRQ3Dx388pxmoBGP76iQPVcod8zysw1mo9upGx63
         /SfeMnRLKy5z+8xh5yomBJHsCNV2PVxufg/vIObezWFi2R36z3ev6QAZUhFDsPfGPchU
         Mq8cZNe7K0qXZBKTtmvdv5z0ZAy2iKAVt+7ko3L7OZs8znXtVF38TmYW1MVUzeO0sxcc
         p8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQeWB7xzGpVsc7eSrbLdl2ydZmcfTTPBoAGH1zyjD1o=;
        b=VOWmeM0Z3Y6OtyVKVRfRzBlZlLxwL/NkLfN0WuL1A4akZizgd7ycmVPiJ5wH2lit/y
         PUBjTWo92rk3/oJ+sYuyZWtXBUlfz2GgKfeR8ANCa7nsB2h0uUs2Yqk2TWYKUJGdz/fO
         bvK8IGKVXDoPdrir59V5IjqLRP/TVxrFF94RsgeczVSrjOfryxLuuTsuBmkqzrO3aYQ/
         nazUvO9NP2TJ+Dnu7rUjcaC1W4bEuz8UFt3cRcvopA1uwN8W4UO3nxf/rdHBey1MJzBy
         X5sQmyzezk2nFWBDIcs4mDASDhPyby8Ee08vD8sLkDFad675SShoyuXhgGgFDiAjBLmK
         KE5g==
X-Gm-Message-State: AO0yUKV9imUv5DMy0PSuSLwgJJeRqykSxyBEVhSerFCo6dL4C2FDl5lI
        6F9yfJz0moAWLbqj9dzIG1u+Hkhxkww1QVdMtoc=
X-Google-Smtp-Source: AK7set8xL8z2WnG8+Da7ZwwVGgyCFnqdjuzEvIUG+sAuI3tEIWmMDHK1AQHMlxZez4vxrS6eT8Y86w==
X-Received: by 2002:a05:6a20:671b:b0:da:dbf4:e385 with SMTP id q27-20020a056a20671b00b000dadbf4e385mr27587349pzh.54.1680430084388;
        Sun, 02 Apr 2023 03:08:04 -0700 (PDT)
Received: from localhost.localdomain ([223.233.66.184])
        by smtp.gmail.com with ESMTPSA id a26-20020a62bd1a000000b0062dba4e4706sm4788739pff.191.2023.04.02.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 03:08:04 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v5 10/11] arm64: dts: qcom: sm8350: Add Crypto Engine support
Date:   Sun,  2 Apr 2023 15:35:08 +0530
Message-Id: <20230402100509.1154220-11-bhupesh.sharma@linaro.org>
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
'sm8350.dtsi'.

Co-developed-by and Signed-off-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7fbc288eca58..090ee07d1800 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1730,6 +1730,28 @@ ufs_mem_phy_lanes: phy@1d87400 {
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
+			compatible = "qcom,sm8350-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0 0x01dfa000 0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x594 0x0011>,
+				 <&apps_smmu 0x596 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO &mc_virt SLAVE_EBI1>;
+			interconnect-names = "memory";
+		};
+
 		ipa: ipa@1e40000 {
 			compatible = "qcom,sm8350-ipa";
 
-- 
2.38.1

