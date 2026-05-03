Return-Path: <linux-arm-msm+bounces-105593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPCxI5M792kddwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:12:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C133E4B58BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05680300251A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 12:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EED63AEF3B;
	Sun,  3 May 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSKr5iZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E71C5D44;
	Sun,  3 May 2026 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810294; cv=none; b=S2G+YCOy3udf95EEtArZr3ORlh3LxlqPDegDHUZT+wcX3ZVq2u8ML96TtpvfJ2AgcKw5ROm22bm/jQfm9oxJ8yt78XsqEmC7PqM3VO3J8wqG59D4J7qtg1R/eq553hsu6zfOqKe768oheOve2GKBBgzrsSmQ4rCp8r0YhZfvrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810294; c=relaxed/simple;
	bh=jxUMgcbkcksArszPbK0H0q0KV9QPN28u1wNry0icvPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7kSkOV3/zyz7z9u2q8kGFVsYVPV2vt9txccjPu6TRSpVLhMsAGLx6O7WDyMVSfMO4k2mMVypAYeKJFCaIchpBWPUH6aJAeM33Ocsu/u6M6g4amTsuVgVSy2p5MY68HpF3DUaiE8hSp7OXXAPFQ7zWnqztUCPd7Pa2vlZ3pD1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSKr5iZ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AFBC2BCB4;
	Sun,  3 May 2026 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810293;
	bh=jxUMgcbkcksArszPbK0H0q0KV9QPN28u1wNry0icvPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSKr5iZ4CN3h4mdXGLDlPlvDDCVWEcUVG3tyW14uaG0CcWQaEvkPjshSrmYo6xSLe
	 n2LyYRYrZGsppIfzkDHQ+1wFDmaLaM9tPeY7VLxqgH8yqd2qAbzZ8eg9WA/m8IiQMa
	 0ChOHFPCtoTUAlcIiVn2A8QAwH27ru3BXX53h1l9o+EECTlISbFvcjTqiAX01+wIsZ
	 12u1FOJlDiQ3m6NJEUjpJcQmA6d1CXp3YuLgmwBOcCTtNrpl6qd6Sdwl1h1mAxG90t
	 9nYI6DQNd9WTp51ya9XTa7wwmcwcqrSe5pwpaomNjcOy5iJCmr66o/flKzP/E+Dk1V
	 QTn2AXr1e3tkA==
Date: Sun, 3 May 2026 14:11:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
Message-ID: <20260503-devout-mamba-of-sorcery-d4ecb2@quoll>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-3-mailingradian@gmail.com>
X-Rspamd-Queue-Id: C133E4B58BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105593-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:31:15AM -0400, Richard Acayan wrote:
> The internal MI2S ports are found on devices with the internal sound
> card for Snapdragon 660. Add support for them.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)

Same feedback as last time. DO NOT send next versions, untill you reply
or address the feedback.

Best regards,
Krzysztof


