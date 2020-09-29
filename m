Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AEC27B8A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 02:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgI2AMC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 20:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgI2AMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 20:12:02 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF039C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 17:12:00 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so2343075pgl.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 17:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=oqWyH6KVz5GIgpx9XiQ64/ocouDLY41IiN7VadeGWLY=;
        b=Hm7mijcf4yTe2S04g2+xRURW1lE1jbPN3E3nOMLrSEei6s4g6gKBOEdcu9tYXNqCPa
         Wj+U5w2mOsd0BDZsyYLCChOLht0aFCuDGSnPiBYMMM/r4zsP03KjZYNNlN7uQ96zWTrP
         jxYeTZ3biQA3MY34GNhI7u3zESWw7RpIq/030=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=oqWyH6KVz5GIgpx9XiQ64/ocouDLY41IiN7VadeGWLY=;
        b=P8/wdIKFqtGQE7Zhx9KggrQ77zMvcR1DVYbh2zej8oOaWQtCFwEyyVsOxeEkE0CHjS
         MjE4jCA8gIN26C0+X5PfqxRTDzROs3xYkfp+ilO4wf/EpaI+CAair0ZxugenkAotxhO0
         WHjbqH1OX4TNzpFGeZOgz9kgLGPKzKCbBVxaokQzTanA+jSWrvYCOKhn3Xvym1RVqy2l
         1Ro+BAC6PAo74zFfXt9AbRQao4aKymAkWTU2Pwk+ubnUQT919yY1oWIVAJlHQJT91KEv
         elvWz8jUnLWVG9PA1KPUCwz4jj60Dw22pXb2omt7D7+Z0tdosy8wNNm0YHX50X0u92Ey
         niTg==
X-Gm-Message-State: AOAM533IAZmkYI02UhoTriUF8rQCEVZOBYNPhg8doYSYv0o6eONFLuVt
        43PaJ4jOS/SvwBGEaFuKTLhqgA==
X-Google-Smtp-Source: ABdhPJxVVfU0xg3mWqPJAhBF+FuRzxs4/X7TUAoQRVTfy3Sk1faTdz1q8IeeLCSnhuuFYPzSneX8cQ==
X-Received: by 2002:a05:6a00:2283:b029:142:2501:35e0 with SMTP id f3-20020a056a002283b0290142250135e0mr1668976pfe.64.1601338320155;
        Mon, 28 Sep 2020 17:12:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l5sm117304pjt.33.2020.09.28.17.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 17:11:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200926203454.13643-1-khsieh@codeaurora.org>
References: <20200926203454.13643-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: return correct connection status after suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Mon, 28 Sep 2020 17:11:58 -0700
Message-ID: <160133831826.310579.7427870479947629849@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-09-26 13:34:54)
> At dp_pm_resume, reinitialize both dp host controller and hpd block

dp_pm_resume()

> so that hpd connection can be detected at realtime by reading hpd state
> status register. Also hpd plug interrupt can be generated accordingly.

Can you describe more here? The subject says "return correct connection
status after suspend" so it seems that suspend connection status is
broken. How is it broken? What can be done to see if it is broken? I
think you can suspend, disconnect the DP cable, and then resume and see
that the device is connected still?

What does "hpd plug interrupt can be generated accordingly" mean? Is the
interrupt not being generated?

>=20
> Changes in v2:
> -- use container_of to cast correct dp_display_private pointer
>    at both dp_pm_suspend and dp_pm_resume.
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Any Fixes tag?

> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp=
/dp_catalog.c
> index b15b4ce4ba35..63c5ada34c21 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -572,6 +572,19 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *d=
p_catalog)
>         dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
>  }
> =20
> +u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog =3D container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +       u32 status =3D 0;

We don't need to assign to 0 to reassign immediately after.

> +
> +       status =3D dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> +       status >>=3D DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
> +       status &=3D DP_DP_HPD_STATE_STATUS_BITS_MASK;
> +
> +       return status;
> +}
> +
>  u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog)
>  {
>         struct dp_catalog_private *catalog =3D container_of(dp_catalog,
