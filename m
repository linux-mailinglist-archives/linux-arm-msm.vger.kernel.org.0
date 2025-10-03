Return-Path: <linux-arm-msm+bounces-75911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB981BB7007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6AC3B4830
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619121A23AF;
	Fri,  3 Oct 2025 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="NnVjjwYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2B522F;
	Fri,  3 Oct 2025 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497586; cv=pass; b=i/vNLG6APeTrFk/0ESdfFbFkgALw6WTHmTVFP/aNOWAMhVKZ1XU9WY1gQOnBIPhycwhWiIK7+CZ2e1xzgl56KK/m8e5rdJBgoPdumwUkvQd0/j4w8UQPozOoQMbqt2EnHSaw4D1aaXq9geXPyD2Xj7so2M8nqf9vmmID95KWAS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497586; c=relaxed/simple;
	bh=UCx+Q/v+Up9aRvZQg7oI/4yA5Nu7M6K+nLP8T1RmvDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHKWZx4l8nOluvaShpd00Az9pZxZ7yrOoavAnJZIDIJ/DYOgUdChiCq/x4nPDK0Hs6oT9WG5BJJmsJ2ow0HSEII9s1ytNuQilfWhFmBXvki4O1p/DOxndMxNjrODXhR1KKca/8A6OlmKM908NaFzLAVHl0VVdgXOJYF7ce96muk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=NnVjjwYB; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759497577; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IX1agWPx2M/mnhCEPkp45qTWbj4C57c7nsr9SV/bIts4U9YfTUfDanrCwlz5jzhqTBwRjrUxTlBUzsgvKabMsjCZfZDyfHc/N39BL0kE0T/AgKAj0vA0WB20ey9Sy19n00/MrBupFQwvP1KeSaooLxZjN9v77r5tM8Ev9slvwIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759497577; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=; 
	b=JQefk6APR4GdZYCmvMVet5YZaLDjPDrucQXACDLke/rjihEacbtBs4IxFCMEjZsjQimcV0LUbnDQdb6VKossZV7HyOFLefzbDC0HJga0dIYWgRug9KS6hAxmLIIWMHXBZZ5zCx8YehHtXyZ5dcrYEBPcszjKyevTIwo7xU7ZD6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759497577;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=;
	b=NnVjjwYBKtPF/BNddEd+4w/yPO6N7gj5jWKm7lnfEuFDblPE0dgUY6diTUUNmtW1
	Q1gQHUoE/9qn0ieyEGgNTwJcnZGumuAeyfcBcamBdXS3aCOU1d3zBkzy2KtVl9vaSyF
	4f8B4tpSFpY8/Y4tgZUiwI6qpG6V8QWw7aFqx0SA=
Received: by mx.zohomail.com with SMTPS id 1759497575944644.3273662791833;
	Fri, 3 Oct 2025 06:19:35 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Fri,  3 Oct 2025 21:19:24 +0800
Message-ID: <20251003131925.15933-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003131925.15933-1-newwheatzjz@zohomail.com>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251003131925.15933-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112278b43d5b7296f48d298d7c27e0000bde89dd1a14b01801709ffef3566009ed46fb8eea8fd60aaee:zu0801122700c41db7c9bfdac74268997b00005d5e3e70cd8442767693eb96494c36d983ad18696044780bb9:rf080112261939f4a3d6cbf8b85c53c2a7000093b7cc0314494e7c40b0ce98bcb113e1986c644af9c7ac30:ZohoMail
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


