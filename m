Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFFB4316F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhJRLMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:12:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:31516 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhJRLMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634555437;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=PnF9fnRz1o1owlgAEPgqtGCoSlSZKVU2JM4V6EtRi+E=;
    b=OjShHuG8ejK8xhzKjTiyUVa52JyRUmLKLIf9c+yegbkRg1nseqcEG00Q3QxBv0uYYD
    4de4rV4omcQ/TTQ+uAIhC7oKDdu2TwNqP6aw3de1GkZuyAK3wRVWHwzT1o5vqAl8ctCi
    cimTcYmNCnF/LUUf+ORK7kKmJFjFFQwxTey5qscI4Tvc5QrKXjlj4JtpZtzR8ccvPRiC
    HRphgFZniQ0boUgdvbTDmwooaxRekEmb1MCWOcHhR4w++eyhijHZ8AddSH7psoF3cbsK
    H4mggr0OhuZN0acEVUq8qvdwNvF6JvX3/k5w3e5lnsDGpeBR/9qTfOiAH3wAuX9nhfOs
    3trQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IBAbVhL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:10:37 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] dt-bindings: soc: qcom: stats: Document qcom,rpm-legacy-stats
Date:   Mon, 18 Oct 2021 13:08:01 +0200
Message-Id: <20211018110803.32777-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018110803.32777-1-stephan@gerhold.net>
References: <20211018110803.32777-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document an additional qcom,rpm-legacy-stats compatible that can be
used similarly to qcom,rpm-stats for older RPM firmware versions that
have the sleep stats at a fixed offset rather than a dynamic one.

Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 99dff7d73b7e..566678d02008 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -21,6 +21,8 @@ properties:
     enum:
       - qcom,rpmh-stats
       - qcom,rpm-stats
+      # For older RPM firmware versions with fixed offset for the sleep stats
+      - qcom,rpm-legacy-stats
 
   reg:
     maxItems: 1
-- 
2.33.0

