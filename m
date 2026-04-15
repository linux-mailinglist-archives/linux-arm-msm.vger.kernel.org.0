Return-Path: <linux-arm-msm+bounces-103279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADldI15x32mFTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:07:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F634403983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A98133068EE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8289F36681F;
	Wed, 15 Apr 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FC1dNizW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061134C826
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251218; cv=none; b=ixwSLquswVLKQ32RKBRSBIlaHmIjBPD/IcLGlEUrVJz2kYQLnvqc6teFBDjH68zMeBpLoXLIRet4svduQwZbmq2nnktzF5aC38Z8ADVRuQZC+XiGgag/tCycpZhUUT5TIS/Uay7XoboAKGwnneLY3RcWwaX2HL4A/3aJ3DOp1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251218; c=relaxed/simple;
	bh=LDI3mtUhr2Rd5w5ikgiCoRnemB42IOlavCohdIScs2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=VvjysYNwNP55is0rwBHSSxqmTatoMnbsuUb0xembDxaRlHxKo4JLFcaY1RiZXJvzWWWEf4VQaTYLV4YQbejO7+MMSQGuJj3IrcTxEFddiew7v6X7+lg/SKnD4bgtNU6pugVQn6rwZuC/XdYommn3x7jcF8gCWe6Jqr80KCZy8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FC1dNizW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so5235759f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776251215; x=1776856015; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=FC1dNizWonp4QpzI2N3Rq2W2xJ4iMmgVfWaMZPlRlepTj+O46bHcZeMyOvzm+f4p5B
         0uL6aFM3ptRN6stlO+7R8SL3cN4C1leb1oZKGUZqvWTFFrL+9ofe30xrw7dS1bEepTjQ
         J0ADmXh+JsoVhe2SX/nQRIjjwzpx/zqWnrwl+GJAsYiUS0ZzXbnZwadHVOurA4W8rzRO
         9qm1UgBqRSE9VOZzXNUgmlPQxITuvHMnnuGTsAUeT7wZ700vKzw0QCgtOVH2VY4mS9Kr
         klEEn4HbmUjn44Ac0GBJAeenFRV01M79S3CFRgUHuQKuQYuVeYJmzUFydARFzyqUq7GD
         Uihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776251215; x=1776856015;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=SjcStqA4w41R969iriXAlZT2ByY7VgdYXVlpI0CyeeUamkSiI2n/+RQBY4V+SI8ufP
         sGUG/cdSvQjfoNwRKyQ1PMJvsfwJRNCxyBUbSRXGTJoCT7vWBCI3IZJ1PxvuyoCOhnUn
         sjz4/7Ks0aBe/Tit/JECexbxQ984433d2PVdHDbkzLLoqwqCSvbuR50wWeGaxxxc0plc
         8yq2pOXE4FQ7r3zy7Iu/TQICjtjWiRkjOePadgzL8JmUoBb9qjveHFV8MTW1YKwdZHDx
         IngpDd2b79m1iVtwcs9019ux/GZfvBdfDoo4gOH5kANyBr3+MW/KTgfJXFPBeyJP1kP2
         tBWg==
X-Gm-Message-State: AOJu0YyD/GBcBtU9+SveWKpumHD3tHYn7zPprcyvlrvtLQa1BG/ln02S
	W4OVpEKNzliJF0fJSor0U51CY55uv3TgonaAMQEfBRgbJbermZjZPrAQv868PH+xefc=
X-Gm-Gg: AeBDietoya96NQZ6qmx0je9Vc5N/cL+MHwgX6zzIw3+4fCvOkzub2wdI4FD7lybFGZN
	n6SkXsAxL/0oxMpmhQeoasBh7Ay0rN314CW78aGXN1HAzLBP0tPBY6IJmMnG1E+/TLtHrGz8aho
	zR90cHyYbl/m75aI9nrZXnYUIFsIuaPBF4T/BNjX6bAWFR+x3pqvGejXjek/bBPSR82uXis2Ahi
	9Vt6eWjx12dSd+aUsrkJ61N7Ho7edQFMJXr+ibDcNrD3l+6WChJ44OXENgWp0KP+h3k8Mw1NYPk
	t/1HmYRqF+ert28VzxFgPIArZKU01ydKqBs153BuPexOlcBgezXApnDx62REetYLmUfGB3JohZN
	wLViu26+qT2qiWeKje738FDwlbzhwdhpc8yL6Cl2LuZpd3fpZqRYNnyhrbSb+0eH72EQ/tPrZDa
	2FG+v6GzJgaDHiOpdyN7cWVlQPELtJM/5DN4VroZMSkLBZaB3x4LqbBUDRz/gubPilJTtwdk3c1
	vrliS+rt+LC4JLmag==
X-Received: by 2002:a05:6000:184e:b0:43e:aa88:f1a6 with SMTP id ffacd0b85a97d-43eaa88f2cemr4326833f8f.45.1776251214558;
        Wed, 15 Apr 2026 04:06:54 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e0091sm3867007f8f.25.2026.04.15.04.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:06:53 +0100
Message-Id: <DHTOI6CA1PS0.3JFMJ1VE6OJJZ@linaro.org>
To: "Kumar Anurag" <kumar.singh@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] ASoC: qcom: sc8280xp: don't force S16_LE in
 hw_params fixup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103279-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexey.klimov@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2F634403983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Apr 13, 2026 at 10:19 AM BST, Kumar Anurag wrote:
> The machine driver was unconditionally forcing S16_LE in
> sc8280xp_be_hw_params_fixup(), which prevents links (e.g. HDMI bridges)
> that require 32-bit formats from working. Drop the format override and
> keep only the fixed rate/channels constraints.

Why the format override is no longer needed? Please add it in the
description.

> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f63ba..c00eabf200b7 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -75,10 +75,8 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_=
pcm_runtime *rtd,
>  					SNDRV_PCM_HW_PARAM_RATE);
>  	struct snd_interval *channels =3D hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> -	struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMA=
T);
> =20
>  	rate->min =3D rate->max =3D 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

Does compressed playback work after this change? How did you test it?

Will it be possible with this series to have compressed playback via
HDMI (with 32-bit format, right?)? You might need to add some
functionality for this in topology.

Thanks,
Alexey

