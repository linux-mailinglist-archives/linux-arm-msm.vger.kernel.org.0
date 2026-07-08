Return-Path: <linux-arm-msm+bounces-117742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id To23GUVqTmr/MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C6E727E2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:18:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BtCC6GHh;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117742-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117742-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8870E3297294
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E05435ED3;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF943440A;
	Wed,  8 Jul 2026 14:57:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522674; cv=none; b=KX1IpWC9o/gpOQ74RRYhZUA4WlC1oG2+jHHWE74/i9qGU/hBzfC5cmPaZSodxBtxobE1bnoTAhNYp5GGJl9tjx3ykN4jyctJD/JLQ4uGOrDl0rEK9NCYYtizY5y3Y7oweW9dPGpiQv3idAdROv8eUxoKhELgiq/3U9XCzBhiNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522674; c=relaxed/simple;
	bh=bFA94aKmQJlqiHSn/ae4mVnqdqfITmIknSp6MAwa+kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSjiZ6syS6eLTFI9Om/ytQRNRwp9MPy/uj34tcvv0jWF8b2z7aRsWhyMCUxnttjOPVxWnxvLiN9GOAMWqjsMmSHuHWEWo0cCaxxVKfVu8B/yjX9GGcrhHZj7tMb5PTRaKtKPlRm7n3S98/hW6uTgnKl34X2ZRLhIiHz2+vBS5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtCC6GHh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27301F00A3A;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522673;
	bh=ssdQGbhprd0rbvWJSTZ2RTiJZLoC7Cp3ZLUEKDmpOPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BtCC6GHhutr3uzqPcK/cpdYyA3V5uOE0EGaUN8f9Mdw50K6hm6ZJeLS4+Tg0S0by8
	 BKLObYI15vq0SAQkYgQjg+Wund2emN/dR9QGuAoIzSa7RpCXIRPY32y/la4OG4fT7x
	 GeKi6v1kKwTBedAqNLQpVswWjZeZmG8PSgmpnIzSkhh52tmn4l7Qh9z0ksdVLgWesi
	 wjy86Ah1N9uYZBnlmSeNtS0RXmz6ls6bTFQAwBmb92bEBMKu07aXulaacFLrotHLtt
	 opAOMK0kXprMrzfsZmM7LpcXTTQBDGrh0sBgVmYc9dEwt5wd6We1rigzkg+k5u7aAc
	 rIhnWsje0MajA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats
Date: Wed,  8 Jul 2026 09:56:54 -0500
Message-ID: <178352261620.2235436.3197560807771965831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
References: <20260615-add_subsystem_lpm_stats-v1-1-d40fc7c755da@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-117742-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: D7C6E727E2B


On Mon, 15 Jun 2026 14:24:36 +0530, Sneh Mankad wrote:
> Add SMEM items for SoC Control Processor and Display Co-Processor
> subsystem stats which are present in Hawi SoC.
> 
> 

Applied, thanks!

[1/1] soc: qcom: qcom_stats: Add SoCCP and DCP subsystems stats
      commit: ed3233af30b711c2a434e95cc05531244fd07307

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

