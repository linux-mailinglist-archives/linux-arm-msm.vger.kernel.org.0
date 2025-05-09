Return-Path: <linux-arm-msm+bounces-57411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23FAB0FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1E5982595
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 10:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827CC28E619;
	Fri,  9 May 2025 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJmtj+39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C727A132
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785284; cv=none; b=PlUfCw87Spbj3RdOXT+DNYAJ43N00QWX0KClBeaxL4V6zcvVV+iiX3PILiZXrN+Z3Ci14cjhqotDcGhprW/R46I8H1akMjkobxXuPUQC6zf8FUq8Bwsn9OLgxCBu1OyUCFL7P3ysXUscwl9QatYGbkZQbilz6+gBQAxlOh2EpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785284; c=relaxed/simple;
	bh=c6wpZKzZDHjVK1uIduWgCg1mh2QvnTuBVDz/nVJ9JEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPA00xIEMnK9YSk4qJPAYmhoquKALI4W4S/+D+cx4c7zZFGaSPRUPZhcO4KZrxNaIUK4NNx2f/4SR1rg+BPC8ns63B+aGT+Crm77C5CUyb4UY725X7X/abc+QEzDSrbDL8CCS4Pfh3vurt0++fQ/PS96o+XKEdcpLwtAlMmgoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJmtj+39; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso18030485e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746785280; x=1747390080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mR13VHCkBK7FRvabjRhDpghhYTDj7T2xDkNt5UakxU=;
        b=YJmtj+39S63P0Q7Bdr+AR6ZBOWsotpIDqDcf+CwlB0j3Only1/AiXNAXGJFGwUNY/R
         O3PY7++Y7RZOhj7/74D2w2LB487WuvnhvVQ+HVJC9H8/soePwDgCaNV83zXM4+fFDTk2
         0pKBv3HTD913/QZJtAXo0+PD7Ji5knSOTnbW44mDXcfB+CCp61VHjDh+xMpKE+FuCkYz
         67ahuOGhOK8e4Wjlw9sp0x1FE8sTAGwnGSBf85Ie4SfN7ucPIjKlQO927o5QoAg3BxYL
         Wzh5f7n7PwsW4m6ZDm1yvpEFA/aFLeQSuJkMpkAUzRyF0Qi3uCElsYG845I2KVjyFIJR
         5AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746785280; x=1747390080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mR13VHCkBK7FRvabjRhDpghhYTDj7T2xDkNt5UakxU=;
        b=ajnX+anX4ggoww8zrktnP82wyUuwgKFvfeGDfM0ELm03qokjU/ombWDQ0Q0RF/eAXu
         W8633UKjIqR0dqYLsZ+L7g3Ok4B+MaAKhjBSZCTMb5bXytcn2uLNsV1E5z+u+hZignRe
         92a6GNNN1f8A+qjjVsaGyRGWy84ViTceje4U5OrkjLjVUbvBvmMa8dgrfYEQXAtN37/y
         bffCinNqsB7Wz64AsLIke4aFx5UVpAJJ2UEYzLyY+s1F6sm+6OSnHPk/6D7zqsFAEWxW
         diCdEdZz0Mm5XydP0W6IPyn7YLlsgxWwHPh5Et4od2zaO65E2bwL/aoTQRRt0SmVgfJy
         7iZA==
X-Forwarded-Encrypted: i=1; AJvYcCWKUjIS76qy0jABqrLuNlOn+6WENXVV/IPZiD04dQ+oVGVjV0LJApQomJ7jfaBKOOToPiLJEJn3XJjkSScl@vger.kernel.org
X-Gm-Message-State: AOJu0YwfqVIT/Ev2OQfRiU2MWuGEYgdRs3ngTKExHxZ4BgMVqu3C/jYC
	RqGNhbLremqaLEQsiy81v3Xz1lJMVD2OvfWfiSdvWwD4yQMfTYY2y86Y9j8OASA=
X-Gm-Gg: ASbGnculFTJNqdvz+OV+tpcDHcu1bgX/EaDS95lOoJDhgEK4cJGjKr9xS9LTCm9ywlY
	mpBlAeQFeMq8FTdVbN2JZphuzqxjsYGjSbXE2VKMMqepKSM5yqHuTacxbRLt/ubS2v+Lu0PiNF8
	yK0P04btAxjFjssKfkav8yv45rd/87HzxfpUkqOPgpjXB/3bFkYGowT2tp/BnTkwT+3862X64+5
	/jaqItX1wgbK78GmqUVOgfQ4YL2GQx8RY9sChu/0VMmsY4wN5G3hMbajiW5P87hUMUemBhzHloO
	f1mVL5BGqu0CzxQJ/38NX0TA62y18OxDMhgjZt8KrfkEZw==
X-Google-Smtp-Source: AGHT+IHa+el3JCmXenGu2X+obdTrpbQ/gFeXWrssArhleTDz2ua7ePOkcxqH8/PoJ09MEVSXyOot6Q==
X-Received: by 2002:a05:600c:820e:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442d8ffb0c3mr13768295e9.5.1746785279819;
        Fri, 09 May 2025 03:07:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d596a5e4sm33412715e9.31.2025.05.09.03.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:07:59 -0700 (PDT)
Date: Fri, 9 May 2025 13:07:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-ID: <aB3T_HTC27F98NJ0@stanley.mountain>
References: <7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr>

On Fri, May 09, 2025 at 11:09:55AM +0200, Christophe JAILLET wrote:
>  sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index adba0446f301..8044cb7e4dd8 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  		return ret;
>  
>  	usb = snd_soc_usb_allocate_port(component, &data->priv);
> -	if (IS_ERR(usb))
> -		return -ENOMEM;
> +	if (IS_ERR(usb)) {
> +		ret = -ENOMEM;

ret = PTR_ERR(usb)?

> +		goto free_aux_devices;
> +	}

regards,
dan carpenter


