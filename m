Return-Path: <linux-arm-msm+bounces-96463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEINDl+Mr2n4aQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:13:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40C244A75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49D9E301CC4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0833BA232;
	Tue, 10 Mar 2026 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NclQKV2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FAF3B9606;
	Tue, 10 Mar 2026 03:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112381; cv=none; b=Iwcw19yEOrit4K6p1ASt3P+0vjZ+sKe3NfsIrky9SGL4MEKnq5Ink1RSipqh+AdRzcTfUTzjZ15YK0JomnYBVaZAbHpsVDLghAWymas2FI7HV/q/l/uKE2WTOZ8ubnE37IxDRgILy/o6EYvB58MipyOaFtJFgMAuVYVIMtE9RCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112381; c=relaxed/simple;
	bh=4Pcwl7hBVZRQFEdmkgECGuTcQC2YUm6xHOqdXHCNP5E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MEtNmJkzgto6NAbCcD71y/h1L71peqJrxf2juQF51x3VgSXbbA4M5YTYSAJTc5jUce7RAz/Y3wbQUKmyeGLKHf1EhaySudvNlg6497ar8Nz/8g693JNk4VbUb3D2WNrTv33mnr6rs3TitdKoa7Ty0pKP1dEdgpWzglqbLrJIZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NclQKV2l; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773112372; x=1773371572;
	bh=/u5N+xQIPg6xybChiK81z7cTH6sS76jS6i91RFXSNFY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NclQKV2lMhrr+R9dTwp71fCk6vh/Qx/oUJh/51PhW3XJV7/PmK6am/tBwqONIRuFI
	 G89B6Evj1Hx2jj4ovYuadt+F0608cxHiZeHLWjSNQK432aOhHe1FhC1dh5ATlXDKgI
	 o/JThViDLbFB7nyyR3tvd3Ql0uPYO2REMGnlklf0XFOK3guroTJQtcpUJaQ9YoRBST
	 FnT3nl9fsAEia0/z/02qq3R4yQvOlVBTAnTrIZcFUztLXFV2vtDCHyS4idSse9xvUO
	 /lb0IKPJb7uJGfelBvShC5XbdQE5Xs64DH0JJaQxyxG/mCQNCdWpdmb02n71J6Yrj0
	 kNioE+ifoC5MA==
Date: Tue, 10 Mar 2026 03:12:49 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Enable inline crypto engine on SM8250
Message-ID: <20260309-sm8250-ice-v3-0-418bf5c5c042@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 512a86e260c2e6ad0b27e52816c96e5fee9d553b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3B40C244A75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96463-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Add the ICE found on SM8250 to DTS and link it to the UFS node,
and document the compatible used for the inline crypto engine.

This series depends on WIP changes that requires power-domains and
iface clk to be specified [1].

[1]: https://lore.kernel.org/linux-arm-msm/20260123-qcom_ice_power_and_clk_=
vote-v1-0-e9059776f85c@qti.qualcomm.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- Add missed Reviewed-by from Dmitry
- Link to v2: https://lore.kernel.org/r/20260309-sm8250-ice-v2-0-0c8c46ccc8=
14@pm.me

Changes in v2:
- Fixed From/SoB mismatch
- Added iface clk & UFSPHY GDSC (adds dependency on in review changes)
- Link to v1: https://lore.kernel.org/r/20260307-sm8250-ice-v1-0-a0c987371c=
62@pm.me

---
Alexander Koskovich (2):
      dt-bindings: crypto: ice: Document sm8250 inline crypto engine
      arm64: dts: qcom: sm8250: Add inline crypto engine

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi                        | 13 +++++++++=
++++
 2 files changed, 14 insertions(+)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260307-sm8250-ice-800e656d7321

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



