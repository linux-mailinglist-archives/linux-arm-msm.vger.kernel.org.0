Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF301A3B38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 22:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgDIUXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 16:23:18 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35477 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgDIUXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 16:23:18 -0400
Received: by mail-pj1-f67.google.com with SMTP id mn19so1744900pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 13:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=sBJcOnwg24jleMutN+HP4yNIjd4URpK+S2uxHFb+3BM=;
        b=PvHz7dF20As5sbbYhB4q2ZvdzPKLTHniMisQ6lTKn6fL1VKD9aT+MsurZd5T4Fv5ay
         qj11BWf5ZcmpCRPmF20yYNN0PA7qRI6ovhUYTvUx37Fpt8ufd3xInESvlq9hOzs0Vx81
         z7jN2AMxqMEh4XWww6NDXOnw+Cs/pYKSa+yM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=sBJcOnwg24jleMutN+HP4yNIjd4URpK+S2uxHFb+3BM=;
        b=HKNvgqS5EA8O+mUI6Bwljn7DKzYboBx7HoN7g/xA2gXsqJkbfx7dxOagDt4EvKElNz
         OiJPqKkEX6QLI1Nm+qOzrkyc1/rUVmX0ED6tqBNVoUEn37lPuKXYWcZtAPhZfsPykReE
         d3XzL1oMfD19ecqYYpqbk1HA8GhwOxPiNi1vyjhUKOxA9Jho1eY53kuaN/wqJmhPv+nz
         bn6M4J66N6Ok6fBbwimQCGfniWyPnqJAL8FtOai9q1wHtOfnrHa0MS9NHAf1ZdS3jBi/
         MEyD3UGS+HWr4SJonOuBjpEiAFfy6TlwPFBOu7Yf+7mMxj5lWlrT2KLNyLhTR0MKUzvN
         5KtQ==
X-Gm-Message-State: AGi0PubSYCiWY1GriJhdIY5LmcHM9Z7qB1fV7LNpt9YKfbLc9gZXuhFy
        ehfzngmLvV39Cr/n7xpeN1TXTg==
X-Google-Smtp-Source: APiQypLbn4cmz+FXdn7gXrnO7qPuX2QK1uwvFuORE9G27aRb5HAsQ3Iu8eAoYmuET7GFLdrJviAD2g==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr1346044plb.121.1586463796146;
        Thu, 09 Apr 2020 13:23:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h10sm18856937pgf.23.2020.04.09.13.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:23:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586154741-8293-4-git-send-email-mkshah@codeaurora.org>
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org> <1586154741-8293-4-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v16 3/6] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new data
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Thu, 09 Apr 2020 13:23:14 -0700
Message-ID: <158646379456.77611.8638840660664120750@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-05 23:32:18)
> TCSes have previously programmed data when rpmh_flush is called.

rpmh_flush()

> This can cause old data to trigger along with newly flushed.
>=20
> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>=20
> With this there is no need to invoke rpmh_rsc_invalidate() call from
> rpmh_invalidate().
>=20
> Simplify rpmh_invalidate() by moving invalidate_batch() inside.
>=20
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state request=
s")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/soc/qcom/rpmh.c | 41 ++++++++++++++++++-----------------------
>  1 file changed, 18 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 03630ae..a75f3df 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -498,24 +492,25 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>  }
> =20
>  /**
> - * rpmh_invalidate: Invalidate all sleep and active sets
> - * sets.
> + * rpmh_invalidate: Invalidate sleep and wake sets in batch_cache
>   *
>   * @dev: The device making the request
>   *
> - * Invalidate the sleep and active values in the TCS blocks.
> + * Invalidate the sleep and wake values in batch_cache.
>   */
>  int rpmh_invalidate(const struct device *dev)
>  {
>         struct rpmh_ctrlr *ctrlr =3D get_rpmh_ctrlr(dev);
> -       int ret;
> -
> -       invalidate_batch(ctrlr);
> +       struct batch_cache_req *req, *tmp;
> +       unsigned long flags;
> =20
> -       do {
> -               ret =3D rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
> -       } while (ret =3D=3D -EAGAIN);
> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
> +               kfree(req);
> +       INIT_LIST_HEAD(&ctrlr->batch_cache);
> +       ctrlr->dirty =3D true;
> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> =20
> -       return ret;
> +       return 0;

Now this always returns 0. Maybe it should become a void function, but
doing that requires a change in the interconnect code so maybe do it
later.
