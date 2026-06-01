Return-Path: <linux-arm-msm+bounces-110806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Do8MFzJHmphVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 14:15:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C191B62DE5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 14:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UoHp3qsd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110806-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110806-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 653BC30B3F5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 12:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B824A3E0C53;
	Tue,  2 Jun 2026 12:08:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0A3E0745;
	Tue,  2 Jun 2026 12:08:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402098; cv=none; b=ot9949X2AjmgVDjOFckinsMtwKKi2j2eHe59OTvyjISoyiW73ZyI8+em31P9m1LoT4lMUqrLt5hOl3S/mNwCUMZQKDw3u7gAcTvn3pOqMlQ1wPB+e0bL6IkH2B8FBdX5uRhHdqNAHoDry4BL+lr6Q9Z4DTkdC/0jEs+bqXYoBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402098; c=relaxed/simple;
	bh=zLAj4P9Dy6L2EM/RcQvTYSnONUWfrINoP2/8PbJBYwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kLE0l++nxGj7vI+Z/4gCLeLmNozSPjS21Qkx/eys0EkKYjkrEYsKZpg784sUoxZq98Bb8KEHNkqVEVjaqSqrNxmg40qB3X6hxM5Gd2ExUVhr9xK9E/ifSjzLn5BLZDNmCK/2a+tJOkLXc5rLTdkTrYTXKn1ZM7x6mFKx20B412Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoHp3qsd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741461F00893;
	Tue,  2 Jun 2026 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402097;
	bh=7ay+AKx4LhOcg/My/FDa+sB5VF1ZYepET64MBC4G2yU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UoHp3qsdcYvkoZIK7m+Fe+1i23bwbQ/x6dyI00f/m5x7QCvioD3/g3kHG37z9oMwH
	 vPR2eS76453kH648olGHUttv826cIEvgmQq821aSsB+v1Sr4Yh5xdDBoob+foLSQp+
	 6I+i1W4Ec4WRaVBHl1S9YTpRr2alOsVPnwPKR0BzoQF7iDFqZMnvp9jp9OgOYWYdoE
	 aHDjizs9+kZWHuB4gkC4rfSZSrxz9qKPw0imkHc+azrF4MWEnoWfibIgtOigVgV5YT
	 pzD4UQX8awJVssk9nloieR6XBzFUJyv/NeS0kKOcKlMkuBybpaQakzq4jIoi9umBL8
	 uhj/P/6eCvIHw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org, 
 mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com, 
 mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org, 
 verhaegen@google.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] ASoC: qcom: qdsp6: add push/pull module support
Message-Id: <178033076336.44654.4051791515158017580.b4-ty@b4>
Date: Mon, 01 Jun 2026 17:19:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zLAj4P9Dy6L2EM/RcQvTYSnONUWfrINoP2/8PbJBYwc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsetKXMP3n1XuuoAxs5FVEr/0WuQBxJi8N6z4
 kxMzFt5XIWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HrQAKCRAk1otyXVSH
 0CZ1B/92s1QLN95Sn55fcp3zZUNqeflRtHVjF7tCT2t/PKmGDUjQgUQ5BOc29+EPXWfmZA3GFUe
 pYKvi7fWkG4xp7rlagTvu6tilvuqa6q66V9HLI1h/HFI070hNT4ots49kuVA3LLbgDKWuCyiMyh
 7AT0tJ5jTDtxaZtjyqK7I0TxBxCMMTpIic1LwdgOQmij3HY3U9i/cT0Br0Wlq9Av1PYqDNuBUQM
 dzxOO67cGf/toRmVdVyX3v9JWtVeTqgeKKeJoanflJBBElKnaepFiJ6ANhn0HOJRym7uC5frVEX
 GFzAZMIAwmGWkwZUKazWr6uruajDbqZU5HD9MF5wwGy3i7fD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:alexey.klimov@linaro.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ravi.hothi@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:andersson@kernel.org,m:kees@kernel.org,m:verhaegen@google.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110806-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C191B62DE5F

On Thu, 28 May 2026 19:57:59 +0100, Srinivas Kandagatla wrote:
> ASoC: qcom: qdsp6: add push/pull module support
> 
> This patchset adds support for Push/Pull mode modules.
> Push-pull mode uses dedicated shared-memory modules that allow the DSP
> to access the PCM circular buffer directly. In addition to reducing
> fragment queueing and ACK handling in the host driver,
> This mode exposes a DSP-maintained position buffer that provides
> fine-grained hardware pointer updates. Unlike the Read/Write Shared
> Memory endpoitn modules, which are period based, where the reported
> pointer advances only at period boundaries, where as push-pull mode
> allows .pointer() to reflect sub-period progress, improving pointer
> accuracy.
> Also the driver now can queue buffers which are less than period size,
> which makes tests like alsa_conformance_test happy.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/6] ASoC: qcom: audioreach: use cached shared memory module IID
      https://git.kernel.org/broonie/sound/c/525fa5f30c83
[2/6] ASoC: qcom: q6apm: return error code to consumers on failures
      https://git.kernel.org/broonie/sound/c/3075ae5abbc3
[3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
      https://git.kernel.org/broonie/sound/c/240286ecf1a2
[4/6] ASoC: qcom: audioreach: Add support for shared memory push/pull modules
      https://git.kernel.org/broonie/sound/c/7c1ac23b178a
[5/6] ASoC: qcom: q6apm: add watermark event support
      https://git.kernel.org/broonie/sound/c/ed56ac9e5e96
[6/6] ASoC: qcom: q6apm-dai: add push-pull and watermark event support
      https://git.kernel.org/broonie/sound/c/4cfbd3a8d596

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


