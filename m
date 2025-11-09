Return-Path: <linux-arm-msm+bounces-80886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B718C44482
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 18:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52D093AB829
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 17:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA342309DA1;
	Sun,  9 Nov 2025 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tlf32Vm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66BD3090CD
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762708976; cv=none; b=fyZR/z0xpPHsZ3805RfvnxxQZzga1ODfcqwMoUKhNDQgAQR2EEdA4NoskCgNHhRMWCRFiuv7+fNtdXcNQJP3DhSWcx5+DHejzBfbnJm78gGHvMmUAXb62qukb2WLL49FuI95xTGkaM/FBgZ+OlKue7N+7D9neU6mL9iG0jgtVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762708976; c=relaxed/simple;
	bh=8xrRb4Ja7YDYCikqkpnM1+9xLkErGoSE0Ilyg3K603U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BajMSXuQEV06MLEqaNwYSTyaZ1nLdraufytDvfsaSxY16A7vLxuHqAtVt46k75R6W9JRmoq0iHcGocC+n6ePP+GjcdOp/N0Q2ZbDeRxp305BuRe+i/QFLF9a9UPtXlP8NV1SJ3nySSgUkHbUrBsS7WtSGgvp4a++uQO6wdfrd4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tlf32Vm4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso3659097a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762708972; x=1763313772; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7u5viM8iOHpulamZW8Yl5pjwnfS/F/QVQpeIUIajsE=;
        b=tlf32Vm4NVrasKbkE996+Mj6XQVE03iUa6BZr/4GVFSrrOzf3ZgZdS0WAMnZw++XHF
         wPAmk7eAJNPJSm8b9OfBtOjhyVHnYWFl+Q78i/d/WyVjXGOcMz8PNpar9PYBq6dP0+aa
         el5n5PPNIQpi4CSO92ADIdilnEVstRU2D/PH8dmGQYeVO/PVWP/yVAjg+U3kAlyB2wqR
         xHHRnazDTd7x3VviVzdyGH1a/mQw6NJ/xm6RJ70TGzKyYI+EdfBPb3G9VRzTLgfcVfLo
         7GKfazWZWyc/lEa0gNbGh6VeOLO/TB9YDYIo2I/UxD1zTGmnqCtIJrJHkJFF5pB2+Nll
         2/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762708972; x=1763313772;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7u5viM8iOHpulamZW8Yl5pjwnfS/F/QVQpeIUIajsE=;
        b=WiuEH9xWUPB81XYj72SX1g/KMOeKssFiGgEGB92MkJwuzUi2HaAHMNw/rrqdNHLiXp
         YvC6aL6Y2XXDquSUwrCRBUPOlDICadMYh7sRfwEDanspiQHkrO3E738QjPospBxvJolG
         8oyZheuoqRPDK0btbS/PpvgzCefgbCLp0I1jWCDE+RzuETzlPUI1qnWbv9ef20bLBxWD
         t5gJF4Da5arj5TbHOCDHjFIDttv4FJMv0zZfL0OZlHvYbfqW/IQ9qmYSAf6L275Y+ufY
         0aejuxxN3+3YCiwq6muzVErPFvJg7+zpKIFyytcKyhX4PVSL9s9KoGsOQbXPMWBGaGJT
         fEog==
X-Forwarded-Encrypted: i=1; AJvYcCXYt3Ciher/NUxcbg/b18tXpbCFQueQvUbqszhFf97Uu1Jf4RlunMMaAR+ga67iL0P+pAySje/iQCjtcAsL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5vbD0BsAra+4Vc6YXwfbU2Mdm38YkOPSJ5PJ75GH5Qc2iNaR
	eNPtUGa/a2s6kQCN9AOMKCFRbazKvpC4P53yyB6BvHrlBuzu5EylRI+Q3fORZY1v/4g=
X-Gm-Gg: ASbGncvrG2CF98IGRg+M0mk+btD1IkWpLBp+zLYTJlhzHThvPZ+uDrUArPLRve04h7k
	qPND1zHtQyfGeppRcKvVUswa4twa7OoaNEJHcrqqCdPOUNzxON3N3ShNPeDbaIfPcZie97mEe7i
	mxH/88xP+i1iTZUOG04bRPp0ufl3N238JZL8Fht5LmuxEB6PTwjZzGTB9k9zSDBO98wBC98z5Xs
	xEw2YVtSWVxmg6T558OfNcEWLHe5bOtTIjrN/aawMn8y17XKSupee8SZGM4b6bF68BBIwc6QcRr
	9QDFBMpQxrJIc4qevamBKVUYvTJSSvsGaNmUTTWnnztGxUOoxFT9JEC9DXXNN7Kre8wTHDqEj4P
	1So/g5BuEwV41UNp9zQdTVe7IyIP7mIhxRKyELobPY7tIPRtwG3hfv7i1gg6wF9ZcZPa16Ai7H7
	2wTQhxQbIk7fQC/24MyfnKr65MBLkxiFldfmGeTqpQXrt+3olumsKFpIKOJb2CbBrvLg5+qcgVv
	3TvjQkBL/Zw8453mWuUkutb9S274oOAr3s=
X-Google-Smtp-Source: AGHT+IHiNx88guNnogcxy/ePccl6T4u99WrAa4tO6dTyzZ7pWo9gTArz9LqZTlbTuW3AfvNrVuFznA==
X-Received: by 2002:a05:6402:3546:b0:640:f974:7629 with SMTP id 4fb4d7f45d1cf-6415dc205e6mr4941873a12.15.1762708971341;
        Sun, 09 Nov 2025 09:22:51 -0800 (PST)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6415d91f486sm4786157a12.22.2025.11.09.09.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 09:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Nov 2025 18:22:50 +0100
Message-Id: <DE4C6HV76V5M.1I1NJB2JCK1LN@fairphone.com>
Cc: "Joel Selvaraj" <foss@joelselvaraj.com>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] media: qcom: camss: Remove D-PHY-only endpoint
 restriction
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <david@ixit.cz>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Petr Hodina" <phodina@protonmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>

On Sun Nov 9, 2025 at 10:39 AM CET, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> C-PHY mode is now supported, so the endpoint bus-type restriction to
> D-PHY can be removed.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 248aa6b21b5ad..1408e8a03f0bd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4044,15 +4044,6 @@ static int camss_of_parse_endpoint_node(struct dev=
ice *dev,
>  	if (ret)
>  		return ret;
> =20
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {

How about just adding && !=3D V4L2_MBUS_CSI2_CPHY to it? Good to check in
any case imo.

Regards
Luca

> -		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> -		return -EINVAL;
> -	}
> -
>  	csd->interface.csiphy_id =3D vep.base.port;
> =20
>  	mipi_csi2 =3D &vep.bus.mipi_csi2;


