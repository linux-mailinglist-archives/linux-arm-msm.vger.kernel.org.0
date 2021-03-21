Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4CF3433E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 18:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhCURrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 13:47:00 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:34395 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhCURqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 13:46:37 -0400
Date:   Sun, 21 Mar 2021 17:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1616348796;
        bh=dXeSBw1LUxqYgI2VXBLKnIR9qi2RE4oYa/g+20vEYF8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=c51B0iHB4MW4WThTKwu19MoVyaNK9EKBv9asxeQPuldWH6QMINwtBVvzmuRR9O1Gi
         5a5MD4BGX++dLF4CY6ah/kDNZTRyrd/APUByTfzvSaylWzxJFIU67ZdI1BT6bcpxpK
         yt+7m9ZSYb/JDkQS5xEuVXII7+0V4bH/koV2UeR8=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 3/3] dt-bindings: qcom: geni-se: document iommus
Message-ID: <20210321174522.123036-4-caleb@connolly.tech>
In-Reply-To: <20210321174522.123036-1-caleb@connolly.tech>
References: <20210321174522.123036-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the iommus property for QCOM Geni SE.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b=
/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 84671950ca0d..68c4ee55ae7d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -51,6 +51,9 @@ properties:
   interconnect-names:
     const: qup-core
=20
+  iommus:
+    description: the iommu and adress to be used to configure DMA for larg=
e transfers.
+
 required:
   - compatible
   - reg
--=20
2.30.2


