Return-Path: <linux-arm-msm+bounces-91495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIjZFhOOgGkl+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:44:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68BCBDF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A445302A6EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 11:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A921421B918;
	Mon,  2 Feb 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FW7bLcVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EC3590C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032182; cv=pass; b=RQZyq84rZP0E+0TMq+0NID6BOwKbaoy9q4T4PXOsYPhoy1swYCbh1EtGJcVRhpqbX1jBbvsHz/ilkIm7KeGgtAbGXCNWjbwO5ifbDldem9g1jDRxBYd7ISxi9DoE2evCY2DJJnTrlAqspigrG1AZb7I9cjHiWurV95EIk/yXNBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032182; c=relaxed/simple;
	bh=hbiY0mk1089H088ku/UdhiadA4YSZzBjPFudkS5si1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3fWUov5nD+E2sIv2ZRIgg9oTkeYvRdpwXmIzKmUr8L/AIVq5sqmWFRUJLvxwpR2kVDnAG4cjLtWJB1zD2LO0VH33C3d+mjzyshzgXEmDpROjt3KLljMCewLSVQLnncZLP37jbghTf4p+7bUW4QR+nwMF4nDaqveRuvvAJqTfGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FW7bLcVQ; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4042fe53946so1483956fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 03:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770032179; cv=none;
        d=google.com; s=arc-20240605;
        b=U3E8QQ/2oze84R6X7xYd7NakkwqJfJgaIxSKfzeKF2M4qAbkasjVbTjBVhAOo3/BBc
         oQDtB5p0gKBWfMfukLCjogyxei9S5UpE+2WItUAyedl5Knhv9xzYfiwJtKFKaXDTNSY5
         HFMVK9tqCsUFB5Ho+n23gY1yz/5STfAPzjb9/3Vjm94POONOQufKOmOmEqCtmwTc22Ve
         zrslJuoyLar0wGx0bumJsdGG38tPROAmXq8Ni0u6wES/Zbe6M/q02TykMneu8JiZVuS5
         ZfWFwYso41795sR0FwEgDiU+eDAajm874UznV6JYGwmHDYKy/7LEEOyKllKFP5w+gZ2y
         HiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dOXYzDQiQdPBTZLhCvuKodoTlB7hy579/On5uDSXb8=;
        fh=1ro4mwZrfp1BSdAy8DkNquX1rh9uXAG5UHTHieqEK6A=;
        b=DFnpSMd9wj1OkP5tDNC3uB33lyNCefVvfDLGOn9yZwcEPUbLaG5ftWa7kVupQyU0T1
         1YqZ4axQ+mJvfduDAncuNoZ8BgjP9tWLV14SR7p+NRcd7DwiYSXcr6ymhUazZunQPnbp
         HYdoAnq7VjmHMwOVcCtEIU5sQvuCQ6VAduMfTNHSD8zORCvcSuFDnLPxnQvAo7wWo1A0
         AtmAnY06pvBHaAj3VO9uV7YSmM030ZAEBMl1eMHnOHMf8r5sF0fDq7c0ZPFb3yX11nnS
         MQjBQSfOFiT4JPv6bfum6OAAQUNVDj5P7pD7cE7ftTMQtVyVtQDMbu930VhSs8FXP0dO
         x2KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770032179; x=1770636979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dOXYzDQiQdPBTZLhCvuKodoTlB7hy579/On5uDSXb8=;
        b=FW7bLcVQU36HoGQnn+yBaOQLHs2LfV1/4fwZdUuM4Z/FPG37P1g8HzTROJw6drLkRe
         d1ant4x9iss2VQYh3bQXhWBklgD+uo4wfeotAjJk/A+Jvrms6YmVBeLamUCFe/Vs5UDv
         mS0xqGqAP4uLrJGWmKQCLfk/QhLYhnRUVHVMJoe+VL9KWM/pr3TyRBmaaorKX0fEQDy+
         aiO6paiNlyUFd6OV4DppbByon+pwCLvAy0FyQ+sWv+qUZR4AtcB83tngzSexbdm1wG6w
         qX7+SHdzC5UH3xcvrL6/387M4Z/AUJCJrLRWgpBkBy0d2Wg/cL/woBvKXX9bhiAJjtiJ
         WF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770032179; x=1770636979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dOXYzDQiQdPBTZLhCvuKodoTlB7hy579/On5uDSXb8=;
        b=cRIM1xGwKFvqK3dK0613FHFGkjm1gGIpDOp+xKeZtKINpDhkQiMbUxlQEgsCN2y5XY
         MX9m8L0ECTEAitAdtyjwEHPzOLJ6IAmnoK1G0ptPUeXv3/exyal7eJ0KaKrFPnMzE/uQ
         YZBuVniAbl4wRa+/6KSaXjJ4dhjyXOVwmhuN32f1uFJafKH4koxE6BXsuIoZXjvPmVKl
         ygdVGYd1HegslVlnkQTG7aM4AFeJyZii43sBnCcUsJMsr4j0Q3E8CA8ta7Sd90HnZb8q
         2FoSRWgDh1AvUp7bBhPox2JU6pGjccPeVrBl6xmqphdG3I6GXX7s62AwkNhTICPGiKui
         9ESw==
X-Forwarded-Encrypted: i=1; AJvYcCUcCXD1XB7qxA3u+TwN/jH4i1Irl7xPUaBObdFNQws5ISrZkfHXNAbd2xrAamMOr7xmqupsFH2H4IqcsjWc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxy6EPZoS1vtC4WFppXJI1z3fPcaxdTNLT2nmFsS4dkddCkBAs
	5xWSeHUcbLtgQO6mDXqL7RO3OKXA/iznZ5x0+lC3eG7uJCcjP3fBXlpwUhEJGFlTV3SBL17Dtbv
	58ghxp6ZzmqNoGAqIS99+uZPAllDIE6+NynME56iNDQ==
X-Gm-Gg: AZuq6aLXYom+AnNbxF1J5Y4z0DeSUra/cD0/2lD1Kj/4hlW4Ki5JsrSTm4nbQs6CrHv
	seA1g69HmUwJO3/kGWUqHGqaAquM1aeXHCaSAqQE+4m/vx42sM0LUael/Fowc2U51BF/Ibxt9VY
	GthM/xgvbGhIR1wp4FFHIvBv2yBu2caNOYWQvoQhemvXWDqFh29vl66lHY/IqOvZjEJcQ7897Zp
	uKa7LgBba+zcjgM+BXhK1u9XjtUFLtKmfIkHISNtkdxqKIx/qm+I8fB/HhzhOIFTaI84BPP7IYr
	zoT7V9NLVVc4xOmWAy0mBgZ95Q==
X-Received: by 2002:a05:6870:f603:b0:403:fde8:ee9d with SMTP id
 586e51a60fabf-409a6b271famr5560255fac.17.1770032178744; Mon, 02 Feb 2026
 03:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
In-Reply-To: <20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Feb 2026 12:36:06 +0100
X-Gm-Features: AZwV_QidVLzgAx-njwpKRe7qqHjFVfha6zhlz3U9qGFzTueyoAaugssIMPkwzfk
Message-ID: <CAHUa44E4Htg9zEMY9XtkMsPRJq+13mq6kSd8RUznHTRvXVXKVQ@mail.gmail.com>
Subject: Re: [PATCH v3] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Wu <michael@allwinnertech.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91495-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 8B68BCBDF2
X-Rspamd-Action: no action

Hi Amir,

On Thu, Jan 29, 2026 at 4:22=E2=80=AFAM Amirreza Zarrabi
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
> Changes in v3:
> - Introduce processed flag instead of -1 for req->id.
> - Update optee_supp_release() as reported by Michael Wu.
> - Use mutex instead of guard.
> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-=
1fbfafec5917@oss.qualcomm.com
>
> Changes in v2:
> - Replace the static variable with a sentinel value.
> - Fix the issue with returning the popped request to the supplicant.
> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-=
a70d23bff248@oss.qualcomm.com
> ---
>  drivers/tee/optee/supp.c | 122 +++++++++++++++++++++++++++++++++--------=
------
>  1 file changed, 86 insertions(+), 36 deletions(-)

I had forgotten about this. I'd like to prioritize getting this fixed
soon. By the way, how did you test this?

>
> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index d0f397c90242..0ec66008df19 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -10,7 +10,11 @@
>  struct optee_supp_req {
>         struct list_head link;
>
> +       int id;
> +
>         bool in_queue;
> +       bool processed;
> +
>         u32 func;
>         u32 ret;
>         size_t num_params;
> @@ -19,6 +23,9 @@ struct optee_supp_req {
>         struct completion c;
>  };
>
> +/* It is temporary request used for invalid pending request in supp->idr=
. */
> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
> +
>  void optee_supp_init(struct optee_supp *supp)
>  {
>         memset(supp, 0, sizeof(*supp));
> @@ -46,6 +53,10 @@ void optee_supp_release(struct optee_supp *supp)
>         /* Abort all request retrieved by supplicant */
>         idr_for_each_entry(&supp->idr, req, id) {
>                 idr_remove(&supp->idr, id);
> +               /* Skip if request was already marked invalid */
> +               if (IS_ERR(req))
> +                       continue;
> +
>                 req->ret =3D TEEC_ERROR_COMMUNICATION;
>                 complete(&req->c);
>         }
> @@ -102,6 +113,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 =
func, size_t num_params,
>         mutex_lock(&supp->mutex);
>         list_add_tail(&req->link, &supp->reqs);
>         req->in_queue =3D true;
> +       req->processed =3D false;
>         mutex_unlock(&supp->mutex);
>
>         /* Tell an eventual waiter there's a new request */
> @@ -117,21 +129,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u3=
2 func, size_t num_params,
>         if (wait_for_completion_killable(&req->c)) {
>                 mutex_lock(&supp->mutex);
>                 if (req->in_queue) {
> +                       /* Supplicant has not seen this request yet. */
>                         list_del(&req->link);
>                         req->in_queue =3D false;
> +
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
> +               } else if (req->processed) {
> +                       /*
> +                        * Supplicant has processed this request. Ignore =
the
> +                        * kill signal for now and submit the result.
> +                        */
> +                       ret =3D req->ret;
> +               } else {
> +                       /*
> +                        * Supplicant is in the middle of processing this
> +                        * request. Replace req with INVALID_REQ_PTR so t=
hat
> +                        * the ID remains busy, causing optee_supp_send()=
 to
> +                        * fail on the next call to supp_pop_req() with t=
his ID.
> +                        */
> +                       idr_replace(&supp->idr, INVALID_REQ_PTR, req->id)=
;
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
>                 }
> +
>                 mutex_unlock(&supp->mutex);
> -               req->ret =3D TEEC_ERROR_COMMUNICATION;
> +       } else {
> +               ret =3D req->ret;
>         }
>
> -       ret =3D req->ret;
>         kfree(req);
>
>         return ret;
>  }
>
>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
> -                                             int num_params, int *id)
> +                                             int num_params)
>  {
>         struct optee_supp_req *req;
>
> @@ -153,8 +184,8 @@ static struct optee_supp_req  *supp_pop_entry(struct =
optee_supp *supp,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       *id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> -       if (*id < 0)
> +       req->id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> +       if (req->id < 0)
>                 return ERR_PTR(-ENOMEM);

Since we're now storing the supplicant request ID, wouldn't it make
sense to pre-allocate the ID when allocating the request to avoid this
error case?

>
>         list_del(&req->link);
> @@ -214,7 +245,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fun=
c, u32 *num_params,
>         struct optee *optee =3D tee_get_drvdata(teedev);
>         struct optee_supp *supp =3D &optee->supp;
>         struct optee_supp_req *req =3D NULL;
> -       int id;
>         size_t num_meta;
>         int rc;
>
> @@ -224,15 +254,48 @@ int optee_supp_recv(struct tee_context *ctx, u32 *f=
unc, u32 *num_params,
>
>         while (true) {
>                 mutex_lock(&supp->mutex);
> -               req =3D supp_pop_entry(supp, *num_params - num_meta, &id)=
;
> -               mutex_unlock(&supp->mutex);
>
> -               if (req) {
> -                       if (IS_ERR(req))
> -                               return PTR_ERR(req);
> -                       break;
> +               req =3D supp_pop_entry(supp, *num_params - num_meta);
> +               if (!req) {
> +                       mutex_unlock(&supp->mutex);
> +                       goto wait_for_request;
> +               }
> +
> +               if (IS_ERR(req)) {
> +                       rc =3D PTR_ERR(req);
> +                       mutex_unlock(&supp->mutex);
> +
> +                       return rc;
>                 }
>
> +               /*
> +                * Process the request while holding the lock, so that
> +                * optee_supp_thrd_req() doesn't pull the request from un=
der us.
> +                */
> +
> +               if (num_meta) {
> +                       /*
> +                        * tee-supplicant support meta parameters ->
> +                        * requests can be processed asynchronously.
> +                        */
> +                       param->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_I=
NOUT |
> +                                     TEE_IOCTL_PARAM_ATTR_META;
> +                       param->u.value.a =3D req->id;
> +                       param->u.value.b =3D 0;
> +                       param->u.value.c =3D 0;
> +               } else {
> +                       supp->req_id =3D req->id;
> +               }
> +
> +               *func =3D req->func;
> +               *num_params =3D req->num_params + num_meta;
> +               memcpy(param + num_meta, req->param,
> +                      sizeof(struct tee_param) * req->num_params);
> +
> +               mutex_unlock(&supp->mutex);
> +               return 0;

Do we really need to move this into the loop? The structure of the
function becomes a bit unusual and harder to read.

> +
> +wait_for_request:
>                 /*
>                  * If we didn't get a request we'll block in
>                  * wait_for_completion() to avoid needless spinning.
> @@ -243,29 +306,10 @@ int optee_supp_recv(struct tee_context *ctx, u32 *f=
unc, u32 *num_params,
>                  */
>                 if (wait_for_completion_interruptible(&supp->reqs_c))
>                         return -ERESTARTSYS;
> -       }
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
> +               /* Check for the next request in the queue. */
>         }
>
> -       *func =3D req->func;
> -       *num_params =3D req->num_params + num_meta;
> -       memcpy(param + num_meta, req->param,
> -              sizeof(struct tee_param) * req->num_params);
> -
>         return 0;
>  }
>
> @@ -297,12 +341,18 @@ static struct optee_supp_req *supp_pop_req(struct o=
ptee_supp *supp,
>         if (!req)
>                 return ERR_PTR(-ENOENT);
>
> +       /* optee_supp_thrd_req() already returned to optee. */
> +       if (IS_ERR(req))
> +               goto failed_req;
> +
>         if ((num_params - nm) !=3D req->num_params)
>                 return ERR_PTR(-EINVAL);
>
> +       *num_meta =3D nm;
> +failed_req:
>         idr_remove(&supp->idr, id);
>         supp->req_id =3D -1;
> -       *num_meta =3D nm;
> +
>
>         return req;
>  }
> @@ -328,9 +378,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret,=
 u32 num_params,
>
>         mutex_lock(&supp->mutex);
>         req =3D supp_pop_req(supp, num_params, param, &num_meta);
> -       mutex_unlock(&supp->mutex);
> -
>         if (IS_ERR(req)) {
> +               mutex_unlock(&supp->mutex);

We need a way to tell the difference between an id not found and an id
removed because of a killed requester.
How about storing NULL for revoked requests instead of an err-pointer?

Cheers,
Jens

>                 /* Something is wrong, let supplicant restart. */
>                 return PTR_ERR(req);
>         }
> @@ -355,9 +404,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret=
, u32 num_params,
>                 }
>         }
>         req->ret =3D ret;
> -
> +       req->processed =3D true;
>         /* Let the requesting thread continue */
>         complete(&req->c);
> +       mutex_unlock(&supp->mutex);
>
>         return 0;
>  }
>
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

