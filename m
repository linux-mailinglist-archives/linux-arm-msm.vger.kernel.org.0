Return-Path: <linux-arm-msm+bounces-74133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45752B884F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5F03B5C82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0C82FE05D;
	Fri, 19 Sep 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YR7fQ92I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E862FE057
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268767; cv=none; b=U1PNQoPWTi1EHddy1LQZLK5BFKYE+vxRrqI7CTUp+SlYWCWZQpZyzztwmWpRo1DwsCKCjP1QCuQwa/JvixNFUTaHTKvK513IX8V20Hk6PjCqQj2AR+hMGlohfRSy/d3vAXC7aEH0DBRj0vR0mSJReU0KhfNx5gV56V9mcisp/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268767; c=relaxed/simple;
	bh=FwMus99U8OAhl7KhXnsvGESrZFJWyVna+f36n8I5bZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGa4px94Fat149hb+4MtXljjasjsUJor3+GP+ycMB3SvSetvYLojNRNvb9OjPIA98og4j0PhsxKOMuOH9nJNzqr2K00WKvU5khcwTbxEfHtybFPOKUYr4gu/6Rzj8MfMKTv993x4pCRCUMdUKWddDFJVAMeLYs7dtqNOgeeqYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YR7fQ92I; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-621cc387bb8so674832eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268764; x=1758873564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASDqAkH4cmxDPZSFWYENHrs1T7W+4jRPHJP2+bsh1GM=;
        b=YR7fQ92Ia2V7geu1PHmvzbLL9QMop1gN73J1L2hxicnLCpQxFtU5C0a5xPX9YXpkmD
         E+6ZVepeYfpFwxM+4NFBLwfToq82fs2O9z+xLYzycg2b5XUfVhOco39Nm1/q5Tq1Sv6A
         d2SeyfKkE6Lu6tC8Xk9SlObyC/T1QOmz4IlD8mPAK9V4//xUGL95jjSyAiFSJq4EW+8S
         7r3aDKjg0z8I/6SCHEEV0LccVroN+98TvDBaZnMv0zBlVfKGgcLjzUZ+irgmd2JDZCRj
         sfVwwjmcGLK0kS8dij6ndG7Eu+9zbU8TZUz8yfcsF4xIHgThy9IElnuZtVUWgYrI0Ag3
         H+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268764; x=1758873564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASDqAkH4cmxDPZSFWYENHrs1T7W+4jRPHJP2+bsh1GM=;
        b=p86C3dn4J1IkHg5xHxO9+ZJlNFpmhzIUEf1Cy294UimDOYpEA6Czd37lTK31SpVrow
         +CHuYVFD1rdfRDQrPDdGos4rZdr31leCx/17lSeLhnVXCTrJENs8RtDtHETiT/EiHoDv
         4WjXUCIlcFyHJhGaqY8fkyc+Nu8RpmxW/NKnoKH+113+TkoS21cg+UjeTbf4DrqR/Rb+
         Y5uq4bwk+8FDMl4FhWAM2q9tjAIOOlq12ip+cwB/CuM7TgI8oSxwvOSo04P6ZcDzDc9E
         kLT7iK1nRvMrHa8LaiicWmZzVeHR07heBiZbMnPUUwhqdqMJheqmeyskPi2YB1zSSpBK
         LMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9NJxWl81sthO078RA8+T6H5XQBGeuSjbXLb9zsd9I7p/+VYfBKmw6GN71Mme1kJK5hKcKIFZzKea9cK1S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/acLX7hoOiw8Of4nm937jIY0nlv+KJU2pJ9uikbL4Dk6Ekepb
	jPWlj+Adf3wnxZKEJ3rYp7tm87oRAQRi0xJ5XtpeGQ4zVrYdbdvcsncQUA92SRwJ+6TaZssDRGM
	KEcbExcYstAC32Fks9bxQTnatsgCq5cgmcEWE7WXmQA==
X-Gm-Gg: ASbGnctXmGBXxjK8+e4M5STohSuZDKlqzvJmAqC+/srL/BnM1q4SJbu1WP9foMovF0U
	sSr81h6oiR+yOE3Llsx4uKsVjRhZYCgVX3g/E1+c2jCNPAZYS4Th8Zypdbwiyg6Zi8Cm1Oz3eUt
	4PS0d1YraTMnDYO2q73BGpkuxreR6Subw84EQTX8kVqpHQA1M2tidTvMrknLKXcRnN12i+s/Dac
	8d0xpFw
X-Google-Smtp-Source: AGHT+IEekOH9/D2Na5uJOAYH+Gd3gYDqTSm7RjBTFazB5QY2j1Nx/k/QnGRih+TMOqi+VBgoo9dEC9T1EDeBavQpFxI=
X-Received: by 2002:a05:6808:5094:b0:439:b674:d9a3 with SMTP id
 5614622812f47-43d6c26736fmr1011006b6e.35.1758268764408; Fri, 19 Sep 2025
 00:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMvV4kK386Sni10i@stanley.mountain> <aMzoPc67ws5NMpKS@sumit-X1>
In-Reply-To: <aMzoPc67ws5NMpKS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 19 Sep 2025 09:59:11 +0200
X-Gm-Features: AS18NWA3C9LQrIakhvqgeKImPW9n-BTnckAYGagXPywalztGB_Wmp1fHsBSux6w
Message-ID: <CAHUa44G96pdFL+08Rn8yr_5fp2MpUCjLAUsUcgprnrZCcSyLxg@mail.gmail.com>
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:21=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Sep 18, 2025 at 12:50:26PM +0300, Dan Carpenter wrote:
> > Re-order these checks to check if "i" is a valid array index before usi=
ng
> > it.  This prevents a potential off by one read access.
> >
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/call.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Applied.

/Jens

>
> -Sumit
>
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index cc17a48d0ab7..ac134452cc9c 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_para=
m *params,
> >       }
> >
> >       /* Release any IO and OO objects not processed. */
> > -     for (; u[i].type && i < num_params; i++) {
> > +     for (; i < num_params && u[i].type; i++) {
> >               if (u[i].type =3D=3D QCOMTEE_ARG_TYPE_OO ||
> >                   u[i].type =3D=3D QCOMTEE_ARG_TYPE_IO)
> >                       qcomtee_object_put(u[i].o);
> > --
> > 2.51.0
> >
> >

