Return-Path: <linux-arm-msm+bounces-115024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7SgjH+JiQmro5wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A86D9F91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jTQVNExY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE343040AA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4D636C581;
	Mon, 29 Jun 2026 12:14:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263D337B87;
	Mon, 29 Jun 2026 12:14:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735242; cv=none; b=ZXOqX3duPEpmMW/c/RVB5WpfztGrc4ayn+r8G88LMc2OyoWDekNgGdRVCcx458TMHuZ0b8A54X7giYzhT7ycmSK8ZLrXxoXTQqbQI3GSkmneKw10HOqYzocERvh+AMv3z4P07yoXNgtaMSE1CK1uHr51gPsNHIXFwB+kb9xyiaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735242; c=relaxed/simple;
	bh=kvO0YGhuovxoCsZTEoBeQBrPgqAhDJ5XPx1WtxUQg58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mnWgdaR4NF38Cac2f7/abaq6qcVnQfvYqSPShg1/sO9rV2XZJoU8fwWudjfCBvTvHFelXx0HWtze4t/UWznPQFPKhGQw5FG7Y5ElLP55ICVwK5r0uoO2GrckOUCD9vcPB/4cwiQKSKKN2prwi/jNhvCqCsnd5Z4cte8a84LcBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTQVNExY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858371F000E9;
	Mon, 29 Jun 2026 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735241;
	bh=+N1moqIwS0HzoLY9Pl3KOMaMW5N8pC3Oh4zwakoY5ZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jTQVNExYMWf1XFG8pnc1uYIH2BzoI8zshS2+FG7sjsGbIBY4vzSd9UUg/xwkeEBA4
	 u8RvO6jmaE/ORJticIPR0Mv6MXagfKrhfqjPhxP2aarqdQpsHWGBFCyH06jisClmGl
	 U7cRNNYwur9Pwfw3b6+3HeIka+fS5GoM/ClvAPwSZuoSogEBnhAULrCzskUzY97++h
	 ss/IBRBlhBXe26Vmxl9nTBN1Gqd7+EhcQWV+7vi33D/SEjb/f1OXYdERy796Dg6Jp3
	 fVyFvreS+TSsaMXCpzvnRgJjAP1KrPPwbSCcE8dCL7tF5yHylzokd9SkqEyXi7B1Lk
	 8svN8YDftesJg==
From: Mark Brown <broonie@kernel.org>
To: bjorn.andersson@oss.qualcomm.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
In-Reply-To: <20260625-abort_active_transfer_duirng_s2r-v2-1-1d6f724406b6@oss.qualcomm.com>
References: <20260625-abort_active_transfer_duirng_s2r-v2-1-1d6f724406b6@oss.qualcomm.com>
Subject: Re: [PATCH v2] spi: core: Abort active target transfer on
 controller suspend
Message-Id: <178240580247.51343.6228572083812055629.b4-ty@b4>
Date: Thu, 25 Jun 2026 17:43:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kvO0YGhuovxoCsZTEoBeQBrPgqAhDJ5XPx1WtxUQg58=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQmGGXYErpGBj2ndt/LWOyD5/0W/ZIzt47Ofyo
 EWDS53W51aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakJhhgAKCRAk1otyXVSH
 0BpjB/9XA91ao0n0nXcVLUiztLBJxBr8BLNVs/sPAhJSX+VXzqdEbvl70cXFHGSU0NEmy0Am6Cb
 Y4j15mb7ScZ7QIlTukEU/zeo1ty/6+Ao3fed2fM+JC0+lyiVwqzoJQC67L2xauq4S5LTrcDakpP
 hOcpE/0ndiyhp7Plw30S+UxDIQ9QqK7kVa1mIzex1LiyPsKE5r8G1W9aDXj7/FJ23daJMrIkp7I
 yK4MiLKInfoTEFgTgnfmImXv04SRXXVlG8wfn0/1xTO9lDLQ6SFHct/s3zSN+8/LopLTMOCpaz9
 BJkmnrLkR7K/dzMB9B/O2ph9NZhQqFKwGQWFytGtKcMeZaCd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[91];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115024-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD3A86D9F91

On Thu, 25 Jun 2026 21:26:02 +0530, Praveen Talari wrote:
> spi: core: Abort active target transfer on controller suspend

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: core: Abort active target transfer on controller suspend
      https://git.kernel.org/broonie/spi/c/c1bab046d478

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


