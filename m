Return-Path: <linux-arm-msm+bounces-78320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3819BFBBFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1F154E3992
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E966C33FE1F;
	Wed, 22 Oct 2025 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZU0fnZtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476E2C1589
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134442; cv=none; b=FV/zcjZTe9g2uhSD2ICO8kx5niHR7zApXlUIcI90u1URiLoJ5HxcHsrXqeRMrgnAl22UO/yf9ZUBI0+BktxgjHSjPSgjFEKCscQ88Fiqvi+J0H9dNJr41JbYl23PXH6lOJ28a3NWESghUXqS3Tm6vdbbNbgUW2wy7o96TKwqdhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134442; c=relaxed/simple;
	bh=97a8tZjKqwRtHNr6BZl+meSJb3s8o64hqDASwzxbu5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR20Q8mJP9Y3ZRyR30XLGE+44uUvn+QEFkhPTdKrXRbOAswWFZ7g3+JATy32eKmWIOChIiDS2hBoLsE6s/Px0iQ1Tci4u/sTqUUTPy3WOof08u+7AOg1iNfsI08MXuhVtHpisXuVxhlv6oNq6FvizfOe50PB/rPUA0zOpWLLEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU0fnZtG; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63e336b1ac4so1543626d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761134440; x=1761739240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6uhgqipKW89TbAKSJ0VsiSw+i7Bc0BvME8dlqiNOkU=;
        b=ZU0fnZtGUkFNuLa8Ca6e43Ct9sxzfOOMFNaD/PsOrrOIveuOY7JsxWvOuqyz8EarfA
         TooN8WmQWzEWlnMScJOSM9H4gtWDzlxtj2bqLSlXnMxv0gtZQWk19KaRQ6tm6BgZcxaw
         Qb3DRFQZDjD4/xKWBl9AaBFWNUCPir1scC3exaxZbF8lDVV5NpArwYWzo11fwi5ii4F1
         Pfr1ZMmDhOrTvcm2Z57Zj4GIAHL1RIexvGC6RgHQaUCD25y23vjfBen9k2VukcKern18
         AvQL9FnGDL790sKs1WsCuE7JW3o3X4bA5UfnYJLtpa36JrSFOmKfMUKlPZxJAj+Hn42y
         AQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134440; x=1761739240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6uhgqipKW89TbAKSJ0VsiSw+i7Bc0BvME8dlqiNOkU=;
        b=Ehwu93sSrh9yo8+zygSG3/d2V4zv4RTz81Izw9BMIewLiU30d9H3uh16/nJcoLRMy2
         dG6XHlcjxgQWqdtDLGnKtq+WVdKC7500eX6OlZ9t0ZofJ1OA4gJnmoR4q60h8pdCrCl4
         6wCCVRRnXCiO/YY9a9RX/XPL46OwVaI/tY1LxigvOcpquFlsRNc7MF6yoANYa1SVOoeP
         5RQQZDCXCrb6mIyHzeQMiEY7G8ut2zy1YrxkmmtCVESuSJZlBtIdH6R96RbaGzmJOcvT
         SUptgLVFdQBraWXkDGNA+cd7jOF2uz9O6/gsOTE2cKVOacPNl88zKLYPq9VPhcuU/3ZA
         B70A==
X-Forwarded-Encrypted: i=1; AJvYcCWd0q7Et+ET1425rW+ZhhvK15X4lnzjET0lMlC0e+NiEt3PJXpXOppHP3C1P6F4yTqKHp8MD9GgjwQirn+r@vger.kernel.org
X-Gm-Message-State: AOJu0YzDruwhBU6wy553oYDboFSya1NaaQLZE2esFgC6VCftotP9kVWe
	e8QYIUHVk3SaXSkjM0YgWSPYZU2DTzDpbvD2v5h5UYsJqk0eFmWhIssy0/AuXJBp4gUOdbnlHpy
	8nLRfiXpmm3AgrBMC+D0gxPQWDkDNZXs=
X-Gm-Gg: ASbGnct0GYgApuGIq1Rm9T3D96atuMmqvcJLsB/myCIE2qADoEzN+6QnTFdsrq15rUI
	iuAgJhCVplsllTTHSqV4D+t93ZKTrEO+pq+VsluuRWRaWkH3RycNABnMIhohdmrqa5LSp8NY4z0
	ygzl7GjLO60QAWkb6totC8DXpdbkm4X90lQAfSAZZ6+JUU6F3VJ0HSOLp8KhyQWS8mFIzB/UAFv
	UsSMifZqZkq7i1uJWdH8aqivkqOjIVasRm5qJT9ytnh1QeodxhC119oyyM1jg==
X-Google-Smtp-Source: AGHT+IHe7HPf6WFvrCRkjbNGAn3hqNruzzhDGzkeQpPjDeNqpVAuLbWf1eiEYp5Q7LepTL72CtjhjX2Ia5Crn9kuh08=
X-Received: by 2002:a05:690e:1a8d:b0:63b:a941:90c1 with SMTP id
 956f58d0204a3-63f2f5b4e47mr755807d50.12.1761134440040; Wed, 22 Oct 2025
 05:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021104002.249745-2-srinivas.kandagatla@oss.qualcomm.com>
 <20251022003429.4445-1-threeway@gmail.com> <76567559-4cac-467f-9740-e8a539a445f7@oss.qualcomm.com>
In-Reply-To: <76567559-4cac-467f-9740-e8a539a445f7@oss.qualcomm.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 22 Oct 2025 07:00:29 -0500
X-Gm-Features: AS18NWAgMZIyWSBaRtc28HmRupfvFkfndCADg6zxwcxhZ5F7Sr-vfM6vIit3CAM
Message-ID: <CAOvMTZjjCn5gDgOrf_2++QjfdCxz2PXTey5Nh_-=caB4wX1g5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: sdw: fix memory leak
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Stable@vger.kernel.org, alexey.klimov@linaro.org, broonie@kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	srini@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srini,

On Wed, Oct 22, 2025 at 4:52=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/22/25 1:34 AM, Steev Klimaszewski wrote:
> > Hi Srini,
> >
> > On the Thinkpad X13s, with this patchset applied, we end up seeing a NU=
LL
> > pointer dereference:
> >
>
> Thanks Steev,
> I think I know the issue, There was a silly typo in 3/4 patch.
> Could you please try this change, I will send this in v3 anyway;
>
>
> -------------------------->cut<------------------------
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 16bf09db29f5..6576b47a4c8c 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -31,6 +31,7 @@ static bool qcom_snd_is_sdw_dai(int id)
>         case RX_CODEC_DMA_RX_6:
>         case RX_CODEC_DMA_RX_7:
>         case SLIMBUS_0_RX...SLIMBUS_6_TX:
> +               return true;
>         default:
>                 break;
>         }
>
> -------------------------->cut<------------------------
>
> thanks,
> Srini>

Yep, that does it :)  Thanks for the quick fix.

Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s

-- steev

