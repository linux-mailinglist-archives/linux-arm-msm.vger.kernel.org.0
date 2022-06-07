Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054C053FF8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 14:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiFGM7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 08:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244337AbiFGM7F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 08:59:05 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B86D4A3DD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 05:59:00 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gd1so15597142pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDtXYp3fqP9C71L4lDk/xlr3jxWkEpVJr+KnqNG4y7E=;
        b=K90qEHu0azHSHu2mOI/stRPDYrcuxcyCEFw1AMnirN2f0G71zutWWNnloA3GlxvQOQ
         xWsKraE+lZ25HczKKrKK7w2x9n7xuENo0TxW2z4j70T/UwwmhNHpZI2wunLzRrHhuADb
         4QvAomrTpPbwCIdUKPVGJYM7iypuonqnEdl1KPR/zIem+WdbqnNMyqnwOcDPRacshMsS
         iFhaVVvSgJ22oqgR+eqo+o1C8baqY6byzkiZHEehP3uc5RcO7tBiR2TSAzG2QWKezj1O
         ewjI2VXumahjBGKRs7NjofsnyPK1BKNc2WSiztSudBdoqAoj7+JTV43OfoLfy3nHVV0A
         7LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDtXYp3fqP9C71L4lDk/xlr3jxWkEpVJr+KnqNG4y7E=;
        b=YYYNDbLeHPvmnYiqfeyy40lw0H2CrDg+NFunA1CGySL8Ttt1QEdcz+FzKA5qnyZONm
         3ROuTCnqMjpMQb+rRIhuJkEES9dHWbxqntRY0YoB2jVuPUnxe63BlNnO8mW648H61oIq
         KZsx0hnwrAniQs5cibjFafKMZllWN0bpQkBXgcWWzcLRorOfRwDe5yCLUMxDF5NGnpI2
         3KpUBWrRnK5tMQRk+5VmT8Y/FjznSC1I29MC5LRFTYBAq7zaFXahhbL1kRMp5zGpd3Tg
         Qj5xtJpq9DsUR/HtCouf1mHgu6KmD38WjNTzo3DRXZeXEibX0qAtjFZ3MNJ7JTbwxL4Q
         QX3Q==
X-Gm-Message-State: AOAM531yZRb2P5Icfx544AEd6DpLWo9oTALKjjgrP6XOn/pPuRAowJtM
        W6Hok/PA6+oZDOMhEVKHS7oe1+bXabyedFcowozEaw==
X-Google-Smtp-Source: ABdhPJzcJQafpZkJeNY+yifsfYjttv26Nfb/21vVes5wyxo2mbx6fcRcdIFZS6FHMfgvoZV/ItHhisempzlmgAMrG4E=
X-Received: by 2002:a17:902:f353:b0:167:7bc1:b1b9 with SMTP id
 q19-20020a170902f35300b001677bc1b1b9mr10880509ple.117.1654606739759; Tue, 07
 Jun 2022 05:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220601233818.1877963-1-bjorn.andersson@linaro.org> <3e51df22-5747-7536-257a-77d279c57254@baylibre.com>
In-Reply-To: <3e51df22-5747-7536-257a-77d279c57254@baylibre.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 7 Jun 2022 14:58:48 +0200
Message-ID: <CAG3jFyuvW2ZHRZ4AgMe8k88fOnkxNLXfxR2hC_X6t_P9TA=HJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Cancel only driver's work
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Jun 2022 at 14:32, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 02/06/2022 01:38, Bjorn Andersson wrote:
> > During device remove care needs to be taken that no work is pending
> > before it removes the underlying DRM bridge etc, but this can be done on
> > the specific work rather than waiting for the flush of the system-wide
> > workqueue.
> >
> > Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 3d62e6bf6892..310b3b194491 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -982,7 +982,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
> >       struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
> >
> >       disable_irq(client->irq);
> > -     flush_scheduled_work();
> > +     cancel_work_sync(&lt9611uxc->work);
> >       lt9611uxc_audio_exit(lt9611uxc);
> >       drm_bridge_remove(&lt9611uxc->bridge);
> >
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to drm-misc-next.
