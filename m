Return-Path: <linux-arm-msm+bounces-117096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y4IkEvRxTGq7kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C833971710F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h2sRc+dG;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 428D930AD510
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93CC32E72F;
	Tue,  7 Jul 2026 03:22:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7238735D;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394521; cv=none; b=amkekdWuDcJXXf1BJ6iyEYQih92ysG4nwQ/ZmI4UplhaIAjYmgzE3u24fEn0VObNzd/+YfBvfsu3b5zcjih2kOD9a3YKxHyOjtePa6RL60NNCnufJuLYH1QHSE+ru3MEI6f5OFCB1NsWkzLOYB6DoSuuoDLwgOZIIA9oWMohPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394521; c=relaxed/simple;
	bh=Q6XPIHfjrifJf7VZxdRX6ZKVDq2u/4S5jcHCyElqagA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKNqi0hHusy8WFFSciatV4iYtAdfJ+GICuq18okVR5jnvy9MBCbAWW6d4jRSuHV0gvjc30oUJRsNddRHSzWnGbQ+GLyG8gHxGgxKg5tsIZsEqkmp/zkUcws7Vticy/kSdE5r6gWYhWL/GTUYc8Rwqkldu4bQJkLd69lJjvkKw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2sRc+dG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CBA1F00A3D;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394518;
	bh=niQ5NEziIOMO5/fJwKtMRgyL+MmUzdEDKvALgyObSU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2sRc+dG6zZVe7C7vjFo6iv3pZIQKD0iUfzfWClG9HygiChdkAWw6scaWcgahmN3T
	 tRUTgpNOwfe84QkNTyRm8QE/uLw++KwHJdCK8KQSGc4SS++Bxr8rpAV7w8de6YTo3u
	 ZuHmv9uTbmK64PMoQ6ADqaGXkuEz/2cIuKfK3D/u3tsV+vKXDDQGpYB+wKKXapt3W+
	 mPjGWjWYc7EMKg27vOatfF7jEREUFIUIAmTbKLsbkzTD5Wa4oRxrUUJWcASYQMuvjl
	 JKfgTf2WwCOmyDb/KlgwXMkXHU649KMX7YIEfLKRfvLeAYxWRcBw1kL6IbuLMHL59Z
	 baAop/NPKCyAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mani@kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Support IP version beyond v3
Date: Mon,  6 Jul 2026 22:21:32 -0500
Message-ID: <178339449911.1938770.6350573817446573406.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521131229.11199-1-mani@kernel.org>
References: <20260521131229.11199-1-mani@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mani@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-117096-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C833971710F


On Thu, 21 May 2026 13:12:29 +0000, Manivannan Sadhasivam wrote:
> This driver currently supports Inline Crypto Engine (ICE) IP version 3 and
> 4. But this driver fully supports v5 and should support upcoming versions
> as well. So extend the version check to support versions 3 and beyond.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ice: Support IP version beyond v3
      commit: c709c76f4cf1d8646362f5a00ce8da1bd8ed58d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

