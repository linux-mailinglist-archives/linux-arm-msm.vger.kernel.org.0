Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F75C2003C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 10:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731445AbgFSIYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 04:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731227AbgFSIXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 04:23:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE6AC0613EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 01:23:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id d6so3997275pjs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=cOjFg4sGuVUcrxoFrYYht/Y2Lr3ZzExkrDSKHnA/MW4=;
        b=UnbAfZjy4KrFS6s6WYk+8IHEm4be5Uj4t3yD6ChL5fY/ouSRK9SmGjF18loFmGMbjZ
         NwSwg8YqWU/TRr/rwMcQ+EVa/to48C4mReIKgvdOahrYtsGJzmiiFXUzBDObLs8r1QIl
         mHTzRaw/EFRcyoow53NRLGbYNHhIxBlrHX0z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=cOjFg4sGuVUcrxoFrYYht/Y2Lr3ZzExkrDSKHnA/MW4=;
        b=k4nBO8Ckunfgr4PGZitYLu06cIihl9ZtzuLTFPqNowzcafI9W60l+hX/a3+JTGyk41
         cZBmdZ8CzMPJe+R5sDE1i4y8LbQfxBVBNC+gDtyu2KdaqgJrxjJirhdV1+oobUvC7b/A
         Ul/DqZXhdidyBoJSF5hFJxuY4PSHx193xhrAqD4eQklyVVb5/oCzJ91ep154Bven5hNc
         WkzqCSSBFAGwtkwGGDBEoipMpU9B9vaLytPREsJYuIP/GASVh4Oob1BYzjf7iiBJd/2j
         KCgk+1/fCDlGBaNJWMghgKi3ueFP5uKnJ5J+NV/zAvT5UBhj9il9b6jD/keA/1IMcXL4
         SLbw==
X-Gm-Message-State: AOAM531a30t5XKzxCHkibAGoJYj7mj/Z7SVC4/2xUQTzJ1LtDJDaPvXz
        pjh/4HrMxXzPAsl89ep76LKGM9kxHW8=
X-Google-Smtp-Source: ABdhPJx+b5mvVb0y2E62nq3IUUFpWuFaRNbXBK9Uf6lqB03vIuZ1pog0GVnbjaipZRvULXIifoMh2w==
X-Received: by 2002:a17:90b:4c8b:: with SMTP id my11mr2426792pjb.153.1592555009235;
        Fri, 19 Jun 2020 01:23:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f6sm5647145pfe.174.2020.06.19.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 01:23:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1592486051-22256-1-git-send-email-mkshah@codeaurora.org>
References: <1592486051-22256-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Date:   Fri, 19 Jun 2020 01:23:27 -0700
Message-ID: <159255500790.62212.11790974984337702896@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-06-18 06:14:11)
> Use __fill_rpmh_msg API during rpmh_write(). This allows to
> remove duplication of code in error checking, copying commands
> and setting message state.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index f2b5b46c..a0a0b97 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -181,8 +181,6 @@ static int __rpmh_write(const struct device *dev, enu=
m rpmh_state state,
>         struct cache_req *req;
>         int i;
> =20
> -       rpm_msg->msg.state =3D state;
> -
>         /* Cache the request in our store and link the payload */
>         for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
>                 req =3D cache_rpm_request(ctrlr, state, &rpm_msg->msg.cmd=
s[i]);
> @@ -190,8 +188,6 @@ static int __rpmh_write(const struct device *dev, enu=
m rpmh_state state,
>                         return PTR_ERR(req);
>         }
> =20
> -       rpm_msg->msg.state =3D state;
> -
>         if (state =3D=3D RPMH_ACTIVE_ONLY_STATE) {
>                 WARN_ON(irqs_disabled());
>                 ret =3D rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg-=
>msg);

Were these two hunks just nonsense assignments to rpm_msg->msg.state?

> @@ -268,11 +264,9 @@ int rpmh_write(const struct device *dev, enum rpmh_s=
tate state,
>         DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
>         int ret;
> =20
> -       if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
> -               return -EINVAL;
> -
> -       memcpy(rpm_msg.cmd, cmd, n * sizeof(*cmd));
> -       rpm_msg.msg.num_cmds =3D n;
> +       ret =3D __fill_rpmh_msg(&rpm_msg, state, cmd, n);
> +       if (ret)
> +               return ret;

This part makes sense and is discussed in the commit text.
