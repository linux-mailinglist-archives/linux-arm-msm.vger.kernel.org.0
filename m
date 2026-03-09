Return-Path: <linux-arm-msm+bounces-96386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEXuHxxBr2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:52:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AFC241E7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14AC0312B7D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB56E368955;
	Mon,  9 Mar 2026 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KG0Rh4lO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722C36C0D6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093040; cv=none; b=HRUnc8csp/NgBaJRM/Xg7+OO45KldjG7dnlAOZX6OFJ/ggbDrtB5uF+mncN8+bE18D23Y+9JFV1JpoOf2aCd3r6mmHiNyDNljcjnMKG9KuRmVZ9pHdhN7/0z3h24Zspfadwyobl1O9r9qqeVgEkiZfvatQkR1vQ43K+Rzqmkk40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093040; c=relaxed/simple;
	bh=/PvnvArxdj/IZDWSjGxdN7IjU/0ZdpHZ67CgFqkwIZg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZncolzFVj4yBUTc0jfW7Al3WfDKJVa0SPV4Ai2UmXGeHNECSBeVEbnAF2ZjPq6Wv85k9/QzxgQnaX/o8O5VxDlVDID7ZPU3hIPDRN+wFclH3CCmzkiebdZlZxbK9sQ7XRRDtkQABv2vVAILyDy00MAFZ0PMjA/vftf8mqTg53Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KG0Rh4lO; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773093030; x=1773352230;
	bh=sC3YaKirmpx4zG2EfuSbaQrF9WS6VTqoT/LIwSDtjJE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KG0Rh4lOvhw6hi8AaqSwdnaUMTfke94/VFpJBT0FHd/2WlMh1bXXlYK3idJd+4Ncn
	 w4ftSUnyF6u8NhosFlLrlpyMJeGnr232ahtxLfAcpAY647zDHnV4mpVBlpKawfOb1x
	 LNx1ZSRJdW3tabHA2nfRAgg6JZUG3JViPcBfF51Ge2nkhaxFrGHlM3kp6cZuSxFe0X
	 gB4y0+YKO/qdKAEE5Ypopd79YegYJXW07epbmdnvxO15GMoKnXAYgKZbitfgmcepFp
	 wTXE88f8vskkfSSR0zZmE+hMJSvmlJ7xSp3oaKSC4y/5Dn5iRr5AbfyCXMx94cOx9C
	 8EnoH78X0uujw==
Date: Mon, 09 Mar 2026 21:50:27 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 0/2] Enable inline crypto engine on SM8250
Message-ID: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 909d1e1f47a65f093de1f7952c466447117056b5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 06AFC241E7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96386-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Add the ICE found on SM8250 to DTS and link it to the UFS node,
and document the compatible used for the inline crypto engine.

This series depends on WIP changes that requires power-domains and
iface clk to be specified [1].

[1]: https://lore.kernel.org/linux-arm-msm/20260123-qcom_ice_power_and_clk_=
vote-v1-0-e9059776f85c@qti.qualcomm.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
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



