Return-Path: <linux-arm-msm+bounces-22775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E6909EC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 19:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E58CBB21CCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 17:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A129410;
	Sun, 16 Jun 2024 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DiAAoDov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641D3AC16;
	Sun, 16 Jun 2024 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718558809; cv=none; b=n8LpZeAHEstOKuJQltCgISEe0RBEVta40B0F3qqgHao75+GNdHoQ8FMij0l3ED558qKVkz/+TV/XqD/6YDrVzwu3Hc+wvuta0vdy9Ui05tETfZdq0kzlasp6wRyK6NZ7CJdTKVdqzi8idtKNLMJEYs1g3Yt/zJr4KxQYS8yH1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718558809; c=relaxed/simple;
	bh=Xm/0Py7i6a9IMqxBVqF8drxyHQMhWCpJiWp2iMkPlSI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fTJrCkb8qooV4jyS7nWpwm/uxjlDGgNUb+5xwVIC+GPXfrPNGijYRoSMUUIudU/JF9hFDt8URM7uvmVElStyaux6gB0bwnoXzUYid72ZgjuA68e208sZjEHkdwfE5SXyyo3GU+pR01L/DC8KXuQjaYEyveFjhDOxUhWOavSqteM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DiAAoDov; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718558791; x=1719163591; i=markus.elfring@web.de;
	bh=9nBqF5ESlkCFxxxtSfxxafJZFyJpQbDfqjP2Yj1FlIk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DiAAoDov0evEhITeHjo7u35qPLueFX6HSYuYpyisk4X5eKpIHooR7dBk95psSnjB
	 AQdd0Y0o4dBP5/f7V43DJxJSnHNmUH5tDhZvxrR4V2DnXDnz8iec+DZ9PH5Sn2S6/
	 isRjwpx/TkslV7whq9ZP/B2dwQtKAFOU4c/OrcikDIqhnjfflqywSI53aYT5ZesZT
	 ndBVylcwSHNra2fOJ3b7DWC/VN0ONRplVeI3G3PM6Ks1U/ubC4ROK+RBO8fbR2xh0
	 l0ruJxWrNTTxZ6PGXgmO95oRbHXwSBcDIE5yFFGWOqxdD0Kn05e1A5R7W4qpRFU1X
	 MZOCO7WIm6G7yePL2g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pUQ-1sJTkO3WVq-00Ef4G; Sun, 16
 Jun 2024 19:26:30 +0200
Message-ID: <2660e72f-e2a2-48d1-8571-b738d9739917@web.de>
Date: Sun, 16 Jun 2024 19:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c4qMevEEZoDUqoRZeATp8WmsNJbisvOlM4oORsHrrjrrsyD8K+Z
 nNih8QUYdTTgvUeNfktoQpIH4cAzbc3XB/e+ap8BXKwMBd8CT1AWDHCvs8pbYDpsfDsEmrj
 Y+tzfzcuVENc2x6GJZKi1BpOWh/TUa8Ocii93k1JzP3E8pBxPmHgismL4NvcBDZJcyCgd9d
 kEgzsm+XKdqqsYb7ndUfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NhWsXH4dfU8=;YdKgy7veYd3vy2o4WUWvR6kCH9a
 IahlDipBDK+K6LYLz6A/eX6whnMhGi7fHhxH1fkkNL4BNBPVi25uGj3OOkoyKWxk7bDRp8y9M
 6PHyxB3iYqN/HqHyKIn5IYaTkMgM5sEP7nc6VvINgSZ/NoLvrls8Fz9LLcUrPZIEkq21YhN2g
 FIYL2JmpoWzB/IgWsTiBFLMzWknPFCsaeacBXhPp7uQwfSIh6f0YRPR96vcMC7vCbQTM9M8tH
 xjUGcSMZxARJ8ePFWN1wIKAbG8D2cn2P/6c9pGIcUTKxuE53RJDe4fT/+iJPRGswLUSYNlqjh
 o9KrXhWRaUX2Fscbuut+AxArU84irUCsOoIv4rElYWrTV620gUegA+McSJ0FRfqbDI7NAQpWj
 3RoJ+T7KMaFQdyBLy9SjeXb/a7zWdMCqGmzJwdWI422XoTV91/Ksinb5JS0jQuqNST4bAqAU1
 rHdTveJ3KV/OAhhFTv+2aYsbD7BO5mGVFO75nSd1cCYnhccju5ZzvoOMFDVRyg3hZ+N+zgDsm
 /cOjSCIlfyFS7gKuMZfh2QRt9ZyVb1sx34iNwNRCPGaHWv9b5FtCAjqj0vbQGy9z0stcqzQ3T
 oqbHwqNVXFVQDyMmXk8JYas7bYPFnwxU1ox6BbBbGvcP6jNz1gF+39aKq6gDJE1LXe5NUAVO4
 7ru0uZ2RZF/OClscS2u++V+JhgSdkQj2hhpNiIjaZ+1H7dyMgDjqO4ewWXcfmsC5ujfEo0zZv
 a6NMbsSTyE6sbrWUmpol+FrIXjIBaiQR4tQ1i7Hjyxt31B+FdwgkM7CdUA32nc8d5hKfb3d8c
 ky9pOQn9kg0Y3xzFs4EqrN6JJQKC7TDx9UJgLxI9/2lkU=

=E2=80=A6
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -0,0 +1,1677 @@
=E2=80=A6
> +static bool wcd937x_mbhc_get_moisture_status(struct snd_soc_component *=
component)
> +{
> +	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(compone=
nt);
> +	bool ret =3D false;
> +
> +	if (wcd937x->mbhc_cfg.moist_rref =3D=3D R_OFF) {
> +		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
> +					      WCD937X_M_RTH_CTL_MASK, R_OFF);
> +		goto done;
> +	}

I suggest to use the following statement.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.10-rc3#n532

+		return false;



=E2=80=A6
> +	/* Read moisture comparator status */
> +	ret =3D ((snd_soc_component_read(component, WCD937X_MBHC_NEW_FSM_STATU=
S)
> +				       & 0x20) ? 0 : 1);
> +done:
> +	return ret;
> +}
=E2=80=A6

How do you think about to use the following statement instead?

+	return (snd_soc_component_read(component, WCD937X_MBHC_NEW_FSM_STATUS) &=
 0x20) ? false : true;


May the local variable =E2=80=9Cret=E2=80=9D and the label =E2=80=9Cdone=
=E2=80=9D be omitted
in this function implementation finally?

Regards,
Markus

