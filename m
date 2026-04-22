Return-Path: <linux-arm-msm+bounces-104145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA89Jx7s6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:41:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF94480AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EB83306780F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D5B3624B5;
	Wed, 22 Apr 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HpoCIaUQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Hg87Vhv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66035A38A;
	Wed, 22 Apr 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872408; cv=none; b=B7rlkCIoam/KOHvqV+AuHbN7T/PjoWWFMCxZSEQSsl15u0AdC0X2SqBGwGNLzkJErgf7+RFZ+KKE+mlFCA68JLDCR6q3D/h2PpKciPW07uttWPZ401k3+NdIJilU82snksJT0Vj10jXDwcF3q3bcUSvxj7V5ejzSSkaAvrjXBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872408; c=relaxed/simple;
	bh=rE7eD7OVYocrYXxDPcGFH49Cu0LOnO8MxMe/4yyU4QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hGGJZaSKGf3Xeccgigw/bv2je5oDo087NCIzVqzDRb6rB1le1DEP+FsrmMas0M0q/hdiypybGtmjnLSozSR18z/PHn/M+SdSkkNONnxZzbbF+chW3ajVZXEsPt9B5Ij1QkKbZPs2UXdgMJKPsKKMB17URF+X2hN4CIgLuUpND3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HpoCIaUQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Hg87Vhv5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872386; bh=O35WNvOv3N53hh4v9viOmgn
	AFCgBOQNNP52h8+Y2J3U=; b=HpoCIaUQzMu8K8P8+xQSe6oHOgHTbiI3WNIoh7mUiGDjnrFh6s
	YmrrytPyIcA81EOu1+c2sNlVL5P/QhIEUEauxBrrI6r1eLA6axdV9RhprqJ0YZdhaSSVCxKAgKe
	uOVx2g16IUF9errQZVCLiGqYGcUpq09soHiRG39qacCCfnS0JvepNAUkhvbHpNs/qci7OPx83/l
	qdCwGrmq+axkBZHgTJuCAKFlDwsUbjgXseOVEQNH/dxPuYRC9bEF2SRj2sU7blKChyCGaEA/YmN
	ZbBn2CXMec12gTcHVFQQ7YDL70LPs/77N5iBuymycVEc2xcdOlfWMB+vTHKVeyR9OrQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872386; bh=O35WNvOv3N53hh4v9viOmgn
	AFCgBOQNNP52h8+Y2J3U=; b=Hg87Vhv5DXcuTCbBOybw/xYUvVXhYFqm8riaenrB3XBx8ptHTI
	rTYAAGiPFr2PzVRLGf4J6PoJObheLwBfKGAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 22 Apr 2026 18:39:23 +0300
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776872382; l=1028;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=rE7eD7OVYocrYXxDPcGFH49Cu0LOnO8MxMe/4yyU4QE=;
 b=pls/q/cYNkGfe1Jb/wqlurCWH/BbPI2Yz3yEYg8HFUGe6GttSge3mDbVxBBOd69xgWV7gBSV8
 0VUCanb4CVCDC33DoNk3Vl2UpBPai/XwX1hW/GEblk8hJ0/iA62Ghcq
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104145-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 2DFF94480AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
assign it to the ADSP FastRPC node.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 36b419dea153..af2bc29ccdad 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2458,6 +2458,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.54.0


