Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEEA358993
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 18:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhDHQVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 12:21:34 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18460 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhDHQVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 12:21:33 -0400
Date:   Thu, 08 Apr 2021 16:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1617898880;
        bh=r6oNEZxrF56D7bbKtFPN2X4x1gfRGJR8ZXv54hesgBk=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=PJyc8IXuh3uG275LvrebXeZMrE7gD+WcsRVQYMWb5deL8ATs/7HRVlKlVgfxP7X+6
         T/RqhcQFyXYhbMzgSi8bCK8q2SitzVcee7nE/S1wOYKLAed765+fsMKKBVtO9lUk9m
         gmdS4/K0cFT8xFn9boQJcD0dagGJaGSImUFXS7DQ=
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
Message-ID: <20210408161953.26298-4-caleb@connolly.tech>
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
index 84671950ca0d..6a3b001bf01c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -51,6 +51,9 @@ properties:
   interconnect-names:
     const: qup-core
=20
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
--=20
2.30.2


