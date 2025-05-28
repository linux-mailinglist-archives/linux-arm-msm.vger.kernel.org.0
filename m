Return-Path: <linux-arm-msm+bounces-59717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B59AC6D63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C631E9E12CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914A279903;
	Wed, 28 May 2025 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8fdIjl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA428C011
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448169; cv=none; b=eTNNluP7c2tMC40q/RFYMxhG5mHPnhqzggJn5mJVDRr7Iskjsn4Xcu65aDXRNDrVWXYTgmOYfHu/NLHx9cjMBUTgVt6KOp87/NKyhux5WZ9LiM4D4+HVkHWlF0vKC7GxZhUwR8TTI9nqNx41ZZ0wBUuMg7r/1sL0hoqMK1u9y+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448169; c=relaxed/simple;
	bh=t08GAhcYElYwLHiAuz12CFNqRq2dkhmxDggvF3lXGGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IK48oQXb2kQr+ZQfCzN+Oxd6mYL7V4sBT7JuZOzTG/S43GbOmYq0q4HbdXGm+hcLivZw5QRUGRHA26FAJkiGCk3lKxOXq5bOSHE8RxOARgcZcbaH3dDM6PLOTkCNe+C2gUnuF+3PjNouOyW5XGoDlrYNKnom3m6g+DU026w71DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8fdIjl7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ea341570so318765e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448164; x=1749052964; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kCK1t1rT2W4oANCi5yB4HtmJu4u8r4qJTejI8zo+Oo=;
        b=a8fdIjl7/wGtJAgXGu6Hlia3MDaLXGqC3UFiOuuSb8ZKrMmtlHikoz40qWQW5UgQrL
         MmvVh/uEzOii7/FCg0Iz7sdsNzJRSIkxttIaXP7bTYhtSIxOq2E+GIcSADbZXMLz63e/
         DvyNQ0EgIPEjr1z65xKhRCvikKL6ZbPfD7lChiAye/3c5bIMDBW97tcgY3OYvc5o2tWx
         R0GbQoI6c806zmCLQQATpJKpE9Dg4VPV+LyzctIjs85bKDPfUF5q2q4neJW2jW317Rdc
         pAfUkG1HaswVDJHNCuGhQGzKW6JSi6JKsR/iY8d6FlD7AjpfA7P2wWBia2zs8UBatlf8
         AvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448164; x=1749052964;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kCK1t1rT2W4oANCi5yB4HtmJu4u8r4qJTejI8zo+Oo=;
        b=QlG4KObPBhTW8u/7U1bC/usbIkIdM1yv0VuW8eLV684TEtMCJaa1j3UvLZR/SasoS8
         yx1pFOI2CXIj4J0ZSjYfIKtFOQmYhHWk1lb+uW24k+ItByUI1gAcan5k44QzXkkbB1G1
         6cu+8rxBXJqaUPcmrkLm7gJgCyz73LJsr5qeXn45Ha6wehfxJFnp0iaf2kU9m4Afoky1
         2Hl8YeDI5iwtQi8XdzlUJBfbaqfBJSeSK/MYizrHLPtJUVGxcAC6Tnbt7sUTlho3E5Z0
         EMWq9B+o6vwOWENx/hO8Xlp58ot/YfG484HIl7jxon1ENugGHayGcmLxvMQhps4Ozfkv
         ZFhw==
X-Forwarded-Encrypted: i=1; AJvYcCVWDCaLK13DAbpMpXcr5YWOxOGuaGEDul4zUOHz5y6zixLdU1fEj76rY05fTE6tano5e4QTbef+ZrJD83g/@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJytOYdM0AoIPrC8vw+W7yzHMJiEsLrnUJpHJXdaw7tU5o8CR
	rAKQ4AUJbLiQN3Wlon7FGiSf+1O2egqKajmfVhR4/RaKtoKaDiatXmpNHow24PacKuiirKxOy6R
	TwaKt
X-Gm-Gg: ASbGncuYiOvFOPJNB2fG7pFBIdf8B44i5A1vqpXIgosWCSFkNidWqzDyOzxbWmQUJ+o
	rlfxfu6R8eTTdF0DDSRihg5zx/d7eLQYefopahnPT5fgZzqgk4AbyVqux8umDhPdq3R87T5l3p/
	youkHeTOWNriuFPoNkwrcXPNg5RRU3+WFTKDTD9KsMVTkTaqjUq64bPTEuyFpxgb5oxPBy4+hRo
	/plGouJaneP4/ifTEU6qgBRoMdZ8fmSCnUyjvDdN0zs6yhVO67zewJj/nrYxqJ8+AUZOtm42AXA
	Ys9ffgy9YFy1YogO6wj7+jbbac1kE5hIbAlM0ST7w3PZSmkZ5/S2DPj0
X-Google-Smtp-Source: AGHT+IGXdGfI0NZMb251EaclZsUurgUstIW2s6fQn24XtH1qsjwVUeWaMZ/3aPe3N0RLnQB8jJ+wTA==
X-Received: by 2002:a05:600c:1c99:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-44c930165dcmr181795775e9.2.1748448164213;
        Wed, 28 May 2025 09:02:44 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507254b9e4sm23132285e9.10.2025.05.28.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:02:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 17:02:42 +0100
Message-Id: <DA7X59CE8REY.4E410IER5BJF@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Wed May 28, 2025 at 4:07 PM BST, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 99fd34728e38..b1b31d197b42 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -147,7 +147,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *=
card)
>  	int i;
> =20
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm =3D=3D 1) {
> +		if (link->no_pcm =3D=3D 1 || link->num_codecs > 1) {

Out of curiosity or maybe I am missing something, why this is needed
for a multi-codec link only? Or in other words why not link->num_codecs > 0=
 ?

Or due to some reasons platformless single-codec backend is a no-go scenari=
o?

Thanks,
Alexey


