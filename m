Return-Path: <linux-arm-msm+bounces-96287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIEnN6bkrmmsJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:17:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0F23B805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E6EB3083CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437803D9034;
	Mon,  9 Mar 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szP4LUjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFD3D412B;
	Mon,  9 Mar 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069157; cv=none; b=IdqXoytihdrmceVEfpbRLAhZRSPZgashn3vI3H10lT6ydAlcYMSKJ4XmrfCS+PURUIR78hvFHTzZJSo/QCU8TVTkcFS2sUZRfoswDoOwUCUvRRXwnJuPHoXzak7Mvqjbn6S6S0oy13vPi006Y0HAERyiSHfdokSmOzDJl5rWOFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069157; c=relaxed/simple;
	bh=ZkCWbqrc47NpgZ+L4btzWYAw5FFwdyUvBXauGv4F/bA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=anu+uMlBAHUmi9gtF3rao5YyvGXYzDXFsOF9LoPCXtY2SKciu6S33XnFNf2Rc22MIh9ketdQCdNiYn5rSuggrKkeVmWJaaIIYqpi+Y8Z0CsAHwo/366BtXwtUPOQvuLF2uw+7vTdiJfo/7tIefAwqTWfWnqN6TmiaiyTBrzGtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szP4LUjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B0BC2BC86;
	Mon,  9 Mar 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069156;
	bh=ZkCWbqrc47NpgZ+L4btzWYAw5FFwdyUvBXauGv4F/bA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=szP4LUjoHtI6vLFkqGOZ2++T17No5A6BEAGf60bnwmpPmKyUSwdTNnjScaxXzwj5m
	 Fm9JwTPiG74aghA5KXmIi0QmhBz2zk4NnyXC4dMqc87IXEDs/Qtv8BckS2u1dwiI2p
	 R7sfNSNqABupVMrGSpmv1IoXPcBjShqO+e/Ts9srnrP3oQLkSFzfawQapT5VNQGNkh
	 rd77cdaT1k4zKxeSc5x9aszEs9HhlNRVKjWlJ1YB65KTn4dxpHx4ZTZ4ZkOHlWiRIV
	 lIOI1Zckun0xj3WrJzfsRWba/gRXaJhQAJdek673JNviYqeCnWywUmEBctgMLoMCfV
	 h08OeRHaEJ8RA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
 ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
In-Reply-To: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
References: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v1] ASoC: qcom: qdsp6: Fix q6apm remove ordering during
 ADSP stop and start
Message-Id: <177306915420.149479.15947778465321461228.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 15:12:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb
X-Rspamd-Queue-Id: 6DD0F23B805
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linux.dev,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96287-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 20:15:34 +0530, Ravi Hothi wrote:
> During ADSP stop and start, the kernel crashes due to the order in which
> ASoC components are removed.
> 
> On ADSP stop, the q6apm-audio .remove callback unloads topology and removes
> PCM runtimes during ASoC teardown. This deletes the RTDs that contain the
> q6apm DAI components before their removal pass runs, leaving those
> components still linked to the card and causing crashes on the next rebind.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
      commit: d6db827b430bdcca3976cebca7bd69cca03cde2c

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


