Return-Path: <linux-arm-msm+bounces-117068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8JKbIk1WTGpNjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783971695D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VIvQT45i;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117068-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117068-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A5B5304D5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965BC30C361;
	Tue,  7 Jul 2026 01:27:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABB2FF641;
	Tue,  7 Jul 2026 01:27:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387659; cv=none; b=TnWS7g6uZ2/afISw42zSQnTNXgtLwSMfXi0MPpCjRo7OmPmwHQTi3tB3PBcugEHFiRQkW6KSTL4CCr9OduQu61yD4QERF6ow1hF9qW6WY45QE6hDp4pY6eNY3sIeTSOn1bt63leh8ZkDJ/HL1IcJ4/EmZlNWKHGm7JCub5Fe4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387659; c=relaxed/simple;
	bh=9jmNmUJ2bK98pFntISEUNsT4R7CR97f0FkyuJ5Ce760=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fj20wCmaCF+Oqdtyi1s41yyL8SNjnnyFOp7gNMmuX4V2PGB3tgBc+Fo4SxKa8GcZFFwCCYboa7UmQZMNM2TjBKjS23p7MqRNLHxMKRioCsMXSORp7P4Vqv+BeT5HY40wDz+y6ghr4GlDOkwOibqjp80YGoEY5x8wI7PVuCVCYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIvQT45i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDDC1F00A3A;
	Tue,  7 Jul 2026 01:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387658;
	bh=OtO1HWwzBUTSg/gC+t/3ZlwjmfjoB7RAcc1IEGVnbNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VIvQT45iSJHC5vYPf2qDj2aTGNdT7Z57tcbQIrRzjnYh5tOwMSg3DHjdP9APiGko0
	 N2GGDYF6+gHRyJbmg7X2NzPIBeVnhpyyLzo1ZYiSn2QwC6yD7X2ntwDKty2hkBEQqb
	 7ZY4Ng6bcVgio2ycWxfnMYgtiLNPQHOFSeiQkcM/KWyAHUFDS6vaw3jEJNYnlLzGh/
	 QX0jQZBOL85qBZsx32jkyvm22MJnFsE7cBbp7lza7J9Up9/5DKJoj3tn9UYNGfEK21
	 p5bXKnFx4/RDXVHBMit2F7PzBxg8SrN/vhJUR/IKKwN9Z4mJrgVehYl9BrwaUoctir
	 d9awX4xz193eQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset
Date: Mon,  6 Jul 2026 20:27:20 -0500
Message-ID: <178338764563.1558388.12903948224635779297.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
References: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117068-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jens.glathe@oldschoolsolutions.biz,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2783971695D


On Fri, 01 May 2026 11:11:29 +0200, Jens Glathe wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the RTC driver probes.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc offset
      commit: f52102fc9ccbbb3c4bc01a29f3194fe07f9602f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

