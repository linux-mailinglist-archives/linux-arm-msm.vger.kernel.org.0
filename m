Return-Path: <linux-arm-msm+bounces-105592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJCKL0s792kidwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 633074B5834
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF1273018AF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 12:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891103AE6FA;
	Sun,  3 May 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h74OIVBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FDB3AD53B;
	Sun,  3 May 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810206; cv=none; b=qiC9ZkRtBNiIM7bis5+S9ySLgQcyfLMpzMCV/hvSedXD4XQX2b9jMrK4ir/o1cH5Gdczutbfh+I59Y+6AIzDYLsLMoMrN8Kgr9tHoD5E9lFFIKPcMZWOXqYPw7oHaRtEGMiM4wvyv4ksecYd0dqbBqizRWWBpWOJuBS50QeAgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810206; c=relaxed/simple;
	bh=TrwSYASiwAn2wXslbk9LoH560GwPVOU2ySn9whSb3ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcSSZl56e+5cTS6ZuVONb4e6bXN+B5cQNDeNtGGidWEHgi6KnJcbDRVZKaZiWEqN1eVfgYBH+rpbB9SFcH9REPUibb6mh4uDAVQ7nyYyPPjblJu2R+WnxMzvF3OI+qtBQqoiBdH3gItTNJAMpYnboC0+x5zTbLQqSMsUvAWybOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h74OIVBx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F47C4AF09;
	Sun,  3 May 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777810206;
	bh=TrwSYASiwAn2wXslbk9LoH560GwPVOU2ySn9whSb3ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h74OIVBxEJJ70d8sD4ScGR36Bzs9m7qcUszUgEQD+E7cKxe2OrsaG+EeVL7htji0B
	 HQrUI/XHgjS65e3COBkuYHwpTBc0c8nUFvPf/Eeer5YyUuqtoWgOF7z9E5W/2+CEfv
	 XMyFDd2UPNiigJoMLgPk18E/7jyTR8ywBFtUxunmRKAnDoiBlu5pyEqGNS11kETK45
	 Z9baCnhuZM3dUb4+e2fss9Ipzpc4lxPYwCII8fPBkvImDAHNoWsuAS5RqGxXw2aM2B
	 f4HzLRoQGnsH1uabc5Hi3kF4lQiicwwLCKYTC25O1ykxLP0eJQ/WTvftFKJlmg2IcE
	 l/My6HJKHQQCg==
Date: Sun, 3 May 2026 14:10:03 +0200
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
Subject: Re: [PATCH v4 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec:
 Document pm8950/pm8953
Message-ID: <20260503-furry-attractive-stallion-0d9d83@quoll>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-4-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 633074B5834
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105592-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Fri, May 01, 2026 at 11:31:16AM -0400, Richard Acayan wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Document pm8950 and pm8953 analog audio codecs.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [richard: add back empty line]
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


