Return-Path: <linux-arm-msm+bounces-66327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE69B0F51A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386F7AC085E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E23E2E92D5;
	Wed, 23 Jul 2025 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bpVBvXyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7362E7F22
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280465; cv=none; b=trs5jcK9g5sjyscZHejcFQKNlHXABwAe8go8Gnp5r7wA04sC95UhGz98tHi9jnPhbgaRUqI3Gw3GsHfvMP93+D9VotQrGqG038xdQnts4dxMhajO5V5kw3fEtnFBjjGiwZRh8arREBB0pm54D0+NCv5gmKdFXyHwvf1CP5GDkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280465; c=relaxed/simple;
	bh=uxR8hSIGVZMlUqZvWAGaCEqh6juFlUpBiECC7T1VfZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Jz7Vxh0CWX59oet/ylmMfV6j6MwPEhkv3HiJ7vo03rGZJsHQ32diwabhejHF1+2GMewHb7onBKDeAi/F6KnQw19R6Zszh+IFpawwp4bTCq9uzX3WhPhXBMpcxAMN24PiDCTc+oY4QbD9MMUuJkVWsPv4Zen4PKGJ0mwQuuD00TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bpVBvXyA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so12984850a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753280462; x=1753885262; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS0lxrQf1ZOnWA8XFa3rp3xfTwC/QvmIwsGzD/b2reI=;
        b=bpVBvXyAJ/FUbp2XY4I5zybksfCxBrlnLrdhUiBqXd+oM1A0Iq1tS0fi5XSHFvkAMI
         0xnwgW5lbnFkeBOIJnL2eqA6+Aofd9h8H+pjARPRlHzetj8isHUtS1Wtq9bkMhqjhYgd
         Y6zxtCAMoOA90L4klMZjeFieYcUP6UfbNalMAtgvGCrDfsHTEVD3F/ltWCl26wNsvWYz
         7T5+m/KDeO/dPUskWb0IRWgY4MDw2+wyRHXOX+bjvZ54NcOtY/fccjTl9N+/V/xQsajM
         1YgwoDEUzJN0FoIohq7xFmCBqlZYYqF0edX84yaC4qod8NWOxHVJ6LMuw9D8LXulYuPg
         M4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280462; x=1753885262;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jS0lxrQf1ZOnWA8XFa3rp3xfTwC/QvmIwsGzD/b2reI=;
        b=PC/5hd/dWNLWjzlS9kkVaghagwkwlfcC+hekkv/xnRbm0VKE2C7MGPu1+gDoGrudD3
         8EN+LlwPXSZQq9+5uLaZbhGkIC9SptQG5tgxsu9C3kbha+mXnjgZrrbbbobbwUQmcKhQ
         T6ERFA2R6nbIAH8VvihmgWjiih1yxgqWzo6wqyRD1mpKIclKyE8TlyS3/gm4R7eCThny
         1aaVzzK+W22pYeKyxJY/v3IrjWpfmyZndWaFLHVOYIB/5y15643SCbXVP0ay9pW3pJ2Q
         24sBNM9fysM/Z2L8FYdNXYAGPld5Q0jy0pUsJHO2xGXClxLI3J7j6QiE5PH0Gtksjxp6
         hOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5AXbAXsOiMyHXbSmSOvrvi/+XUfMykrrMQL1MHtkktl9hf6AW2xPJTcbjKeVDf8ZDRcU3RqeLzywUzK+a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XKsGC06I/NPFcZIYwjtV+Zr1mo8s9z1OD97tryFqGKim7OMm
	4cdHmn5EBOZEeY8mxgbDJbFYoJ3YOj8UkKAYQQFCkh+zYZgKJoJ6l/+8YRM7FThzdq8=
X-Gm-Gg: ASbGnctxvSHBvyAVSrpkyRYrumyhjpzlRgg3Zud2wyQ3QkUcEGeDBtoY2ysEEfudaSz
	XdjUAqBz8JB5hgjq/FKjm74osrsvqAxETI63A72XHHCdZ9qLqd4mjpZAcYyP24ouTA9abQAv0ZU
	bi2aIqXDTc59ZDeDDrrhE2bkf7WB2ixG1ywHiAS6k9v3qzqETnUQCs8qEG/+bSp8P6mrDomfO8v
	Owj1wvqeTPfCmw8jckGtbn/4iZD9fnRZfF4PBqbW0Oa4S9DdvyhPniJifiY1ckPt2pEH8BUp1tu
	ca1hYjGE/80l1gtwIJDFOsdKZIMx/CPHbFWWGva6ImVK++gax/U5TqEAzL9gClfjWWUahEloTrp
	YY7L9Gw03c34YropbeMw31x4B7iBJEqm/Y16wsyvCimX9mOdRJCzfJNfvPKBFiC26LFo=
X-Google-Smtp-Source: AGHT+IFVifTAJZtaYHUfGrIgJKVup73904Jpxi3iJQtxs2jFFAnZeMblxxiGJ+7YSsPUQmauGBlE4Q==
X-Received: by 2002:a05:6402:2105:b0:60e:f46:326d with SMTP id 4fb4d7f45d1cf-6149b5a9c99mr2747658a12.33.1753280461684;
        Wed, 23 Jul 2025 07:21:01 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm6803870a12.51.2025.07.23.07.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 07:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 16:21:01 +0200
Message-Id: <DBJI1WH6FF2U.DATWTQ5SP4JM@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
In-Reply-To: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>

On Wed Jul 23, 2025 at 4:19 PM CEST, Luca Weiss wrote:
> SM7225 is a variation of SM6350, and also needs an entry in the table.

And now a second after sending I checked sm7325 and that's also
missing...

>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Note, due to other bugs on next-20250723 I couldn't fully test that
> DPU/GPU are working, but this seems to be required in any case...
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9fdd169f87a78a486bea88230=
83bef08bc5b9521 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -246,6 +246,7 @@ static const struct of_device_id qcom_ubwc_configs[] =
__maybe_unused =3D {
>  	{ .compatible =3D "qcom,sm6375", .data =3D &sm6350_data, },
>  	{ .compatible =3D "qcom,sm7125", .data =3D &sc7180_data },
>  	{ .compatible =3D "qcom,sm7150", .data =3D &sm7150_data, },
> +	{ .compatible =3D "qcom,sm7225", .data =3D &sm6350_data, },
>  	{ .compatible =3D "qcom,sm8150", .data =3D &sm8150_data, },
>  	{ .compatible =3D "qcom,sm8250", .data =3D &sm8250_data, },
>  	{ .compatible =3D "qcom,sm8350", .data =3D &sm8350_data, },
>
> ---
> base-commit: ac3f0fb04c50a909908fd375686c5ad6b27bee98
> change-id: 20250723-ubwc-sm7225-19be7c2e7bdd
>
> Best regards,


