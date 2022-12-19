Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3809D650C8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 14:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbiLSNT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 08:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiLSNT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 08:19:27 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E695FCF8
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 05:19:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m29so13372339lfo.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4m7sigmBhYBgKY9HRGSI2miJ1dbHGKyOlPCPQtX404=;
        b=XSbVyrCX/Fg7rgQ2d1UDfvTwgV8SobdDnfIzHyRafjtEBGGnqBArLiPUQDG2Ox7OT0
         kYmFaZ+T/urCGF8kYSejmPpyO/i6LPgBNu3AwneFTBjlnZKiPnnJ4fSM/Fbm4NpiSBBU
         e1dLAr8eAUz/jDBnTJXWUa5r31EWoy9nYPklZrEkuXh0LM9BvcrMn9y47IGcomhTA+Z1
         G/DYfp64lORHBkeQpVlob3ST8LLQRk0uBRHckUZAPDviAuWCxVeAmP3f3P0/prZCJff6
         B73J/4P5onkG0FWFblcPBvmW6xh3IHzSu4T2rGwrOMwNWWz59wwi3aNkDobRBUyHQFRP
         8agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4m7sigmBhYBgKY9HRGSI2miJ1dbHGKyOlPCPQtX404=;
        b=KHTSaJQdt/XFwhomEmEtj895seCZNGkPBlhzkaQgx2JMMUdHl7jTfPz7d+/opGxmTu
         org23Pp9td/lQTQ3C0e6vBkc46xplj4IT+L+LWXGQJjxzl89pVhaVP5BDEVA/+CWG+d0
         mU1GiCjKmwEjzswxVaWWByO67G0ysE/Ij4ONfpeYjlZ84CBIqCOWm8JNmSxyhg4PG6iT
         LGClamTOCCq9Gq0XO/ZpLrCYYk28bPV7ukdMcrH4ea2a0/IfAKsFzNpESIZsI/dKCjRq
         TpD8Yn2G/43sCukKwD2pLuLibCQUd681iyMPJfYMCIkMvpSlIYLh2/5qEv/hDXq7FREz
         3kBw==
X-Gm-Message-State: ANoB5pmY0P5XXbgMCA46bPUEjIcet58Gd2c0M+bH0StTSprqud1eJuiY
        WpklCflV7sZTI5RklYBuxEsi3bCpv9SidNVa
X-Google-Smtp-Source: AA0mqf4/CC3d17R/ex5wGel8ruP1CZZ00EcwlgQyc7QkMKeA6GwrCjJAv0mvCALUCLbiWtUr0YC2bw==
X-Received: by 2002:a05:6512:468:b0:4b5:5efe:966e with SMTP id x8-20020a056512046800b004b55efe966emr11886555lfd.15.1671455962187;
        Mon, 19 Dec 2022 05:19:22 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512370f00b004b581ab4c77sm1099501lfr.78.2022.12.19.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 05:19:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jeremy McNicoll <jmcnicol@redhat.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8992: Don't use sfpb mutex
Date:   Mon, 19 Dec 2022 14:19:17 +0100
Message-Id: <20221219131918.446587-1-konrad.dybcio@linaro.org>
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

MSM8992 uses the same mutex hardware as MSM8994. This was wrong
from the start, but never presented as an issue until the sfpb
compatible was given different driver data.

Fixes: 6a6d1978f9c0 ("arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X) support")
Reported-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 10adb4986ef1..02fc3795dbfd 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -37,10 +37,6 @@ &rpmcc {
 	compatible = "qcom,rpmcc-msm8992", "qcom,rpmcc";
 };
 
-&tcsr_mutex {
-	compatible = "qcom,sfpb-mutex";
-};
-
 &timer {
 	interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.39.0

