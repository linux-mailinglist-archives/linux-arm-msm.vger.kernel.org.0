Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8BE5B25AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbiIHSZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiIHSZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:25:17 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008C14DB26;
        Thu,  8 Sep 2022 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NT7X1Sz5W6hQSIsiU4ULlcCcuruRhLO5lb17p/kGl3E=; b=CjAh+JtQhKpfLiqP2XIz1gTKh+
        DDDQHx4rrvytIgiOrQws6xJ5nju0emEA+QOfRb0326lxcsZApak4HClhUm2IOuEyl91QMIe7GZ6jv
        fpFYneR36uv9h1OmIocVJizTrRTuv9GPlF5FqK2012GuSXUw2Puw3M3VhTDR9nI7pkEwgc+/Wy9s7
        ZUuwudK4jR9D/DDWioINXeCLIS6uAIHoO7LvteMSkxhoWgcvB0E6rgAENK2W/Jm8l3KvT188W4b7N
        7rCjdCtro6FybO7YfWsktSFM28BcSr0oHNk1y1ppjpId99k27H16Hms5t/rvlT1puYphktLbEvb0f
        CFHchNvg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oWMCy-004g9E-LC; Thu, 08 Sep 2022 20:25:00 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/7] arm64: dts: qcom: msm8916: Drop MSS fallback compatible
Date:   Thu,  8 Sep 2022 20:24:27 +0200
Message-Id: <20220908182433.466908-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 was originally using the "qcom,q6v5-pil" compatible for the
MSS remoteproc. Later it was decided to use SoC-specific compatibles
instead, so "qcom,msm8916-mss-pil" is now the preferred compatible.

Commit 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific
compatibles to SCM/MSS") updated the MSM8916 device tree to make use of
the new compatible but still kept the old "qcom,q6v5-pil" as fallback.

This is inconsistent with other SoCs and conflicts with the description
in the binding documentation (which says that only one compatible should
be present). Also, it has no functional advantage since older kernels
could not handle this DT anyway (e.g. "power-domains" in the MSS node is
only supported by kernels that also support "qcom,msm8916-mss-pil").

Make this consistent with other SoCs by using only the
"qcom,msm8916-mss-pil" compatible.

Fixes: 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS")
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4: None
Changes in v3: None
Changes in v2: Add Krzysztof's Reviewed-by
---
This fixes the following dtbs_check warning after the DT schema
conversion:

remoteproc@4080000: compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,msm8916-mss-pil', 'qcom,q6v5-pil'] is too long, or
        'qcom,q6v5-pil' was expected
        From schema: remoteproc/qcom,msm8916-mss-pil.yaml
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index de741f287e1d..147c6aa3f046 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1345,7 +1345,7 @@ bam_dmux_dma: dma-controller@4044000 {
 		};
 
 		mpss: remoteproc@4080000 {
-			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
+			compatible = "qcom,msm8916-mss-pil";
 			reg = <0x04080000 0x100>,
 			      <0x04020000 0x040>;
 
-- 
2.30.2

