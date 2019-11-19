Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFAD102EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 23:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfKSWL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 17:11:27 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34926 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfKSWL1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 17:11:27 -0500
Received: by mail-pg1-f193.google.com with SMTP id k32so6486581pgl.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=NB1snV7gGgbvKvDUiVe8mxdHgisnUgyrD7QDIYN9eA4=;
        b=AYheE8fizt0HAafRhuXEGD2WMBa9fi633m8P3QdxYOzpLr3y14X1eHXTeOlwMfWl/L
         PynKyCFu32iLqHWFM2RWMEpHND9k4a7dMmaGExHhIYzW9G7PkzCT08aUZBb10hTrLCyh
         64vgXmyhjScpqrvWxXC15oo5y+4GQGPrAyn6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=NB1snV7gGgbvKvDUiVe8mxdHgisnUgyrD7QDIYN9eA4=;
        b=FEXEFeyPcx3Yy33oPaMu9NDtPacFF1K8RahK+N9rYpqROJC6eGklCLDjOy8m7BXe/h
         f0HA/u9hDNTUHm0if3KuvZkO2muZTTEAlCeaT7xLH4cLKl9zT1Tm5Ll6J42i6eONUtM+
         MsrHazvLL3VUSZCGIfZqwBub0Oy+Gu4kp7vYAIlyGMvPMokGAQRcQunGKqd3/2CREF3c
         0Cdk3NoKIpvCEQMhsCXncfhHt74WxxGe5xbVHXH9r9LJwkJ6nm0VIk935pvi+utqTd1X
         sybX3Uq+ZCRrr2ZNkylaYjR49x5hF4UlwpPzRSUsyjVAYbgElsNlJeG6+Qm2n0tRYG28
         SJCg==
X-Gm-Message-State: APjAAAUdIA0my/abiWH+ZnSKJLbJMy+lHw1Ar9AZeQ7fEgUQGeP2L6/w
        Vpk7xKZQb2MxU4OiLM2RK2OneQDs5xo=
X-Google-Smtp-Source: APXvYqyzPU8Ff4deEYC3/bz0jeI1IYHSAy2uy9pwy8CFfbNzyTjNBKCd7/r7LKX8TGSRGKqGjjxITA==
X-Received: by 2002:a63:3741:: with SMTP id g1mr8076985pgn.434.1574201486254;
        Tue, 19 Nov 2019 14:11:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w129sm11451952pgb.67.2019.11.19.14.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 14:11:25 -0800 (PST)
Message-ID: <5dd4688d.1c69fb81.77385.33e9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-15-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-15-git-send-email-eberman@codeaurora.org>
Subject: Re: [PATCH v2 14/18] firmware: qcom_scm-32: Create common legacy atomic call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 14:11:24 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:50)
> Per [1], legacy calling convention supports up to 5 arguments and
> 3 return values. Create one function to support this combination.

And remove the other functions in its place?

It would be nice to have some motivation here in the commit text.

>=20
> [1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/so=
c/qcom/scm.c?h=3Dkernel.lnx.4.9.r28-rel#n1024
>=20
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index 913a77c..eca18e1 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -252,6 +252,8 @@ static int qcom_scm_call(struct device *dev, struct q=
com_scm_desc *desc)
>         return ret;
>  }
> =20
> +#define LEGACY_ATOMIC_N_REG_ARGS       5
> +#define LEGACY_ATOMIC_FIRST_REG_IDX    2
>  #define LEGACY_CLASS_REGISTER          (0x2 << 8)
>  #define LEGACY_MASK_IRQS               BIT(5)
>  #define LEGACY_ATOMIC_ID(svc, cmd, n) \
> @@ -261,52 +263,34 @@ static int qcom_scm_call(struct device *dev, struct=
 qcom_scm_desc *desc)
>                                 (n & 0xf))
> =20
>  /**
> - * qcom_scm_call_atomic1() - Send an atomic SCM command with one argument
> - * @svc_id: service identifier
> - * @cmd_id: command identifier
> - * @arg1: first argument
> + * qcom_scm_call_atomic() - Send an atomic SCM command with up to 5 argu=
ments
> + * and 3 return values
>   *

Please document arguments.

>   * This shall only be used with commands that are guaranteed to be
>   * uninterruptable, atomic and SMP safe.
>   */
> -static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
> +static int qcom_scm_call_atomic(struct qcom_scm_desc *desc)

Can desc be const?

>  {
>         int context_id;
>         struct arm_smccc_args smc =3D {0};
>         struct arm_smccc_res res;
> +       size_t i, arglen =3D desc->arginfo & 0xf;
> =20
> -       smc.a[0] =3D LEGACY_ATOMIC_ID(svc, cmd, 1);
> -       smc.a[1] =3D (unsigned long)&context_id;
> -       smc.a[2] =3D arg1;
> -       arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
> -                     smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
> +       BUG_ON(arglen > LEGACY_ATOMIC_N_REG_ARGS);
> =20
> -       return res.a0;
> -}
> +       smc.a[0] =3D LEGACY_ATOMIC_ID(desc->svc, desc->cmd, arglen);
> +       smc.a[1] =3D (unsigned long)&context_id;
> =20
[...]
>  int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned =
int val)
>  {
> -       return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
> -                                    addr, val);
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_IO,
> +               .cmd =3D QCOM_SCM_IO_WRITE,
> +               .owner =3D ARM_SMCCC_OWNER_SIP,
> +       };
> +
> +       desc.args[0] =3D addr;
> +       desc.args[1] =3D val;
> +       desc.arginfo =3D QCOM_SCM_ARGS(2);
> +
> +       return qcom_scm_call_atomic(&desc);

So what is the benefit of this conversion? Now callers have to construct
a descriptor on the stack and call the function that would otherwise
accept some number of arguments. Are we going to be adding more register
based APIs? It would seem simpler to just have a similar interface that
smccc has that takes some fixed number of registers and then suffer the
few extra register moves of some random value like 0 when they're not
used by the secure world.

