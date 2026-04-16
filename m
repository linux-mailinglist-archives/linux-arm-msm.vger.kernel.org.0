Return-Path: <linux-arm-msm+bounces-103325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGrSNEUt4GmldAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 02:28:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65150409465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 02:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B958A30A4495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 00:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3621A9FA8;
	Thu, 16 Apr 2026 00:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gkwF2/Ip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460B1A680A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299024; cv=none; b=aUaP3Jjmg091iE5E9sE1uXafCoAFpcDuFsEP9Lj9OkfqZ6DD7SZVYwWJn8oCdFsLLwdzwj7eLa06/TlzK0e/Mq9dKeXK+OFqymXz86omDhsarhVbKmdLLc/fm63NNo4Of6l1cbXD7OQc+dcyBplQYhkSfSQ3ve+nBg/6bxPVGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299024; c=relaxed/simple;
	bh=t7V3EQfNXi+zUiRcTG1auE19RDqnd6aAKgkgSLJpf5M=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TyPt1AzMN5pKAqD57HtbLVX/Y6m3d+PcjpBPfnYOyGs0Dfw3HZzuw1vtDneB+KKtXFRk0vzSNjdB5SU67S2bUFjcmtZBAYTX89CsLWZ92UVOV6W6xEHN+eJKR/THiCx6UFhc0cFUHWWNhOKtBktFH0jmj/QAyiVJTmBlb2X6Th8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gkwF2/Ip; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776299013; x=1776558213;
	bh=/kO5sLVWHV577778m/vBhxM6H4oMac6z5TOPbNkRp0Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gkwF2/IpjykiX+GMr/PnVgC2G90whGKcLRsmMCRk39A+Kw9m3mKmP29nxIrDl9dn6
	 Ovu1bmVck8s+nyJ5PMRdlS3NImzq/m0CRaJ5K26gIAXJfDBg18vtL0wa7LihfdDJ8a
	 mtHST6qK6YvpBv86d5bo3CDS/HmW3UACBf4g6h2af+ob0AGkem39M9r3TnczNHuGZT
	 J+vSOfN0xdvffN/+7Oi2/iLGPlNovwfd25+IRM3X+HO4+08j6985PsKJTBq55H0+su
	 QBPZItNffxt9nhdnXGreSgyF4qhxuGBidQd2kt/NVD4uhoWyBpPoD6dZyLa+J+ReU1
	 oqX6OiWeTsf+Q==
Date: Thu, 16 Apr 2026 00:23:27 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] Describe IMEM on Eliza
Message-ID: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 916f527443bdd0ad8a231961c005d737ed2ef811
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103325-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65150409465
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible and describe the IMEM for the Eliza SoC.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: sram: Document qcom,eliza-imem
      arm64: dts: qcom: eliza: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-eliza-imem-e791f44abf1b

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



