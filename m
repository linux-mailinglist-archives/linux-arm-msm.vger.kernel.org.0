Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF7C5784B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbiGROFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbiGROFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:05:44 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB05F5BA;
        Mon, 18 Jul 2022 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KEQbjyX3IK4TMz889tHy4uRRmO3cwtzyqR7UuTp19qw=; b=byelj/kaaF8ioAB9oLrY2ZLwiI
        P68vO5FvrxxmfgYfd5a7W/w/Kuj2QNUodE11MzVwOxN36CwV2YzdsmnmVvBdDWPTR0xIrQslAmNNm
        uibZCFRUIzYzxsAhjfDkGjpM77U/cLhZl96gWFDn6E1GI+RunHRTi0GREYle74PTnVsT31asIGayf
        VmxeUnkSSLpBylcG2rKMBq/2v8UBqljCsI+q9iIx2Cqcd2Czi98AYpvhGISh0LCLH5O99WRr0/Mf1
        pl+5YgP0WoDM+aa28dD5SOLP04i9irLdjHZ8CvHUzD3LkNjXV6H3Gr5LyFeCIK3Por0YW2XKGfvBy
        qUUV6bAw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oDRNN-008iC6-5c; Mon, 18 Jul 2022 16:05:33 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Subject: [PATCH v2 1/5] arm64: dts: qcom: msm8916: Drop MSS fallback compatible
Date:   Mon, 18 Jul 2022 16:03:40 +0200
Message-Id: <20220718140344.1831731-2-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
index 05472510e29d..07b23e0730d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1329,7 +1329,7 @@ bam_dmux_dma: dma-controller@4044000 {
 		};
 
 		mpss: remoteproc@4080000 {
-			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
+			compatible = "qcom,msm8916-mss-pil";
 			reg = <0x04080000 0x100>,
 			      <0x04020000 0x040>;
 
-- 
2.30.2

