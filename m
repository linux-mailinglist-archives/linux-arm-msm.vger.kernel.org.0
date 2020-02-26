Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B403170BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 23:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgBZWn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 17:43:26 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43491 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgBZWn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 17:43:26 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so273088plq.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 14:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tmmzbig6kKd2J1vSLS/3+Ly3DK1KMOkPEr7ocA5n8BU=;
        b=G4kRN/gblOwhZ9Ydgqv7ZiG7wbtZIxzqLwbWe4wGx7O3kdMCtDPX8HYO7WSz9jaYG6
         qRDSPJTqBduvJZ5hNUCW9fZ4YUI1AwZd/VN4tmk6kvh3t1vDDgi8WIXh1Na0DTBy+IoV
         /gLLKqvaHocsv0u8y+Q+IwrIQb/27Gw2n6sy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tmmzbig6kKd2J1vSLS/3+Ly3DK1KMOkPEr7ocA5n8BU=;
        b=k4UQkW77WUhgtyo0fZKYuMaO629gXeGiVwLayfpSlj8MRAgXN5UJjEyAf+ynF/0Hx+
         VzJo1QoacshvkAEOYmhRxfjobfRG7RzZpwj2oebVw4rf5U5hOVAp30NOOK+OXdyzP7X6
         qeaZ6Qj63bB6yJqNYxJIOpMOOJY8s2ul7Nw6yp6qf3yqJJFnyQqv3h6PqXz+GgV2DqtT
         J7SawqfXXAN/0ha1L86f29S2KeErO4+lFAAyDuuX+jZOpwK6QPsweC1F6PvqMRBOasNt
         D4hysSM8wqDmy/fbUtLl/9EkWmd6d2wHT53pTrAK/vqScN2mXyEv3e4OJ6aOeJLPg1Et
         7Ncw==
X-Gm-Message-State: APjAAAXGwubZaSFAYD9elHM0SK2R8aI9+YHB9cCvxLb9clmbYujVpS+A
        brh90UeqzEHnJ4Nsw0EmxLHs2A==
X-Google-Smtp-Source: APXvYqyU28YSEFboz9xxQdDdc2W7O/rwUruv/UskcxB861z9ZN4/Qcv4sP2DfN01S+LwztHf98W1Hw==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr1565171plo.259.1582757005506;
        Wed, 26 Feb 2020 14:43:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v8sm3944025pgt.52.2020.02.26.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:43:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582694833-9407-3-git-send-email-mkshah@codeaurora.org>
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org> <1582694833-9407-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v7 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Wed, 26 Feb 2020 14:43:23 -0800
Message-ID: <158275700389.177367.5843608826404724304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-02-25 21:27:12)
> Currently rpmh ctrlr dirty flag is set for all cases regardless
> of data is really changed or not. Add changes to update it when
> data is updated to newer values.
>=20
> Also move dirty flag updates to happen from within cache_lock.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>

Probably worth adding a Fixes tag here? Doesn't make sense to mark
something dirty when it isn't changed.

> ---
>  drivers/soc/qcom/rpmh.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index eb0ded0..83ba4e0 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct r=
pmh_ctrlr *ctrlr,
>  existing:
>         switch (state) {
>         case RPMH_ACTIVE_ONLY_STATE:
> -               if (req->sleep_val !=3D UINT_MAX)
> +               if (req->sleep_val !=3D UINT_MAX) {
>                         req->wake_val =3D cmd->data;
> +                       ctrlr->dirty =3D true;
> +               }
>                 break;
>         case RPMH_WAKE_ONLY_STATE:
> -               req->wake_val =3D cmd->data;
> +               if (req->wake_val !=3D cmd->data) {
> +                       req->wake_val =3D cmd->data;
> +                       ctrlr->dirty =3D true;
> +               }
>                 break;
>         case RPMH_SLEEP_STATE:
> -               req->sleep_val =3D cmd->data;
> +               if (req->sleep_val !=3D cmd->data) {
> +                       req->sleep_val =3D cmd->data;
> +                       ctrlr->dirty =3D true;
> +               }
>                 break;
>         default:
>                 break;

Please remove the default case. There are only three states in the enum. The
compiler will warn if a switch statement doesn't cover all cases and
we'll know to add something here if another enum value is added in the
future.

>         }
> =20
> -       ctrlr->dirty =3D true;
>  unlock:
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> =20
> @@ -323,6 +331,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>         list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>                 kfree(req);
>         INIT_LIST_HEAD(&ctrlr->batch_cache);
> +       ctrlr->dirty =3D true;
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>  }
> =20
> @@ -456,6 +465,7 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum=
 rpmh_state state,
>  int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>  {
>         struct cache_req *p;
> +       unsigned long flags;
>         int ret;
> =20
>         if (!ctrlr->dirty) {
> @@ -488,7 +498,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>                         return ret;
>         }
> =20
> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>         ctrlr->dirty =3D false;
> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);

So we take the spinlock to update it here. But we don't hold the
spinlock to test for !dirty up above. Seems like either rpmh_flush() can
only be called sequentially, or the lock added here needs to be held
during the whole flush. Which way is it?
