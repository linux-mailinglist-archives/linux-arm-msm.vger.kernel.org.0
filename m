Return-Path: <linux-arm-msm+bounces-33474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769C993DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 05:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 534871C2335B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 03:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB164A8F;
	Tue,  8 Oct 2024 03:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCpvyWzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25F40858
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728359576; cv=none; b=uuRS3CQsIvcRSLEaky9XMuXOjJ8gNco0XPCfOVVmvUw1CFdxt9DIvalykXPyG5pqIoi6MyuUuVDSw6hEohhruD/+5znxUZ/GN341c22E7hR53/48JFo0uio67QH+2LjrciHVPo5AY2LDkDQUKncjxjjslbvoYaKvNkXYRl2Fj2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728359576; c=relaxed/simple;
	bh=hCLWlw0j3aBtBWIKToAqdb5t72nChThzzCfqeoBaQ1w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m/HRqrbEzWK7QaSW3qNLT9QW0eFapWeV+cs3KMPEaIxGugbXLoMRVZOMx8JtjKigbIZH08VhJ9N7KNVUpBVGu2bMUwtKnJ9hm2Gttup0LWo0db9lTeOZ/sYGfsXzDmkZKYfGrtj5x3QevyD6dbCJdl4HjBddv4/a3Lvqz4kiKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCpvyWzE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d2d320711so115019f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 20:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728359572; x=1728964372; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElqD9Hm+WZEodZrxK7bnkSFLALYB9eCjiPyOgKg3kGo=;
        b=bCpvyWzEP5LSnVcRqcNWjCHuHeJjxXZHv/OwcJjS8n5mEO722I+wvpJc42/vds/7fA
         A9R98j4/SXT8nDLRZ9d+jJCwRw9vHRbPxomkltbQxZTELx92nJEHfJpouraiZvXkyKdY
         HfS5495e6Ws8OUPSkuWY2sPr2B4gU2H+85q2EUcC5o03bV/fdBA+Z1o3PFzNEtGJxrH0
         C24bWz0100aegzcPlqIGLkaXA4BprKXzoKdlzckASB2nnOrzmOuMfuNC6ePXbOX0QV8M
         DOWdzcUYDGydX4QTTxm/XJrqtC7vF8H/Yi2PcGrKjMB1OrjRGHB954O8RM64n+5Re/4p
         F30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728359572; x=1728964372;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElqD9Hm+WZEodZrxK7bnkSFLALYB9eCjiPyOgKg3kGo=;
        b=fo0KVwlEsD9iVkQKKogIO3XXgxvTNBoKJMo6cZQ1/xzchcM3uxEfL65Xhn4g2IdKnG
         qbG9Fn+2gE4urqIcstXVH39HJDSAX4nyHLVzDmRLVlkg3mKq1ZlcSefNOrzK+rtdAh89
         7ZK5my/JskE4l9e7LK7ESYokS6B41b8YKFNbsN1vJzR+mxaWY89OKX2RwcmCCjTDifpL
         792tDtj0hExxASmRM4duIZIyUKz2oQpCfhD89SiszmaHr71W3/mEOMq5+JyJ8QkuDsRg
         MAM1E/1MTNb9RxM6GExpFHBH1zEpo5Avxmgo7oAvOhBrlDZGfro4ENNRdnPq1g7twg7t
         Tq6A==
X-Forwarded-Encrypted: i=1; AJvYcCXe1mZ/gvLCL0Not4cd5AfLgKELDPrwqjs3heAlykmRT5piXZDiFOYRBSzbT/wsTK2ENMhgh4opuAqB9Cw0@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPX4no9uug4rVnv+7cezD7Q7OZ4ei4MFZIgjBZrGvIFiGIxxL
	06BKsMNVUugm0MBx9iaZcC95WzdLxFro9Kd3h7ovNQHuv+TKcxoRsXOEoan5Y2s=
X-Google-Smtp-Source: AGHT+IG0BGCL/uld55vxEnmyp6p8cfwtL2b0uOPAyw08t7e4tq0ydjKfo3AyQfjiW9owlo+MdBT4cQ==
X-Received: by 2002:a5d:5105:0:b0:374:d130:a43b with SMTP id ffacd0b85a97d-37d291a9ccdmr959081f8f.4.1728359571913;
        Mon, 07 Oct 2024 20:52:51 -0700 (PDT)
Received: from localhost ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16972b97sm6973289f8f.99.2024.10.07.20.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 20:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Oct 2024 04:52:50 +0100
Message-Id: <D4Q4C17E1A8J.3O1CD1PDP51HH@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <kernel@quicinc.com>, "Rohit kumar" <quic_rohkumar@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: lpass-macro: Add support for channel
 map mixer control
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240930053111.3986838-1-quic_mohs@quicinc.com>
In-Reply-To: <20240930053111.3986838-1-quic_mohs@quicinc.com>

On Mon Sep 30, 2024 at 6:31 AM BST, Mohammad Rafi Shaik wrote:
> From: Rohit kumar <quic_rohkumar@quicinc.com>
>
> Add channel map mixer control for lpass macro codec DAIs.
>
> Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

IIUC there was off-the-list discussion about why it is needed.
Could you please elaborate a bit more in the commit message?

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

You don't really need to set chmap_data to NULL if you're going to overwrit=
e
it with a kzalloc() call a couple of lines below.

> +	u32 rx_ch_cnt =3D 0;
> +	u32 tx_ch_cnt =3D 0;
> +	u32 rx_ch, tx_ch;
> +
> +	chmap_data =3D kzalloc(sizeof(u32) * 2, GFP_KERNEL);
> +	if (!chmap_data)
> +		return -ENOMEM;
> +

[...]

Thanks,
Alexey



