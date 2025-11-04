Return-Path: <linux-arm-msm+bounces-80372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC076C33302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBD218821F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E595C313275;
	Tue,  4 Nov 2025 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pq6qEDNG";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0/77oJUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9130CDB1;
	Tue,  4 Nov 2025 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294654; cv=none; b=FTFunE3SPdwd02MRk5QhMjYE+uRm74JWBHwLlZnbF4WsG8TcQwEU3PC3+P6O6ZpL9xbV039Jgzx2EpXdi6HmxOM7Ce7elYvWTrtNVrc08n8cg93670+8xjFcUs/ch+G4kdvihfixebav06eu+Vbs3C4iH90uV8wm99kkFbO9vFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294654; c=relaxed/simple;
	bh=+BFaXB26O/b0HmVxM6VKiQz+qurdE0BnVgxv8AgvYEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLDO02uIN+AQaUNhEFqrVrgY6rp/+e3REeqR4yBBaud8hYs0qpTbQFfSVufpo5Lrl2GFyfPQdq824t2U01iYVzsNHixVORPPILtmQlUGbUetZWAbT840c5IvtbS5GFJyD1ht94dIxL2YgmVfRYXGnKindzg3O+MfgrNbnFwrOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pq6qEDNG; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0/77oJUF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294650; bh=s/yfI6inVk/K2ZS3MsLcuyi
	vUUzxYm6tzR577zVFhSc=; b=pq6qEDNGUkiENrPVUBxsGBu7IIuNIWMREIUeFy2/+SA9Fmwah2
	4aJjWoGwsZM8UnIDoFCyNvhRE82VFoxAEFtihKtZlb6kBRKud8DSDqH1oSEbA/qhNWb1xZcKVgY
	CEY2JNZovncFf0BxVSeeg1KBaRYGp3n8BQfP8FgwLl542TOjUCdtMQ8m3tlLDl1Kw5YG9yMLk1i
	dzDjHhY0w6QPMNqwzXmPhrwFgY+o4nSKylDeJsyVqK7btfKuCmCWMDxFtTGDmqhmmo+gWEp3yA1
	8AtiNuyr80LILK96C9cqC8P9VVweCTo+XCDtXkE6tmag6N0Q4WlqRrRjsHIjIxcVjig==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294650; bh=s/yfI6inVk/K2ZS3MsLcuyi
	vUUzxYm6tzR577zVFhSc=; b=0/77oJUFSlprHPH+WQeZ+Hs3ketIPsxP2ljoY9cp+Hf+ObPNZl
	uSdddBnVmVc4etm9WL2YFDOlYO066ScPfkAQ==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	david@ixit.cz,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Xiaomi Redmi K20 Pro (Raphael)
Date: Wed,  5 Nov 2025 03:46:55 +0530
Message-ID: <20251104221657.51580-2-pc1598@mainlining.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104221657.51580-1-pc1598@mainlining.org>
References: <20251104221657.51580-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Xiaomi Redmi K20 Pro / Xiaomi Mi 9T Pro.

Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..b81930eec39c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -983,6 +983,7 @@ properties:
               - qcom,sm8150-mtp
               - sony,bahamut-generic
               - sony,griffin-generic
+              - xiaomi,raphael
           - const: qcom,sm8150
 
       - items:
-- 
2.51.2


