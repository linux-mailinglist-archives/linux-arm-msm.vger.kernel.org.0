Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818E64218BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236936AbhJDUxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:53:16 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:32871 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237051AbhJDUxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380674;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=P3pJe8UTWqOR4oauZ6Y2fQM+55nPWxe9V8KCULIJ8Os=;
    b=CbBFa8iPw8NwTAiwQd9BtEUy50z+lxvvQRhSGBM0fH1FEBOwNsy3oy7S9mffOlA2Zh
    iTLWJcRYdXXe5BwMYyyVx+Niy+HR3sfcyIaEbYPjD+blB9vT4J6nX7JTxYzpta0lm/dj
    rdBLBY6UdX3Ce4uWsqoRgqojIm9H9r+BtDLGP+UWoef0TcabgOBFCLXUhuNVRlbwrl75
    sgV8AxyO4XwEo/4+7IjvGbHoiqif6nYI5+k3FR8uTiyQlVYlI4EDQn4wUM7o59kZwNas
    C0BWBJkvedE1X3akzZNUwVOmw+rnAuWwNe5ufeluU24AsGu0krqE+h5+AYhLN6Xe42aG
    musQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KpEKSn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:51:14 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 10/15] dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
Date:   Mon,  4 Oct 2021 22:49:50 +0200
Message-Id: <20211004204955.21077-10-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the qcom,msm8916-saw2-v3.0-cpu compatible that is needed
for cpuidle for MSM8916 on some devices with signed firmware which
is only capable of booting ARM32 kernels without PSCI.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Add Rob's Acked-by
---
 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index d68c002527fa..07d2d5398345 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,sdm660-silver-saw2-v4.1-l2
           - qcom,msm8998-gold-saw2-v4.1-l2
           - qcom,msm8998-silver-saw2-v4.1-l2
+          - qcom,msm8916-saw2-v3.0-cpu
           - qcom,msm8226-saw2-v2.1-cpu
           - qcom,msm8974-saw2-v2.1-cpu
           - qcom,apq8084-saw2-v2.1-cpu
-- 
2.33.0

