Return-Path: <linux-arm-msm+bounces-74907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AFB9D5B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E8D1678F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F94C1F4C85;
	Thu, 25 Sep 2025 04:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="LSdgrmSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB82B9A4;
	Thu, 25 Sep 2025 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758772999; cv=pass; b=TPk9vC8LxmGT6zMFOazYaSCYAOb9/SiCsSe/OF4f1hL1WxSXPsmJ+edeHvNa4KsqyndHI0NzzgVnAjsaOVSsp4/Y31U2cdPKDgCjmzu5bLvpSlKAelVL7TXE6mWKZfesuuQgvmdyB+bjwn8D8+yzoJMrbsICsHt6fAI7UZdYhI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758772999; c=relaxed/simple;
	bh=j0JNqETfUV8ZTtHPugzgp53jFW1g79PZN+s8TbO9u10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9mIQynNhQnMZcGQqRj4IUJmT6JzQHOnGC32hOxd6BRl5XPr+PTEIW9wDhbXFDvfOVNy5EEQ/iUaCLUBwSHotamvHOCFCyVQ4XGO3GjUiQ4gaq8NvgWXstwIzAPVtUXjyciWPFKVLizS8SKIeNnohiG5B9p/+s4quDoIrVQ2STU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=LSdgrmSl; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1758772991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jx0EDBXH60Fyko54ILL+z3efv2oi++J+BJPuza0JlZ9gmDCnb2EeAA1YyhFxg/JS07vw8DmOD5wyipMpukb1JT+u9UZU/e7f41aX3UYebRss5XxCPsYz7U5MEPGKt/Cg+Av8UAiqRws2f3JMXImW4xZdSacVXKZ/nJnHn4p40N8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758772991; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=biwcjgaON9MyA4O6iWgnRUPBQJDPhGPq/pAxYvrCfIg=; 
	b=isOTgqHUYyNQp/sq/sToHXQaDjH5XpYRBng25qE3481fdM5xVdjXbwWVi/hjkBFe0VDFbQFTZ0SShSvifDhuK4N5Xsv5wrNkaEuhRxbznl0wzHZ2f4IGo1wX5nHlKDKEsLJHjb018g7OHJydDRpizjWgmDJ8CL/FfsY98Hfdm34=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758772991;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=biwcjgaON9MyA4O6iWgnRUPBQJDPhGPq/pAxYvrCfIg=;
	b=LSdgrmSlsv5IYIhlvLDoZiARoQabCWgObzf+KF5+pUotygUOSDW8zd02KZYxsv03
	cARDzQs80gsL6LQjFYUX8cu1IgAxuAxMv4IXreGkvrt3fz0WmplZAQu/2hFQbLpXOlu
	5gCxXv/S5harAQveBheGNETAkfD2cJs8Z5yneWMU=
Received: by mx.zohomail.com with SMTPS id 1758772989028593.2505959757327;
	Wed, 24 Sep 2025 21:03:09 -0700 (PDT)
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
Subject: [PATCH 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Thu, 25 Sep 2025 12:02:44 +0800
Message-ID: <20250925040246.8454-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227fa5dfef18278789a719a3e5200004c340a1d465bbff2401ea6dceacd9842d6ed6a6ce235351d9c:zu080112272b80ead9472730ddd1a061c30000d98111d49c2a0e0bdfd9f1e7a1adbb55307ff39f4a40cd6171:rf08011226f8b2bc2960aa1d0c36a1fbc500005c924807842978bc600e053729bebdc50fbebf34f7b7f707:ZohoMail
X-ZohoMailClient: External

Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
or the sdm850 platform. This series adds mainline Linux support for this
device using device tree.

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
Jingzhou Zhu (2):
  dt-bindings: arm: qcom: Document Huawei MateBook E 2019
  arm64: dts: qcom: Add support for Huawei MateBook E 2019

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 967 ++++++++++++++++++
 3 files changed, 969 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

-- 
2.47.3


