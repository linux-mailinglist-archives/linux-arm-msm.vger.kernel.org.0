Return-Path: <linux-arm-msm+bounces-53126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D5A7A8BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 19:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63037189516B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 17:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2522512EB;
	Thu,  3 Apr 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOtgn6kc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F019ABD4;
	Thu,  3 Apr 2025 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701970; cv=none; b=FaiZgC/dJQ3sRbGxxc13bLHfC+99P6AVlRZTvwwlVhIlD3ewO13eUGOLLP3m2pdJ4S3zb2hRiBsxAt4MevdLJLGOyi6rnP2/LO3/ElY5gY7DibKdaV5cDQQQ93AjBZLqWSR4FrBk6ExMf4KSBXZkk1p4nNjlXPUSSPSqxIu3Ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701970; c=relaxed/simple;
	bh=h6lDn2oRoZVQr2eL3ETbBPAyiqVUOXRCf4qhIrmhyHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhdLonmWRGMucWhSz9xh4KQs3bNhL9vyem0pdaVGQki/HJW2gDzCDY5i3B8OOd/R8ul8LgXgaM6tNPRZkOVK08yvwhu0ZNhm/nlJfPueT02Rf1FPr5eMTVQ8DU43+vChS5AnBimYr5WpGqCv28m26epvXYxs86jf1UFHTLY5BJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOtgn6kc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so825645f8f.0;
        Thu, 03 Apr 2025 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743701967; x=1744306767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNO/JA0foT2DpdUYBUk7pcZAoPgEl1mlc8h7/c2UazE=;
        b=dOtgn6kcQzgsjnZjoj5PgkUxZ7YiWxzIPdjlBaqQSm4AknextPf9DC08hk2mHKVALm
         EsjSVDEUCMjogJr/lYZZTlLWuUtzf9TNNLqahouZ80QQBgHTb3+cq6c3TPHqw643L2sM
         6kGh3NlrrTLYOEAU6apbKnOFenRnlahSvRPVfyDKvxuKqws4w7TgjuLLiiRgk1s+j5sQ
         6zHtKiW2dYHu34OWmJL5vkQNOaUz8gZ9CGByARnKl3cD2ONmOLH+GjaMJg0XnBgiATHG
         ubQdLrxllvxNfF/S2LN8saqP4nXdDjRI7R29UGB0QCsiLS4BwkoXoPL4cByORqcFlCve
         6tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743701967; x=1744306767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNO/JA0foT2DpdUYBUk7pcZAoPgEl1mlc8h7/c2UazE=;
        b=pTs51UwP/ExvXbAiU6AdIn35+u7pZUgWutgtVio3Gola1ibVMe9ZmLJRX0OsWbpzyd
         4v1Iie2tm3dNYt3qPCK3J7q5TDoqggYdlTa2QEAycr3JuAsES79wLFm5RKY+ZvaO3ebk
         gtCg9iwxisnW1p9gj+Y21me55ufPy4p25MId+7Q9ZeAV5xxwI9Y3D6rD/JSakgd+tSIT
         HsDV5YjEKOgUIEofQ9zIGYrmCc0fXRL4uL8Pi97fhS/SBvw62TEO6D4iuTOtk/CGUepH
         N8DVv04KdJgCx03y0kqfzjXW1Mf8vCr91tPz2Fpbr+sYNrmwuuXiHjdQmaYUbjzTQaRv
         0l0w==
X-Forwarded-Encrypted: i=1; AJvYcCUx8XtH+qtixqyQAAd99FlWqxDbvXuiEqDfPuPGAkLuQTToe9fv5ossoCmtIMcsfW2V+o4AOJFZc3l11Ltu@vger.kernel.org, AJvYcCWHxbJajFVMSeqv7+Ee+c+koYK1O2QVh8siSk3ashTdE3E5lV+JINM1jO/h0qsO1pFSoYChN8m+ZwgaruNp@vger.kernel.org
X-Gm-Message-State: AOJu0YyuztcMMM0RgXOBglexTrVizeO7J6zfNB+W45lVBTK2dD3X4eig
	fYVTKwdmamIAhTZmngkFSYyYepX4z+y2z2JeyZtu0KZ9OZXbkTQC
X-Gm-Gg: ASbGncth3S2s+wfs2t3Spu21fARoLs9gEWhA7eEjVxg4gqac8Op0Vxmpkh+CPFKX516
	tflulkxN9NMKhbSgSutQ1uuOJFLE7IiHN2LIhuYvzGC11KqgF2xYSmhgh9FfqJA1K7wdL+LJNk0
	SvqnYEMO+S7DrHnzDQ3JTVwT5UAWrKAtn69O6wf+7XZm3EU3Z0YorF5lWTX0dvXTeqhCNAtPMVp
	PJAEmsJUCwgL4gnPm8vy7TXpYCro8e/CIUbYaSVjRlcPAyiXDyhVKy/XbKkVpQ9BnnXGZATHtcW
	56vEDCKHCf6CkIEzgmXBCXZB39qadl4erm6kH3rfQjVMMUAEW/zmwKPxesDV/BxbLJTelq66YUJ
	mzCsjFZ8LYumkSJO1zKCn
X-Google-Smtp-Source: AGHT+IFMIi4hovLxofIkRnajXomszFrujt7/tyePth8kw2e++hEC+Kp0OE+ILwmXrxf3oLN23kvKDw==
X-Received: by 2002:a05:6000:2907:b0:391:4999:778b with SMTP id ffacd0b85a97d-39cb35bda01mr174975f8f.28.1743701966921;
        Thu, 03 Apr 2025 10:39:26 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096923sm2385018f8f.17.2025.04.03.10.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 10:39:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, robert.marko@sartura.hr, shao.mingyin@zte.com.cn
Cc: kishon@kernel.org, wens@csie.org, samuel@sholland.org,
 zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
 linux-arm-msm@vger.kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject:
 Re: [PATCH linux-next 1/5] phy: allwinner: phy-sun50i-usb3: Use
 dev_err_probe()
Date: Thu, 03 Apr 2025 19:39:24 +0200
Message-ID: <2773791.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250402194203426goMMzm9R9_yQBb7SMNGj1@zte.com.cn>
References: <20250402194203426goMMzm9R9_yQBb7SMNGj1@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 2. april 2025 ob 13:42:03 Srednjeevropski poletni =C4=8Das je sh=
ao.mingyin@zte.com.cn napisal(a):
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/phy/allwinner/phy-sun50i-usb3.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwin=
ner/phy-sun50i-usb3.c
> index 363f9a0df503..b03faffc160d 100644
> --- a/drivers/phy/allwinner/phy-sun50i-usb3.c
> +++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
> @@ -141,11 +141,9 @@ static int sun50i_usb3_phy_probe(struct platform_dev=
ice *pdev)
>  		return -ENOMEM;
>=20
>  	phy->clk =3D devm_clk_get(dev, NULL);
> -	if (IS_ERR(phy->clk)) {
> -		if (PTR_ERR(phy->clk) !=3D -EPROBE_DEFER)
> -			dev_err(dev, "failed to get phy clock\n");
> -		return PTR_ERR(phy->clk);
> -	}
> +	if (IS_ERR(phy->clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk),
> +				     "failed to get phy clock\n");
>=20
>  	phy->reset =3D devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(phy->reset)) {
>=20





