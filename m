Return-Path: <linux-arm-msm+bounces-81811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD6C5C154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD853B161E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8A62FCC1E;
	Fri, 14 Nov 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KChybCa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66552D8DA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763110228; cv=none; b=GdwBoIkzco0g/TxNobYiWecvIug5sB7NmAttMi4+cSFz6TEXyL0eAd906yMYMm2LBu/8PP9LJ9RIzzjOONzgVcD3iUpIYw6LCpQBharJrHpKw5AWbEuPoihTIqkop/mbSQoXXCbxaGbyHvkhh4FKAN8zjfffjFAJ9XK9Di3FoRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763110228; c=relaxed/simple;
	bh=BUQR4z8zJ2mH/dcBcWD/IQNQF0hh2gv9vQwxfAujeEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/TRqrbkKQhvi3CmhX9hGhNipxlOQrON1L0SKVzwx0pnPQH4UsPrUMeaw8DzF9RoPiYZHcynrM9T1W1KRupDhUWhLWEWa+zOkvp53WHG8XgcrF51ghOMvR29QH3XAhHxRg1VdBCehfJOdeLI4kQKyXkN+IjpS3BlQ7jA+9x+b9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KChybCa8; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-656d9230cf2so935941eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 00:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763110225; x=1763715025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CusVqL2ntwZsk8KprD0ABpMXTld3zKY0G34uzzG8h8Q=;
        b=KChybCa8yN89mWkgNJ6Ys9C8P/p6B2E9+TzaLi6b8cM4s0Kkc3bPOXALyrgcHmPmcI
         QZY8Rvv1FEqHXzuN+Zsx7n3NKj/fVyMmFMEGILpC4gmWyUDCxwVp+QQ7QtXKHLU/oXSZ
         1OKq07q5M3a0bffuKtfyImQBTolDwG2i+pj3chaZbqdIIGmeU93wHMs7wG76b2sMmubt
         5kZCEr+AqZ7QtEz/4MQoAD3hjDquR98YmeaEUaf0+O1uYJWkBynvNDlfSFQxgnBbvw2U
         92GJtCFv8r4e511t7qxtaG/Z0k87+l4cTKiYJnGUn+BJ18ja2pZncpF1/t6v4wWe+kp0
         2TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763110225; x=1763715025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CusVqL2ntwZsk8KprD0ABpMXTld3zKY0G34uzzG8h8Q=;
        b=V9SLkvcc5CwUePGxDgpkgsMqiI4bU0IO/PpWUA0SmBlcmsaBzpkBHUtzc9A66S2yQG
         ASbAYKqCR1mEUjyPHdo1HtipGG1b7ERi0UFjlmUshgkZnJl00vHwSUi0qg6NQTLne98X
         BZ0QxjVKHp3gEHgrru9NGORiBjQoiBFjjEsuOgvwVtaNX0K9dGYurmGj4nD/tp9hY5NR
         NFtoVTwNMDkw8xl8xZgZY/v6D/dzv0S8x4vH8Dgh7LHDXmlkns8dfBVOV17TmpgqIMfh
         7DHQ6LJ0R85bO5T0MwjyDM984kt4f0qzUI7r7Yd5rKy8V4DmWmFgDBSU9HJgATYjlckV
         earw==
X-Forwarded-Encrypted: i=1; AJvYcCUuZIxEK/tPzaDAhKTxx0QNLw+vygRdjDQ1sKINQ7ZwUj9GEm5SLeYHyejbzmaW33K7mtarY/Qm5H9h24Eb@vger.kernel.org
X-Gm-Message-State: AOJu0YxE4BwybiFepIwG47A1br4udbCjVOVXGY32b7J1K/6xNAt7QTRR
	JvtHmiQiPnr5ii+6PAU5TsATJh4MJ+1uT2zgCk78zgdDY4l9+DcJ/fwvcygjRXGhNMvaJBNCuyI
	WjJO4j52fEFaYosYU1dAE04nD/pifv2N4nuuAn5J5rQ==
X-Gm-Gg: ASbGncsfzWxSV5kTINN50pWhTKj7MyOaWWjKG0jntRL8O9GD/aFtZItDY6piK40C59f
	AGmWL+S8u5JOsdsAnrCDK/5WJplQQoswdykwxxL03umENYXxeg78GeCvMXqGq933XppV2UKyWd4
	xZ+e0j4OkQmn66C1PCvEwqaG91CBUhvmTrYf3i7bChgamUdS6uV0tVmeO0yGbyd+sLlx+DihQ5c
	avg4mw1w2ayIUdASRAulSqztqDzg/hDdCeT4YyUoT4amMmTti5FzLNgh5VQ7RkNUlJiYrcr/VbP
	cklp
X-Google-Smtp-Source: AGHT+IF1A1pWHFYkRwg3X51lkNTOBIl+wQ8n3kMIRR/2Y8vGWmB6jerdRYhHhX6GfE0v08cbQgMc8VxU+REj9kPZerM=
X-Received: by 2002:a05:6808:6f8b:b0:450:3cf2:3c67 with SMTP id
 5614622812f47-450973c1b43mr1217012b6e.17.1763110224866; Fri, 14 Nov 2025
 00:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-aheev-uninitialized-free-attr-tee-v3-1-57905b913359@gmail.com>
 <aRQ9DQ1Ncf4Iep4o@sumit-X1>
In-Reply-To: <aRQ9DQ1Ncf4Iep4o@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Nov 2025 09:50:13 +0100
X-Gm-Features: AWmQ_bk8z8uY8FQvLbLxKFhMh2Cuc82wVlGR0MiBwZAeRVTZdMtWoIw6TFAW0SI
Message-ID: <CAHUa44GzZtLPMRH6yEHP7e6TLfLbOfEdRpjVy=E4CZ9sRCCbUg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: qcomtee: fix uninitialized pointers with free attribute
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Ally Heev <allyheev@gmail.com>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 8:53=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Nov 11, 2025 at 01:26:42PM +0530, Ally Heev wrote:
> > Uninitialized pointers with `__free` attribute can cause undefined
> > behavior as the memory assigned randomly to the pointer is freed
> > automatically when the pointer goes out of scope.
> >
> > qcomtee doesn't have any bugs related to this as of now, but
> > it is better to initialize and assign pointers with `__free`
> > attribute in one statement to ensure proper scope-based cleanup
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > ---
> > Changes in v3:
> > - fixed commit message and description
> > - Link to v2: https://lore.kernel.org/r/20251110-aheev-uninitialized-fr=
ee-attr-tee-v2-1-023ffba9ea0f@gmail.com
> >
> > Changes in v2:
> > - initializing variables to NULL at the declaration
> > - Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-fr=
ee-attr-tee-v1-1-2e1ee8483bc5@gmail.com
> > ---
> >  drivers/tee/qcomtee/call.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens


>
> -Sumit
>
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index ac134452cc9cfd384c28d41547545f2c5748d86c..65f9140d4e1f8909d072004=
fd24730543e320d74 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -645,7 +645,7 @@ static void qcomtee_get_version(struct tee_device *=
teedev,
> >  static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32=
 id,
> >                                         u32 *version)
> >  {
> > -     struct qcomtee_object_invoke_ctx *oic __free(kfree);
> > +     struct qcomtee_object_invoke_ctx *oic __free(kfree) =3D NULL;
> >       struct qcomtee_object *client_env, *service;
> >       struct qcomtee_arg u[3] =3D { 0 };
> >       int result;
> >
> > ---
> > base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> > change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
> >
> > Best regards,
> > --
> > Ally Heev <allyheev@gmail.com>
> >

