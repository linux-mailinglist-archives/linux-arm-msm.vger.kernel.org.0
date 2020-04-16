Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58AE1AD37D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 01:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgDPX7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 19:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725770AbgDPX7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 19:59:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49968C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 16:59:00 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so244452plq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 16:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FLWZq8AE4gZ7QviLVtSYRyebpAMt/+sMwOVeXrCKpEQ=;
        b=b+6VDpJQbgNfJbl+SSfpjwemQsFrkixSTJALMx4v7dWF3H8eAevcS4Mr0g7DIVi+v7
         v2Sc5SgvZn3LAkCtxandNCI3xu/LOqj/kClcpDWly3f9B8LJ5+e6EBMyYAwSxLndkyhp
         AVZPQ0AyosSCY8c8E/RvSJm4BvvLdYIfY5uuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FLWZq8AE4gZ7QviLVtSYRyebpAMt/+sMwOVeXrCKpEQ=;
        b=HP+BnJtVkt1+JZoSKomJvHbp8ldYL2b6Sc+HuNXr9fqincU5T53wenRaYwQJsDcqli
         TN7K9HVaVW5COhtZ1iMqkrcv/6S+H3U53kWoTyH8l5JO03o1vkK1O0NPnLE+MQQ+4QDw
         mIg85IrbwaAyYUDkdtZJzhav44f2S75l1W1NF5Dyafy24EpHoIBpTLAimAD9XUJk1fKQ
         dBas6HAE5EDiUEdXhq3/JwEgs16OFEzVp4XgiemY2FWy8+byM40J+10Jw5uX4EMclMf+
         vpVGs0YejuhTyP80YlOID4E1U4LequPPJO5ctodoVkS7FlCcsBYUH94tlVoo1wZkZM+L
         g9ig==
X-Gm-Message-State: AGi0PuYOdJD2uz+82FTvWsRHycpdwny3x3ODSDZ4Zx01LDgz9/0Qzbps
        7HI1yOGFNCN7nrovkXoLpasE2A==
X-Google-Smtp-Source: APiQypL9DkzbkP69P/kl5Tvz4PJpFH1vGa4D1NY1hvSZZ95YX+Y0YPx0Ny7lJfrxucut0r6NEGPh2Q==
X-Received: by 2002:a17:90a:19ca:: with SMTP id 10mr1063701pjj.23.1587081539567;
        Thu, 16 Apr 2020 16:58:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p1sm3675780pjr.40.2020.04.16.16.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 16:58:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1586703004-13674-3-git-send-email-mkshah@codeaurora.org>
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org> <1586703004-13674-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v17 2/6] soc: qcom: rpmh: Update dirty flag only when data changes
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Date:   Thu, 16 Apr 2020 16:58:57 -0700
Message-ID: <158708153779.132238.7823999141480422982@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-12 07:50:00)
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index eb0ded0..03630ae 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -133,26 +134,27 @@ static struct cache_req *cache_rpm_request(struct r=
pmh_ctrlr *ctrlr,
> =20
>         req->addr =3D cmd->addr;
>         req->sleep_val =3D req->wake_val =3D UINT_MAX;
> -       INIT_LIST_HEAD(&req->list);
>         list_add_tail(&req->list, &ctrlr->cache);
> =20
>  existing:
> +       old_sleep_val =3D req->sleep_val;
> +       old_wake_val =3D req->wake_val;
> +
>         switch (state) {
>         case RPMH_ACTIVE_ONLY_STATE:
> -               if (req->sleep_val !=3D UINT_MAX)
> -                       req->wake_val =3D cmd->data;
> -               break;
>         case RPMH_WAKE_ONLY_STATE:
>                 req->wake_val =3D cmd->data;
>                 break;
>         case RPMH_SLEEP_STATE:
>                 req->sleep_val =3D cmd->data;
>                 break;
> -       default:
> -               break;
>         }
> =20
> -       ctrlr->dirty =3D true;
> +       ctrlr->dirty =3D (req->sleep_val !=3D old_sleep_val ||
> +                       req->wake_val !=3D old_wake_val) &&
> +                       req->sleep_val !=3D UINT_MAX &&
> +                       req->wake_val !=3D UINT_MAX;

Can this change ctrl->dirty from true to false? I'm worried that we need
to make this a saturating assignment instead of an assignment.

	ctrl->dirty =3D ctrl->dirty || (req->sleep_val !=3D .. );

> +
>  unlock:
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>
