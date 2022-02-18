Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAAA4BC2E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 00:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239840AbiBRXik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 18:38:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235291AbiBRXij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 18:38:39 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5080827B489
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 15:38:22 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id p206-20020a4a2fd7000000b0031bfec11983so5417401oop.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 15:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=WD8tzmr6Gc9xsM6o0zTpMsmg98gwrdEpXYMfSuQzvAE=;
        b=hWsgHxEOfsPtol+MTw/rQABiw/ogBt1NwqQlWjDJv7a013wO74pb+pbnxCFW2zfd1K
         PmzdI+PK5juqzHzxuvZmWAUZJREUKpFwmttobU5iJIeSp1kgkJuSbiBntnMrdxDvv2cY
         Gvi3pvDFnGuRze/95TfSLSnvcLnTaAStKv9W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=WD8tzmr6Gc9xsM6o0zTpMsmg98gwrdEpXYMfSuQzvAE=;
        b=s/IjMaN8mZzswzF8riNmu7aFswVqTskF6bjNmAdA++YcjMe7jjNA2cofivt5hBY77i
         dkjbFji7O0B2cfcWXjISOTXtvTW2pbTwTIeMY+q/Ts+mn6WLkJg6uI8tuDDyzMfTHCY7
         n1nwwevRtBEUsZDZKlsAs0xu+c/hr+7LGm5DXO3KPQxCJ/XYlEGy6G/oyZA7LUfeJm5Z
         Tiioe0TiJcJ1Us2SfjEBNO24fPdoQI22nxb4X1d8G4O2jYFbToyiAAa7sItTiL7WskXv
         NQ3tH/L3u7PEpGRbcw0vCOFK3YsGBmZZYik1z4XMGYfow/4Dq2SDZFNH3+MIxgMAkZzQ
         bEuA==
X-Gm-Message-State: AOAM5306958zBtQcEuLQdfHEEwcyOqLpldogAfOuw3MJ6v8bPj1c8DP4
        CXiSdMgZJOPQamESU6o7rJCVOyEw1nPaxb8UCVgtRR89Oow=
X-Google-Smtp-Source: ABdhPJwdEQkxvsrBJbSY1CMQPrS2Bi29H8PeVBXyD3lU7f86Fon+eR4moQmyWhKCWzgrx9JyZAlY6Y8pppO2vSFC+6k=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3644761oao.8.1645227501635; Fri, 18 Feb
 2022 15:38:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 15:38:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org> <20220211224006.1797846-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 15:38:21 -0800
Message-ID: <CAE-0n52EDHg8=W36SE_pKWmmvq4-2y6KLMQMdwLSU4h5pOHwOA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] drm/msm/dp: support attaching bridges to the
 DP encoder
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-11 14:40:03)
> Currently DP driver will allocate panel bridge for eDP panels. This
> supports only the following topology:
>
> - eDP encoder =E2=87=92 eDP panel (wrapped using panel-bridge)
>
> Simplify this code to just check if there is any next bridge in the
> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> field to next_bridge accordingly.
>
> This allows one to use e.g. one of the following display topologies:
>
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 fixed LVDS panel
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 LVDS connector with EDID lines =
for panel autodetect
> - eDP encoder =E2=87=92 ptn3460 =E2=87=92 THC63LVD1024 =E2=87=92 DPI pane=
l.
> - eDP encoder =E2=87=92 LT8912 =E2=87=92 DSI panel
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
