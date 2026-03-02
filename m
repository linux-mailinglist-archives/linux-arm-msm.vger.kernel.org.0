Return-Path: <linux-arm-msm+bounces-94932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OZBHN2MpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:13:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 347831D98EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5084B304F5F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1E3E0C77;
	Mon,  2 Mar 2026 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OJdCszWj";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="j6RHIbe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213DD3E0C65;
	Mon,  2 Mar 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457071; cv=none; b=V6WU+laWvNJ5ekIGpK+btxwclbbQT1HWy6EhNDimQFmWCrw2oHNuUpWCpww/r+6PnaJ6pUBt8/Fm90OH3AzMXbxfRDlWiairU8aYKAqpwiv3mHjD9tWhVp2KN6doWPQ+CevTTPhaTj+6S6DzI74TxkLmU6m2SUW7JpcvzKFW+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457071; c=relaxed/simple;
	bh=t8oc8JDt2e608x3X8ZqaFFb/ngOLHac77ZTqYBbzizI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvbGjI5OGYE+8Gl2zBCm5Zt7MfpmR229AHM6KTG13MoZ+mAbqyKkA63MY2NNrnsXEXNh0Y8OjrPdm7Gw0kNDR8n+nAtoxLpRaS3KBhOuxStgWzFyR/0i/2a06ZpBn42WTRFxhPYtg3czBnNc+lcKN95SgWjZ7x2e8RrXpMx5iiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OJdCszWj; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=j6RHIbe1; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772457043; bh=nbcD0sgt3M7NkjfYuNxSnj+
	7YeOQ1n3E7X8hZDizAqk=; b=OJdCszWj49oi25BKZpch2s8VfK8wXLu7jwY3GNxFGQyaFT+GvD
	ZwYDMwk3iSwVR0xyE2B9EhyIzmDezms6WWQ0ilEEQULya08DOZXxnJOYsiNPhlCD/I5u7bsfIMB
	Azq4l3rJVsahksXNTw4JU1SWLZVxGauCRvNzVQt7v6tUdA1JaJ+d64tw0zTprv3zn599FUdPe+E
	m3qlcUSsdu0HQei48syQaTWAYTrxso5TzHPUvTSUOZmqRwpRyzMdzWpiiNehi9kiWIy3HYVwril
	3Lhm8ptlsIL4ND8UR8yvl/bfCcnDzX/yua4x9+qKn/wnwtSebKBGfBxFXmefJALUYxQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772457043; bh=nbcD0sgt3M7NkjfYuNxSnj+
	7YeOQ1n3E7X8hZDizAqk=; b=j6RHIbe1caLwRZQSEIxcyLs5DUBaHzfGXq6/sm9J1ouHBnoEMP
	7IVlByok7N/f8pzM8Z3KuhKGjfRrtz1++sCw==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Mon, 02 Mar 2026 14:10:14 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450
 and SM7450P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-fillmore-socids-v2-1-e6c5ad167ec4@mainlining.org>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
In-Reply-To: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94932-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:mid,mainlining.org:dkim,mainlining.org:email]
X-Rspamd-Queue-Id: 347831D98EF
X-Rspamd-Action: no action

SM7450 and SM7450P are two SoCs of the 'fillmore' family.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb370b874f41063ba057d5ade4f003..4efbf06fad9c9bd3ca33910d48dd3b9574271e5f 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -245,6 +245,7 @@
 #define QCOM_ID_IPQ5000			503
 #define QCOM_ID_IPQ0509			504
 #define QCOM_ID_IPQ0518			505
+#define QCOM_ID_SM7450			506
 #define QCOM_ID_SM6375			507
 #define QCOM_ID_IPQ9514			510
 #define QCOM_ID_IPQ9550			511
@@ -264,6 +265,7 @@
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_SM8475_2		540
 #define QCOM_ID_QDU1000			545
+#define QCOM_ID_SM7450P			547
 #define QCOM_ID_X1E80100		555
 #define QCOM_ID_SM8650			557
 #define QCOM_ID_SM4450			568

-- 
2.53.0


