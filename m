Return-Path: <linux-arm-msm+bounces-100597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIeCGo//yGn1tAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:31:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0B351931
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA2F5300E616
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D552FBE1F;
	Sun, 29 Mar 2026 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lHPfex6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B562D5A01
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780299; cv=none; b=hAX76axcCj6b9n++M1QasjG4EhwNb5IdZhllwFOGCUyz1nmeahpY/t9JDHdLwKjdCTSQotr4u+5IpVpP6EpjcmeDMJ3MOmCv3JML7mXrCfqrYRmTtDBEZEnFwSLu3hldErWC01UQ0VvdKoNsTrbbBA+YpCC1HOQWCq9f7ZaIxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780299; c=relaxed/simple;
	bh=vc4G9ZHUODvdpPo/QPGA18D7VElWKAOlgjkWMaDVmNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAUUleyuhnkO2mJ/GEN8QyKbbIIdtk40gJm6xQbc4yH27XKlhygxp/J9ueYPi2uXgvqhWfX3tFrO39XJtLTdRxztFSW7R+sZlZFvxuI6Z+YH2p+5jAbe+El3+whC8KLLuEAeG3fdcIiQ4tOyE4vJcCA1Z4S/mZ1F0fKcqrsM+BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lHPfex6U; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774780286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CFAKJAB4Aph+kt7HsCig5cXi/YZzAEI5065gYb8udqk=;
	b=lHPfex6U8xdmSMN1wJisxKDGw6XLcKoo09RxSdEm3Ooqi1rBnilIlso1tPt28rpwm6fRt8
	A4zxj2mSuRSwlXORUeniFJLW9bos46onafFnCCyokDwdFps4PjwEQYu2H3rJhgdHE9k4Wg
	4Vg/2nwpongniUAQV6QVjGVWXqvZ/hMZblA45dxbrtXzXXikrfsGDb7PMEsSJWZ6otzrrL
	SDunog3py9Myp8adVEiD52XsDaDFNKHicrRkJ0gzvLn4fHN0HR+v/jMf84P35ZfD4gfA+z
	3Hqr3ZBLzN+46xTg0VeOCnJOv6U4U+uMmCy3kJOs6JVy7xyK3KHM3+tushro5w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola edge 30 (dubai)
Date: Sun, 29 Mar 2026 07:16:39 -0300
Message-ID: <20260329103055.96649-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100597-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:email,packett.cool:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBC0B351931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Motorola edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..58f1621bb855 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1038,6 +1038,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,dubai
               - nothing,spacewar
           - const: qcom,sm7325
 
-- 
2.53.0


