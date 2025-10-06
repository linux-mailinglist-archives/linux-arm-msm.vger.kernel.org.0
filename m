Return-Path: <linux-arm-msm+bounces-76059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71281BBDFF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF1DC4ED408
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C51927D771;
	Mon,  6 Oct 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="AkCVMV1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED827F006;
	Mon,  6 Oct 2025 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752923; cv=pass; b=qoNhCcACIxV8GXGEUZpOU/HaU8bH94GJNh55vFI4p8TxfGsUFBNwfCBcRtnad+I+pWp2/n4y+HI3vc6Eph6GGFY2W3a27er0D0MDZbHhnbMQedkNVTBjzO3YP2y+ToZHdQshthQ2EpPe+7N+eajHkIHXu5DlTUSIQg01y4z5ZXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752923; c=relaxed/simple;
	bh=UCx+Q/v+Up9aRvZQg7oI/4yA5Nu7M6K+nLP8T1RmvDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brFb43C9qEWoHtjKrwpaS62ObtkyXVTkYjz9s9o6iFV85aDmZ104VpbSZO3SbpjvUNi2c7UQo7GPdPjA16sR7wOWCmrjgs/fZ/B2SHWn0yix3FLuqDSDbUsNvMtEXSzaoNBNH/3fJt6rPAH88v0S1KxB1+l9LpkgbauSP1LQ110=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=AkCVMV1A; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759752916; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E2NEWA5AE+K/Kt6Cd93kTY4BWsTKm3q6dfyXrgsD7ZoD5Xz3AT56flWgeRfxQvYSYtTKTdA/JTCKcXcgXBlwtLPqRCExRdgSruGdeWJlWipicXjIMT4+pV33DpKt2DhvZ+6Nzg3ZH9VYzfV0SpY3uayA4LLiv3bydHAvwqSB0eU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759752916; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=; 
	b=NwfZH4ouL7a+d8mflHhN1lV0XLTIHxCH2AEItAf6ewt4GjlDoTiit9gTOGriOdjLVJr/xQLZTiKIAVnPBxgA6q74HF0WQ5N1x2zH6o017laNawi5F+NR75YU7IXBV0/P7MR89ED95gtgCdNWTllXHqtL/acja5IujIs9bFG23Ao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759752916;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=;
	b=AkCVMV1AT/AxBMfCskglIrzxtfJlUe1728Itz2kfzg04f3RuLGE+D/4h9KRis+d5
	12tPvd46ozWzA+EAY1faea8fREHw1zk5vTahoPazRHBfBjWLH9ppyLU238SGNOZ9G6t
	AMbpH1YRXNj184CdcpgdAztRCINEYJcHKXd2/xro=
Received: by mx.zohomail.com with SMTPS id 1759752914531191.22963622203463;
	Mon, 6 Oct 2025 05:15:14 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Mon,  6 Oct 2025 20:14:54 +0800
Message-ID: <20251006121456.26509-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251006121456.26509-1-newwheatzjz@zohomail.com>
References: <20251006121456.26509-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227af60f4f24e3f701d5842b57800003fb062fbdb690a264879fb6dfe5dafd56f922438432c461ff1:zu08011227056833f721c95dd7e21649f70000c37399be41a632f3476a2071a54548fbc28e33288e0aec521d:rf08011226638d6348310e9190d42d519800008fa0956de43e85cca0882df4f53368a01fed22eb5c903b31:ZohoMail
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


