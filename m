Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F33567123
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiGEOfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiGEOfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:46 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8468838B6;
        Tue,  5 Jul 2022 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lfKvd6kLV0gVxHVUI8wa4zPzhwb+1sr4KPaNFEsWr0A=; b=MUFLmjTak7SfGiJDZIU/nTQoeX
        WMp3xeaQLJml9dj4O0m6QOw30H1n0eIhyyVcsoIqgUxQuMmaFRVe61XgDMb3GAYFpLL/MWvaqpv+C
        hpTCiErqWxy2PrQFZJdpDc3NF6hCYjWopnLAszgteEEQ0CDMt1tiy+Nuuq2043xzRreu4ARaSTGwy
        PMbLPB9U8wVK0OzlmIFDU+1UtqYAg1RAqjznMdoyE3B0Ct22whu53FSIyj+bjErKtEAB6Jju2zq4Y
        6tlHiyIvaPnoQyXOv9hZIF49lvT3f9j+/gg2KsG457aILGfySFwyzgawmd66NV6CLSDNmQv0Gn29S
        rBo3DxXA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeN-007EB6-4q; Tue, 05 Jul 2022 16:35:39 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/8] soc: qcom: Add compatibles for MSM8909
Date:   Tue,  5 Jul 2022 16:35:15 +0200
Message-Id: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
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

A set of tiny patches adding compatibles for MSM8909 in Qualcomm SoC
drivers. Most of them are even just aliases for existing code (usually
MSM8916 since it is very similar).

Stephan Gerhold (8):
  dt-bindings: soc: qcom: smd-rpm: Add MSM8909
  soc: qcom: smd-rpm: Add compatible for MSM8909
  dt-bindings: power: qcom-rpmpd: Add MSM8909 power domains
  soc: qcom: rpmpd: Add compatible for MSM8909
  dt-bindings: soc: qcom: spm: Add MSM8909 CPU compatible
  soc: qcom: spm: Add CPU data for MSM8909
  dt-bindings: arm: cpus: Document "qcom,msm8909-smp" enable-method
  ARM: mach-qcom: Add support for MSM8909

 Documentation/devicetree/bindings/arm/cpus.yaml    |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  1 +
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |  1 +
 arch/arm/mach-qcom/Kconfig                         |  4 ++++
 arch/arm/mach-qcom/platsmp.c                       |  1 +
 drivers/soc/qcom/rpmpd.c                           |  1 +
 drivers/soc/qcom/smd-rpm.c                         |  1 +
 drivers/soc/qcom/spm.c                             | 14 ++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h             |  7 +++++++
 10 files changed, 32 insertions(+)

-- 
2.30.2

