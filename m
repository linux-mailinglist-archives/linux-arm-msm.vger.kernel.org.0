Return-Path: <linux-arm-msm+bounces-101400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIJ0LPOfzWm9fQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:45:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A6381175
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 834F1301CC50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 22:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF723EF658;
	Wed,  1 Apr 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHO+74Ks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9D63EF0C6;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083180; cv=none; b=dCsGMr/aGrzhpGnfKh/EtMlmhb/paY2lj2tqVOSFeU9BYuHBhhZONJrwkVVsLe0hp0efzRSdvs6KjUhKraRc7D8TRBTR/DcldNY9zUZjrQT1QNMqL0pIsIeHUpC4syQQbWC9jPc0T6c9t3PE90zHDF3d38n/6fb4o9aml9Yy7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083180; c=relaxed/simple;
	bh=SukhKZ9+f2HwLYvQ8WbY2/mfioRlbGDMDXaymSuHNT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnI6NPfVEp2jr4gQHr7Pxkwimmh6tbu97iedV1k9bGFQSR5cSgJICB7g3erpWy3k3trpJnq11bthVMMfifWnwh/TFnk4njpgNuQZ1/Fo3Aj4rnI3IVUTNNpH+CKsxmkc21SWFgZQCQHKogkSlz95+2UN6kOCNj7AKyaR3i6f4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHO+74Ks; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D512C2BCB5;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775083179;
	bh=SukhKZ9+f2HwLYvQ8WbY2/mfioRlbGDMDXaymSuHNT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qHO+74KsilIKmM0hUdfNaUZIaxhBGQQwN2nzYnJiv85bzgYMsvk1z+o5avVEOws8S
	 +VfRG2W/W8xK/fmujlpVwztXAe1S1Pa6x/gPik0mM7xDrlcCPibKvtFHSyilU14MAB
	 uvDom9kXmH+TlQRF+tZeHYiopy0OAhHu9RHKzES6a+lgk6o4DWl6rB4O6Mh2Skc2FP
	 2BSH4DPx8dv/Hjlv/QMxUxH+L5SVsm6iHCslqXyjCooonJrSeWbp7f0odeYYtS3+Mh
	 HB9MgzrVfaFCn6j2ccIUDUctjrE/sOiNnoHk8vWTBhnuAIBnDvCvptEj39VeNdbHpn
	 qNnQHhMLnZw2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5570810FCAF2;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 00:39:38 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Convert fb to use memory-region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-beryllium-fb-v4-4-46170004da28@ixit.cz>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
In-Reply-To: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gN5kieASmpmvG+WEYJe1SGEYovf2d/d661pl9qIjP0k=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzZ6pgC/nS88wI0yQMp0VyFhh2nm5c5335vdWy
 +6URQAjsLuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2eqQAKCRBgAj/E00kg
 cm3LEAC7XOvnvorLfRnv0jq2UQj/F6jtDPzY1o+eTp0VjA6r1fk6hBAORqt+rS537AmBQPYZiAo
 cW8Kv7+1PdyIbw9afgepI4d9jKysnK6Tb9QCyOk0nLAHg5bAUWoHGsU4GSpOnWzViumdmMSvRIH
 YVeORaXyqYP0M1eIQK/QaIoKxMhRrzC0GNmKI8oo5+zW5op/0a9U4KxKdotKJJmPIVq9hBed8/R
 CN/H3MCcB7M0TSGrLwvebVrHkcRqng8N7g/kK30DSpbfWvc0y+zUCqwkeuCRv6GEZHtI025OPyy
 ymohd34JYHZNJRcUlLDm+JInkcY/bTFDvsMtuysIlKMQeYU3tYmwNgmYq5WMLsJssumfuofu6bF
 gqHUCRW0DU0ozlBXMQesYy2Y0ZSePmjGwriAIhQjvm3cc+O1bBkM58yge3nPznnCdjXjTKFToK1
 Dhg/E23OZ0kP6acfXlIX3qV3w7Q8B/uSiX6mq626Epz1IKqK2/hCLbFOJLREVRfayKO+2bBYqfC
 aBq0u8PeHuZl3gHSIas5py0jVfNs0qESO3Ai59xe29c9lv+0+f9BfKRpSI4hYgF4y+TFaTPu8LZ
 TFmmYUd+3pmsWWS+fHJ1bbhtZP/hbkY/h9SJ16QolkqsIBuCg+gc4SOeIzQvmXOlLDYq/jxCBz/
 xrV9t2z0lm/e71w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101400-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ixit.cz,samcday.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,9d400000:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF0A6381175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 77f5872de6f19..0d915ecb0444f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -43,9 +43,10 @@ chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		framebuffer: framebuffer@9d400000 {
+
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;//2400000
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2960>;
 			stride = <(1440 * 4)>;
@@ -109,7 +110,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x02400000>;
 			no-map;
 		};

-- 
2.53.0



