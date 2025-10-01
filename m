Return-Path: <linux-arm-msm+bounces-75672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E18BB020F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 13:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53C63B9CF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A36C2C3770;
	Wed,  1 Oct 2025 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+EHTCxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532432C237E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759317878; cv=none; b=F5V7LOf08cvDTDogJiGVc5mTggnoRQ216JlALGVcBlYsTeT1mf9Es05XGdWe+pMxjuujF5tg262YYMk7PC7gCDH7KmbagPnZoPxCBxEA4Q5OJzFxTY5/maZbfZAXliPNnM6uzPYSonovaJjR9sbh9R9UG/YLmMiEjvfageyLfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759317878; c=relaxed/simple;
	bh=5e/F6QKv/vvIaNOCn+i1T0+gkBtuWnI86XhAnampRNk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=afkDL//wrhGrg60KZ0wSoVE16tpN5GkogDuBe1SJY4Ij4ne5HaxgtU4fc8FW6evhXxCx1kleqNY3uiVc6f+m6ZLrOgb0p0flmbimZeIMYaEGzj24LU9iYScJRNaU59q8+2cR2+KxmMW0a7mATsq3JYYQyJmoKUkdKjCExg0theg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+EHTCxk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46b303f7469so48949725e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759317874; x=1759922674; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loyJAwQrLX68E+xJ/zLjfhEY3jyjUwwo2QQ6EsgIrWo=;
        b=R+EHTCxkowXKiJqW2azLB159NiOyF0KfrXw9Ppus2Ucpt3SVD+O6U0bsereAf58/jC
         HFv8fsj1wTct/joVo5XrVdhjNh1cVY/zb7zRC7mY1cwrhdp5Kk5hwKl5gQ2GCaBR5cIZ
         Z5UkdaxDve6kQwWAG8EHfb5t92KNzo4pg0FvRhE2+1hL1UP+37U9ukRNoeTiZSa7bSCh
         t4ZDkEBREiHuf9CAo6/jImUbPVvfDBYK6L3pli5QudwDrq/WpfmQX6JSW3mnxsU6vr5c
         O6uwNtZQUArSepUYSwumeSoJZRFTvo6E1Tla41efs46WtgAflmFVCJbyllRoSHJodFwN
         S9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317874; x=1759922674;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loyJAwQrLX68E+xJ/zLjfhEY3jyjUwwo2QQ6EsgIrWo=;
        b=Ztzk/6XGm6SFGgtFfxTV7W316erkWwZQcjzAL+xVzEcONMFQJItgiujDLsp46Xsybe
         eQuyExlUVB3uVJd0sJveSji5/di3SYYCYRQQCM+BpIdJJ/rmEbF9S5+8vLcbEFBeAXvw
         fqtKLTt5sQsqVcSFUk58eZg+oQsOS8/wqRoHttIQbdiKIlSeuFj3skGsuQVC4nsfIlBC
         //eX/6fHB3UmrhBYDjjo35noLwC61I3PqoD7S/BEyAIpiOqP+PjCy1yCKaqahEP1iMjI
         hl3cBnOFcLXFHUKqKJ+ly3He0YudGAUWTLpPJYO867A7iXJ3oY4ALw5P0K0KJd/ulvIJ
         uJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm0fJZCTalDpWeXbZhHpeP+XcSvyrXWsC+SE0DJeTGzakxHyCgpk+GiMHFb9ZViq8xNsAJ/oQ5V4NlMEs1@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUgPKhTSm8IO3Z1gTQe/g+eYA26rM5M1qYaXAhfyqXvBr6e1z
	FJ+t02uZdyfUVRZRc6lbqwEAenewTzaCbB5cw0Bic27pUd2s+X0X1ILf89UXyZx98+bt0ZnM6dt
	G57UE
X-Gm-Gg: ASbGncvJ4BbLu5wSuC8Sfe/YLLxmGKHJzvWwfsAQ7J868A+8EZ8gAqnFWtzKnaz1WOi
	lanBHYXvxkxPTr3pI4bCPDkvIDq6GW5UJgrjk6iYX8U+N/H4ll4/HZ9Y/D3eqWbUBbvoii8sDoj
	xJQyc+MylhGNmT7dsB8LrsmAbZUffSw9oWtZL5StJ25bpVPDvnru0fbEWkuWdag3Lw5lHvKdhcJ
	wsg6s+mLcqM9EJRwT0ZNivb2lzo9vIDEmtpTjhGKI+szi9SfmElOzcKjvVlGwJ63VLbUirXUyaQ
	fLmv5DRLZqLZBDmrrY4JhrVaYiDoORqgeY4TBlsAT7vqESDEqxIK0kW0y5NN+wfXxV4ayJWylkg
	0EKKiVcS2NgKcwCPC3W6eY1AOvObGS1wXP/3DaXuGkjIBUMv20OeD+VlgyVBlYxJ7A88M4jJZmg
	==
X-Google-Smtp-Source: AGHT+IFtAgywWrsfSYERzPm6WM2utiuL00aNpUAhUx1d7BqDM282ZQ7LYiOHorp1TnI/lQjZh6x/0w==
X-Received: by 2002:a05:600c:8b65:b0:46e:42fa:ffce with SMTP id 5b1f17b1804b1-46e6125d025mr23588735e9.2.1759317873648;
        Wed, 01 Oct 2025 04:24:33 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b577c87sm35652375e9.0.2025.10.01.04.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 04:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 12:24:32 +0100
Message-Id: <DD6Y4WZD1ZMK.3E0AUSVO0W79P@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "TangBin" <tangbin@cmss.chinamobile.com>
Cc: <srini@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: Fix the error of excessive semicolons
X-Mailer: aerc 0.20.1
References: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>

On Tue Sep 30, 2025 at 10:41 AM BST, TangBin wrote:
> From: Tang Bin <tangbin@cmss.chinamobile.com>
>
> Remove unnecessary semicolons in the function
> pm4125_codec_enable_adc and pm4125_micbias_control.
>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Please use better email/commit subject or title.
I'd say that something like "ASoC: codecs: pm4125: ... " would be better
to reflect which codec this change relates to.


> ---
>  sound/soc/codecs/pm4125.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
> index 706fc668f..aa8319c4a 100644
> --- a/sound/soc/codecs/pm4125.c
> +++ b/sound/soc/codecs/pm4125.c
> @@ -691,7 +691,7 @@ static int pm4125_codec_enable_adc(struct snd_soc_dap=
m_widget *w,
>  						      0x00);
>  		pm4125_global_mbias_disable(component);
>  		break;
> -	};
> +	}
> =20
>  	return 0;
>  }
> @@ -756,7 +756,7 @@ static int pm4125_micbias_control(struct snd_soc_comp=
onent *component, int micb_
>  		dev_err(component->dev, "%s: Invalid micbias number: %d\n",
>  			__func__, micb_num);
>  		return -EINVAL;
> -	};
> +	}
> =20
>  	switch (req) {
>  	case MICB_PULLUP_ENABLE:
> @@ -799,7 +799,7 @@ static int pm4125_micbias_control(struct snd_soc_comp=
onent *component, int micb_
>  			pm4125_global_mbias_disable(component);
>  		}
>  		break;
> -	};
> +	}

Thanks for noticing this.

Looks like checkpatch.pl --strict generates a bit of more warnings for this=
 file.

Best regards,
Alexey


