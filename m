Return-Path: <linux-arm-msm+bounces-112442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EoQZDJhUKWpYVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:12:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90047669203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gsDxLj1f;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112442-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112442-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADFFD31453CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5937405C50;
	Wed, 10 Jun 2026 12:04:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD50406803;
	Wed, 10 Jun 2026 12:04:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093091; cv=none; b=S4PwGFoptufV9e9EampoA+Lm13j6vB4qQhsVd6QBIl54JixnBhbUdkJthnPkqHfazFPIbTMLsdvSQVu1Yy2MpULHhhK1ZIVXDHybA/N+CUt2eS5oYZEUSmsYvlku69GUK/dVJnJEA3fRBm+MNdO0uClm2RCQ8g7cmVofjI3cuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093091; c=relaxed/simple;
	bh=M66cB2F7xALh/u13C8aaeYXg0X1u3YSHSqfVx9v2wwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgFa8sBsX+hOe+ihr8jrPJtsT7keY0ar6ueox/FDfvW8J9ILvI9bn3fbeCXC5DEkYCvwR07JtiEcbHYNtCOVn28wYZ8UXIqkLzKz5SbfGzo9hfsKIA0SMa7fY2MMz8ALiKqlx5KfoZvt5Gpy/hccRg0wJOjc6x1r3DOtvou/d10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsDxLj1f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605B51F00893;
	Wed, 10 Jun 2026 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093088;
	bh=LsyBpd3ubxXywUQiKVs/hjr1/ctDNQr3tCkSZxmIp0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gsDxLj1fjgPNbefANUcA6hmPrSLXo/+bgOXjvlVkzcf0ltdQ0z0tNCIl/xQweAWRh
	 onVfIn3wirf4WO3C4ZVxthbQ2oWUH8hEBu3okuadDg3NAObxgHUlOmHs/S/CnJYHVt
	 E1hmSpdC70dniwl0jgVUBabwtMiaI8ycwDI+mZzDdnCEVFGo+qu/I0GrzZPtjMpmYC
	 WNBtTGKnfFHIG/iwwVClp25UK+wqHygJ6nZjjfGKV0OmIalzoogKtI+3rjn8D443Ak
	 4QWDvpPQeH7MiWhkI/RBPW8KVf8mmQFtn3aeFUdJyXtXp1H8Ah6a43FMoavfGdoczn
	 hdExCJBnMA8Fg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 14:04:17 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-8996_61x5_qusb2phy-v1-4-d7135980e78f@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093064; l=1065;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=YVIqfrH3mYeu1oku7m5qMRh3GSxgBbzNU1DvKKCnwRs=;
 b=vQmEdDcvBBjR9bcJgViAK/lo1iKmbRKe4aVfqLMgFPPe3p7SNXSaHgH3wtvBtVEp7CzCSySXB
 5FbaOktItZeA/q54C8Oo25ip0czuFmAKfzQo/e34ZGy/fveXXTGGxUr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112442-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90047669203

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There are a couple issues with the current description:

1) The msm8996 compatible is wholly reused, without a SM6125-specific
   primary compatible
2) MSM8996 has a different power setup (VDD powered through a RPMPD
   power-domain vs a regulator)
3) MSM8996 uses a different init sequence

As part of fixing all of them, use a SM6125-specific compatible with a
SM6115 fallback.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 6e84c226948c..688548cef0f1 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -681,7 +681,8 @@ gcc: clock-controller@1400000 {
 		};
 
 		hsusb_phy1: phy@1613000 {
-			compatible = "qcom,msm8996-qusb2-phy";
+			compatible = "qcom,sm6125-qusb2-phy",
+				     "qcom,sm6115-qusb2-phy";
 			reg = <0x01613000 0x180>;
 			#phy-cells = <0>;
 

-- 
2.54.0


