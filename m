Return-Path: <linux-arm-msm+bounces-104143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBcCBOfr6Gl4RgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:40:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0B44802D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29B30301ED94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B3E35F199;
	Wed, 22 Apr 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="c9wv6hAD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ozOkxdvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26244347FEA;
	Wed, 22 Apr 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872404; cv=none; b=rpo7ZaCFx/53hU0lNPOgY1q65w0zPwpI0hOs1UBnEhvXxhJTXsbjyTxtVB6kDcrGyftp6nOAzLI+QQR88PkkmG00sSsV32B65E0XHnLAjeBtqH7ovaCjHWp/2jsSEvx2mILMLflt5aYoLrsXR4G0Z4VkUNjKBiV4J/75OTZF9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872404; c=relaxed/simple;
	bh=lL9vrp1OPvporR23TALMB54nFgempsTLlwD1f4DjRN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1RYaVFYIPfkxiRBsI4ms+/+h3eEMkiRdf0LyMuGhjc3RqM4/7bA0VFm+TFeh3k7Mqrn+HWmC5lGcKFsb1bhVzP2HHLc5ecsaMhMyNs6G1BuxLunau+v/IPZP9t24bRAQSQFMq1ddA8Cqhhn0D8iJLnKvyITH8KWynsfibBafIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=c9wv6hAD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ozOkxdvF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872385; bh=QESum2udMlgBHpeT4W0tMrB
	iIUtOxZ+pLPnf3Zbb0c4=; b=c9wv6hADChEIQUHuvy9SPB5dOOtpmS7+WZhKNwhUEkfzvN2aU9
	59pGW5vorJIl+2mBrTURxjcGSc+FYuXU1WF7ozJn1hgKhPjJMXk6nAX/kmhD0rwDxDWMQGH+0J0
	FcBKTF+ANtYqgA+DmNsQTFgp0eeva1EQGNao0aRzhy0jJBmAEemRWkIWCQGDgT+8qdyVUCMOW9N
	bULGTdxx3V/GYCFk8DkOJK6Xy9QMB+ufYI0dl2/aqx+DlKqGdu32sX3jwq+QPKTFl/7YcvW8aQU
	yphRiv6Use7pQD51uURxbmN68t6uqScepqHk1rZQhefpEAMUT05UnPhQXirXZSGuTZg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1776872385; bh=QESum2udMlgBHpeT4W0tMrB
	iIUtOxZ+pLPnf3Zbb0c4=; b=ozOkxdvFr4MxYwqPURD+lpkm2VJeig61gmcnKsPgJEGEKobQjL
	10kiuxsONr6+qqMeMzYFgywI6nTwalEf7bBA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 22 Apr 2026 18:39:22 +0300
Subject: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776872382; l=1036;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=lL9vrp1OPvporR23TALMB54nFgempsTLlwD1f4DjRN4=;
 b=LxR49A4Ji7TTkcc8TolyYpA0LXRbohIetDW+M7Fw2LaHofZ98XzG2+5poB1YXKv1kn6QSWRx1
 W17UdSE5gQCD1ubUvU4NNqM1GIibMZgB7gynBYbw75rOlwOctx5jmjb
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104143-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9f800000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,f6000000:email,f6800000:email]
X-Rspamd-Queue-Id: CEC0B44802D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Downstream [1] this region is marked as shared, reusable and dynamic so
describe it that way.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 4b47efdb57b2..36b419dea153 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
 			no-map;
 		};
 
-		adsp_mem: adsp-region@f6000000 {
-			reg = <0x0 0xf6000000 0x0 0x800000>;
-			no-map;
+		adsp_mem: adsp-region {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+			reusable;
 		};
 
 		qseecom_mem: qseecom-region@f6800000 {

-- 
2.54.0


