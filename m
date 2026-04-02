Return-Path: <linux-arm-msm+bounces-101577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMyuEKXAzmmqpwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 21:16:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67738D964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 21:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44910303B4F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 19:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2235C366570;
	Thu,  2 Apr 2026 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACLWA4K/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDD332EBD;
	Thu,  2 Apr 2026 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157354; cv=none; b=rv84ryPKFFNB0APrbws/Hjwn4EpquTaKAp0v0/bEimHvZd5VqC9IYpSMD+W45Wp1Q4R48A86tOMp/SDscEhDekjWnDdyGubtE/h6OCDanr9vbVCoNykLrpK2mc48h89ckwLaIYvyaXrGVMMD0O8Z8Vpb4kDj6L0aaKsiZ4LbdgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157354; c=relaxed/simple;
	bh=vmcgmx2b1d+sEcCkP/PVuRC1VBB/6wisaD/PfN6lEgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gv7y1qLNI3/+TaAIH1WLhs5ZTe70ZqWqXuRwzUXiiqKw/Llagnl19p1M4/KDFUN4Z9LnQaibvSLkapsrHvqUuZ7THnJCX6HmoaBc+k8Qd9HpbkGldqcJxtYs6XKqp0abmZ1/389IcDs4Y2jPy1kgPYMaOkXMucZUdqYr4zIa1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACLWA4K/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F68C19424;
	Thu,  2 Apr 2026 19:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775157354;
	bh=vmcgmx2b1d+sEcCkP/PVuRC1VBB/6wisaD/PfN6lEgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ACLWA4K/rONuT/BL90yp++j7/3xrb5B5OQf3g2JPW6l720NbNNp3SSm/8J5Mgaceb
	 UWKzxQQhANPSfCK6QAe13QhTTebPFAVO423WF5pr7RkNGTwX9E9YTc5+JKTcPojZ3a
	 UqTGUVXq3S2nYZAqXTdF/s5tnMMEYDR5gyhQeFRkQtNXcETPYjkm7oH30QhYFHYYjA
	 ATQ94DMK9ylk1OpYEZ0dQ64d4dgWdyOwT96KHBQx/hT8JGn874+RN1VF18arYlqZwX
	 gE/6rbYguIo5aDSA2b2Qv6bekgiFffQz/EKXinMwc4m6xBrOvmOkEy6t4GIB5vM5Qt
	 brJbfW796RMzQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool, 
 mailingradian@gmail.com
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Message-Id: <177514411128.51134.5760476545108119591.b4-ty@b4>
Date: Thu, 02 Apr 2026 16:35:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-efa4b
X-Developer-Signature: v=1; a=openpgp-sha256; l=3225; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vmcgmx2b1d+sEcCkP/PVuRC1VBB/6wisaD/PfN6lEgU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzsBmINEhPyOy4OqH/NAYGmbM3RkQgB5HkyK6p
 JqKnv02sGCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac7AZgAKCRAk1otyXVSH
 0E3oB/9vVI1XIIBBGP5Y+VBEm3Fvl1zALIOd1g0AY23zTjIUPgiEL52amWfgkGZNkR7tiyGKqJh
 CYHy4h5g7SmSv+M7e1CnqvHZ+HCsBkLLYiTw0WoJAIfmuSVDnz0fYcJakh/zpmw14YoOtpCcEPK
 rql/Eee22r5qfXFR0a+xBY43harNzZOamJKhMRZW10t3eU48OrSbi7WNKuAhPhF7jWZqlGda4ND
 SI+dQpDHKjcuzTtG9Z8j2IisVTHr5my2q8zVR40Wu90CcVUcniXgScFZ/LnCtb1BtwuTgHZeu23
 Bb4bLuo0kdtQ3fpen+VI4kf2KdFk0M5E9L8fxKrqEcTh7YTZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB67738D964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 02 Apr 2026 08:11:05 +0000, Srinivas Kandagatla wrote:
> ASoC: qcom: q6dsp: few fixes and enhancements
> 
> This patchset contains few fixes for the bugs hit during testing with
> Monza EVK platform
> - around array out of bounds access on dai ids which keep extending but
>   the drivers seems to have hardcoded some numbers, fix this and clean
> the mess up
> - fix few issues discovered while trying to shut down dsp.
> - flooding rpmsg with write requests due to not resetting queue pointer,
>   fix this resetting the pointer in trigger stop.
> - possible multiple graph opens which can result in open failures.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
        https://git.kernel.org/broonie/sound/c/6ec1235fc941
[02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
        https://git.kernel.org/broonie/sound/c/4a0e1bcc98f7
[03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
        https://git.kernel.org/broonie/sound/c/d5bfdd28e0cd
[04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
        https://git.kernel.org/broonie/sound/c/69acc488aaf3
[05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
        https://git.kernel.org/broonie/sound/c/cab45ab95ce7
[06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
        https://git.kernel.org/broonie/sound/c/e46957f27c60
[07/13] ASoC: qcom: common: validate cpu dai id during parsing
        https://git.kernel.org/broonie/sound/c/d49ee8faefec
[08/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
        https://git.kernel.org/broonie/sound/c/bcd0df1ebc9d
[09/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
        https://git.kernel.org/broonie/sound/c/ae0de4e50f8f
[10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
        https://git.kernel.org/broonie/sound/c/8f542c7c4aa9
[11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
        https://git.kernel.org/broonie/sound/c/b54a38af7138
[12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
        https://git.kernel.org/broonie/sound/c/d8b4163038dc
[13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
        https://git.kernel.org/broonie/sound/c/8ea6e25c8536

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


