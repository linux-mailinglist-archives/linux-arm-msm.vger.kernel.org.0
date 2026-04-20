Return-Path: <linux-arm-msm+bounces-103719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL6uJXH15Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231F428F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 762D7307263D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121F83921DB;
	Mon, 20 Apr 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VRGBhjMK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mMD1mi/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955C389119;
	Mon, 20 Apr 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678153; cv=none; b=ovgdnSJmnKts8Bs1jC9KY+fRjY/h6oVEx8wJue2nPduVF18qnFJ8ymjNRc9daOu2WzEhQc+/jDHsvMeV5576AEwcQqaiO0cdgsawGExNswBG8RZC1rspMGta69VQIoVIrwGaYp5e+3Ce/pZQFXPKC0ECfN9ZFL6Eq4pKbc4M3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678153; c=relaxed/simple;
	bh=wxDih+S62XS00edvZz5RUzsqEJuy7JKaTFKjK6bFbaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIpfd2CNWAHnnbWcZVzsTdwu+inCH+sk1qwnyrv2mijPbUS+dgcVHHI7kokjvgPBgPOJDzpTyqorGHvbFKsxnUEEsmOArmp4wGqz14pGHNbzGPRqFVKQSTitnYcXmoc2+idAnuRRhwWAY+BPiYU478a+chy5Bz6TCqKquBDtr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VRGBhjMK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mMD1mi/w; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678139; bh=8vOmtcMT2nIBl4fQ4RvFSh/
	8uyVbzV2ZFQw1RmR+YFg=; b=VRGBhjMK27vsgd+pnymU2mmb3hm3tIz1U3H/axCErNinGY3II9
	xbKmYVFne5RbgEeKTslO85wAA30D6eife49PEfFQXbrKlA5PopUmBzVxxL/7ZNP6v374o1YLrTW
	JkFpJ1gZcfLCHGrT2ufkaJzs7//8J2ZdBkYyEhV9KJv/PU7Wf071BepVr0FRtpGSCk/697qLYNt
	tHR1hwLVMOVX+QaCc90achQYqK6qXnCCuGZUPHNY9lPr9erXDNEMt9lqBVYo0l8aX7YbEIcgeXy
	VUEGnxeFtRRN5HwtZ8EOhXAl9Z2W4aRXZORxt0kLH8jdTFTkPa4xn6JZedXwH3RXp0A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776678139; bh=8vOmtcMT2nIBl4fQ4RvFSh/
	8uyVbzV2ZFQw1RmR+YFg=; b=mMD1mi/whk2Vb7/BMR7ZzAKPgTXyG4Zhqbu/d8P3qq5/puVySr
	cx7ELreB3zIwXiXs1B0B2BfbBhEgKYFIIYDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 20 Apr 2026 12:42:11 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-3-f6c7ab3c889a@mainlining.org>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776678136; l=1025;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=wxDih+S62XS00edvZz5RUzsqEJuy7JKaTFKjK6bFbaI=;
 b=Zi71GPLzqiLrYeR1ETwnrK9oMAEsgkAKJXCzg1JfLgzJBAgmvEZrM4/IS9OJHxfiEJtUo0mrM
 q/LKNqOGF5+Dr3PPEANveJQkGI/OhEWTnActzjg3PgxZ988IR+WUblo
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
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
	TAGGED_FROM(0.00)[bounces-103719-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 1231F428F8B
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
index 4b47efdb57b2..2dc53814aa55 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2455,6 +2455,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+							  QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.53.0


