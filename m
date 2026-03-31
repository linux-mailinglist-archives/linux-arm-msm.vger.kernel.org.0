Return-Path: <linux-arm-msm+bounces-101382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHOSD5pTzWkMcAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:19:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D117737E8BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0B0D300D0F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 17:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687F547CC81;
	Wed,  1 Apr 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kn6aGhbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D6472777;
	Wed,  1 Apr 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063959; cv=none; b=ZncrQ4yhLIjgCZa20qcEWdlSTzJpBvWgNAv7vXcp0Jj1YFwoZcZ/Q3Maw4FHSHvfkYYrjiJsz8kH/yE8E+/cB/EFxVbQOoAnyw1RzD/v8Hs3EE43lyIY3XSZ5855Q5SbzpjYgaeYYUi7Iiswr7P3JNVcuUJ7Zgy7EvZ7y9wfeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063959; c=relaxed/simple;
	bh=0t1qiOT2TkAHTnIXYBg0hCbmcpZmO03o+RmNg0lRSM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RDFVGtj9x65BexKxXnmsWv33Pn3VqTC5zrQ7omDbNBBE60jrjkvH+ryxrl8uryZimL+NmblIO1ocjtVn+2ppheVsnXwbLQot8psfLF9l8sPEvg81XYsFZYZ1UKmorwuXJ0OpvFkjPNIPbE78fCevVGHv40zsuLSqyIyXOa7JU1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kn6aGhbV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE168C4CEF7;
	Wed,  1 Apr 2026 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063959;
	bh=0t1qiOT2TkAHTnIXYBg0hCbmcpZmO03o+RmNg0lRSM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Kn6aGhbVpkCvOBVAh+SBNp2CXHHvrdBvyGduFCUxQDiR7qJe8WqoQaVr7DqqvqgS8
	 WAcunvO+lt/tUvspqhbvEW0XNNsLGEsNSoa9fg0A2oirbdRvQH+hqXfQDK3KXLTK9E
	 Iv9/NfeUtRxn/RgGuz+QYM3AHCFdnaFlvveEDVB8atfAPpvi+yLcoY346n+6m/oLA6
	 0/6PCbpX7tnLEKriTVpTjM4SBfK8Zg2hikUMd1QlUvjSgxk2B6AKdMgtANqxosKIM/
	 PeGTIuN8VVVItBNdBlx9EitcCVzrNTf+BWwEHfhXrSKABfZwNbYSaP60QdPureyXot
	 mNcbswJ7x5TAw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool, 
 mailingradian@gmail.com
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Message-Id: <177498454736.825035.17158629527064214797.b4-ty@b4>
Date: Tue, 31 Mar 2026 20:15:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=3225; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0t1qiOT2TkAHTnIXYBg0hCbmcpZmO03o+RmNg0lRSM4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOSIVdmH+wSNvp/okTncJiMCIH2sFZN1OGMI
 oQu9duWOdiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1TkgAKCRAk1otyXVSH
 0CuxCACC9KKzA/fAdPwwiJumNjSTCJm8Oyl6YqXD/dZgVMqclE+DBVH8Vf05YtOXTD0b8Pjnfnx
 b01IWU3HhvUFGxnwkdP2nWiaTqsjSsfBEV8wSJ4P5gGNs7QN8WrEtQ0UlDlvUh9dNWYHEz85mJm
 YfpgaOawIy38h3vrNUWDUW769SSSWRw/hVipmfsXeq1cjZ6H58HJaafeUEfIC8P7L2mHGNNlMXB
 +pnNokNut4jcVy4ud76KTI4slp1xCwcOHQAp14ZTXOTnJd8Ope/pkJakmHXNZuruE4R7I5NveB9
 keORpL0mZWOOvApxHyoHttDbwa38FYAx6IugNIEL+ijc3t+w
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101382-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D117737E8BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 08:20:52 +0000, Srinivas Kandagatla wrote:
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
        https://git.kernel.org/broonie/sound/c/b918fa0009c5
[02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
        https://git.kernel.org/broonie/sound/c/53c1971fee3e
[03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
        https://git.kernel.org/broonie/sound/c/4acb0d8ae805
[04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
        https://git.kernel.org/broonie/sound/c/08798200d790
[05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
        https://git.kernel.org/broonie/sound/c/05e5370b04c3
[06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
        https://git.kernel.org/broonie/sound/c/c6e2c74a1999
[07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
        https://git.kernel.org/broonie/sound/c/2d99c2869c35
[08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
        https://git.kernel.org/broonie/sound/c/cd1716423637
[09/13] ASoC: qcom: common: validate cpu dai id during parsing
        https://git.kernel.org/broonie/sound/c/4847eb57fcf1
[10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
        https://git.kernel.org/broonie/sound/c/c4c6e17a3bd5
[11/13] ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
        https://git.kernel.org/broonie/sound/c/dce7c38257ad
[12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
        https://git.kernel.org/broonie/sound/c/aeb8c96748af
[13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
        https://git.kernel.org/broonie/sound/c/7cc1926fcd8d

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


