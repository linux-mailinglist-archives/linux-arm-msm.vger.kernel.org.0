Return-Path: <linux-arm-msm+bounces-20034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5248C95DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 20:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33D02818C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0CD6E5EC;
	Sun, 19 May 2024 18:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD4n4LxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06486D1B9;
	Sun, 19 May 2024 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716144068; cv=none; b=M84VzotMOrJxHojsa62j5EIK9lQ6wpNHjsv7SClR7Rkq61+MC5oklg7DJZuuab1V65SzGBtD4fiwad1g6DEgMYXKRpUf5ctZr/nGDHZLJbtXGLA403QeDI85M/J3gPWXNYX+e2vqsay+EWnUscHgLsXv+aAGxQlKlPVs4EV5x/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716144068; c=relaxed/simple;
	bh=Bkc78qfFXrUWLgGWQBIZhJN7QRVjrTGeVPuhfbNz+wM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoJFmFhvKSm0D7TxGxSHpVbVqiNX6mBYZTSgzO0YJ6vYx16SDbzdIsEb99WBb/8PJNVXzUjRT1tCv4a6bYtXq0elmITrcCs4tC8G4HlMCALyQQcko1d0WHF272MekENa5rJsK9n7Mpb1wYsxxY8GOsPn2sTtIhVbrkUevwXP3ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD4n4LxC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5731ffcc905so7594373a12.2;
        Sun, 19 May 2024 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716144065; x=1716748865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQN1qbHQDdw7eqyCQqGyIUPoss1m/79WN4ywDxt+UMw=;
        b=nD4n4LxCyimJLKXyRaC7WS3J5mNj8huLi/IsxYMb+H24y2PDEv2sp1vGQBk1hUNn2J
         50ADPEXv9nzSnMu+qJc0GOfP0qQOqaCZlPgskHqzVWxoIXUjcX/6S4gJblxhBzULNQ5k
         E2FDlhv82IDrzH0vxBEu0mf8kk9q1tXdYOYfhR+Ls6mSlJYUiM6moxp2ut7iS7jkymE2
         3oZbBz0cVj7HBAIHmN2vstn12K0ZdL1cIpZOWs4zbtZ7issC1AC5MeLrZUToPUc3zfzQ
         IcmQZ6njGFOargxiewUG+EFGBmBIFkbWdVzOqjUGVld/dM4U7wUHO3ASKyhxW4EvURvQ
         oDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144065; x=1716748865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQN1qbHQDdw7eqyCQqGyIUPoss1m/79WN4ywDxt+UMw=;
        b=J34nePUn7cvJN4VfeP8WN5Ay5959h1EWDokXdn5yRBQ/4UK0F3YOcVKdlN9DbDINtS
         m+kejmEOb+ooWOIXkG/E+7KJUW9C+ky8ynsM+yXsG+Kr0O77QAoCYhiR+bOKYGKw/0/9
         gUko9Q54mYpjNC419oRAwVBngz565DWTO5LC8Jb5Fe/98P7OG3evJ5oBU1EkwnrAA8C5
         1heBfVBgY/vxXsbfA5FSz6wQ17vVmWM27xv+7DQ95qLyCbk82ECjB2FNKWoN1Utj92GP
         uOSFKNk/5OEe+UTYsrk7ldwimFMg4iuk4Vbf/EDtsUNgSUFjr18zii40rOpwBsM7FERe
         uaHA==
X-Forwarded-Encrypted: i=1; AJvYcCW2aKLu6OYMdWYsgMnTMYVGQQkToOW3GAsjDT0dEJAJ62CGHdhVsfbxQpgRJaD2Cz0JafKkUZkXSvkkwGUIn/mS2MEi+4u6/PRrXBLwGRcd8tAVW33RcTLZgJGrEXHh5J27yK/v3ndokkQ6Nw==
X-Gm-Message-State: AOJu0YzANz7typIou23Qm6U0SYaitTcqBCfBzOvu9ZgrLCnSP+A0Dgob
	jPDjKcS3DpD1wFBNW1p2VMYbak4HckX75DwSuGm56lQYdo4edmNpL4GCe2tdMqKOHtt8GO6w10+
	NanM7j2ICyiJt6O/EqyP65RgFCVA=
X-Google-Smtp-Source: AGHT+IHweVWnVR9Lu7hc72pDxsrgNd7ydRD6Tty9jY/2pAI5Zur7TSot4vocz//LYDi8PXIQr8kumSNYQcuq5PRPpFo=
X-Received: by 2002:a50:ab47:0:b0:572:9984:1921 with SMTP id
 4fb4d7f45d1cf-5734d5bec35mr18572666a12.17.1716144064801; Sun, 19 May 2024
 11:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072330.229076-1-pvkumar5749404@gmail.com>
In-Reply-To: <20240407072330.229076-1-pvkumar5749404@gmail.com>
From: prabhav kumar <pvkumar5749404@gmail.com>
Date: Mon, 20 May 2024 00:10:52 +0530
Message-ID: <CAH8oh8UJUaq=Qg-jNYnEjL=auq9eDTcG24FZ3nCoZWcEDqwqEw@mail.gmail.com>
Subject: Re: [PATCH next] drivers: soc: qcom: Auto cleanup using __free(device_node)
To: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr, javier.carrasco@wolfvision.net, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are there any comments for me regarding the patch ?
Please let me know

On Sun, Apr 7, 2024 at 12:53=E2=80=AFPM Prabhav Kumar Vaish
<pvkumar5749404@gmail.com> wrote:
>
> Use automated cleanup to replace of_node_put() in qcom_smem_resolve_mem()=
.
>
> Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> ---
> drivers/soc/qcom/smem.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..ad1cf8dcc6ec 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qcom_smem=
 *smem, const char *name,
>                                  struct smem_region *region)
>  {
>         struct device *dev =3D smem->dev;
> -       struct device_node *np;
>         struct resource r;
>         int ret;
> +       struct device_node *np __free(device_node) =3D of_parse_phandle(d=
ev->of_node, name, 0);
>
> -       np =3D of_parse_phandle(dev->of_node, name, 0);
>         if (!np) {
>                 dev_err(dev, "No %s specified\n", name);
>                 return -EINVAL;
>         }
>
>         ret =3D of_address_to_resource(np, 0, &r);
> -       of_node_put(np);
>         if (ret)
>                 return ret;
>
> --
> 2.34.1
>

