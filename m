Return-Path: <linux-arm-msm+bounces-117704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPgXBpxsTmrhMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:28:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC3728049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n8ejtLH8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117704-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117704-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E219D3051220
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7724C900E;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA94C77CC;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522637; cv=none; b=aUoXI45toE2+uU1rdvHfYs1N2Mq73zzMgjoOKrZvOTPbYNKGU6ZFy8brSlrEh4Vgsuf5z8IqFnfMGctROAEqK1ZX9sQ51sfQc7RfXsUGTjzoWZHAEhp3Q3gvmsRlmqLAsEba00ue1HXVKWrrmoKIae8T5J1TMldZ/61T2Rp0jlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522637; c=relaxed/simple;
	bh=j1yLDWQNlff5fSstvDVYvAPaBmeCPbanN1T8YkQonZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7PtE6fEodPzJdomfAPU5bFRuD+Exxhsv1qxNJECDEoGREen26HpD1xDz3ljv/u0uKIKkn2Cbhufxp+3EsEJXPaqsxQBoK350dfBUxCLnOedHjLVY5iMfbO1BRAC1twCyyNNDW7/xQ1/+u7j8Cz9PYcTLu1Wecuidycy6sfxUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8ejtLH8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A55A1F000E9;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522635;
	bh=5n5hDHmxpiElAG8DeF7rPBhhPM1w6lG0LEa5L82OtKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n8ejtLH8pANfUjCDPnGYgkFoMCgoAdPoTOxONdtmcMb1w03n0k3wbLde4vPcjmvBU
	 BiSBlmavq9MnovzjfZbazN2PbMKVSKQRm83pzGEbEEnFXo8uNVCPCWOhCmjxKnPs3B
	 GJwu5xPN/YTn+wZP8gbiRVJ8MYIiVWya6XmCd/kfpOza+EWpXFKvSt57VFnl+DEbhV
	 JjUB3mDPmobXNpWdgs/5bvJD8pSnH2J61/u0oNZb0xu7GObNa+yD8sUGYKvTvyI+IL
	 q4Uw5WAVJeW0UxTerN5PO26ocC05riQ4vlQ5CLLFn/Z6JS2fvulnSC6Uz7GHAzhe2Q
	 a0OCq+EsfZwzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: talos: Add memory-region for audio PD
Date: Wed,  8 Jul 2026 09:56:16 -0500
Message-ID: <178352261645.2235436.5591797000080061652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
References: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117704-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04EC3728049


On Mon, 29 Jun 2026 12:04:38 +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Add memory-region for audio PD
      commit: 229f04d1f09f8832006753a266dadc0bf6e8b3cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

