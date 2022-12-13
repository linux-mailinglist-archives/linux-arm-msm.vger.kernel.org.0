Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4860264AC78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbiLMA3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiLMA3M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:29:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEA61DA60
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:26:34 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so2275122lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64a16xm03GDRzSrRzGbHGfzDIJpeFaTeX77Wh7ttti4=;
        b=iuYfFxLfpTQ0Vm7Ok91YF8ZXJ4acYipdS6f7TntzmkZxAwjmS3B6lXk16+ACdini3E
         Mpo9Fp4hwU/4FxW/kfVEPlW3CVdI3XihyKrdCx4okSOSNMpSkP0z5s7tcVhzI2p/jy1L
         pIGrPvY6EyoZH1I2Z1qEnnkhKIlme/ueWzMN1RChyxFHhi2ziLKaphFjWM/1meO5wq2I
         uikUmwFHzKq9ERztMJAh1WhP2ZDPzW6lrDGYJ8baUPHr9rmFk8CQFcP92w035VA6XPbN
         B2AL2sahczhBh46UPTOSob/xyMDjC9B8yanWNcsjy/B+BJc229qMHS2p7sUPyGsIdhBL
         awuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64a16xm03GDRzSrRzGbHGfzDIJpeFaTeX77Wh7ttti4=;
        b=lNS68KwDYiWfmNXqqLSlnj8vhvvLmMQJ+keQeSQQx9qlKY53m8pvbnpuFmswbL3Ax9
         9GkdYgSZ0Tl/iS3vZQpUSYWc3Lpg7IQGN+FPPAMVmlcZ7keJ6dYcS0X4utjUXVH59W2g
         mWEmqT0P+j0CKjYbdZ/WvzD8XDXYU8QpDb2fnBRI3VQGC2s8BlPnLBnOBsunxB1BXjtG
         azty44AYR1tchlcrOxUrlZHUeRGuK45+D4xmtrviRTQ7ql3SPAauCGE2nMlZwmZOax2T
         Ji5x2tJAAlROvs464Ylx4YAFesOezdeoAFkj4shqCdTHfijbT5OXVQ1/vgETDK1CwC7Q
         v6mA==
X-Gm-Message-State: ANoB5plw65+YpXRv/uI1h4k8tsxMK67WpjAnUn5pcsD2hQkRvfwHGXDM
        wydZDIO15x93+n0uC5pxlB9FFkSfRDX2hBqm
X-Google-Smtp-Source: AA0mqf7IM9a/qZExoPzn3FRqUdqlme93mvUre5klopIcd86b/7ZAfQ5P7d5H6I4XRQvzJRo/BoHueQ==
X-Received: by 2002:a19:ee11:0:b0:4b5:b6e8:bb53 with SMTP id g17-20020a19ee11000000b004b5b6e8bb53mr2934454lfb.24.1670891192101;
        Mon, 12 Dec 2022 16:26:32 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id y28-20020a19915c000000b00492dba3c85asm139371lfj.220.2022.12.12.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:26:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Enable split pagetables for Adreno SMMU
Date:   Tue, 13 Dec 2022 01:26:26 +0100
Message-Id: <20221213002626.260267-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002626.260267-1-konrad.dybcio@linaro.org>
References: <20221213002626.260267-1-konrad.dybcio@linaro.org>
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

From: Marijn Suijten <marijn.suijten@somainline.org>

Allow the Adreno GPU to access split pagetables specifically on the
dedicated Adreno SMMU via the qcom,adreno-smmu compatible.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3f940cc3f32b..83b4450fb3eb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2253,7 +2253,7 @@ gpucc: clock-controller@2c90000 {
 		};
 
 		adreno_smmu: iommu@2ca0000 {
-			compatible = "qcom,sm8150-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm8150-smmu-500", "qcom,adreno-smmu", "arm,mmu-500";
 			reg = <0 0x02ca0000 0 0x10000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-- 
2.39.0

