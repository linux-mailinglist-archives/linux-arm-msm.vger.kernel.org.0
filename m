Return-Path: <linux-arm-msm+bounces-112566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lnA1GOQTKmpviQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306DE66DADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=blWnunHk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4384A300C7DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF4A26CE2D;
	Thu, 11 Jun 2026 01:47:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326425A354;
	Thu, 11 Jun 2026 01:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142474; cv=none; b=Kstmcf3jR14Buqkh+HJ9AEVsIgXjM7SkMj8FhWPznJ6qG6+bXgKVlNwKoyUno9YRAoaltOncC7c4rRxaVo67Y6tlNwtp9lgiNhj5khd/dl6WWRbu8Zy1Auwf3kv+bL/O+Rzs8EzJk13Oto74VL9NenW/Rk4/TusAgiyfH4Awdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142474; c=relaxed/simple;
	bh=ONxgRvNXqTNt9Je7E53qINzQ+b32OwqgeZpbAyWH7jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxGeJpb0s6LJpRnYuA+BwjmGt5L76CtFNF0mx1n3noKtDTNxt78aLfQIr3d120Y349M/DAx2gGv0fT14FOdH9Ad7WzqBfKrZrRRifSiHDmw/Sibo3VBUne542bKsGS2KOTBqs6bOc1DC8H/QDpQQQfjAeU5P7NXPfsskqIl30PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blWnunHk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3BC1F0089A;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142473;
	bh=UDV9PR3pNhpsJfKmh7yBqBnapans18jcW5MtOlyoCH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=blWnunHkUTZwyJgU30vBPlq5dwSQcn6IRBpfTOCz2iaAAyDZRb4rGvRF0POstgi9C
	 KFRoE3dk/2Sm3SpqWqx2WcZhtxsVviCwAS1/rVKGIDek3ks/bMXdV+7oae5da0mrnU
	 WzKaGBd7gdhjssqwEKgwvTSVsw2yDjaAM++FiXyvODaO7tYg6jvFkGky+bjUTrB/Xi
	 uxDHc2cw2TOdAOKSwovOA/oJhWpXepYYXvliJ8vQBglrXMOIiOePH8C0woYm3bOZ7O
	 vs5B0ASuBF6qltqrNqzFwI6LggfFUHk/bXFpvxR41eq6modnZB8dHkQjNaQM5S/G0m
	 g1XW2mupCCYDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Govind Singh <govinds@codeaurora.org>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset
Date: Wed, 10 Jun 2026 20:47:42 -0500
Message-ID: <178114245714.590736.1315764992945434846.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251208223315.3540680-1-mr.nuke.me@gmail.com>
References: <20251208223315.3540680-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112566-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,pengutronix.de,codeaurora.org,quicinc.com,gmail.com];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:p.zabel@pengutronix.de,m:govinds@codeaurora.org,m:quic_gokulsri@quicinc.com,m:mr.nuke.me@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrnukeme@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 306DE66DADE


On Mon, 08 Dec 2025 16:33:14 -0600, Alexandru Gagniuc wrote:
> The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
> are the same. "BCR reset" is redundant, and likely a mistake. Use the
> documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
> from the descriptor, since all targets now need it.
> 
> This changes the bindings expectations, however, it actually fixes the
> driver to consume the intended ones (qcom,q6v5.txt), which lists
> "wcss_q6_reset" and *not* "wcss_q6_bcr_reset"
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset
      commit: 6ad61d0acd41044a949e84f96a5f8e02284d350f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

