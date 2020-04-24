Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E8C1B6B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 04:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDXCsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 22:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDXCsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 22:48:33 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56907C09B044
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:48:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j7so3908291pgj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XnjBfutqpSQtz7Gqtz/wqHdQiXpCTuOajbGz3W2B49Q=;
        b=Otu2OY9W6c7i78G0eKqOlbFsVXugWLXZkviht6Hqtp4+J4ZLE1NrvVbtM53o9GFoy4
         utxv1Mf1ooKzUZDayNkV6rONV0FtdLVG9q+EhH08MSuwNT/OtWnE85u9gfnT0qW/5+5d
         uJpZtDjB+UDXwiNw0wkg0zB4PAUg7mNitNgYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XnjBfutqpSQtz7Gqtz/wqHdQiXpCTuOajbGz3W2B49Q=;
        b=rIp9++wksZF4z+WoALdVi/JlV2RLvSYcrpRvu4HClGkoxgBl0aU+EUs0wjlVfB1DI0
         Wpqq7wClR/LfZTWmUDxqBkU9xchrzM2+p/ufO1EYu0bUM5rypXXUdiC1D3d3KGtHrACt
         JYwy5uhzOmxsx9fZRrNZNUsTjBatPiRBla7RhebtRqELuI5ChL0Md3jl6iyu+038wJtM
         p+of26S3M4V/Qi0r2861tVXiXvkOsltffHMgVxllZitOHjTG6ifU4GtCrDbQ8MDu8Mcl
         HSZdOPFfL8Ieoh+yPQf5R6ocDubOaOMJmH7J8f5TvNyCoJjSGiHvENzdGEjgx2nP6d79
         uL4Q==
X-Gm-Message-State: AGi0PuYjhd6rQoBhzc727dSTEx0ts5RZMXeVZLOqW/wCc/uimNeDfLFH
        wq3aj+2zlYjBBfc7klOJxPqmNg==
X-Google-Smtp-Source: APiQypLdbNn4udPU2l9vxnDsqhWL9avqENFsnboZyGvzLLRtXwBHtGAEBzaqDknf0iNNX4/R2W6MJg==
X-Received: by 2002:aa7:934d:: with SMTP id 13mr6946334pfn.305.1587696512682;
        Thu, 23 Apr 2020 19:48:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e135sm4046249pfh.37.2020.04.23.19.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 19:48:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200422145408.v4.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200422145408.v4.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
Subject: Re: [PATCH v4 4/5] soc: qcom: rpmh-rsc: Simplify locking by eliminating the per-TCS lock
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, mkshah@codeaurora.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Thu, 23 Apr 2020 19:48:30 -0700
Message-ID: <158769651085.135303.5206480555792176636@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-22 14:55:02)
> The rpmh-rsc code had both a driver-level lock (sometimes referred to
> in comments as drv->lock) and a lock per-TCS.  The idea was supposed
> to be that there would be times where you could get by with just
> locking a TCS lock and therefor other RPMH users wouldn't be blocked.
>=20
> The above didn't work out so well.
>=20
> Looking at tcs_write() the bigger drv->lock was held for most of the
> function anyway.  Only the __tcs_buffer_write() and
> __tcs_set_trigger() calls were called without it the drv->lock.  It

without holding the drv->lock

> actually turns out that in tcs_write() we don't need to hold the
> drv->lock for those function calls anyway even if the per-TCS lock
> isn't there anymore.=20

Why?

> Thus, from a tcs_write() point of view, the
> per-TCS lock was useless.
>=20
> Looking at rpmh_rsc_write_ctrl_data(), only the per-TCS lock was held.
> It turns out, though, that this function already needs to be called
> with the equivalent of the drv->lock held anyway (we either need to
> hold drv->lock as we will in a future patch or we need to know no
> other CPUs could be running as happens today).  Specifically
> rpmh_rsc_write_ctrl_data() might be writing to a TCS that has been
> borrowed for writing an active transation but it never checks this.
>=20
> Let's eliminate this extra overhead and avoid possible AB BA locking
> headaches.
>=20
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e540e49fd61c..71cebe7fd452 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -581,24 +575,19 @@ static int tcs_write(struct rsc_drv *drv, const str=
uct tcs_request *msg)
>         if (IS_ERR(tcs))
>                 return PTR_ERR(tcs);
> =20
> -       spin_lock_irqsave(&tcs->lock, flags);
> -       spin_lock(&drv->lock);
> +       spin_lock_irqsave(&drv->lock, flags);
>         /*
>          * The h/w does not like if we send a request to the same address,
>          * when one is already in-flight or being processed.
>          */
>         ret =3D check_for_req_inflight(drv, tcs, msg);
> -       if (ret) {
> -               spin_unlock(&drv->lock);
> -               goto done_write;
> -       }
> +       if (ret)
> +               goto err;

Nitpick: Usually 'goto err' is used for error paths, not unlock paths.
Use 'goto unlock' for that.

> =20
> -       tcs_id =3D find_free_tcs(tcs);
> -       if (tcs_id < 0) {
> -               ret =3D tcs_id;
> -               spin_unlock(&drv->lock);
> -               goto done_write;
> -       }
> +       ret =3D find_free_tcs(tcs);
> +       if (ret < 0)
> +               goto err;
> +       tcs_id =3D ret;
> =20
>         tcs->req[tcs_id - tcs->offset] =3D msg;
>         set_bit(tcs_id, drv->tcs_in_use);
> @@ -612,13 +601,21 @@ static int tcs_write(struct rsc_drv *drv, const str=
uct tcs_request *msg)
>                 write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id=
, 0);
>                 enable_tcs_irq(drv, tcs_id, true);
>         }
> -       spin_unlock(&drv->lock);
> +       spin_unlock_irqrestore(&drv->lock, flags);
> =20
> +       /*
> +        * These two can be done after the lock is released because:
> +        * - We marked "tcs_in_use" under lock.
> +        * - Once "tcs_in_use" has been marked nobody else could be writi=
ng
> +        *   to these registers until the interrupt goes off.
> +        * - The interrupt can't go off until we trigger.

trigger via some function?

> +        */
>         __tcs_buffer_write(drv, tcs_id, 0, msg);
>         __tcs_set_trigger(drv, tcs_id, true);
> =20
> -done_write:
> -       spin_unlock_irqrestore(&tcs->lock, flags);
> +       return 0;
> +err:
> +       spin_unlock_irqrestore(&drv->lock, flags);
>         return ret;
>  }
>
