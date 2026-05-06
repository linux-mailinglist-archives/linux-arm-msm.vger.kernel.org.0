Return-Path: <linux-arm-msm+bounces-106211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFPjJa+z+2mJDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 23:33:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DE4E0A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 23:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C5A6300679D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 21:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF62335A397;
	Wed,  6 May 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jv+ylAOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B2350298
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102635; cv=none; b=LizLwJ5jp1pAJUm1bNdKqburHi3GgR6O9II7iE2glJrQ4LXR16RnJ6Xr/ICPKXG+O5ZNT2iMe973jVFZS3U7MdUCY+jdAQkIExnwkDkgbsr8z75Jpwy/EAOv7OAVazWYgKqG5qim1+J9GuCAGEYAKOzK4f81Kk7nlZDiHnR87+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102635; c=relaxed/simple;
	bh=bOp/XnzpWg6Okv/XKeNm3o16G8ypAnd1OT93w+aI4pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6nTicUN4VQohiqZOuGNPoyCQUguwh2FVDltb+rZjjxyvhMKaA0yxXvNYZllyiwPeTBjY2wtIpf2seUtLhfU/icCX5JgTSD4EwPg8lhc4MSQDtwDxLHsMHOGcap+Dc5p6AOOYi05+8sJ0f/vNNcoL4KOCwBAnLKsNjxHkMhKfDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jv+ylAOW; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778102631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=27j38BQzRRUufIyWGUwV7rnv6ZNf4FgzfmGcfX1k3Vg=;
	b=jv+ylAOWBLap9D/0r+8+x7AYFnL0FRgbCOOuKbs9bgt5YkreYKlrB2MdARNJ49hH5H0ZtZ
	YYfNtkiT86WWJhCY57qU0aosKLfWw+GRimHGIYz79CszB95naPbHU4zIryE3d38ulKavfJ
	c7M0L9mJXH5tK7vebjuMKTgDxWSr5/8EKPEkCyKKILpdTzJZA8J0mcvqK4iAJi9o5SgZZY
	L94O/39H+pCTGuXJMuyJJsstu9iJWlVzoKbW4qaaoZp2TOp+/VNzyFNTqm+uemp7SBpeFW
	U7pLqI1Zds6Fx7BOIEM6nyfL0AvqWr4uQu9tHDyijnhlE3Ms1qE4PxF3gcw8mw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Wed,  6 May 2026 18:16:52 -0300
Message-ID: <20260506212319.682749-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 348DE4E0A09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106211-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Action: no action

Motorola Edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v3: no change in this one
v2: https://lore.kernel.org/all/20260403054417.167917-1-val@packett.cool/
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..a5117d0839db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1040,6 +1040,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,dubai
               - nothing,spacewar
           - const: qcom,sm7325
 
-- 
2.53.0


