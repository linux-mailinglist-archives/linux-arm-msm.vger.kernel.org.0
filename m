Return-Path: <linux-arm-msm+bounces-104440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB4tCuBR62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:20:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51C45DA14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E86D3057628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFF33A6B7C;
	Fri, 24 Apr 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UzkjaPD+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jhIpPVph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945E3A6F06;
	Fri, 24 Apr 2026 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029208; cv=none; b=tHXfc2yMbDd78NZZmhoH46SInbI0FSlmNcj96lMytdjeVcqpbZlZLP4vTmGQ+nTOdNwmLgAnG8qofE0eb0+ei1nAC1UPkaXW4W7wxZvxDjG5dBd1UDGV8CcUUuOxV9qHC18IVZvmesi/aUuO6tsWhBilTHXrWXTn+yrFawQeD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029208; c=relaxed/simple;
	bh=i1hgezSglNcJEtLLwL7N5dWPSZIiWXV1o2Iq7/9PIX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZnNS7EtYEX6KFCah9UvJ1HWxnKO+26wPyVuX4TD0Vu35tz77fgNvqYYenV5xADsDD3Z/P/nGtmEhn9AQ1jiId2lY2xVyWKGF4SrNoP0TE7FpVUV/CNffGziuyGXXGbyZzwc31XwhWaQTaTTVcAqAaoYy6+7bMZ6zWa+tU0ulMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UzkjaPD+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jhIpPVph; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029190; bh=axbyCgp8rRe2ZykOgeR8C2O
	x6HIWcLpOv2SMOiYS7k4=; b=UzkjaPD+FjVIsWVBPiuUu35YE8rfl3NUHse/h1L53YlqQiR/j+
	cDv7lJMUEYguqNem/tyLFCnnp4LuvbLTyx8ednZJTduhDJvJgzfh2m1g49lxuzmCe/93uncBJ0n
	hYszZzQeaTm9QhtrpMXP8iiN14/+68H3FXQrAJ2lANA9vCYlfTwqJT3XA0odXA4GR96g4ZF9Zc0
	RHS8/lsqhvic9yqD9zefzTvQn7ozuGPKGNeWqKe+SlJGJz1QaSeSWRhbdcLjb9we3aiO572YGxM
	tyqeV4rHIF4DOm7nZc6TWEEy0eucTHJDQ3Vyb9lVIAcHe6Tw/QRt9yuJ/LrYcFIy6AQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029190; bh=axbyCgp8rRe2ZykOgeR8C2O
	x6HIWcLpOv2SMOiYS7k4=; b=jhIpPVphaSFP3jXmlBAv1QBhXtv+c1ECsHXF9OwxjDl1uEscR1
	tB5xCicjpL3nHdbJb3z7B6VAntR0kDmlSFBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 24 Apr 2026 14:13:07 +0300
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-5-ee5257646472@mainlining.org>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777029186; l=1091;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=i1hgezSglNcJEtLLwL7N5dWPSZIiWXV1o2Iq7/9PIX8=;
 b=9YWBq1O9WuGaWicum2AIo/5iDL3Ao6+tf9ool/iMSsmNJgjeK5dbmDn3MEbJQRXX7ZWBEFq5J
 JfVr24Niok8DXkv8bnb9cPwILEgV+w/VSqhO7dhPV8iaZBKJaGAw/xI
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: 7B51C45DA14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	TAGGED_FROM(0.00)[bounces-104440-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]

Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
assign it to the ADSP FastRPC node.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 36b419dea153..77ea4070a37c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2458,6 +2458,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_HLOS
+						      QCOM_SCM_VMID_CP_ADSP_SHARED>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.54.0


