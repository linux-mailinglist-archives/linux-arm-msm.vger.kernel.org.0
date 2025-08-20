Return-Path: <linux-arm-msm+bounces-70007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC97B2E49F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 20:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D38A26FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 18:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5521C2765CE;
	Wed, 20 Aug 2025 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7UFMh+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE926F2A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755713056; cv=none; b=pl1xIlCUkYMp1A6LLJsco0OnFivwtovQ3DK4kyotgmccTGN1/yWREjHNROitTY/4sYAB3+gNZTfQeuT6eJUu+P9nu0L8/OvSKFsf5KSZC0AHcdtv6dbZC8vDYtRlLzsSL7jVJHXAqVTYlOVTnWpWDC8FemcCnQziz8OvPPGeUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755713056; c=relaxed/simple;
	bh=OpFpKI+KtlmIT9oYEBNy9nRTNf0yv3CRnBX+62DRQw4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KldK9p/GKvf96EjKKudewUSgd/kGGIGzLv93N6EoeTRmxXf3iqLRbOUJ1im6CwPL3AZzYkkTDELo57XaT6Vu7U80LwvaeupawNZBjaaIscVt4J+kEu0SpV2Fzr61mQ55p5D47abLKnYkhwhFbPTebz+QZIcd6Pa2EYdQfosPlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7UFMh+u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso802325e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755713052; x=1756317852; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/AR5JOfPXOoSWz1scRPUv02h/vmF6EJ2WDbLA90+dU=;
        b=P7UFMh+u3+qZUMXsFVqBRmxNwYYrVqeWrFiQJ2fi71wFQ4hUPQG6h3dWef+ZtvnlGn
         Fy/PDrX8UD1rL+zOnrs50zBsoLaAZujAHTOQj7Y6LvjkFUb4JnRU0bfaz/vXAY/djs48
         HskhBZ2RwEmwUgEIiLprvRB7qfOYg740cTPU29VA6Qx4Po+FvDPA+6zbgVOCnXIgn1KR
         4N4uMvlQpTVJrHRNd5rplXy2D3HpgXzYzTryVoeYMYoL3PVC179l/oFvBxICzHRROdbc
         j3+mkoD7mcwEgDebtiUv1vl4rAHMA6Uao3xOAmmh19euqj8kq7YIQnxvFd0EI/umd7gr
         8Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755713052; x=1756317852;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/AR5JOfPXOoSWz1scRPUv02h/vmF6EJ2WDbLA90+dU=;
        b=NgYbl6PzsNTbVyS5WapsFK+bvJjm79hyWVylkOBg0RXVEWIutOWul4g+cJmgNVXwaz
         ViaSQYMLnaSkX7LhrBQxf3AmPyurbiSVw9zd/wLKrGB/IJBi0pQlCm/3iExHF8suBW30
         6NucCrG0SsGMjAU6GgV6WjpCGdt8LdCdZC9khktVimuoYxJdtGxcXpYg3foAGYqgNjHM
         II1itklSatX5iFBS/nLseFu7Ez4kTcvgBfwiVC2O0oEj4mDStiFHm+5IUt4ob94bZybO
         mnNQUr/lMnEbUxmhp+tKmkEc7FGWxzwJJMZtUk5eB/gLEY6exBYkcSrC/YiILCklDkhs
         2IBA==
X-Forwarded-Encrypted: i=1; AJvYcCUSM3lTNCWZBN6ex74oEtycNPWae69LkvrymnOw3JMO7KhhTbCE+h1t8AYZB9qCdf7M/T2TFJvKEFdJ6PDG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9N6N3/9aw/Ov1mHxMj1KjoF+ml+P7vgQgO6IwtBuhw5wZdPd
	nRO+NclvAW6pkU+GD58cWXw2sXlwsOPZYUUWEBy+LE/fI0knzdIHvIkt+3AcyFGMJWM=
X-Gm-Gg: ASbGncvvobI453599ipEKGNeQUaM4N7oqERqBmc3WhS2XZJTlyGVnoC8ihSEOMA/Axi
	l6Gatx+SIHVg4p6Fbb+5oeedYbcReYFVdlRA5nIGMNT6+Hu0diSjVsMWh6Vz+Vg9oTRAuJs+RH5
	zzb3oVvH8np7BC0s/UsmnWgJopWgEr3cPo+QE+s46azOqIe+YrXldO6N0XQBabuKhvY+5eT1ALQ
	4dQ711QTDMyYJCtlqz+xjZdzoGEF7gpcDDpopw9dNdsJ+FL5iKuAbU/8Ph8vJ9QadOywgNMRiNM
	wYIXp/wLE4FE9ZQMsFr/mk2LSlT9ybiRdEcY5r/XOOobAeaE9P9tetF3bsOVYt89nuv1UHPjtr3
	nZ6HBEmFTP+QlkY6LwMiqvZR78e8=
X-Google-Smtp-Source: AGHT+IF4HffwmvTz6VUbz/+5M+jcK4ZI8rIXlBiu5vgtpE5f8sju5xfz46Xbc5v3IHdDPzI90a1fDA==
X-Received: by 2002:a05:600c:4447:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45b479ad42amr23982595e9.1.1755713052212;
        Wed, 20 Aug 2025 11:04:12 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:3a9b:1de2:5440:9326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789d1dsm8464172f8f.49.2025.08.20.11.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 11:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 19:04:10 +0100
Message-Id: <DC7GC0UEKZDM.2C8KIM6TFLMHK@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Patrick Lai" <plai@qti.qualcomm.com>,
 "Annemarie Porter" <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
 <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>
 <DB2HSWQRGFZM.JVPTBYXCOTKS@linaro.org>
In-Reply-To: <DB2HSWQRGFZM.JVPTBYXCOTKS@linaro.org>

On Thu Jul 3, 2025 at 3:33 PM BST, Alexey Klimov wrote:
> On Wed Jun 18, 2025 at 1:34 PM BST, Srinivas Kandagatla wrote:

[...]

>> Pl use audioreach_set_default_channel_mapping() to fill in the channel
>> mapping data.
>>
>> Why are we not using channel mapping info from the snd_dec_opus struct h=
ere?
>
> Okay, I was re-reading RFC and can't really get my head around this.
>
> So first I came up with something like this:
>
> 	switch (opus_cfg->mapping_family) {
> 	case 0:
> 		if (num_chan =3D=3D 1 || num_chan =3D=3D 2)
> 			audioreach_set_default_channel_mapping(ch_map, num_chan);
> 		else
> 			/* mapping family 0 allows only 1 or 2 channels */
> 			return -EINVAL;
> 			break;
> 		case 1:
> 			if (num_chan > 8)
> 				return -EINVAL;
> 			if (mcfg->codec.options.opus_d.coupled_count > mcfg->codec.options.opu=
s_d.stream_count)
> 				return -EINVAL;
>
> 			memcpy(ch_map, mcfg->codec.options.opus_d.channel_map, sizeof(mcfg->co=
dec.options.opus_d.channel_map));
> 			break;
> 		default:
> 			/* mapping family 2..255 shouldn't be allowed to playback */
> 			return -EOPNOTSUPP;
> 		}
>
> but I don't think above is correct at all.
>
> After re-reading the RFC few more times. It looks that channel_mapping in
> opus struct has nothing to do with channel mapping that we need to provid=
e
> to DSP here. The channel mapping maps "decoded" channels to output channe=
ls
> and seems to be needed by opus decoder logic and in some sense is interna=
l
> thingy to correctly construct sound for output channel from opus stream(s=
).
> In other words if output channel is present and valid then channel_mappin=
g
> describes how and which decoded stream or streams (coupled or uncoupled)
> to use for producing sound output for that output channel.
> This is described in https://www.rfc-editor.org/rfc/rfc7845#section-5.1.1
>
> The number of output channels here actually matters for us. We can constr=
uct
> mapping for channels that we pass to DSP based just only on the number of
> output channels here and let DSP to figure out how to scatter or downmix =
or
> upmix them to its own output channels.
>
> Conclusion from my understanding:
> -- we shouldn't mess with opus_cfg->channel_mapping here, it is needed fo=
r
> the correct operation of decoder, we shouldn't call
> audioreach_set_default_channel_mapping() on it;
> -- mapping output channels to provide the mapping to DSP might require so=
me
> rework or I need to look into this.
>
> Or something else that didn't came up in my mind yet.

As discussed during out-of-list chats I'll update it to include mfc module =
in
compress-playback path that should handle the mapping to output channels.
I already have a change for that locally and it seems to work, at least it
doesn't break playback.

Thanks,
Alexey

