Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6268326C5FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 19:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgIPR2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 13:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgIPR2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:28:21 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF85C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k13so3545047plk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=icqQdJptZU1+Cli7+KP35XPpco/lrViFrPCj4c4ItTU=;
        b=mNTDCrovWeR++HPoKJ5nc9Jd4bCTN0psmXsvkS5E3/I1fy+W6uAlWjYQsHgbHwIjZT
         7rW0VJ1LogMzOqE+y/JfsZJsMrGDIOaoBaWZZmqKsie1JUYETlh8qdq2SSI2nhoZ27I7
         FZQfkeVKS19jy6I03LnAS/dFZwDUNick/O9kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=icqQdJptZU1+Cli7+KP35XPpco/lrViFrPCj4c4ItTU=;
        b=Dy41ssxVGWnCXtN5DArnRjOt8l5hIxWHkQNYnVx2cC+bwnBWlYboYu0xkYLV1zfKBi
         2BevJz1gycceIHhaGI6nlfD61tYqhHVLG6NdT98ynnZbDtQWrfj7og7/9A9PXeTvO4s8
         hPTcyKUFBkaSHzIBIgNdLaXa98SeCzhgSCckR5tS70J76Rwh2efdqqwtD6FijH3TKI/S
         1+uSDkFxUbTbv0fXmBqfTnuquZGy0S1aSIcfBfbrO9Zsefgnmk+oJ1S/sqfJb2ucz7Th
         rbQFqI3U0vr1xKcjCsi65X8Hh5XPTx3TO0tpN8Q2D32SJvmk5kY5glju7yWF3JhhwLNG
         0bOA==
X-Gm-Message-State: AOAM530bAZVm3IBuPbyXp26hBFY5AiJTFJQr96pZs7Dhj6SzkYCGNGtA
        WySRN2g8QJ/21g6SE99K0KsvzQ==
X-Google-Smtp-Source: ABdhPJwls/xnxK0gmUalIkWlfpej7xUrnrowqMX77b9HSLjNZLh8iL4/eR5Em7wKVHXEpoKFK6BvkQ==
X-Received: by 2002:a17:902:8643:b029:d1:920c:c1db with SMTP id y3-20020a1709028643b02900d1920cc1dbmr25400194plt.42.1600276671136;
        Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x4sm17420010pff.57.2020.09.16.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 10:17:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200916145252.16024-1-sibis@codeaurora.org>
References: <20200916145252.16024-1-sibis@codeaurora.org>
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Date:   Wed, 16 Sep 2020 10:17:48 -0700
Message-ID: <160027666863.4188128.6191735162530147774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2020-09-16 07:52:52)
> On secure devices which support warm reset, the MBA firmware requires
> access to the modem region to clear them out. Hence provide Q6 access
> to this region before MBA boot. This will be a nop during a modem SSR.
>=20

Does it need a Fixes: tag? Probably.

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>=20

Trivia time!

>=20
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index c401bcc263fa..f989ca81d374 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -931,6 +931,16 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>                 goto assert_reset;
>         }
> =20
> +       /* Some versions of the MBA firmware will upon boot wipe the MPSS=
 region as well, so provide

Should have /* on a line by itself.

> +        * the Q6 access to this region.
> +        */
> +       ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, =
true,
> +                                     qproc->mpss_phys, qproc->mpss_size);
> +       if (ret) {
> +               dev_err(qproc->dev, "assigning Q6 access to mpss memory f=
ailed: %d\n", ret);
> +               goto disable_active_clks;
> +       }
> +
>         /* Assign MBA image access in DDR to q6 */
>         ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, t=
rue,
>                                       qproc->mba_phys, qproc->mba_size);
> @@ -1137,8 +1147,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> =20
>         /**

Should be /* instead of /**, the latter is for kernel-doc which this is
not.

>          * In case of a modem subsystem restart on secure devices, the mo=
dem
> -        * memory can be reclaimed only after MBA is loaded. For modem co=
ld
> -        * boot this will be a nop
> +        * memory can be reclaimed only after MBA is loaded.
>          */
>         q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>                                 qproc->mpss_phys, qproc->mpss_size);
