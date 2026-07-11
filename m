Return-Path: <linux-arm-msm+bounces-118474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P9nmJr5yUmqtPwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:43:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0F742387
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:43:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DKT8T9lD;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EBDC304C94C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B623C7DF0;
	Sat, 11 Jul 2026 16:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F43C9EF4;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788059; cv=none; b=lalhZ1F2+b73uRBewdAboWoodlQqNOhA7iAQh/ZxX4Jek/VAgY13zjMBqnzRGbclRYlN6gOrMZ2o8KuwaW4OmNQPdYnUXuMiSnR6GXbCUgmh1IZOzav46b7bXyjzbdu/+0mpFePKjtH/XlYAwMa+NEDP0bs238rNhmktvoAs2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788059; c=relaxed/simple;
	bh=+l68dU0dR+99ZPwyCDJAGnECFoPpPHbBNf7jDQlDhME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKpxxYnxTNLlWa0/wDHTG7jWowCEIjaBH6FySUnBDU7VMdFvWXMCL3/tL1QSzWm+MOl+dV/Dw+nDtP6oFi+SqcluP1Oz8U84obZmNFqqLy2OdcKcy+LNLpLISZJ3ifLaDPkfAGRIN/B7EMc3hx/WlZxbNdoaAuU9z6/DfuyMeNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKT8T9lD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CE01F00A3A;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788053;
	bh=Luf3aj5S+Ieuk57MG3szVaEm68e7eHP7Po/Pn3Xt2LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DKT8T9lDMYhwuB+XkwQ8YGyCk8N0pOfotwmxFTjOHYAzuVBmac47qMFD15IeS9VzV
	 QZMzTEi5k55YbCaWAJqqjOrZ/Fiq0KGo5YOy2FsXNoJm42oKIlgJoWxurP5BFUa3zr
	 xWvgRM+REe9ToaIJBmn2OZIfkbkrq68daeHSWX8N7WdP94Rpo+297cEimMHX4JK9WU
	 34g0xoP5wj2LlAEk/8+uyt4ONPiGnNBGDUDm2JoC1aX8FF39d4FBPmDAp6h6HEGptE
	 t0/n6W/bb6a1uXRbOb6J6YooYmk0NqgFOs6rNNiCiCZXW1g12izklObmnSKDMP4VcZ
	 Mu/eAKoam+uqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: qcom-ebi2: use managed resources for clocks and children
Date: Sat, 11 Jul 2026 11:40:40 -0500
Message-ID: <178378800458.138068.2861861016801192645.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
References: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:linusw@kernel.org,m:pengpeng@iscas.ac.cn,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-118474-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CC0F742387


On Tue, 23 Jun 2026 09:54:15 +0800, Pengpeng Hou wrote:
> qcom_ebi2_probe() enables the EBI2 clocks manually and populates child
> devices manually. Several later failure paths can then return without
> disabling the clocks or without relying on the driver core to undo child
> population.
> 
> Use devm_clk_get_enabled() for both clocks and
> devm_of_platform_populate() for children. This lets the driver core
> unwind the resources automatically and removes the hand-written error
> labels.
> 
> [...]

Applied, thanks!

[1/1] bus: qcom-ebi2: use managed resources for clocks and children
      commit: d19a46f7ed8eb54fea61e0eaf7db53ff7babb03c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

