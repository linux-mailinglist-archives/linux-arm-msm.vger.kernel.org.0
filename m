Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549E85784B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbiGROFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbiGROFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:05:44 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD5B1581D;
        Mon, 18 Jul 2022 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WJbMbG1S2uvxcR5r3NqyT2CvNf2y+o6Hbi3keAffiV0=; b=WT81n8CFGvilNr0lw7Vh6MJZlK
        2vfhFvX0qXzCVMj1sthuQXC+J8UZx+waWcdEX5nXpnzEArcs4Ho0pcoLp6ZplJezY3PbZ+Ub1JQpq
        UhZLwCZh0+Rs9hmCPCzWCAvNqH+EPCALd8giCWYqx7qtiAdzQb+8mvzDitC/Z29rMVW5deaGAChSS
        l6NXlHn4gT5bJKi13UgeN+slhfnSH3UY75alZm/Zp3Zec+in+OjISxMfUH+UfUnbY7G7sZLoEZLjs
        t9f7jX20qrQ/R0GCplf7I7DvY8+nnyjoN8Wb4KK5nfVj4GUlwKoG0VxlyhJ564b0/GCEHt3JH81vg
        Bra6fYNg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oDRNK-008iC6-TO; Mon, 18 Jul 2022 16:05:30 +0200
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
Subject: [PATCH v2 0/5] remoteproc: qcom_q6v5_mss: Add MSM8909
Date:   Mon, 18 Jul 2022 16:03:39 +0200
Message-Id: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
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

---
Changes in v2:
  - Address review comments from Krzysztof
  - Drop "ARM: dts: qcom: msm8974: Disable remoteprocs by default"
    since Bjorn applied it already

Stephan Gerhold (5):
  arm64: dts: qcom: msm8916: Drop MSS fallback compatible
  dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
  dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8909
  remoteproc: qcom_q6v5_mss: Add support for MSM8909

 .../remoteproc/qcom,msm8916-mss-pil.yaml      | 264 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         |  35 ---
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 123 +++++---
 4 files changed, 355 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml

-- 
2.30.2

