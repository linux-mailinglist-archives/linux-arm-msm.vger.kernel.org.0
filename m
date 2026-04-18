Return-Path: <linux-arm-msm+bounces-103586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GND4Mtsf42nwCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 08:08:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B704201AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 08:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7F1300E242
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 06:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB96A340DB9;
	Sat, 18 Apr 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjkCztzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6F12F585;
	Sat, 18 Apr 2026 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776492497; cv=none; b=Vv2gl77JZSYAdAL7uqYv7hqi9alx/YtUtGZYlalyMuqRem0y0oPsdAhC4WDavwkN6exQPiymN6QkP75vG1eRJ5/xKbgEyrYf4qvKjDoIGh5jHakz+f0uOyya+V8AiuHTJKb3utZ1WqzXkWpz/lGXrJ9u+el8cUdIxahMLgcrgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776492497; c=relaxed/simple;
	bh=4tdQ4myJ3/2Qzw/iKug70gkDUKySGOD6S1ORNO1oIao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oLP63aFKfwDPLcSOlUj5k4A0d062Ekecovu8roVd1Xqs9nLOR7cY6jSP/ZPVaBWWW0a27njdBPf5umIunfiWZmOkJC/2reANR12IQmKi2hWCI/P0TPvPVrRAmHKgi2E7Tp+tG96Ynmr0meM1HAiGRGuqsxN/6aOAYZObUadhhWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjkCztzT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE0AC19424;
	Sat, 18 Apr 2026 06:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776492497;
	bh=4tdQ4myJ3/2Qzw/iKug70gkDUKySGOD6S1ORNO1oIao=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sjkCztzTpepswITq7pxryFaFS2dRoRiv06Ai8hLlA8/u8qNkpWpL7FqkIQJc5uyGu
	 DdRQgGMxyrFnmfxCmFqEh6Eh51MUnWQFcDn37Oyu5O3N70IIZYu6MHoNMn3Z2k0uik
	 87FVYzeFK+IW7qNmKl7cdkAVTntgghQebMjV6ZRcMR9nN4Bsje5D/II68wAWUZfNva
	 Dj+s6uUdN5jBE9sxhI7Po0KyASMPK9EfKKk9D23D2Y+KU5PNsFfD8iHo2mZToBitGU
	 tH63u7v1WGlwJUeXAzT3XUQGA7Y0F7R6vKXyXVd00wbIjIYp+9wnhf5dStOg5lvoiS
	 EAmedkxTVSRNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15935F436BC;
	Sat, 18 Apr 2026 06:08:17 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Sat, 18 Apr 2026 11:38:15 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM4f42kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ML3YzE3PzExNKUzHxdS0OTRDNjM8tES5MUJaCGgqLUtMwKsGHRsbW
 1AItMNWVcAAAA
X-Change-ID: 20260418-hamoaaudio-914a6369a94d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776492495; l=1437;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=t8xKrGP5JlZ29QeT2aH4/4HxK5N4poIHW/rEsjbHC34=;
 b=6Tn3gQGGE69Mma0ktj82/PQxI2QTsMpvMWqD7NMGD2MmU5gb9Qe121YjbAuABdE6d0xFg6glt
 zoX38nXR2fOCwfvIx6cnpfG5Y74GkSy3YkR8BnNosOa1ajACeyfMLCu
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103586-lists,linux-arm-msm=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 26B704201AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reference the reserved memory region for audio PD dynamic loading
and remote heap requirements. Add the required VMID list for memory
ownership transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..3a0717d49990 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -4371,6 +4372,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-hamoaaudio-914a6369a94d

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



