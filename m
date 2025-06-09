Return-Path: <linux-arm-msm+bounces-60640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32EAD1E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18D26188D506
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585AC1EA7C4;
	Mon,  9 Jun 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POgJ9GQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AFD25392B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474060; cv=none; b=qB6BpHwDBJ/YOYO8Us1I58hXvXJKlksaCVKJGmgOIFYNtab/Hs3f7iGauBg6eI+7mkor5GzumZXoXU6OTGZyM64+V4iRQHdLscWzsXndnMhHBbwPkFcoZ3jEAa9KBm3a30e7NfRG68mgBU71Lmvs6bgsbEtbEPr0gMrpXHHtLeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474060; c=relaxed/simple;
	bh=+URPo4JGBj7DndEyMo5gm2wIJ46h7HcTeGl1dr40vvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUsj/9zdg1MyItWUC9svuwwbMakLkqZ0ZgqTDvbjWgTaX3XxIjuiv1oQquo7Y2PyBI7Z1We5irR9KO3n9K9mN1B7GWpiUcvI0wtIEHpUI6aRcGMC04Vfh1UVDQVIsfLzV2BG5Pj2+DqutOIqrn/Wrt1j2um5nK2A57dJbknSaOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POgJ9GQt; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-404e580bf09so919387b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749474057; x=1750078857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYtTd8X3ioZoP4ZqCiRHyNkyAopif3v2teL9bFi+ppk=;
        b=POgJ9GQtiCyJg1MeCIdhKRsxIJQUedNqxfcn+K8n9tUOgoV5bfDj1GjFUE7RSKIAi2
         0PnK3CGURLMXrOHvSi8TA+q1i+TuK9JgtBiwq9XTsk65ggABs/z9CrBPn4nsWLd8LTcQ
         nEPXUF5Co/51VGXMqxFGBqE7FEGwlMK6geDB/DXh/zVkA4pf8uBOKqQ2ArfvxYFyheTZ
         gSHSmZkzxiKeXPgYUoMXjLdp225PEC44bqgPk6HsPYA3TXfogO8Vrc96wrREG3LLv9Dy
         Xa8re29o6cb6Z2R4g6IdJ+w4n+8wXStw5x55v74RhhNG+z4BOmiWydi8xxm5L7zRdHuJ
         AtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474057; x=1750078857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYtTd8X3ioZoP4ZqCiRHyNkyAopif3v2teL9bFi+ppk=;
        b=JUM6d6GOfNUz4sAfd8hvjS11uMfup67Ew+S7ARaIk9X7Epw1P/vQCiA1roxWNDlX2D
         xsy+zSX6yR7wGHtl7l+2Ncc0flyL8XjEcy2s6UYLhv5lSUu3WtSjWSTkaZQjQaeR4+m+
         F7vsSisbEVraQPux3DcqKrs9hZ02j9EpbOHh79W6RI/k49EbVNr2fCOZ9S19SQPeQ333
         CjmtE7E5BZgqaU29fjEMqJNb4qeO7DY7cBgGaqZeOzuMEVC1tHs13e+KpYPEG84xP53N
         rTDAOZHyO1V3lRz67GIbzlxeSdmcU1kwf3M+CLb+DI44kKDx2q2q+vxPC+5cQdpvM42/
         +eQw==
X-Forwarded-Encrypted: i=1; AJvYcCXIiUx8jonkcPEiFtyTSZtuAuvUGl10IIBXmW2fHWrjKEERysCSQ2wNa7sBtFIWxrYZRDMMNtmRwVODMaic@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvYGbaoqH3PPASYWjTIY0YJUMPOSr/X3i1kowlZdLeqNs/Xa2
	l+gn4JOtH5wEJadfz1IPexiySwJBz+evYhJUxyt4EPIIxCL8noKjg665LMHGS7HGNhRQkP8My0E
	8r2kFCmeIEMxOgHgskip3EotMRu0OncQvt3dIXH1SIg==
X-Gm-Gg: ASbGnctjS9bth+wk3rsphM3hJ9Zxe+gPmEd/YN0OzZpxqw7wwOPG8t/aMgJzcWKu+ZP
	XST7ir/ehumdWWJ2oPffW+YLp8foJYf4D3d5ObKqsx/BPn153HnI2EL9QCEHPr6sQ/w8jhtj2eJ
	BNGjkUMUq3VzZRZPp8CUbbQrtJ//cCLUV0S4F2fE/zoP9T
X-Google-Smtp-Source: AGHT+IEx5dBBYalreZpgcAi7SiMqb9bdO3lo6yhdnudOtUBVFZ+AX4nRBzDMZ/8OpWtkY6MrxyYR2ncP1ceSLRn0V4Q=
X-Received: by 2002:a05:6808:5086:b0:409:f8e:727f with SMTP id
 5614622812f47-4090f8e7a1cmr6634453b6e.3.1749474057017; Mon, 09 Jun 2025
 06:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com>
In-Reply-To: <20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Jun 2025 15:00:45 +0200
X-Gm-Features: AX0GCFs0onTtmhC4kVNMBNJ2gfnQX-I7Oo5EtaFJz3aIdTdjQHDdvJiA4KNJJYM
Message-ID: <CAHUa44EyGXswbYLgdrfH_cMSyadgVUAJDGAMdsPXQVN7V7Nhsw@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: prevent use-after-free when the client exits
 before the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Fri, Jun 6, 2025 at 4:01=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
> client wait as killable so it can be interrupted during shutdown or
> after a supplicant crash. This changes the original lifetime expectations=
:
> the client task can now terminate while the supplicant is still processin=
g
> its request.
>
> If the client exits first it removes the request from its queue and
> kfree()s it, while the request ID remains in supp->idr. A subsequent
> lookup on the supplicant path then dereferences freed memory, leading to
> a use-after-free.
>
> Serialise access to the request with supp->mutex:
>
>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>     looking up and touching the request.
>   * Let optee_supp_thrd_req() notice that the client has terminated and
>     signal optee_supp_send() accordingly.
>
> With these changes the request cannot be freed while the supplicant still
> has a reference, eliminating the race.
>
> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/supp.c | 114 ++++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 77 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index d0f397c90242..62c9c75f48a6 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -9,6 +9,7 @@
>
>  struct optee_supp_req {
>         struct list_head link;
> +       int id;
>
>         bool in_queue;
>         u32 func;
> @@ -19,6 +20,9 @@ struct optee_supp_req {
>         struct completion c;
>  };
>
> +/* It is temporary request used for invalid pending request in supp->idr=
. */
> +static struct optee_supp_req invalid_req;

Prefer avoiding global variables where possible.

> +
>  void optee_supp_init(struct optee_supp *supp)
>  {
>         memset(supp, 0, sizeof(*supp));
> @@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 =
func, size_t num_params,
>         mutex_lock(&supp->mutex);
>         list_add_tail(&req->link, &supp->reqs);
>         req->in_queue =3D true;
> +       req->id =3D -1;
>         mutex_unlock(&supp->mutex);
>
>         /* Tell an eventual waiter there's a new request */
> @@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u3=
2 func, size_t num_params,
>         if (wait_for_completion_killable(&req->c)) {
>                 mutex_lock(&supp->mutex);
>                 if (req->in_queue) {
> +                       /* Supplicant has not seen this request yet. */
>                         list_del(&req->link);
>                         req->in_queue =3D false;
> +
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
> +               } else if (req->id  =3D=3D -1) {
> +                       /*
> +                        * Supplicant has processed this request. Ignore =
the
> +                        * kill signal for now and submit the result.
> +                        */
> +                       ret =3D req->ret;
> +               } else {
> +                       /*
> +                        * Supplicant is in the middle of processing this
> +                        * request. Replace req with invalid_req so that =
the ID
> +                        * remains busy, causing optee_supp_send() to fai=
l on
> +                        * the next call to supp_pop_req() with this ID.
> +                        */
> +                       idr_replace(&supp->idr, &invalid_req, req->id);
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
>                 }
> +
> +               kfree(req);
>                 mutex_unlock(&supp->mutex);
> -               req->ret =3D TEEC_ERROR_COMMUNICATION;
> +       } else {
> +               ret =3D req->ret;
> +               kfree(req);
>         }
>
> -       ret =3D req->ret;
> -       kfree(req);
> -
>         return ret;
>  }
>
>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
> -                                             int num_params, int *id)
> +                                             int num_params)
>  {
>         struct optee_supp_req *req;
>
> @@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct =
optee_supp *supp,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       *id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> -       if (*id < 0)
> +       req->id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> +       if (req->id < 0)
>                 return ERR_PTR(-ENOMEM);
>
>         list_del(&req->link);
> @@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fun=
c, u32 *num_params,
>         struct optee *optee =3D tee_get_drvdata(teedev);
>         struct optee_supp *supp =3D &optee->supp;
>         struct optee_supp_req *req =3D NULL;
> -       int id;
>         size_t num_meta;
>         int rc;
>
> @@ -223,16 +246,45 @@ int optee_supp_recv(struct tee_context *ctx, u32 *f=
unc, u32 *num_params,
>                 return rc;
>
>         while (true) {
> -               mutex_lock(&supp->mutex);
> -               req =3D supp_pop_entry(supp, *num_params - num_meta, &id)=
;
> -               mutex_unlock(&supp->mutex);
> +               scoped_guard(mutex, &supp->mutex) {
> +                       req =3D supp_pop_entry(supp, *num_params - num_me=
ta);
> +                       if (!req)
> +                               goto wait_for_request;
>
> -               if (req) {
>                         if (IS_ERR(req))
>                                 return PTR_ERR(req);
> -                       break;
> +
> +                       /*
> +                        * Popped a request: process it while holding the=
 lock,
> +                        * so that optee_supp_thrd_req() doesn't pull the
> +                        * request out from under us.
> +                        */
> +
> +                       if (num_meta) {
> +                               /*
> +                                * tee-supplicant support meta parameters=
 ->
> +                                * requests can be processed asynchronous=
ly.
> +                                */
> +                               param->attr =3D
> +                                       TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_I=
NOUT |
> +                                       TEE_IOCTL_PARAM_ATTR_META;
> +                               param->u.value.a =3D req->id;
> +                               param->u.value.b =3D 0;
> +                               param->u.value.c =3D 0;
> +                       } else {
> +                               supp->req_id =3D req->id;
> +                       }
> +
> +                       *func =3D req->func;
> +                       *num_params =3D req->num_params + num_meta;
> +                       memcpy(param + num_meta, req->param,
> +                              sizeof(struct tee_param) * req->num_params=
);

This is the point at which this function must break out of the loop
and return the request, or it will be lost.

Cheers,
Jens

>                 }
>
> +               /* Check for the next request in the queue. */
> +               continue;
> +
> +wait_for_request:
>                 /*
>                  * If we didn't get a request we'll block in
>                  * wait_for_completion() to avoid needless spinning.
> @@ -245,27 +297,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fu=
nc, u32 *num_params,
>                         return -ERESTARTSYS;
>         }
>
> -       if (num_meta) {
> -               /*
> -                * tee-supplicant support meta parameters -> requsts can =
be
> -                * processed asynchronously.
> -                */
> -               param->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
> -                             TEE_IOCTL_PARAM_ATTR_META;
> -               param->u.value.a =3D id;
> -               param->u.value.b =3D 0;
> -               param->u.value.c =3D 0;
> -       } else {
> -               mutex_lock(&supp->mutex);
> -               supp->req_id =3D id;
> -               mutex_unlock(&supp->mutex);
> -       }
> -
> -       *func =3D req->func;
> -       *num_params =3D req->num_params + num_meta;
> -       memcpy(param + num_meta, req->param,
> -              sizeof(struct tee_param) * req->num_params);
> -
>         return 0;
>  }
>
> @@ -297,12 +328,21 @@ static struct optee_supp_req *supp_pop_req(struct o=
ptee_supp *supp,
>         if (!req)
>                 return ERR_PTR(-ENOENT);
>
> +       /* optee_supp_thrd_req() already returned to optee. */
> +       if (req =3D=3D &invalid_req) {
> +               req =3D ERR_PTR(-ENOENT);
> +               goto failed_req;
> +       }
> +
>         if ((num_params - nm) !=3D req->num_params)
>                 return ERR_PTR(-EINVAL);
>
> +       req->id =3D -1;
> +       *num_meta =3D nm;
> +failed_req:
>         idr_remove(&supp->idr, id);
>         supp->req_id =3D -1;
> -       *num_meta =3D nm;
> +
>
>         return req;
>  }
> @@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret,=
 u32 num_params,
>
>         mutex_lock(&supp->mutex);
>         req =3D supp_pop_req(supp, num_params, param, &num_meta);
> -       mutex_unlock(&supp->mutex);
> -
>         if (IS_ERR(req)) {
> +               mutex_unlock(&supp->mutex);
>                 /* Something is wrong, let supplicant restart. */
>                 return PTR_ERR(req);
>         }
> @@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret,=
 u32 num_params,
>
>         /* Let the requesting thread continue */
>         complete(&req->c);
> +       mutex_unlock(&supp->mutex);
>
>         return 0;
>  }
>
> ---
> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

