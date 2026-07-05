Return-Path: <linux-arm-msm+bounces-116608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 19/iNVvGSmrQHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:02:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3770B64C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:02:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P5MUOwoK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16AF7303CFB4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EDC3B7B7F;
	Sun,  5 Jul 2026 20:58:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E5265CDD;
	Sun,  5 Jul 2026 20:58:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285107; cv=none; b=KtSLkhU/OL+5lLeea1fwQPgrBKEN89UTzolJf6cVeJZZeBq9DdkivneMrq4cYvqwTwf21PaCTdr0qphaubZtdNFr79iqf8la7KFkErpIls8IhuhSPPmTWPbPyAoaaKtfc7NYU+FxiBSsblh+PQbnXEIeRN4mA5aGnrmzNrxIPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285107; c=relaxed/simple;
	bh=kz5y+gWXpk6JL+Lb4Rq0cv3f2KwoopYNPoknYucd+nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sU1+DRp4xlQnQgR8ZyBGoUIY+hiu4GvkFxZ1H6b946j2k/THHiZXIKZbennRgHFzeq1Q+vkvm9oYhgL4NbYSGhQB6ezxjLgXWnv2C6XMyMgfpZhPuJv4ooIRevQXK8k/Lfrr33bCZZ/8AH3dQMxCjJzVfNMhMQVUVsRqr8abV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5MUOwoK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AE41F000E9;
	Sun,  5 Jul 2026 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285106;
	bh=sPtiqjW2kKvbsimhHwtAlIMwlxcFGZ0kn+Ge/s1XouA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P5MUOwoKhvjwLkwvrKo7EQ5oiaz0WE0Gc/SmyDB6klv5KF0b63xCAYch5WPYe/q7c
	 gUXd7ydXzxfrv8sS+1SZpqie3dKGp8MoHlZFVOCwBUpnhhxDczi4pz+WS4EcKV3awF
	 CawqgXm0x846GXmfeJ87gVTP3+JbE7EsS1XrT9i9MSO6TJ4J8nKEXK2IEee3dfoIzz
	 zydMglXnctsMJ+L+vHgtqs3eOcgjt1HK/7lpRcPEGyy2IUXWPmoyl0W/weAhznMxxD
	 JbrYx2gEncziMxrOfxtfiekK77rABL2OoQFEj7J23AwUhEhxN7vRFjK3oA5Tp/BKjq
	 3nQwROIKueu/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
Date: Sun,  5 Jul 2026 15:58:02 -0500
Message-ID: <178328508281.1157743.3896901467375077910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
References: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116608-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76D3770B64C


On Thu, 23 Apr 2026 18:55:31 +0530, Kuldeep Singh wrote:
> Add the kaanpali nodes for the True Random Number Generator (TRNG).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Add TRNG node
      commit: 14a53a14a615915eeff73ca77e4267247f31f7ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

