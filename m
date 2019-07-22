Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D256FC1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 11:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbfGVJYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 05:24:52 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:10644 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbfGVJYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 05:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563787488;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=H1gWY6IE7LGNkWVyXPI5Uoz/3tQSH/9wfOxoFpAOzxQ=;
        b=RvEn72DNgfMJYlcXG0u23gjrD/bKDOo6PDHehgPJj9r5V8Lf5rYNVoDvILe4j3c+w/
        aIYwPTIcJYGYM6xQvP9hSHaJYnHddvuj74svbQFvotPh0fib3foR1IAZ9tPKuyzuK1zP
        HQicjaFr3XIQ7WrIobBlAJttekStyUVpRaQzBVNSvhBtSL+e1cBoKGquzFsCexFdQPdu
        SLmLnQJbSL+oTKdqmmjlNIfAqr1pC+WZdCs4aNKh1gFTI51UdIN267A7si+aGcJxqPfR
        HSUD0XszUXExMj3H3tFY3uYKKonVqmOwwNC8ulSg9Z6B9cwAQb2y0vVHSigJLxnBl41k
        o6qA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP4G6N/EiB"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv6M9OmObx
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 22 Jul 2019 11:24:48 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH v2 2/4] dt-bindings: qcom: Document bindings for new MSM8916 devices
Date:   Mon, 22 Jul 2019 11:22:09 +0200
Message-Id: <20190722092211.100586-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722092211.100586-1-stephan@gerhold.net>
References: <20190722092211.100586-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the new samsung,a3u/a5u-eur and longcheer,l8150
device tree bindings used in their device trees.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 54ef6b6b9189..e39d8f02e33c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -45,6 +45,7 @@ description: |
   	mtp
   	sbc
   	hk01
+  	qrd
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
@@ -115,6 +116,13 @@ properties:
           - const: qcom,msm8916-mtp
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - longcheer,l8150
+              - samsung,a3u-eur
+              - samsung,a5u-eur
+          - const: qcom,msm8916
+
       - items:
           - const: qcom,msm8996-mtp
 
-- 
2.22.0

