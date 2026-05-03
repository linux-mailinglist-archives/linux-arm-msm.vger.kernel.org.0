Return-Path: <linux-arm-msm+bounces-105615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBU4NUq892m5lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:21:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838A4B779B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCA6D30053BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131F437CD20;
	Sun,  3 May 2026 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZYqlfX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF02C21F8
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 21:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843271; cv=none; b=hkQYV2S9NRq2RTqxAglZBz1tgbSzVJYETAVylZw4yv1t9wA0AQmbC1kSrS3fBN6lECYjuGEDPU4O712fBV3qOd9Tf3g3d47bOYBaO21pPgZhLS3Mr6f2yOPguj/WxK77bquUrJK+lDvY2mtxjCQvSZ4C7MsMCwD41SmVJAxw3qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843271; c=relaxed/simple;
	bh=WtL8OS1YnNGjQgVNOCpLNO9Uttl/pmSrIlnfIUeuAns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhQQQr1lK4zPr2jD/q6e0lFQqo4IcFjxHr0Ntx4ztPtzEhKua8m0FbcDSl6u1pJqbw0+x91X/zAsSv4syBE44ZI70tRPtMF06t0OMd2MmLkJjji9bNrIpbt0hkzZc+afmzteTRkTbqBWIay3mEDnyI7YcpLwqj/AEozn0Uo98CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZYqlfX5; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50faeb8317bso26535751cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 14:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843269; x=1778448069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0QNlGrqaDI4UYp6C7qqj/fd9cv+jSvpWhH3Jn8vqzI=;
        b=NZYqlfX5Nq8zcfXaB5rwTQWs+aLqAZ1E+2DkRWXbigD9LGo/H2mgc3BQ2/KgK6uPGN
         DUO0SJ5pNjZkFR2cuiv0Sr7rI8uwLDCj0hhtVg4tKu2/p1r70d4wS3DxXXoswM/6jE3Z
         3zNxd/xXrbYzoFBWXmR2m3Ppc+ziuvQLyC9QeRHvEdyE4Cp4dNzf97yq3Vd1Kyqu4wQQ
         XFC8Kb2xSE/IFzK95Q466JChNhfy27tYEBukUglKWiErqpvnvJuGaxq6Yr2mIJehiCXI
         p/ikV66ybXXIbZY/jy5rdCVz02xZEimYjEoAUoCDtaqpmMUMo7zKvcAuGtP3Kvt/FQ3s
         Zq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843269; x=1778448069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0QNlGrqaDI4UYp6C7qqj/fd9cv+jSvpWhH3Jn8vqzI=;
        b=MAlumr+ZlO2SJYHrAJXuKJH7GGka/mgGUlbPVJn4Ue2gNSLPILxuyDHZ3qA5r53ujK
         w42z/TjC1rAl299Fl28rv+BQ5hsjATUDmrslnFMs+xq1pEoV0Vg73JvRU0oEsb569kAx
         MHqGGY7+9ZzZ543ITIdMtpaFU6lrqUUiTA24k3t2xN4SZnDP0p7t95tN6Ebl3p8VKnJ6
         QELFp8SaaeZpj2r3F7N78Mg8z8//XVF3KSBG2WSPU8chZo7z/8lgCneTjajgACsxzbUQ
         w/noWOLmF8FsXzJpFbr8o4hZXIPkBhOtwkcBAF1G9FbRJDfhUMe59uRk1lp3YTQTIYbB
         s09A==
X-Forwarded-Encrypted: i=1; AFNElJ/SaTGcoSCyDBFRdZuy4XWjox+vtWaWfjjIwqe19cqIkFOcQcuFTbRvWfW9toKK6y9CeyiLaEZ6VRuhQPIk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxd27M7eqlkWK/XjGnx/7npk/76LGd3CKW/R1gyPgKcmAiZi5F
	AfQaoKw7b0jlgkMDhLrfMAcsJ6whJyzRbZOMEvYNhN6c6LVkxcyPN4e+
X-Gm-Gg: AeBDieu4eL1BpJ3h3j3irT+Afi1Hq2vh37Oz9KYfulNUeaCcBv1vkUVmGxUA8s31wbG
	G119gaGNkfImNQW6M+orpBtUAa7ejjocHOSBcsPal7PnqPFCrVwxennb94WH5l80IdWcM9XE1KV
	2dWyQO6UTqpqwgFkhlSwZefNhW8Fb5Ys71UW/EyOah6I6omYdm3u/p0kAZL4PWPymxIKQy30LaZ
	jqYoqr5F1nG9R7UaN3t0Mdw/rXW5Jnu5YVQk5JgqI/BT/3Zhnudxxl5dSU9maBqB4FJihS0VnEM
	UKHliwCdTiZFG/dQ5QqBTfxLJ26L0lqCDphASAy5drHl8TRtLNNlVo9G/D0CE/OZMHKbvRqYdVk
	e3a3+B7zeThjuksK2PqlqELKJO5CfUsedT1nA5OAimDx4S0wOgBBqtm0Eu4ssnLOkL9+HqMD+Ki
	SdwEYkA+VvLzoPzZOslVYQ/vExkHkq0s9eEhj7
X-Received: by 2002:ac8:59d1:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5104bfade50mr120133951cf.55.1777843268706;
        Sun, 03 May 2026 14:21:08 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm86548111cf.23.2026.05.03.14.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:21:07 -0700 (PDT)
Date: Sun, 3 May 2026 17:21:49 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
Message-ID: <afe8bQ3SIAu9rP1S@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-3-mailingradian@gmail.com>
 <20260503-devout-mamba-of-sorcery-d4ecb2@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503-devout-mamba-of-sorcery-d4ecb2@quoll>
X-Rspamd-Queue-Id: 5838A4B779B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105615-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, May 03, 2026 at 02:11:31PM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:31:15AM -0400, Richard Acayan wrote:
> > The internal MI2S ports are found on devices with the internal sound
> > card for Snapdragon 660. Add support for them.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
> >  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> Same feedback as last time. DO NOT send next versions, untill you reply
> or address the feedback.

Ok, I believe this is about [1] and [2] with reference to the patches
already in v7.1-rc1 [3].

My patches add INT0_MI2S_RX through INT6_MI2S_TX, which correspond to
q6afe port IDs 0x102e - 0x103b. Srini's patches add LPI_MI2S_RX_0
through LPI_MI2S_TX_4, but no q6afe port IDs.

I asked if the LPI_MI2S ports have q6afe port IDs to check if we're
referring to the same ports, but apparently q6afe is too old to have it
[4]:

	> Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
	I think the older SOCs did not have this I guess,

Even if there's already an allocation of dt-bindings ports for LPI_MI2S,
they can't just be reused for INT_MI2S. There are allegedly INT5_MI2S
and INT6_MI2S (each RX and TX) but LPI_MI2S only counts to 4.

[1] https://lore.kernel.org/r/20260305-fluorescent-gainful-unicorn-4f8d7e@quoll/
[2] https://lore.kernel.org/r/20260305-gigantic-gay-boar-86db8a@quoll/
[3] https://lore.kernel.org/r/20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com/
[4] https://lore.kernel.org/r/23434dcf-5f45-4d16-95fb-a13021331de6@oss.qualcomm.com/

