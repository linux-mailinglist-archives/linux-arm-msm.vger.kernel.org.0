Return-Path: <linux-arm-msm+bounces-109994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB69CdviFmpbvQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:26:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083E5E4261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BF1730D170A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A2637B022;
	Wed, 27 May 2026 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9fDkV4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217AB3D16E2;
	Wed, 27 May 2026 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884125; cv=none; b=jHHstk7Yp5MOI6uwzcC+egfx1L04/KBPGe1XX0t2/q5ncPwQly2jk552SrwABDZA9CsaNFSANe/8NFAcqyiSujXfqZ/R5iaia2q7TSnG9fACUnCpYZrWP7WR2xgd+GwMM6xLPywFi9HULutFd0cLJ8CjS/lfe8geLMjM1cPpn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884125; c=relaxed/simple;
	bh=T4FqehIl8WWQvNN4UBxgpJZklu+2/xmkrX022/gXTXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pTOhK8PprkuXxkQ5TdbqK8cbuQ/npdMvv9ZuiA7Dj+Od9A/GQ54yxvjbPA6sRCpaApeJBn7nbgUdeh0adTGSrg/DSCj9WbolXntv7ocPksieHujo8g8WgvSh9djI+fofN2so5pVR00aak425tCLGm1OI/DNkTkfxl0HpUcg3PUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9fDkV4z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DA81F00A3A;
	Wed, 27 May 2026 12:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884123;
	bh=t6CParXec6WBWqEfdqrDBdsraZOad/XDU3mSaF49ohA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b9fDkV4zUYHeuvE3+i1ILBnpjr/nzYvLEcc3bvLBxw4tjjUdGn+2LeoxjOa/BelVi
	 ubKUPxYN9NPT9r2q4IUUknrDssJ0HK/4udrLVmE7Bcm66MF/9NqDtmY6Zy5WG0PI2U
	 n4zMciY5sHHDfJpQUDa1vkOiJ0nyi5hnx2XIv4N6vqcRbD+qt3nWBWaPZT55RyjUhb
	 BOnYx3muft0x0S3dxajlvbaUp8GlXOTA2VL6TyuLyTHED96aGmbzSoS3AMJ48KuK5K
	 HG8ZXAma9VK9uv6opTFknqZGmQrhz33odlWHvp/7nmtWfml2SBSn5Qtyp2VvyPEWpJ
	 BH+orH0QaZDtA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 krzysztof.kozlowski@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com, 
 alexey.klimov@linaro.org, ravi.hothi@oss.qualcomm.com, 
 mathieu.poirier@linaro.org, verhaegen@google.com, andersson@kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] ASoC: qcom: qdsp6: add push/pull module support
Message-Id: <177983641184.868420.5216505688708523357.b4-ty@b4>
Date: Wed, 27 May 2026 00:00:11 +0100
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
 h=from:subject:message-id; bh=T4FqehIl8WWQvNN4UBxgpJZklu+2/xmkrX022/gXTXU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFuBYLE+RUGBY5i9Fmhgob6MV4cdwmqiCeUL5C
 nQr0Tbqk7SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahbgWAAKCRAk1otyXVSH
 0BKJCACGjUEAKePNuw5PYuTcUVsLSbOHGPMG8KLJ07gusPxZoLJNVShJAaIbWGRNYnFvgLmTnoD
 0TCEumdmgMbDMAYx/7g3wjA3ePefVuhxrQpPWeztVd6HBkai3R0cWfjXT835IW/U3u6/Ebjs19N
 N5ZqmcTXueElXGa8A/sDq78QeFIzwwQYJhyGnd2B5F7qtYE2/hUJgCidu6OPtDp67LUGCOBBnaM
 GIvCRJXPSrpWsiQ9eFTbldTD/5ICFmag+wH1umz9yJUznL3hKG4yTUMcbw1jAM1rYnvTybR7SMb
 4wTyJBG++dLUorJhwibHYny/CkVn7M0FaWxtXIW1XvL9rhRQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109994-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9083E5E4261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 13:15:21 +0000, Srinivas Kandagatla wrote:
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
      https://git.kernel.org/broonie/sound/c/e4c4b837d65d
[2/6] ASoC: qcom: q6apm: return error code to consumers on failures
      https://git.kernel.org/broonie/sound/c/f3493007b7bb
[3/6] ASoC: qcom: q6apm: remove shared memory IID helpers
      https://git.kernel.org/broonie/sound/c/47ce092cde64
[4/6] ASoC: qcom: audioreach: Add support for shared memory push/pull modules
      https://git.kernel.org/broonie/sound/c/f08ce3bf4133
[5/6] ASoC: qcom: q6apm: add watermark event support
      https://git.kernel.org/broonie/sound/c/f257ed401cfc
[6/6] ASoC: qcom: q6apm-dai: add push-pull and watermark event support
      https://git.kernel.org/broonie/sound/c/0fd22bfd3af2

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


