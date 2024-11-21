Return-Path: <linux-arm-msm+bounces-38675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 924549D4E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 15:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B93281267
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 14:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332281DBB03;
	Thu, 21 Nov 2024 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eg2ElmpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB301DB55C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198299; cv=none; b=ibl84DwZMX3z5OPhrYiEROS2fSxu03Qy0rKTviDKtvlv2sZAI66Pq8wWYCI2XczRkwp7zBR8H7CSk3OvHeW22rAkbDaap3W2fE1pQAwpsZPvJQPyLbVZSBj0QCX0Sopf+lYPhhkcEIv5fIgRbAORbqrsfOvVYc6TbLmhEQMqoaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198299; c=relaxed/simple;
	bh=Uw2FiaqGMl761SWfGXIHbx7lQuyHidBlVpgGWwm+k4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR1NKO3B7s03EZtHnpPPrTEZZ4YRuAmy4wRa1KDpCvUv1HiMaypX3iCVgkrfMp+8+4D6k0DCsSnkiR7nBmrnNiH5LnNRK6QmegPQFi2FaGAi52Ty5zilfclJaPk91szy9EkpiAp8xrivDTVAYsFHEnr4j9ltpqk5+11iJFZC+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eg2ElmpA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-432d866f70fso8256915e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732198295; x=1732803095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5HJcVtwAACwC4uPS1IF8o+pGP7DKNM9J+dC2VSwrYbs=;
        b=eg2ElmpAWfQ9JRY2GxBRZ/5CZIjjd+7QJUwJWIf+4QaR/kE+RGjxPQSNYb++3I2AG4
         0c4ibWusOhXMIF9mEx5oMksJvrEDU9uQBDY8QuIyanLpBfDOgVM5sofXlhrpAN2u2X/p
         SVOYzhSA59CHCUGOhX2EQLIdzEq4ATM5ozCyUoGFtTS169CAAMdDlaExHABF4DnoFojf
         r7FhBm/d9xASpG1OCwxftnN5nNhPEb9R4geyKL4Qsh4Yft6Ie8XoKkAbRpwN8M8UU1xr
         CdVunGt3T2G/rsgt+I0mRdHvH2FRG5G5BSZwF2T8cPijNy7KNoqjqWAnKIx/bkxBdhXK
         +bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198295; x=1732803095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HJcVtwAACwC4uPS1IF8o+pGP7DKNM9J+dC2VSwrYbs=;
        b=d/vOjNqkeARu7qrsjjjgPY40BIke7QCMMtYCILOGXiEJ5+TaXXIKgpKBuYgBJcWMqJ
         Ydxhz4n5cNEUOVoKd5vSCy3sDpEaeHbgJ57oHXTKxXAZslIigqGqTbeNg2RGhebQYk3M
         4RF6HjpxFo/uiXzLUD7z0UozkjTX8i3EGaEmBY+nB6mUtLDe3QGJjvMz/zsiKEEt/Avb
         hJIbSIGyxepse69yKHWCoHaL1urj4RpLl4ZZnX1kyArh8mqcLZJHwjYba4KVNVKrTzoC
         ky9pOnBK7fUh1HpT+PrvSx4/CO6xEsvZFAmT7Y8/q3QORs3pnwpkUep4GSAJOgFzFAOZ
         M/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Q8ZQXR+d9pxwtHRd5QOus8Rvibhh9T/sKngcQtcSTjKOR1QfEkjzz5a7/fm0w07Ps9VGml/52AfCcbsj@vger.kernel.org
X-Gm-Message-State: AOJu0YyDto8vWj/PFPOrbSrgoQS0fqYb4DIq6/QRwVKKhmDTeoym/fPJ
	Vyi4yQdlvfB7rbCR9fbQqEaB94ttwpOl9Igx1cFacN7O4tkaOOpFyOWvCAr3Pfg=
X-Gm-Gg: ASbGncvtivNVI1YaS0hmPPmZfEdvX38Sqw4F62WW2ds3k5EwmdgyDb3oZXJJmEwr9zX
	YQue0yPPF/O7cZyZc5LIHv4YTsQA3GuRFJwsG7HvEwU/rlbCMU8ncEQJQwQYp+jNWvOpzc4nxj1
	5/XnG2WueYTeDr0KAorSAj/v3ZuvLMya/4Ip+Eca5TuIoe73xgBCGjQvBlXeLpA81O0ji9ftlIw
	hVvheUC1/lLl+Ad8rq9QSAH4z9f0q18m7NWb3Vsn8c4ePLexfT6iIbm/suR
X-Google-Smtp-Source: AGHT+IHJhwxxcRKJjxAsvH1hKFueQoCCj9Rk1klftfp0bdOZUzXmrqOdJxbga8Qwf4rziSS/MLDeQA==
X-Received: by 2002:a05:6000:210f:b0:382:3527:a14f with SMTP id ffacd0b85a97d-38254adedeemr3844751f8f.8.1732198293549;
        Thu, 21 Nov 2024 06:11:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:585:4e9c:5bc8:98f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490c89asm5158683f8f.34.2024.11.21.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:11:33 -0800 (PST)
Date: Thu, 21 Nov 2024 15:11:29 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <Zz8_kZkKyetqnRr2@linaro.org>
References: <20241117232100.23760-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>

Hi,

On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> Since commit a78a42fb48b8 the second argument of apq8016_dai_init() has
> to be an lpass id returned by qdsp6_dai_get_lpass_id().
> 
> Fixes: a78a42fb48b8 ("ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6")
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..ddfcd4616895 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -150,7 +150,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> 
> -	return apq8016_dai_init(rtd, cpu_dai->id);
> +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
>  }
> 

Hm no, the code is correct the way it is. There are two cases handled by
this driver:

 - ADSP bypass (lpass-* drivers, qcom,apq8016-sbc-sndcard): This one
   uses the LPASS IDs as DAI IDs, so cpu_dai->id already contains the
   correct value.

 - ADSP (qdsp6 drivers, qcom,msm8916-qdsp6-sndcard): This one uses the
   QDSP6 IDs (e.g. PRIMARY_MI2S_RX/TX instead of MI2S_PRIMARY), so
   qdsp6_dai_get_lpass_id() is used to translate that to the LPASS IDs.

The code you are changing here handles the first case (ADSP bypass),
the DAI IDs do not need any translation there.

Thanks,
Stephan

