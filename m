Return-Path: <linux-arm-msm+bounces-112428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpi+E5pPKWqdUgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92155668F70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XFdPLr1H;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57648333CEDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE2A40629F;
	Wed, 10 Jun 2026 11:44:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B60405845;
	Wed, 10 Jun 2026 11:44:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091850; cv=none; b=XBtlFE5P3qxX+KgRXMlIoSifZ3qW2YLc7lt6BLbCqTo9xctOCgov3b+7dIQQsQZ4nDR176vORRGluVnoqY2KOpditq8/Rx640rmlgER1tP7Z+vM+gRqNWdz0HkU0NFNAp5jK3mWhrLkA47SrJAUQtIByrRFihtN8R+gJotfYcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091850; c=relaxed/simple;
	bh=BNExTdQgthoTgli6gW11cU1EriYZgr1b7cMmsnJgKXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIC9sKPedzAThxmoQV13LuCgnUcWtTBmmYmzn0Q8F/oudfipQ1j4dr/nog214oE6zhOr7KcD/8T8sv3ipcUzxacyChwhPB0RfeBCChAsqUiPzLlCXOqVqdWT+m6SqTVfK7iPRp4p15X+Q3+ppEyg1qVZ6wsGAjeV9FtFIoPKIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFdPLr1H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62C81F00893;
	Wed, 10 Jun 2026 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091846;
	bh=b90blh8Wgl0C3PtMvwOc8mygqmL45BO/8n1jwbvR3fM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XFdPLr1Hfg/1iKkcMX4e99uB8efuzdcr/Tx9Kh6e99j8xAM2b1QIeGCCNzOvIQMkm
	 aXDCRtH42BCP1O+asKioW6nr7M8wOKSlULcwBYWoA64RyxkWMkzyMvxxA6mMEEJ5lb
	 MwwbT4V/nMtBq9k+r12RDxjvwcz7tDmecxikopI8EKbwzpPS1ypg8BJ2cFlpHG/rfX
	 GjxvzrUa3AzO/t9jgTlZeE0MH/cXmFnaFUK+YdHt5Qep5WhEMau8HdFc6qfD6sUU+s
	 XuOfSxNgSv4THSGszkSTU5MXyJf9/N5C9Px/K3NHQ0mnaRQ/qJcU15l6Zi+ekUXdUs
	 QXvy0K0WsTmyg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 13:43:48 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: sdm632-motorola-ocean: Fix LED
 default trigger property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-june26_dts_fixes-v1-3-2e0c953a6c08@oss.qualcomm.com>
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
In-Reply-To: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=956;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=LsToER+vhM6EQyt8+q5JsjwcFiepBKl8nIEvFZNNRe4=;
 b=zoXooLNMguTed/iJXi7zfx09v2EW4dJV0NVi7t+YmGicbCyJSNPBmpdHyxcwshdPKw3lZMYyh
 K0rJAesEjouD48vTn3eSJ7xCWKp11o7sHx+zO+ZpwxoiWJe763hGwLv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:luca@lucaweiss.eu,m:ultracoolguy@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92155668F70

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The correct property name is "linux,default-trigger", not
"default-trigger". Fix it to avoid DT checker warnings and let the OSes
consume the intended information.

Fixes: 3176c4d6b9be ("arm64: dts: qcom: sdm632: Add device tree for Motorola G7 Power")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts b/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
index 2f55db0c8ce3..9ea3e5e76bf9 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
@@ -130,7 +130,7 @@ led-controller@36 {
 
 		led: led@1 {
 			reg = <1>;
-			default-trigger = "backlight";
+			linux,default-trigger = "backlight";
 			function = LED_FUNCTION_BACKLIGHT;
 			led-sources = <0 1 2>;
 		};

-- 
2.54.0


