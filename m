Return-Path: <linux-arm-msm+bounces-103260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPQ5G05f32m5SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B5402D9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA45E30B93B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9F833DEF9;
	Wed, 15 Apr 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QWrOkSQs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vLWyf8y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D733B6DB;
	Wed, 15 Apr 2026 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246040; cv=none; b=qqmPJVmKDHuJwbkzYqukfc/uKMO0gpMJGIC6SjdnT9dwgkZxpr8ZjDoyYQ3YWXnVpkL5Jq8n2htukEucumVFN3mq5RvQHs2hfEDg/4JOL/+nxQNcmZt73+Rt6pxMoqgK2i0SpZ5AB92bzKt9g9Ce1kwQE1WmngvQivaiZg8KtWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246040; c=relaxed/simple;
	bh=GJbk7JlYiJz4h0VUyQlUiR3mnt6AHJEa5ETucslsRsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUsb7dQX2n5xb3aTrs5HwBZ29/YwsHC+pY9xRRTO+524M4pySZBOm4vD/T/hncZaUSpjkRsfKmS30ZTS1v+tydVt06pUDNYqUJq1Dp3oGoUajRcXoUHWRrGAIHqmpFQ06anMfZIu+ViRZD3V1j/GeqCpejDbP/E/6zSH9FY0Zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QWrOkSQs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vLWyf8y2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246026; bh=v4lIYjv9uJrzes/E1O8O0rU
	z6HcIeUcneJS3yUMBmDM=; b=QWrOkSQs3qTeIz7v44FjfINeroXBFFKKLsMErkT2VgLTdSKfzj
	PdgFfAaSMH7sbA92qYUuqruduiHZZ6+odi4MfI2nJCcyYufdQtl1IYfT18FJ2lAa15Q0lxGG4jM
	iGkE1jV3Pc6PMY5Bfy6y3AMUyQn81vaIOMXvHX17Za2vuN6KRb6xTQ2uXmGWpr4ew8yCsqGmKgm
	NniATWQrmM5hO8KwZMT4B1+Y93yj29+sclQHDHTNAE15KQGYKN5VHR/1T7wWt/2y472JBLp2jp0
	YQewSJQe2QeUa0Yc46ct/t0s7PLVFw3Mm6s7qZzdv1wVrpVFkj7czJ5/dCP6/5sKDTQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776246026; bh=v4lIYjv9uJrzes/E1O8O0rU
	z6HcIeUcneJS3yUMBmDM=; b=vLWyf8y2IEyhCpppo/n/We77vgYcbP9gzGIbtjD2DUg2dXxKMs
	NGmjLFuLXQEHvZ8a1C2bYJU6zBI2qFTIgsAA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 15 Apr 2026 12:40:26 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=877;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=GJbk7JlYiJz4h0VUyQlUiR3mnt6AHJEa5ETucslsRsw=;
 b=27bW6kHa5LfVNj39eiy4jsBGjnl1SOEJFv2jFzN/1b71W4HkM0G0VOiAgC09EMez1Li+xQDTn
 EPSVo9KxM12DChpGvBv1Un/KoNv0mOHjXqekVtM+3VbDA5m3Vh0Enxq
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103260-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 701B5402D9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
assign it to the ADSP FastRPC node.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13094b5e9339..19d80fbba57d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2456,6 +2456,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_mem>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.53.0


