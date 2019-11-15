Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B6EFE8E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 00:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKOX5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 18:57:07 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43544 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfKOX5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:07 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so5735503plm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=+07j2B58hopyN/ZPaBe69iJHlWi51aKHuV5+M1PPQSc=;
        b=H0ak2Hd2yu1RxB45LW+1S+MQGJCihk1/ctT1XWJ12Yeo9uhBHLnxrV/X7d3M8gU3r1
         IujnsBnbUaOsjVaJFVaaiAQF/7E9zTkm/WcELCQ8jrChDsWzi1PTm9bRdlTqoAcKlwx2
         SU8PqROMKmINdKcVH4+FolUKCWTdu4egG6DwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=+07j2B58hopyN/ZPaBe69iJHlWi51aKHuV5+M1PPQSc=;
        b=gM+oEuVdTWrJsSh3Mm68Z+UVRy4Bhx9P7A01pEeGG0o2FhK2mkiUT6u7qiZyxV1J2z
         H9lbiLnsiY+N7FXwKcBebQ1AAT3cmo/juA387JELCiEEzvEMI7/xANr7a3zNuBCt+U5l
         sg6V50HVywSEdUIJRaTHNKrP9DVDQVtbYY7jub33uzKKmXTTHYykIROF9IBQKqfJoPBc
         bGKyJFkwmtkrkmjpG0Ey7PFQl9ZsxsGfdw9+imJVK8QG5cxw/Pv7CG5ttBiOiLWFaJG6
         C5t+pf1tUq5gjA8iA3BSYYxbzqL7A45bOej8G87YZB3kgJQNL9CSJOw3iqdP0OLEacSZ
         L/Qg==
X-Gm-Message-State: APjAAAV0lEAmslMZ7NuQ7GmSk/yhu46PhI+idUU/1OdSo1OUiG9P2PGi
        OHl/dOWgvB6/0FQWRBtE5CNzinGitoU=
X-Google-Smtp-Source: APXvYqzSSQfd7/2G4P4J+spB+fI8VwxQvZbO2hAP1sVvyCC9MYJnOlPR7egzW0H2TdJXtAZnclDEpw==
X-Received: by 2002:a17:90a:ca04:: with SMTP id x4mr23470260pjt.103.1573862226403;
        Fri, 15 Nov 2019 15:57:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u7sm9751454pjx.19.2019.11.15.15.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:57:05 -0800 (PST)
Message-ID: <5dcf3b51.1c69fb81.e286f.bdec@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-10-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-10-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 09/18] firmware: qcom_scm-64: Move SMC register filling to qcom_scm_call_smccc
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 15:57:04 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:45)
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-6=
4.c
> index 4131093..977654bb 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -54,6 +54,10 @@ struct qcom_scm_desc {
>         u32 owner;
>  };
> =20
> +struct arm_smccc_args {
> +       unsigned long a[8];

Please call it 'args', not just 'a'.

> +};
> +
>  static u64 qcom_smccc_convention =3D -1;
>  static DEFINE_MUTEX(qcom_scm_lock);
> =20
> @@ -95,12 +95,22 @@ static int ___qcom_scm_call_smccc(struct device *dev,
>  {
>         int arglen =3D desc->arginfo & 0xf;
>         int i;
> -       u64 x5 =3D desc->args[SMCCC_FIRST_EXT_IDX];
>         dma_addr_t args_phys =3D 0;
>         void *args_virt =3D NULL;
>         size_t alloc_len;
>         gfp_t flag =3D atomic ? GFP_ATOMIC : GFP_KERNEL;
> +       u32 smccc_call_type =3D atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_=
STD_CALL;
>         struct arm_smccc_res res;
> +       struct arm_smccc_args smc =3D {0};
> +
> +       smc.a[0] =3D ARM_SMCCC_CALL_VAL(
> +               smccc_call_type,
> +               qcom_smccc_convention,
> +               desc->owner,
> +               SMCCC_FUNCNUM(desc->svc, desc->cmd));
> +       smc.a[1] =3D desc->arginfo;
> +       for (i =3D 0; i < SMCCC_N_REG_ARGS; i++)
> +               smc.a[i + SMCCC_FIRST_REG_IDX] =3D desc->args[i];
> =20
>         if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
>                 alloc_len =3D SMCCC_N_EXT_ARGS * sizeof(u64);
> @@ -131,19 +141,18 @@ static int ___qcom_scm_call_smccc(struct device *de=
v,
>                         return -ENOMEM;
>                 }
> =20
> -               x5 =3D args_phys;
> +               smc.a[SMCCC_LAST_REG_IDX] =3D args_phys;
>         }
> =20
>         if (atomic) {
> -               __qcom_scm_call_do_quirk(desc, &res, x5, ARM_SMCCC_FAST_C=
ALL);
> +               __qcom_scm_call_do_quirk(&smc, &res);
>         } else {
>                 int retry_count =3D 0;
> =20
>                 do {
>                         mutex_lock(&qcom_scm_lock);
> =20
> -                       __qcom_scm_call_do_quirk(desc, &res, x5,
> -                                                ARM_SMCCC_STD_CALL);
> +                       __qcom_scm_call_do_quirk(&smc, &res);
> =20
>                         mutex_unlock(&qcom_scm_lock);
> =20

Maybe we need to restructure this whole function to be a few steps

	setup_and_map_args()
	do_call()
	unmap_args()
	remap_error()

And pass some set of args to those functions. That would probably
provide clarity to this monstrously large function.

