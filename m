Return-Path: <linux-arm-msm+bounces-118475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LFAmHj5yUmqSPwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42F74234B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:41:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZlnJUj2w;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21EBA3022F77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6233CCFB0;
	Sat, 11 Jul 2026 16:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECB3CBE8F;
	Sat, 11 Jul 2026 16:40:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788059; cv=none; b=SHJifzfUcHx0c/E8ROyxuet96dprSBJ5QIb5UGxnFwUQJdxZRn7v0cR17RXiu6rkWMjV8/6b8/obVsMrD2VA7KW6Ei69aAzwAskpUp//moW43/w95QxndVSHVqbwWztz2ZOjpRcTXTWnDR3qTHEbgmybJ5A9r3AjQkhdQSDt6as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788059; c=relaxed/simple;
	bh=7lQAVVqTCdk+oS0mwBqwXnb6/mo4KstJNFyBO2WAKZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvqD2yg5Kgu+S3eIx8gRxZZf76DTRZVE++4SSAzoe0AWA1QtfvP27wiYdRicMHWElacXm9WZ8umai0Cvigazo/v1FdBmWBm7YuxTb0XRakVDKj7/rDo1WKnsljXEkQ8OQavlG7rE57tz42Y7AMB+5LTwE4AEpWPiAKpYGYd06+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlnJUj2w; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09671F00A3F;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788054;
	bh=osDDlEG2z0Rbu3XY9WfwOYVuDOqxyzd5wCYpia7MA4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZlnJUj2wyxr83BrE4qg/GmZkG7ufxNlVXCY5XQfqPSLznjxSromz++Uy3oIWY3kZ/
	 8OCTyWUISeteRkE6ytc9Pol4WgPmxpgtoPI5MYdI2cfv4uSxJL66NEgPE7bakYBlyi
	 ZtYwwqcC6KzdZk+mkUC3LVH4b69Tvcj7Z7tJKv4hnmbImiJZeRM+MqmMA9+YeRhG2P
	 ZrgQC2dRscIVhuo2FpJZzcxGFs+MPwSRzu6fdbLQQUZBUKobZG4BzlzCBy3KLl7EsJ
	 jAEE4UCKaHyTWHx8s/Y9su3iA8gXgPm3oypDzgRiJY6C8/T5ZphJ4U4emUVxDyqamc
	 1fygnQaOyWaRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Lina Iyer <ilina@codeaurora.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: manage PM notifiers with devres
Date: Sat, 11 Jul 2026 11:40:41 -0500
Message-ID: <178378800454.138068.5206045720298101845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
References: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118475-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:pengpeng@iscas.ac.cn,m:ilina@codeaurora.org,m:quic_mkshah@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C42F74234B


On Tue, 23 Jun 2026 09:55:01 +0800, Pengpeng Hou wrote:
> rpmh_rsc_probe() registers CPU PM or genpd notifiers before populating
> child devices. If child population fails, the CPU PM notifier path is not
> unwound and the genpd path needs open-coded cleanup.
> 
> Use devm_pm_runtime_enable() for the genpd path and
> devm_add_action_or_reset() for both notifier registrations. This makes
> probe failure and driver detach use the same cleanup model while keeping
> devm_of_platform_populate() responsible for child devices.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: manage PM notifiers with devres
      commit: 75e918aa876440d8ad559a11d6ab87bddb1ed79a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

