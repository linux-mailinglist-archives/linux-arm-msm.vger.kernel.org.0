Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B373567128
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiGEOft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiGEOfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:46 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8387AF3E;
        Tue,  5 Jul 2022 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GnQiwhSeKgSWb528tyFdhTGPu6fgyfiQjpLyZ1zT8t8=; b=Es65sQU/Htqx2AE/r3wnoOW7pg
        rdTVH3IVgsui4USZMPg+8yDJ0RFwUvxAEtuk8IQZDT7M9eJXqh0z0RVO5kyhAO/7rAinoUUNfgeOr
        KpRQuajw1plK8Ofm4PNj2DdvOVDyqML41sEDK4igfpcpySTpSqK2NJ9PE59CLmEV2UqGH9shMviHo
        ymy91mgYqngr4pMUn05Cl+acf3C9qCQsdhKslkSMY6iRvZmfIl80GRK5LLXOdpjyvpmrI/wWBm+al
        QTVUKCrHADZ0IrJkKnGfp6722I3x038iU3gKhOjD7Z5gDO/FSXEVRmarBEpppde7B/f13zSKiFSHt
        Wiz8Wfaw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeO-007EB6-Dh; Tue, 05 Jul 2022 16:35:40 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 1/8] dt-bindings: soc: qcom: smd-rpm: Add MSM8909
Date:   Tue,  5 Jul 2022 16:35:16 +0200
Message-Id: <20220705143523.3390944-2-stephan.gerhold@kernkonzept.com>
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

Document the "qcom,rpm-msm8909" compatible to describe the interface to
the Resource Power Manager (RPM) on the MSM8909 SoC.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index f0f1bf06aea6..32b89147909d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,rpm-apq8084
       - qcom,rpm-ipq6018
       - qcom,rpm-msm8226
+      - qcom,rpm-msm8909
       - qcom,rpm-msm8916
       - qcom,rpm-msm8936
       - qcom,rpm-msm8953
-- 
2.30.2

