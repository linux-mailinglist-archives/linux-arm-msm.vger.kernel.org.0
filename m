Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8F31A6E7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389173AbgDMVgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389146AbgDMVgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:36:51 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE02CC0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:36:51 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np9so4399232pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Bl9Mhh+Xx5XvDq6coWRx01rYWy0QhTE2WmyFT1dTfWM=;
        b=QAClugwrpKbhTcAyDaQ2FnuTc1aNxmUvP4einQzMQ9MXuX+IuKkvX/9CmEiok1+Owo
         adw0FBTQYVkTI+cS4K1CzUi+sItnZhnkPUH8RtLhSJu0bEdD7Gm+dlzxNckt5pcnQQIS
         Vl32eHXaSDU0A+Sjj4tpS28C+mow7vf05ifyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Bl9Mhh+Xx5XvDq6coWRx01rYWy0QhTE2WmyFT1dTfWM=;
        b=k4LXjsq/iSEsJ1lk11Zry90VTBjRDjlgd0SumxeX3mWna2pPSBt58avrtrpzkWrRDd
         jn8hv1TDNGiQVypp32HqGaAeckxAzpfqMk7Y/rjhSoyNtBFOz7KPG/ADodav9uaoHr26
         e7Q6wElMyZ6yFpAmMrCcDLvxj2r1i7Ur4sipr6tVV581+LKoR3zm7uNgPKqrPz2oa+C7
         G7hxvKaftttYPnzbGzbSotcQEIL1H8HFDBCYfvarZyGzWGOK4t/8qM5cKg/HB4SOQNQ1
         LcEESXXGzTKGi6q/KUPETsgCf8RwUFyC0vwKmpJt9cVM7qdFbB1aIJtj+IsdnDY9s4i9
         4c7A==
X-Gm-Message-State: AGi0PuY0bG+/Eu7OAQ2DgoZ6bVKaCF1apCRJWkdSKtLJvC8liNM8W+ZV
        rY4eqDEFahKh6czdC3cFbc/GiA==
X-Google-Smtp-Source: APiQypJpAdW6OQk3JJdMFIGbSzOhbxmSaQLBdHOwqDOMyP5ORWijk1z7sJKbfdDLr14mkcgdaBDCjw==
X-Received: by 2002:a17:902:ff05:: with SMTP id f5mr842027plj.320.1586813810958;
        Mon, 13 Apr 2020 14:36:50 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e22sm8629230pgh.14.2020.04.13.14.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:36:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
Subject: Re: [PATCH v4 03/10] drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 14:36:49 -0700
Message-ID: <158681380955.84447.4248338073528400701@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:08)
> I was trying to write documentation for the functions in rpmh-rsc and
> I got to tcs_ctrl_write().  The documentation for the function would
> have been: "This is the core of rpmh_rsc_write_ctrl_data(); all the
> caller does is error-check and then call this".
>=20
> Having the error checks in a separate function doesn't help for
> anything since:
> - There are no other callers that need to bypass the error checks.
> - It's less documenting.  When I read tcs_ctrl_write() I kept
>   wondering if I need to handle cases other than ACTIVE_ONLY or cases
>   with more commands than could fit in a TCS.  This is obvious when
>   the error checks and code are together.
> - The function just isn't that long, so there's no problem
>   understanding the combined function.
>=20
> Things were even more confusing because the two functions names didn't
> make obvious (at least to me) their relationship.
>=20
> Simplify by folding one function into the other.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 439a0eadabf1..d9177324c6a2 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -628,7 +612,18 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, co=
nst struct tcs_request *msg)
>         if (msg->state =3D=3D RPMH_ACTIVE_ONLY_STATE)
>                 return -EINVAL;
> =20
> -       return tcs_ctrl_write(drv, msg);
> +       tcs =3D get_tcs_for_msg(drv, msg);
> +       if (IS_ERR(tcs))
> +               return PTR_ERR(tcs);
> +
> +       spin_lock_irqsave(&tcs->lock, flags);
> +       /* find the TCS id and the command in the TCS to write to */
> +       ret =3D find_slots(tcs, msg, &tcs_id, &cmd_id);

It may be better to inline find_slots() too. It's only used here and
that tcs_id =3D 0, cmd_id =3D 0 line at the top of this function is
annoying.
