Return-Path: <linux-arm-msm+bounces-91126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFfAEX0Qe2k9BAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D48ACEFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6120D301DEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2F037AA96;
	Thu, 29 Jan 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfaOZJYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8412366048;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672823; cv=none; b=WlcE6JQPfaQsImZpCXP1VQfGZ2+pHukPikezh9l/oIvtOSSSyM7hyYdMNT1CupcsuBR6pJua7SWt/yG266bm+PEVce8wER4fk5uhtShnpmT4IC1eMFM56gpRtafkIDaDI8PB0jVdXqJkrJi1rgrBZFjGPpp3t/4+LetFT9C62ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672823; c=relaxed/simple;
	bh=w3BfxnaLzOTfeH+ahfSm3SpNkDzwWrd7RhdoBtGJE34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atnOE4bc9W/AGGV5mDqxXWELYUyjlxe/SBHU972OxW1/hhbJLj4OdBI0y9kZgEqNi3wZHXfmN5fcbVjoslgQu3couLvy4v1f5cAYvMaVau5KcZdDV8lGNemnB3HdQOEO6YkFic4G+XuTKRDHwdSFJioWLIE9tEo5KkwTecVh/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfaOZJYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 918E2C19421;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769672822;
	bh=w3BfxnaLzOTfeH+ahfSm3SpNkDzwWrd7RhdoBtGJE34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rfaOZJYCaBBIOMxcmqFZTpSTRF8gKofKSjo+b+49XMHdT+ZH0uCuGqQQdho3Zhqpc
	 OA4Iu6Jz3RkP2RvhCBpD+WnK/I5526F75ee7wyorq0xk277EGlCvcK8SHd3tZP/XXS
	 3PZWBnKM73Tuh1szeJQt5grQ/7U3roanDjsVMkt4tpX71E19kvT5z1tDsuLS34YXyj
	 uaC5IFpTLJFK55y1/q4wBKj8/7aDNXX0hA8dl68TUdygsVNw6OjFrOeh3QQ+ct9jEf
	 OliOG/LCu4rqNsHDyzFDQzEhisRhG4TcCGIfCImiMQne9DYerCvbt8JeMh/U7+jt8m
	 GyFweL6hzPFHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824BED358D7;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 29 Jan 2026 01:46:31 -0600
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Lei Chen <quic_chenlei@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672821; l=937;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=kuDPS1lxGGLEWDgl2NZmSf54NnC2W6l23QlaSfrIpcU=;
 b=FtNF3w+JDBp3IKpM79Nvrxs75KYnRL50BAUcWKnpKdrUJd8AZdy23R4XQMZDNUhuRMz7u8AXR
 b3HT8/hh2x5AFL3w/UItq6BF5EJrkhSwpbjLdBKhh7+16YTguyfCrQe
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91126-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.228.225.192:email]
X-Rspamd-Queue-Id: 07D48ACEFD
X-Rspamd-Action: no action

From: Lei Chen <quic_chenlei@quicinc.com>

Add DT node to enable tz-log driver.

Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..740e3c238e8ed0f162dd168291f6e307ace66e80 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5136,6 +5136,14 @@ data-pins {
 			};
 		};
 
+		qcom_tzlog: tz-log@146aa720 {
+			compatible = "qcom,tz-log";
+			reg = <0 0x146aa720 0 0x3000>;
+			qcom,hyplog-enabled;
+			hyplog-address-offset = <0x410>;
+			hyplog-size-offset = <0x414>;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8550-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.52.0



