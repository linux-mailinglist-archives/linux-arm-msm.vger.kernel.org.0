Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7346F776877
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 21:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjHITVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 15:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjHITVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 15:21:09 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E5810E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 12:20:51 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so2692291fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691608830; x=1692213630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFQ707YTlR2asiZeDkwXq23zTGpUUmFrLAoTxhmG6mY=;
        b=OPxuvbEuXJUXjzQ89YLv2sBdDf2wZx0cITcGYsNii8MZxxcnyBJ5c8rcGtK4hVNqNi
         bvgzBFviOD+kPmESZ/f8KkYo1Tv4TXZ49/bRINZspYc17BdlSD05VYIkNxNSlmSS371+
         jwLhwnJvThpOeD4qf8YunREVa8PM03sXZsgIrD8mGorZpFd6UIYeMzkb5q05orFGHF5r
         BovPTMhwNsuDP3MLkpcd8kIa1I80udRfhv2g01ZSk0MrTImMoFeaWGt+GN7BmDdbyQTl
         NsqVezWpl0l/iFlkMcS9J26abIdSn7zpTVTagZSULfvqCxhQkoj5QIzkr/Qur0IJFYVf
         Pmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691608830; x=1692213630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFQ707YTlR2asiZeDkwXq23zTGpUUmFrLAoTxhmG6mY=;
        b=H7cPzkjSZJgha1efOmwgk1WDXfj/qVTRLtEAf8YQct42tSsGzC+pZqx5JwCkRU8Nfp
         6ubeZD5g78dg9ceHVwEAq7zBk9DHZIO8KLZ2Ja8MpJzFhk01FuFv+ISSfc7n2M8Y9AUS
         djnRWvv/tsT3qI3l2lAY3gXGR/wrfVmYKSyR6kGBqRX0/j+RSQCrpmPZgWe69dbAuO+j
         y+n5qttf3nl3KvO5ZEeBvVbUwLpQorgU809Ocdq4+q+ThQz7aQDa/NO6dEr5RhCrugxY
         eBPhwMlJ87W78TCYi9SxXr/BA18yL9jGAkeP8QeRWirNpEFf0etJ6EhH2wpwLLCWWVXU
         ewtw==
X-Gm-Message-State: AOJu0YzUYbpYVUykZyBM8nDhSdKQU7eglU91+WXcm46GLC1o5+kUpnyR
        2rNyyviUPTzjNngNehYs7DUx1A==
X-Google-Smtp-Source: AGHT+IGx1WiOqj0jubUGfA3Ryt+VCR2f1eEL3qHMRLstCIQlqiZlZyf0bk+Shq+qIJ3+Bwaqub5OnA==
X-Received: by 2002:a2e:91c8:0:b0:2b9:514d:64c1 with SMTP id u8-20020a2e91c8000000b002b9514d64c1mr112691ljg.8.1691608829483;
        Wed, 09 Aug 2023 12:20:29 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id o3-20020a2e9b43000000b002b9ed203af1sm2863218ljj.132.2023.08.09.12.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 12:20:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 09 Aug 2023 21:20:24 +0200
Subject: [PATCH v3 1/6] arm64: dts: qcom: msm8998: Drop bus clock reference
 from MMSS SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v3-1-ba1b1fd9ee75@linaro.org>
References: <20230531-topic-8998_mmssclk-v3-0-ba1b1fd9ee75@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v3-0-ba1b1fd9ee75@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691608824; l=1046;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dMjovGWIjyf4UWgt36DKFCmom9ibnuPYDRAv7j4Cf+8=;
 b=0aJhMLANoopT9Wyll4mX1KVx6JDNVknG/kysgc0OBuv4vVfhC4gUTx23xhiPcZ61jRec2O2fQ
 9NkAHlkn2sqD1DWLMOhTzsIB89GXL0lNqi5IveyKMkOX4DQlv8M6WaN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MMSS SMMU has been abusingly consuming the exposed RPM interconnect
clock. Drop it.

Fixes: 05ce21b54423 ("arm64: dts: qcom: msm8998: Configure the multimedia subsystem iommu")
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index a41a34dbcc3c..e40f6461f4fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2743,10 +2743,10 @@ mmss_smmu: iommu@cd00000 {
 
 			clocks = <&mmcc MNOC_AHB_CLK>,
 				 <&mmcc BIMC_SMMU_AHB_CLK>,
-				 <&rpmcc RPM_SMD_MMAXI_CLK>,
 				 <&mmcc BIMC_SMMU_AXI_CLK>;
-			clock-names = "iface-mm", "iface-smmu",
-				      "bus-mm", "bus-smmu";
+			clock-names = "iface-mm",
+				      "iface-smmu",
+				      "bus-smmu";
 
 			#global-interrupts = <0>;
 			interrupts =

-- 
2.41.0

