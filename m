Return-Path: <linux-arm-msm+bounces-112974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nT+4MRKGLGpESAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:20:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAEC67CB6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gJmFOO25;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112974-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112974-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8206B323B339
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 22:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1BE3A4F46;
	Fri, 12 Jun 2026 22:18:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C6374E4C;
	Fri, 12 Jun 2026 22:18:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302711; cv=none; b=U7DSq+IUlELd+XMAL4rvhnoCjYC+E25B95UOr7fVJ43ypMm8o8exATDo3r/SK0r7xVpbzeBQioM6Tf2UoVxN3WQP8pQhAlwcwbp8zuxWEGvS7ohUUer0vF1ewI3NqpohEDuB/GRpoNat4HynWSt987w2G+HaGEjLzvC43Sd6uNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302711; c=relaxed/simple;
	bh=iMlL1vFVayA2B3AOOQa5rSWOICr4+/dX6uwv8YS1F+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pBaGwKiqYa3Ma9KiTb+9woRuMMWEJIiOI3M+wnteEJP6933fqG/qU63/0bYgpSyW9uaD6xvgQsEt+dewXgafBRpsuOrEwQvnfegW/1Ul7rx1Nfw2iRY0A7vgbAKE8EG4cT9xIunot/qJknruaoqqNP5tSSLfP3f/M3iOES6j6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJmFOO25; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8121F000E9;
	Fri, 12 Jun 2026 22:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302710;
	bh=AmDKpKNkyHOSQGKO6ddMzshe+a01Z+P69G0V72xH0YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gJmFOO257+VQ8A46wJyA+hzvkTHzjFx9c7pLMbKlPx4pFHfZXUVELRZhcpIxoAQp4
	 h4cD6ZXMEI4eSiZScC/2m/gW+NV5Fu4EmKzcgMv3DiQgLohscb5Ra6WUwxK9SwpCAr
	 BLeTPRUX0ZBlBYi5EY7dB7KrcXy+GBqK4rSHw7tA/Hp70hxWeA1WRh1ifhXUnc/0Ti
	 BQzMLKInUAJUwRMBndBgoFSbxC8aP7BMQDLQs8HWNGFjmamQx819vTYqk2IXX9Pn/M
	 UlTnblNpS0ftN0/VN2Ur2aYlTO+SbGabB5amWvS21Gitm0EqBssy7TdHOD4Wa0UcES
	 TWQZrID2o+aRA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, lee@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 srini@kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v3 00/10] Expand SoundWire enumeration helper
 coverage
Message-Id: <178120723551.484538.8091127246653014116.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:47:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iMlL1vFVayA2B3AOOQa5rSWOICr4+/dX6uwv8YS1F+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWx01hgPSdY0U0XnB3YIuP/hyAKexWEILJYF
 0S1U2RESXKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFsQAKCRAk1otyXVSH
 0O1JB/9AaKaf19LOtVzcwR9XkOvkYk1H4VwvXjLXO78dkZMjTpw2PHayPmajKCBj9q45Sj5vrqC
 gyR+r/40McOuce5pryZxFKPXty1X5DZzzXfdw81vnJeQheiXQBAC6SwZw7IROnOPFaYaJ+5LAm2
 nqjW8DLNhgOjYRdWxwpW4yWIhNn+GBQxU1JY517OFGt+sw2psCFV/l/YPg2A5APTTUO7w5qkVVe
 WgLaNdUhbny1y563jiiIpJSHBZa6R0yFrnzg/tkxz6dQpY+bw87dA3+LJZr0AeohTGr2K20Pehx
 jIbyzgYZf78mJiL84URc1rfnJ029d0B78kiuC+b1zc+1TkgR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[26];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:lee@kernel.org,m:ckeepax@opensource.cirrus.com,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112974-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DAEC67CB6B

On Mon, 08 Jun 2026 11:27:04 +0100, Charles Keepax wrote:
> Expand SoundWire enumeration helper coverage
> 
> The patch series in [1] added a new helper to remove common boiler plate
> waiting for a device to enumerate on SoundWire, however, many devices
> also wait for enumeration during probe. This series updates things to be
> suitable such that we can call the same helper at probe time when the
> unattach_request is not valid.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/10] soundwire: Always wait for initialisation of unattached devices
        https://git.kernel.org/broonie/sound/c/5677a551f458
[02/10] ASoC: wsa881x: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/f0eb67c618ee
[04/10] ASoC: rt5682: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/933feddee4d7
[05/10] ASoC: pm4125: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/ae636c93299d
[06/10] ASoC: wcd937x: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/ec1028e3f077
[07/10] ASoC: wcd938x: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/d6fc2c7051a6
[08/10] ASoC: wcd939x: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/4e006504ac95
[09/10] ASoC: SDCA: Use new SoundWire enumeration helper
        https://git.kernel.org/broonie/sound/c/90a49e0f1652
[10/10] ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
        https://git.kernel.org/broonie/sound/c/890b61d3a8c9

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


