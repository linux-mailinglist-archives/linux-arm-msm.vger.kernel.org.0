Return-Path: <linux-arm-msm+bounces-117736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DZFPEJdtTmoyMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:32:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3472812B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="IYrV58/Z";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB813283DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AA741CB20;
	Wed,  8 Jul 2026 14:57:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EF42DA43;
	Wed,  8 Jul 2026 14:57:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522668; cv=none; b=UqviTgkuyr6Cv/SYekX0YInTskdG6dUfqOyhtpCTrEUxWMk8q/+hLc4n3nkh3emVXj03zfQhIaup50jIci/6aeOSWZEybuYXjCfPMDdlhDuuQfh2xJYTjyS3Ok2lNUWm8Pe+w8Oa145bNejKXtoNHV2pCvF2oXdeyvp/OVfvkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522668; c=relaxed/simple;
	bh=5R39CovJ9VJOOuCwDmySNs1kpkYaDqDuDZ4HIS5V/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRHkNMj/ZOJOz3wBHXVsEvDu1so2MoreGO9RRpFjqK00cGhiDtiwpg7EUMXtMxIEVDQx4d85OiJiJUZWhMX8/Bwb4BL5XxiQNIc0hs/Wv1X7bf0sbNtft0LWyII5T6gYPnMLg5Nl8sDD8VEwiQnOPet2Td4KQfi1mLxEwHLBHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYrV58/Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC831F000E9;
	Wed,  8 Jul 2026 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522667;
	bh=xZFYNX3SqAzPnn6TOYTyXtXeZIqIPQPKInlUbDu5KJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IYrV58/ZJJvu8n/I5Bd+p6RLvEVTlhtZ+IF1Rs3NsVgVglLbv6LDqdL/ajoaRNhw8
	 J37JjbGXfLMC9vWLtf01Ar7xosNxsfuu1cqO/6PTLYyp7YPoqJ+g+GpGj7++5CcQkY
	 4tnNppZ3NLW5ZxOB429K5Vn8K1rJGJSYO+rNRrM750NJyB/4wpf0sdk/9BUPDnuEzA
	 n6Ly75g1smqTrR/yL6PVFuA/ph8hTwclvdDLDNenEK/JA0egPKmVT/WCtsmT1Rw1Q3
	 FFFbXgyqy6W47hRKg5MjFoBNCyw/C1Sky2WMTCcI2MXEB4Ns8r+yrM3GwzcQvm6SjY
	 VUeWbiUo9+/fA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	monish.chunara@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	nitin.rawat@oss.qualcomm.com,
	pradeep.pragallapati@oss.qualcomm.com,
	komal.bajaj@oss.qualcomm.com,
	jsodhapa@qti.qualcomm.com,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode
Date: Wed,  8 Jul 2026 09:56:48 -0500
Message-ID: <178352261626.2235436.9462453754580041321.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
References: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:jsodhapa@qti.qualcomm.com,m:ulfh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-117736-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A3472812B


On Fri, 22 May 2026 16:20:20 +0530, monish.chunara@oss.qualcomm.com wrote:
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply for UHS-I mode
      commit: 4614628bea862cbad0ec3323200900a1f34e98c5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

