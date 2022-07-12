Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D599D571A4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbiGLMqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiGLMqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:07 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CCB9D516;
        Tue, 12 Jul 2022 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aD2rbECvCO3gom0r7Pj4MC38seHQ0mbymFuuRLMPlIo=; b=MrF4glDWczhmvuAlDEYa2TOySF
        Fk+5TX0JvW0fGI46gFW4crMjuPhvv7JZlD6CChwFGs2qWQ3qqktRtK/tofhfy/ETnRAphXt2zssHu
        /R+yW0KcxQPUaj1aM6JzBneXX1idKxxGvMhH7W667j124bMaLbHBvxZoKaJuKjWtJR5dR4a6faQJW
        tNrPV7pXfHkFXvUiVofnF5amuhjRLHvKQRmA4WRULOZS4DuLPZr6pItlm4WpBHGZq4sigUXOW8ko5
        9/9AxPR5Qn3BaPkNI7FTobwX05fFTF0biPzxbhGx4ftc7EoOmAJbquPU5hcYQA3MaxENH4Q6QRLwa
        PnTQk07w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFGw-0087Gb-BK; Tue, 12 Jul 2022 14:45:50 +0200
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
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/6] remoteproc: qcom_q6v5_mss: Add MSM8909
Date:   Tue, 12 Jul 2022 14:44:15 +0200
Message-Id: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
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

Convert parts of the qcom,q6v5.txt binding documentation to a DT schema
(together with some DT fixes) in preparation of adding a new
"qcom,msm8909-mss-pil" compatible. The schema can be easily shared
between MSM8916, MSM8974 and MSM8909 because they have almost the same
requirements. The other SoCs are quite different and would be better
described in a separate DT schema to avoid a lot of complicated if
statements.

Finally, add support for MSM8909 to the qcom_q6v5_mss driver by reusing
the initialization sequence for MSM8996/8, with some minor if statements
to handle the differences for MSM8909.

Stephan Gerhold (6):
  arm64: dts: qcom: msm8916: Drop MSS fallback compatible
  dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
  ARM: dts: qcom: msm8974: Disable remoteprocs by default
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
  dt-bindings: remoteproc: qcom,q6v5-pil: Add MSM8909
  remoteproc: qcom_q6v5_mss: Add support for MSM8909

 .../remoteproc/qcom,msm8916-mss-pil.yaml      | 263 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         |  35 ---
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   4 +
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |   2 +
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |   2 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 123 +++++---
 7 files changed, 362 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml

-- 
2.30.2

