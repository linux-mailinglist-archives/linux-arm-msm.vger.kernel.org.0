Return-Path: <linux-arm-msm+bounces-78247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3767BFA163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50C2D35452B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3753A2ED164;
	Wed, 22 Oct 2025 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JUIac36p";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rDXZp0mE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB482ED167;
	Wed, 22 Oct 2025 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111655; cv=none; b=FLZJvSJ0Bqk3pqJDDiP+qhHef7r7BT9BK6d/a40tNpMvSFyrJ1uLOsSDdj2L7iM65AJFkaOG3RZOZ48KSIXAZ5vJg7xh3wVEwUi5LJ91UBQhuHnLgMwIvGtYfZJNUHfPWhLYiwMeIUYeocsQVXwOblXCmZbKP8KfsHehtBsqt1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111655; c=relaxed/simple;
	bh=Pt7ENDOTElsGzRjCQmIU+epszdp2zPZNAyCGcle9P3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqWl78AkRT7t3CIGKXABdIXtWCzyLKsNnLjXK8xboXkhQ3VmBPaCrCXeHPlTZ44EowEnWPk/4oIdnDm7Miufs8iNt4dObZItnzsMCsn9Ap5Hv2lWUS5ZfPTMVdIlqyZCNouqRrmW54VaLE5cw5U1e3ecEMLwU4t7Tk6Gw/YiJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JUIac36p; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rDXZp0mE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1761111641; bh=n432jT2vab/2MJW+ivXChWS
	65PC55AaK360z0hhFACU=; b=JUIac36p0QxR3rBJNYWEi9s6vwTDtfKKaMVE8gvM8daDYRDdYu
	7/hTp/ErDYmBrsy9u3NQZ5MdT3vICe/hbigS4Omvk2ivssucP16SvRsWzKop6kK0KnbbRFzES/k
	jgd1o6GMWc/6Eqoipi45Li6eoEOcLPUEx1Eft3Mi3HkzNIKRZguEkwmiG5w0iz6lX62tCbTVnpf
	V8VwNSsPLArO/09gp7W+c3g0oChCj+cs6bZZ7C6Fxm64Q+FW6BzoydIBtTUvA10WhM+0trqFb24
	kVRWGEQLyH+WB74tEdtYG0FsHm+kl09KNM5sZS9pIjf4Uqh+c2sYIxWCKVJZiW6zPXA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1761111641; bh=n432jT2vab/2MJW+ivXChWS
	65PC55AaK360z0hhFACU=; b=rDXZp0mE/9dL9vM50n8b9OWhIVEtOM1J09aGU4M9LnfMzpgock
	IBkKdewyxKHGUV5weBqS2NHENSpvftg9BFCw==;
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
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi K20 Pro (Raphael)
Date: Wed, 22 Oct 2025 11:10:23 +0530
Message-ID: <20251022054026.22816-1-pc1598@mainlining.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Xiaomi Redmi K20 Pro / Xiaomi Mi 9T Pro.

Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
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
2.51.1


