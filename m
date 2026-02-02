Return-Path: <linux-arm-msm+bounces-91568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGCoIkE0gWlyEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:33:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF6D2A9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738D73018BFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 23:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3683A35F8AE;
	Mon,  2 Feb 2026 23:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1OubHCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349F35A936;
	Mon,  2 Feb 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075192; cv=none; b=uNgAKaRp65yggpZhZzr09pMz5OgU6oL+hqbOJZ/kIB6sup3E9tby9sfYHzi/3HvJN8Q3++WFeIWgG972y4YAqnbW0JaZaWTedIZP4zGUtQVw3XcNird1H+HdocQnHYtFK26DqFWi63zRC0dLV0HkK28Nm8bINFpsV6ci9LXG4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075192; c=relaxed/simple;
	bh=R+zvFWyGY8u/rq+aP4fP5Dz8VgfUlSwukLKLtFfHKrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Awx8pHX40l9cdokpLEUuedbpDXf7Aj6oxjVucRUqXIKCdtlA+vC/7Y6VZVLXL+ztJggVqdIu8AMFu5fvaleZXVPHN3rJ2CW0NSywkskxETA2KjAHE/besmM72XpIbPRiVqZFcYHkhFkOmBB17pzrcIQ2oCdg/7Or6zofjqrFJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1OubHCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B06C19425;
	Mon,  2 Feb 2026 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770075191;
	bh=R+zvFWyGY8u/rq+aP4fP5Dz8VgfUlSwukLKLtFfHKrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l1OubHCNGqttE/2IBoD5lD/d0RoqKunPT2pjsFhrwKx401TuQlCYOB1EIpKH2IMp8
	 I8u89q+EXFfFJIYwtXqJIPZ3vltIXOL9oi2n60P6eSoIifTKAHfCMXwkqZ6Li+l++B
	 Hsr5it7TCMM3+8oHkO5aOZqfHtflagI6twq3epAE5oG0YgyHS/c6oN0jGdMqCz1o3Z
	 REDjz8li7MAvPzZIuVdrVtn62K/QMQt3+MnuXrb6NT4RsnlWHx3nAEl35H34EIHuD9
	 fKfitA1U41vkp9pN0iUYa8UObOGILKo39r38gb11NIW0TjNMXyP77o49srmFEEVdkP
	 fFB91y7N5K0yQ==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260102215225.609166-1-cedric.bellegarde@adishatz.org>
References: <20260102215225.609166-1-cedric.bellegarde@adishatz.org>
Subject: Re: [PATCH] ASoC: qcom: q6asm: drop DSP responses for closed data
 streams
Message-Id: <177007519035.976577.8405290688594066065.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 23:33:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91568-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29EF6D2A9D
X-Rspamd-Action: no action

On Fri, 02 Jan 2026 22:52:25 +0100, Cédric Bellegarde wrote:
> 'Commit a354f030dbce ("ASoC: qcom: q6asm: handle the responses
> after closing")' attempted to ignore DSP responses arriving
> after a stream had been closed.
> 
> However, those responses were still handled, causing lockups.
> 
> Fix this by unconditionally dropping all DSP responses associated with
> closed data streams.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6asm: drop DSP responses for closed data streams
      commit: 8a066a81ee0c1b6cdbd81393536c3b2d19ccef25

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


