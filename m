Return-Path: <linux-arm-msm+bounces-74908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BAB9D5BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18B34A8217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A38B20296E;
	Thu, 25 Sep 2025 04:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="KqG6ysBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B32B9A4;
	Thu, 25 Sep 2025 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758773005; cv=pass; b=iBNILPDqVjGQ3+1jLjO4bzSddzBacbP1ekxoQc42rxHDLoWvvQzpqwvn3JJ8YlpjZKYqjVfjjZgOcqg1VBYrzWbGrqp7UB05Y1F3SNW69fwYw3idCOcuFOKgpakOUsxaOw8WJ8cQDzYtGlQokB61HaGz+8sRoc4N8cxfaSDtGYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758773005; c=relaxed/simple;
	bh=UCx+Q/v+Up9aRvZQg7oI/4yA5Nu7M6K+nLP8T1RmvDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZYmIvgu0y7LBkDLR1PphHFkVEb2/aSE6qFlP4vSK2usycW+oWI/Z9LnshNIfyze/yQjiw7aedcBujm8sCcuSfLQtrUc6/05nDHM+eQIsAdeUNn/YCG3DI3u7udH1IuW3HQrCm7uHdmcX3hi8bVL71SaGomuKnIwDeosU1BUxxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=KqG6ysBa; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1758772993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lAP81Vte/KwXDeJeZj1Uh7s2S0R/hIIECXwRCOsrzLQ6kNZP14tBx5oBDKJdVTPU+McZ4nUhE+a5wAllGvZOqmyvuKBf9X9eTT2nBcHJJVVBLYT4AfztgGfCiHvzdaFVUD2kOo19cto4fIfzlYowUVJTrjzUINcZAJGYDK7EVY0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758772993; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=; 
	b=ngYITXkEa941SIUkTpfec1nx8yyNhY8UNbtH6nhg/jYekAsmCz/ZzogCT/98ziyDLE6DzW/ST+Y23GpHZ+4HqagJQfCJbAARCKz9vYMKwUQFmVwlYamz/sk2YLBQSjD0DhrS7uSwEOOme6lPiFg1UoXHaQLWEJhox/IIwwNF+08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758772993;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=;
	b=KqG6ysBaSraywQ57BDyH7ZXC+vodgh2iNFKI4o1j3a05bqMXsF5f+sNIvKIf81x2
	cNKwL/nSMTEAUgvj0dZHAbNdf4xWITusussgUr5wzH8gRBv7Va2OAp4I3LrZqMoYbWA
	8virKwROv6L8g+P7rCYFJ5dk4k5Yu1HwLM8TT/P4=
Received: by mx.zohomail.com with SMTPS id 1758772991950807.7981314082474;
	Wed, 24 Sep 2025 21:03:11 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Thu, 25 Sep 2025 12:02:45 +0800
Message-ID: <20250925040246.8454-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925040246.8454-1-newwheatzjz@zohomail.com>
References: <20250925040246.8454-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112279305e7ea19423900b220f8eb00002ff0bd5d189ec94f7082ea236a85defc59a659a29435e43b6c:zu0801122706839bf778247151cd766a6e000034a34e29626d5b567be940aadc6a05ec3a7bfd0dfe66c8ee7d:rf080112268abe4dab782d897f48db79d10000ff6d892890ecfe90bb31db8a68484d6e5fe1703a88e9070a:ZohoMail
X-ZohoMailClient: External

Add compatible for the sdm850-based tablet Huawei MateBook E 2019 using
its codename "planck".

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


