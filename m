Return-Path: <linux-arm-msm+bounces-75695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3DBB0A55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B2C4A7AA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FB83043A1;
	Wed,  1 Oct 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVVmrjIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB5303A35
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327577; cv=none; b=i/WyLlK22TAjkw2ByGJ650bS3pQPBxJz8R+3Dkjitu1oWic0koq/GZU4qkkK0KpM49tOat0YoYPcv9EAdEhEb5tTk2k/31KBRQujlpds9WBhM2ffAxar+mR/05CbA5Vwe0rdNnVzYUlNPhSwrPqCFmlfYSVHgKMNCjpcRIEFZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327577; c=relaxed/simple;
	bh=l76gsiwqYQty5zu0MKOtOEBLRN1gepgBIGBpL6+Rlp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QkeBMR6f/TazVagbGddNhCqfPnsI3gZ+Yb8Gxgkn4Vrhk02uvyLTAlXRCdI6bHj3pSwNx9iw5mQk8/XVTzJ98OYOyrg1DIxrNKx9D8vroNE5mfZ5fLiWOFfSoruRlE8PJn0TDWzouxy4lLvf5PD8N5MBTbnWJupj3LeEECE00pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVVmrjIL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso47994315e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759327573; x=1759932373; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3g3uJS7sb6Tpx0wxhY8DWuhaiEuwHEia1cLZgWlxNtQ=;
        b=WVVmrjILX9W4wOBDGVZv0jugOym0zbqc9znMfgoDkk7CGwOGazdS3sPV2+kSdqNc7s
         YS45yD7NAVBccgdRpoqSjuahyfPPmhBzs1qXAG6meSxxx90lcAZDAJyTcCOAU+M2AzKd
         jQJUjBOWBPPmmjxmK0HKxtMwhmKXdYbHL97ZQV+VRxoiX3DdoZlMSUsBXMaSytoTTWzP
         5QcvYokq+ZIzw5Fze5vVsIHWt/yAyAQNTXd3rpzSV+dmo3Z2I+kwiXJM1+vlncGlE6Cb
         rn0w3tyWrjujrziZ4D1ryW3UJEtPX88vqSsURV5rJ+a9iC/ZZ53o0HuW6RyUBCDEjJ1o
         ihkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327573; x=1759932373;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3g3uJS7sb6Tpx0wxhY8DWuhaiEuwHEia1cLZgWlxNtQ=;
        b=NPshtKjRhIo0FZ75iZeTjwEPEoQKzSwWZcIgFYZ6RwCm1gF6bRBphiQXySpslHbO2g
         kTUnWMUL9E7wlcuKETiH4Gem1E3sgaFCV6GOqo6qoHM90ZUJVnPVIzXmlXRNb31HxAEb
         l3e7RWpR/vCAOx6R674o81Z9s0ob31GogTIpyXNx2Wu/Z2H82TMsoXX3EKiZhGeYuZQ1
         JP8LP/mfbhWBl9qiCqs28fe2gAvubuzeLArB4f+vmHJAFl7prOqIFT1/JfxcFspB0CeA
         Q6WmRp5UIL3nt1PF2usi1K2e53b4KvQfPrWsGAOZ4aCXiG3UHyixqAZQ3t2JCXyN0q/c
         RhSw==
X-Forwarded-Encrypted: i=1; AJvYcCVjllTDRUOvVTi1hfwFHum4VtVh6QTZoG5El9eAlcACeAFwro6G5kh6Sy5KwisU88JLKJwYEqfZk6we4+NB@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMdFGW2zOLe/3i9zb98EoW+OC9h4YEHD7Qyuvy2ZwfkbQOPjC
	F5elXZYMHKkewRP7wWvqYV6Lsl2qdJxVK82LyT7DMUdtiy1lPDfh6mUWxXWaLKGjzfo5vGQ4ndo
	RdbAG
X-Gm-Gg: ASbGncsSrX4nxRiLy6GAgxNoDxUqfc7M3cLGE+H+UpH8vCdbEbK2FtWRsD/tOaYSMxC
	TU+yKwLRTjBUHVQNcyWyELZElSz+Fi2q9gjYwr1aoHgN2h53Mq3E9c5BSEYSt4Diojl0aQEMXVo
	bp8u8rcMPcc0n5T38XlTe6rQMujMi9x2TkgMdcME/72/a+tI71JLJ23v47CEWOtYOHLcyhqEf9o
	o7q2PBtAFcmEJDArZpQZBqYj403dLpgn2DMbb8f6/Uu7YydmZvP+wlaxyfgTFUokAD4yCYvypJs
	Pjf+YXkZZ6MtH1l1POzhDEcRR309nLNuZpHFtJfR1KCxjNNe2TQ6b5dG+pfML7MOBMWI9+SoMsy
	E5kHkyHhEM4igWhbj7VXWcb8BbA0MIoPiykU6YgEW5j7vJHSLZAyZ/F/KfIPdSeU=
X-Google-Smtp-Source: AGHT+IErI2QyAnk7Cp71eAtjo9ofA6etzV1HBl9ELWiOQ9Yjvkh/gQqn9A3Z5ffEhjbWPyqfMujlgA==
X-Received: by 2002:a05:600c:8b06:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-46e61218f7bmr32902925e9.9.1759327572725;
        Wed, 01 Oct 2025 07:06:12 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a020a3sm41377545e9.10.2025.10.01.07.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 07:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 15:06:11 +0100
Message-Id: <DD71KONODHKJ.15RI1DXF5T6PJ@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel
 map mixer control
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: aerc 0.20.1
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>

On Tue Sep 2, 2025 at 7:23 AM BST, Mohammad Rafi Shaik wrote:
> Introduce the channel map mixer control support for LPASS macro
> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
> are required by APPS to configure usecase-specific audio routing and

What is APPS here? Will be good to have this abbreviation or acronym explai=
ned.

> channel mapping.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated patch with improved commit description..
> - Link to v1: https://lore.kernel.org/linux-sound/20240930053111.3986838-=
1-quic_mohs@quicinc.com/
> ---
>  sound/soc/codecs/lpass-macro-common.c | 55 +++++++++++++++++++++++++++
>  sound/soc/codecs/lpass-macro-common.h |  2 +
>  sound/soc/codecs/lpass-rx-macro.c     | 12 ++++++
>  sound/soc/codecs/lpass-tx-macro.c     |  9 +++++
>  sound/soc/codecs/lpass-va-macro.c     |  9 +++++
>  sound/soc/codecs/lpass-wsa-macro.c    | 12 ++++++
>  6 files changed, 99 insertions(+)
>
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpa=
ss-macro-common.c
> index 6e3b8d0897dd..777af4885245 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -8,12 +8,67 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <sound/control.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> =20
>  #include "lpass-macro-common.h"
> =20
>  static DEFINE_MUTEX(lpass_codec_mutex);
>  static enum lpass_codec_version lpass_codec_version;
> =20
> +static int lpass_macro_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_pcm_chmap *info =3D snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_dai *dai =3D info->private_data;
> +	u32 *chmap_data =3D NULL;

You probably don't need to set it to NULL here, if it will be overwritten
by kzalloc() call few lines below

> +	u32 rx_ch_cnt =3D 0;
> +	u32 tx_ch_cnt =3D 0;
> +	u32 rx_ch, tx_ch;
> +
> +	chmap_data =3D kzalloc(sizeof(u32) * 2, GFP_KERNEL);

here.

[..]

Thanks,
Alexey



