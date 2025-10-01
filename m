Return-Path: <linux-arm-msm+bounces-75698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F55BB0ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941A62A45B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECCC2586C8;
	Wed,  1 Oct 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="VHsYt4j2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708B8212B31;
	Wed,  1 Oct 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328494; cv=pass; b=Cu+TP2xZq7esCY0rHoQAluojDX3tInVWPjhlhhuuWS8g9EoCKjCGOtuX/+6pmnY7FXIQaOeltZzwtGEzS6Cto6ypEMW08orvTRuCNjCIrOOxhozd7k3k1asqBKsWKpnnc/IaZ9BpKC9HAJTteKPi7F6NtHwITHFZvynMYSIIEGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328494; c=relaxed/simple;
	bh=UCx+Q/v+Up9aRvZQg7oI/4yA5Nu7M6K+nLP8T1RmvDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gm88H41A2a0nw4X5lRhjxoDM/jRtJGObKqwuFAGcyGdA1c+ChRiglUMgBjdLzsCqjPpji7ojdrKdQkG8XVWWGuhb7iwP0JpoSvkPYsuYPbsk9Lr8r1vp/TqO0dVBWY/UDSCdAMKdcxKVXGb/c/tP3RX6BLVUqWFHNOQ6Yl55fPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=VHsYt4j2; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759328488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WiFNBVPsVmxNNZw3OPvmm+30OAgYwv0xmLbaxtC9NEHJFvwxCWwGk4aDTpvHeAP7VRs1O420sLnEThX1ui84YachEjXhD9bXfZR0U5VK9zueitKguhc4ovjhYMflHLQtsaCYXeVdqpuY9hfdDTFKg+izjMvov5h7DqBi1pL1w6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759328488; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=; 
	b=Vbr70NP2CeoJ6pcZFd/WIABDI/TljMOh7ydVrK7birBCTjB0FN5cqXMgODhAZ3R/1zO29dQ7ylMPGOWFDcsfsaNGfElYyFDCIpux0SED3l6L7dO5o/TXDJNxMiNSLya10Kt3Z301ezIKAqbB7po0CUagyqV0ZAxtKrCMDBUQCSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759328488;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=dXpyQVgErznLFISPFWnTrBznE8b+Zk77c6YDc0u8bEU=;
	b=VHsYt4j2NbJfrdnRozLopsM1AtMKe+78/rvtyoNPmnMcNmEnhB5xGrVHTc58JUDq
	Ndj0Y28CHWagzrbjxE+XuCQwBon8uhJvwXOPR/dCkt4fS8uOA7SYWNvLgVi2Epz/LwN
	qhTTJxs1RF8OdCANZwLextoR5Lr4Jkij0wXK1Ag8=
Received: by mx.zohomail.com with SMTPS id 1759328486480135.78304201248739;
	Wed, 1 Oct 2025 07:21:26 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Wed,  1 Oct 2025 22:21:06 +0800
Message-ID: <20251001142107.21860-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001142107.21860-1-newwheatzjz@zohomail.com>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112271a1f1c971be94ce0302376e40000da5bccac1cc02727949f127215b3c17459e22e6992d7312b50:zu08011227d9e9f6d188e6228d9686120100000b820426c8d050a954bb361e05158414ade1ee76c89dead2a8:rf0801122625009e2e70f4aae943dcba0d00000bde9bb1fb1a7dbf8d05739576a038748770c20fc80a29bc:ZohoMail
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


