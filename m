Return-Path: <linux-arm-msm+bounces-103587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJA+G45f42k7GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 12:40:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBF420B3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 12:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BA43021E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 10:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3989C346FAE;
	Sat, 18 Apr 2026 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DHVAWqoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7671AAE17
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508793; cv=none; b=KJVpQM8Hwi9r8VpEG2Qyz4B1/o/7omUYX80EIIYjXMIU56FgOdoYAooLxM2Otcl5Okahaf/ZH83JRRqZF0NGEdYeEyIPBRNx5p0Upuy2HPVn8lXs82Biofp9IvEPbj5BgACKdCejMGhkDVjxveIQNQutwgluFqef3QfSTcv4BBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508793; c=relaxed/simple;
	bh=UM1j3tTyd4NJQRoZKg2wpV5j69LwzRebkAbz0Z6p4VY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xd2EqKqrvkRZBwJ1dp7WczZYkdPz1CmNsWuYwbmKj9fXS86q3jyp8Jz26b2EhhOE33AoOovdiwZw7LEDuDu5s/WZk794sO3874xm81ggTt8BJD/f2H9UhVBlrk7ByAL9EN+jDbOuwq+672zfOYEKI4UWlm2vQobbagWp85DHiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DHVAWqoC; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508783; x=1776767983;
	bh=wCcx7kme4eOad2JrX+MW8A3AgGN4Z0ct0zGc8ZL5D5o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DHVAWqoClPy276XXltuN/mc2VySF5tIdsC24Lk2uCN4F1Z+HL4keRbzS2NOUXt2df
	 F0orHFlnBUADmF6veWTlPXTbbZCOPHT4Bi0OukZQq8EK4DYyo6FSyH8k6mnN9XF/vS
	 vaNhAQYz/NHMYCT/2IXqui5ME45JICAMczjWl13nBGMmB1Qax7qPBIWIKCFKbgy/VC
	 sz4cwE6xXvsPhiGhF7hEs4T6D1r8vezSkvKJa4FhyJNajBcD/V7t3npCpHM3W95HNP
	 CPLw0xhw3quT/DXPlDFjfGTl0FJatlV9HwP/x1CSu7Vm5jTKK/2V0I9jsaOI8RlRTa
	 Uyu3f4aofVhuw==
Date: Sat, 18 Apr 2026 10:39:38 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Describe IMEM on Eliza
Message-ID: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 03c2634e0ff46d4489246ce80f3d761f0d24d6d6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1CBF420B3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible and describe the IMEM for the Eliza SoC.

Sort nodes by unit address, this can be applied separate of the other two.

I kept the IPA modem tables in eliza.dtsi per Konrad's feedback about the I=
MEM
containing it regardless of SKU.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- pilreloc-sram -> pil-reloc-sram (Konrad)
- Link to v2: https://lore.kernel.org/r/20260416-eliza-imem-v2-0-fb7a711234=
51@pm.me

Changes in v2:
- Fix sorting of nodes in eliza.dtsi
- Link to v1: https://lore.kernel.org/r/20260415-eliza-imem-v1-0-4a90e86837=
99@pm.me

---
Alexander Koskovich (3):
      arm64: dts: qcom: eliza: Sort nodes by unit address
      dt-bindings: sram: Document qcom,eliza-imem
      arm64: dts: qcom: eliza: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi              | 94 ++++++++++++++------=
----
 2 files changed, 58 insertions(+), 37 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-eliza-imem-e791f44abf1b

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



