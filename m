Return-Path: <linux-arm-msm+bounces-76284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91825BC321A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 03:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95355189CBE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 01:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE374299A8F;
	Wed,  8 Oct 2025 01:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="TsIUHOvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FF23E320;
	Wed,  8 Oct 2025 01:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759888470; cv=pass; b=RhZZomz2q1WJHH0VJzCFxYI1DCS3d2thMsTS1VtvbfGhSNhXvfHOXugMC32+GX159BoxcD+oQh5Y2l8G7z3r0OYx7vG6nzZzFlNPRJWrAd7zD6UJjP0oHgqGR8OUgsZAGN2hDXPZzexNexauQpxq/mGl97J7jalj7X5i9kgAHIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759888470; c=relaxed/simple;
	bh=dgfnn9/QLmFK+D6OYwNccW6H+1JK7n5ioinioN6VcrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScVMCmzCmUzYtcgtn4F2kV65tBFPfBtf3jhBx+7yZp5nJ292/s1t7TtCh6hMaS7+YiEQ/xXB/8z+dn8sMvPvjOIqhaSEIj6ouhdZw2NRMHIpWa1/8tpB4/6pgrea3hR3RpYvf9qeFRUx9j6st2HJxP0H/v3FjeQQejSZvwnxCYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=TsIUHOvp; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759888460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QVejwkTLOYMV4dLuwgIGi0sFUQZvJwgDHSKJvBFrRNdyvf+wubozVqWWEPkuUL3J/pXth+lLvThPv2iQRGBomVzx9YFThwxJWxnDe+Ad8OQPaZFfvjqpqjcAa0cfnc1EO41h+lDFjUlzE1pFvPysslC/2rzppUXM+vQwTE73y34=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759888460; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+q4u6H0/xA5V23XKGBAID+Xs02Cto/gKBQMu08TxQ6A=; 
	b=Z/lyM3inZFdaqdhPDhna8plt9HRzFRDi+MKgjaqcrXWteKxUZM2Opjo75k2b1lh2P6feL5MN3sbYQjPBSQB5MO2eaUDsruqWaW6Jpk9ZVJh3LS8t/LM0fQVpJ3/iUEFiW5IeThtu6Z9BHk/dPzPm6wnvlTL6YjswP+j8mpp6vCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759888460;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=+q4u6H0/xA5V23XKGBAID+Xs02Cto/gKBQMu08TxQ6A=;
	b=TsIUHOvpsuXVn+LGDn3L087jDYpj2ax4jJavlR8mO8aSw566DT3urG62OVom450S
	zdfj6EmajCsHQTjJfn7OaCJ8urL4ZP0ZQ2czzTGK935WeXCMkaRcHcUqfMwlny7jsR9
	u9lbkr1CrBWEUkPm4T0/85lLzOTNF2bpFur0dh+U=
Received: by mx.zohomail.com with SMTPS id 1759888457186116.5012706570401;
	Tue, 7 Oct 2025 18:54:17 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Wed,  8 Oct 2025 09:54:03 +0800
Message-ID: <20251008015404.4906-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008015404.4906-1-newwheatzjz@zohomail.com>
References: <20251008015404.4906-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112277e81857c0c3b30968fa525e700000251a2e73abafe03a4b9683e84da28f92071feb64045430419:zu08011227d6902975c79a9cc004e99169000019b3dc714debdfe0d4061d012fc6dcc89ad797259da2cdfd6e:rf080112269a730f765af996c15dd950d10000f3f0724ac300e63fd12b6d708e22d86549f44b96fdae659d:ZohoMail
X-ZohoMailClient: External

Add compatible for the sdm850-based tablet Huawei MateBook E 2019 using
its codename "planck".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..2c1ceb8d4f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -893,6 +893,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln
               - lg,judyp
-- 
2.47.3


