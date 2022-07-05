Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD4A56712D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbiGEOfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiGEOfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:50 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200C3F3E;
        Tue,  5 Jul 2022 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1RiwGMr62ypcp68vk8R9EtbXqeYqjatLpR9QdNoQVAs=; b=Ntwof444ar/tX2GSPEroI4ryw9
        e5dUK/egzAv31L2+MmkBJQvhccg4rN6aet0z1D+7yEjYoqYxcoc/dZNeJaR4uhcDyILF1TfcPzAwh
        B2Pd/ktKdhev7A1tmri+lzeiqZXRD5N7Oe7f/9yLDLuMURspTQmrM2RoOqzTjrrz8UV1DpgRp+UmW
        Nw5wPvPcj6RjVpk7RZYaOe4yBQJo606H6XU9d0yhTgk3jzhS9M3kmhCbRdiOy6AyK23mfnQwjV3PJ
        Yj0rYh7/ao9knHBVn6M1Nn+i7K/NcD88a9Zrvq6LeERojG1a8sySSC6MzZL6bVKGiykojxwKWjhL3
        X1zvoihg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeT-007EB6-DM; Tue, 05 Jul 2022 16:35:45 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 5/8] dt-bindings: soc: qcom: spm: Add MSM8909 CPU compatible
Date:   Tue,  5 Jul 2022 16:35:20 +0200
Message-Id: <20220705143523.3390944-6-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
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

Document the "qcom,msm8909-saw2-v3.0-cpu" compatible for the CPU
Subsystem Power Manager (SPM) on the MSM8909 SoC. This is necessary
for CPU idle since this is a fairly old 32-bit SoC without support
for PSCI.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index 07d2d5398345..f433e6e0a19f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,sdm660-silver-saw2-v4.1-l2
           - qcom,msm8998-gold-saw2-v4.1-l2
           - qcom,msm8998-silver-saw2-v4.1-l2
+          - qcom,msm8909-saw2-v3.0-cpu
           - qcom,msm8916-saw2-v3.0-cpu
           - qcom,msm8226-saw2-v2.1-cpu
           - qcom,msm8974-saw2-v2.1-cpu
-- 
2.30.2

