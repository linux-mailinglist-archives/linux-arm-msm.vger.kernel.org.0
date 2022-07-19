Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9235457A4BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 19:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238311AbiGSRNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 13:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbiGSRNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 13:13:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31874F1A3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ez10so28378397ejc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
        b=BuVirQTZTwxHB7H87FJWiywTqDnGatrkPQzw5UHbCPG2g8CTgDMoTYPzdXmc1KYSZA
         zTy3rNxK9hcEWlZ37iUIdgAYI3gp5P0kewuDync6JAXMK25mV3f/+c+smo9PEExXg/f5
         x+Il1343dGqjFsDeOlWvHyG+n+V8E0fgXrD8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MNb0V6j3qPMABdJqAwbj58qIBpWCdI7aPTD3FNarXk=;
        b=1+nMje1rIQ2rgNV1JnQS3YlwTLMeqYERZlYAbucE39WSRzxPnwxwp2fUl0ZXL9zSgW
         7Rb7B78BACOZ78FMPOK3WUxwBIp6VBbaDqOFac+Wxnk10LPwJzlQ9bKy2lRRRAwHmQF/
         vScKXWzkJu6Aa8kLgpBhQs7n4lPRlPnJTg4pQ2RGCDFRlT8eooedFEFIT/r7pc2Qe7K5
         COJqQgyQ5BAi1rmgsCVJG1cVuvdIeapWpJnOwfBIUoL437jbAeTmrWWUkkUb97S0Mk3Y
         bC36lQXGYFd2UOq6u++jqiIqa6Q/mSOJONuIUtX3B/5efnl4m18E8wFnArU91mC/xbKJ
         WkEw==
X-Gm-Message-State: AJIora+CIkpohTYwvkQ6+iOStPM215N/NYzJEtUJkn+6zduk8f33sLGr
        8R6XzYyO5R5/S0mvI2C1ckor8f5+/Xf471e0
X-Google-Smtp-Source: AGRyM1u73KBLJHAhRElDx5c3ng/3wOT1qLCpEPu2kWiJEh5KVjFI8k/K0nRYCd98EPxGnGUTQdUF3A==
X-Received: by 2002:a17:906:7308:b0:72f:3294:8001 with SMTP id di8-20020a170906730800b0072f32948001mr10163470ejc.254.1658250778420;
        Tue, 19 Jul 2022 10:12:58 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00724261b592esm6808864ejb.186.2022.07.19.10.12.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 10:12:56 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id d16so22560195wrv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:55 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr27615443wrr.583.1658250775011; Tue, 19
 Jul 2022 10:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org> <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
In-Reply-To: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Jul 2022 10:12:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
Message-ID: <CAD=FV=UZN6SrybRt3_DRHsRYg=-yi9w++NPAtjtGHvzuyW6y7A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 10:23 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Now as the driver does not depend on pdata->connector, add support for
> > attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
>
>  This has been on my list of annoyances for quite some time now. Most
> excellent to have it fixed, thanks!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Tested together with patch #1.
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
>
> Unless someone yells that there's a problem or someone beats me to it,
> I'll plan to land in drm-misc-next sometime next week.

Landed on drm-misc-next:

6e2dc7ac7141 drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
