Return-Path: <linux-arm-msm+bounces-112032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3EkUMNLGJ2rL1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07265D67A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:54:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=UCJ+krti;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0433F30D0F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F5C3E9C19;
	Tue,  9 Jun 2026 07:52:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755943E7155;
	Tue,  9 Jun 2026 07:52:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991578; cv=none; b=nEwRizZ4WPS0npYhH7IMnCcuMTi3bxj0EEPeh8xfa4nTQjBnOsl+xT1+KNj3s9vww4JEFDy4CasfuK82bt6A66U0ZoLtvddu3rzPOuPO2c8tFR/6gZbvR5homF5mxwuh9AKoLWd3LTagGASqLnQlaMptUtskU5ToK8TOLr3/1f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991578; c=relaxed/simple;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZcSUNwAU+ab6nI/7d02/zhPDxW07xuvKFR6oEgjMphakBz0kQmZe5EdwJv00KnxpkGLsObBfiZPP7HHp0V3HYFTQiBC25rgscP15mDYh+rkf9w7UCythakRFAv3kICbjbdp4W1QaV7QuzmFkRLk5z7CvfR/0Ubnrt4cD/4TiHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UCJ+krti; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A0CF1A37F7;
	Tue,  9 Jun 2026 07:52:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5515FFC1;
	Tue,  9 Jun 2026 07:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9829B106A2AC4;
	Tue,  9 Jun 2026 09:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xnnBezdyOqutoPIKE2OEoP82HYmh3FTHwn7Z7cZXCPo=;
	b=UCJ+krtitxcJH1aTgMdIj1xuQf1V5COpvq61rhz+lLKjr8ySVV9rsP5QRcGbVq+PAvAoK3
	RuuOz1V+kQXCGU1aELysXAzDtlF/WB2dHC71W60rB7QAXajAd8HWmtkhUxa5FXbvsQaBnQ
	ppwRD+ZV201v1seE0HuTvAkKwXb3b3H+KDBGvAEhqw5fgg2KUZvE9dfHopbxFZjk1OPqZB
	6mTRDvePmYjfZRuRfBfLJQn4/HMD/wHQ3TsbGxt3NVqcDwkmh2HOe9/FiUo3pP4ZdSsJBA
	OU/hjE6TsV2EEJ2nm9/1wdy32hY3/Q8ldyQ6giw4wPmkZLNzC13klf5yrYFZzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <mani@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <20260609-quirky-rat-of-criticism-aea1fe@quoll> (Krzysztof
	Kozlowski's message of "Tue, 9 Jun 2026 09:19:52 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 09:52:51 +0200
Message-ID: <87mrx4b164.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:stephan.gerhold@linaro.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B07265D67A

Hello,

>> On MDM9607, there is only a single controllable clock for the NAND
>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) wor=
ks
>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>> clock ("aon") that is required by the dt-bindings. This is not really
>> useful, so avoid doing that for new platforms by excluding the second "a=
on"
>> clock entry in the dt-bindings.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

What is the problem in giving twice the same clock? If this is what is
done in the hardware routing, I do not see the reason for more
complexity in the binding?

Thanks,
Miqu=C3=A8l

