Return-Path: <linux-arm-msm+bounces-115738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hGCuH6M1RWrE8goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B76EF590
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AUYDRdXz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115738-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115738-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CCDE300AEDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCB348A2C3;
	Wed,  1 Jul 2026 15:43:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4D2DC32E;
	Wed,  1 Jul 2026 15:43:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920606; cv=none; b=u+A9TDtMdKI7wiNTSVEuh7WyRBilaEvNoT9MB+YXUujx2gfGJQblBniFfwYMhd+HcQrRvuS6BQYm+ZjdGtNr3l1TF1WO5Xjk3ww1ZFIyWpcZgzcFoPmg856YxsGBoHMNTbTT8XlCnPcEI69KDtuxb8tbLSD/188DVpbOFaYhgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920606; c=relaxed/simple;
	bh=HM2DPYSejnDjK0EbO02fuW7eNqD70LaJ3J9inedrnDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yg3meQv1QBDZpcfvPu8xqmJKgFHy+aWOUn9/hfaJK2vJ/8YExF+JNIJhxdw2qFYzOchjxtkzv7rp2aAPnmCUYZYFg9tADoYvj49i7Pm/oz233gg+VgElak+JVWTljgnf8yelyLZY89kYp33+QxJwyD8q6lG6+hkM6zZGgXJWg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUYDRdXz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0131F00A3A;
	Wed,  1 Jul 2026 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920605;
	bh=R9hkvW1pOBiwJxeWS9RI6xClT+G4eIr46GYgHEL037E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AUYDRdXz/PaaZhAw3koo6OKd/MD/VoBOUKFjFZ+PaqUFXCNsHWc4XQ6NsIY0ColGg
	 aTTW9iZ6dIijvT16mdvRm4hZzPY0ojE/flG1VaFjW2yjxBcUEcWO/xEyQCpuW0dsed
	 3cpeodcguZioQP5wyBiUhTzQFXl+b3GZRP4x6BVThdvXG2tqH1PRN3B+H3oF1qNEof
	 kWmZr1H0gCTyG0gUWNu0p8UvD/mHHEuSAbFYjHJX30+aX1QZ4cl5Bw3wJZmYCj2R9P
	 1Ln3SkBXUu1kO5GwBaaJ5jZoEbycybU3gjKhj54u30nbySrgMDPzmlp/6KwQu/tjTF
	 iYhA74O9/T+BQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 01 Jul 2026 17:43:15 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp-crd: Add pmic-glink
 orientation GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-8280crd_fixups-v1-1-3fe92ee9636b@oss.qualcomm.com>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
In-Reply-To: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920599; l=887;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WJhVQUrFc1JZZG8DPZgSeM/xJ0liJrNVeUKRoLS+cbM=;
 b=UNH1YvFi/vQeNiuQZ+rnPpWDsZz2POaJfR+SxEhYRmS/IHVB5O9BGhWuCxG/yjJuhh4ESR1kM
 pZfOmvTnwacCrJgEZMIBAkJBYci1K2G0DmM6ySGsSATYy3dfoxORpyP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115738-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC6B76EF590

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PMIC_GLINK USB-C setup on SC8280XP requires that an orientation
GPIO is passed for each port, the value of which communicates the
normal/reversed state of the plug.

Add the missing references to let the OS access that information.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index dcdeefd28728..adc6d7b7c91b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -56,6 +56,8 @@ pmic-glink {
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.54.0


