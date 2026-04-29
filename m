Return-Path: <linux-arm-msm+bounces-105166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB5DC8/Q8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:35:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220F491FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9FCB30EA139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689F33CA499;
	Wed, 29 Apr 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AmcHdMIO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="7qOUrwlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84D3C2781;
	Wed, 29 Apr 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455032; cv=none; b=qK02NHoYWeCyUzdPbGE9u4tEwhCY2HChP6/zrHhRuNIF+YfnmKHZWFnC/yT3So/qcaciholaODDnckXKfGbg2ugT/89EjR8pTsuAKwT93ilFh8Xi7+bvzZhgfRJ/9+Oz4d5XbyG+/VMOB42k1X5+cHR6ojN0WFx5SAQuczZKxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455032; c=relaxed/simple;
	bh=vbOeyERZc/20vtfxF94VeD9jomPbFH2j4pcpIHekYI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qA0TKNu0S5OsPP/AK6ECZ0QnEzD6BVivGG6fdjgn4vsET+DeCnBC8OvIPeQAUUWiIDQ2scH4ISsGPJY5vL3ap3wZgBi56vrjR4tYcJpxD9Krr9zpYGDasXB2c6EkoU2AEIaeftgiux864alhI0TJNzZacRuQos3nMb1SbO1u3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AmcHdMIO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=7qOUrwlv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455013; bh=Z9X83L0pwCmY1R7toTZt7aZ
	/pZxu/Pi/2hZVo+w1/vk=; b=AmcHdMIOqZJ1/w/kxQFl6NwJPCGNSijik0W/Z7dcR2pPFeZTZ7
	VQZy8SjFs9S4d3wCOFVIxgJMyNbm652dSI469nIDrtbosnvvs3ElPdqDBywkvxL8LoQ5hi5uz6n
	Qh/V67rI8U+y2H2J6J+yH1GSDbXCjqUiqsOs+S11ur8Z4epMHT10uNa4eBg/rRYZsmcWSK/p05p
	c612bAnL7pVbdvdZlFllf9TXbaqv8WGPhr1Kpyz08QWG9/ysbOakM8eifkZvuOvSMcL3Vk51wyC
	x2fq0kEvUWAUIt0LHt2GUjzG548eaoHxM7IDKQJ/MSPwhFCylI6n3UV4UNmdTLr6KJg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455013; bh=Z9X83L0pwCmY1R7toTZt7aZ
	/pZxu/Pi/2hZVo+w1/vk=; b=7qOUrwlvotcR8HQNeDd+c0THBsRHHYeq633aAfSWNvG2KWuiDE
	bceHBVSl/TpbeHq2gVid1fMJJzwlGyCaMIDQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 29 Apr 2026 12:30:08 +0300
Subject: [PATCH v5 1/5] dt-bindings: firmware: qcom: scm: add
 CP_ADSP_SHARED VMID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-1-16bc82e622ad@mainlining.org>
References: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
In-Reply-To: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=871;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=vbOeyERZc/20vtfxF94VeD9jomPbFH2j4pcpIHekYI0=;
 b=VJSUEbOaeCeorX2Dv6gXlCqHz9U2OPNR4GTDyJfTOq3J2hiQvc8WX2/5CZxzb2B6Gv0LLy8UV
 tRVc3ultdzIBDo3YqlsN2FmV6y14+1ti9FIRB3tzGiqlaK8rph3gs11
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: 8220F491FED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105166-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

CP_ADSP_SHARED is used in FastRPC driver for older SoC's such as sdm660
for interacting with ADSP memory region [1]

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 include/dt-bindings/firmware/qcom,scm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
index 6de8b08e1e79..0d29d8d4829c 100644
--- a/include/dt-bindings/firmware/qcom,scm.h
+++ b/include/dt-bindings/firmware/qcom,scm.h
@@ -35,5 +35,6 @@
 #define QCOM_SCM_VMID_NAV		0x2B
 #define QCOM_SCM_VMID_TVM		0x2D
 #define QCOM_SCM_VMID_OEMVM		0x31
+#define QCOM_SCM_VMID_CP_ADSP_SHARED	0x33
 
 #endif

-- 
2.54.0


