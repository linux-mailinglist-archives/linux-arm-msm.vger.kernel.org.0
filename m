Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14CD57A4B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 19:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238375AbiGSRMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 13:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238246AbiGSRMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 13:12:19 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ED74F186
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:19 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id e15so20528825edj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
        b=ZQAX4R3A2RP5ePI8X1wnZBz/yY9Fp4N+5ElluUKxbZOSaqGLZi45cpgYwxewdTyBjy
         AtH3jrlwrayMjKxZMhtnAc4zgKV0KMlAX86PQ6qAz0sCIUIfKuP0ghevIzpbzJB2z2+g
         MeKjSieefdGX983+e3xeaMqLcqpDFdtvWZJvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
        b=rpDnWtMQyzpibGzLSq1wWKpcsq2WlhbG0V5aoZ071cXkC6S6usU/6RNoSIlIdkYc0u
         zMNNGxL2xlmFjlB9f5TT82RAI9gK5nCRknAxhEtcoXo1I/vWcUpFLIW9E8y+Q/GV+Cv1
         g0UdWaEMgZ7lREfYcjzGnaLc1Y5+TBYubDbPEwzoYu03Hkoo1WxFL7arOG2oPFYIsRHA
         rc1Ewp/r1QgoMl2GaucenxH7RBEpYH1Gw7l/3wcABY3ux2T5N7yb7n+DX4/JUOz6p4ML
         OdHSk/cGAlsUSMXphHxh49rmBuCsGVfvDvjWZ9baqoL7KjnJ7Xrhszhvfuj+wldRqsHc
         i5qw==
X-Gm-Message-State: AJIora+je1a39Yl7fLCLda+lFE3xoqKa0NO+QZicbNIEvjCC0d+/4XY9
        BsNyXRYY5DD5nz9gUcNDOSGwOw1QADZi003h
X-Google-Smtp-Source: AGRyM1u9lqNPHuo5gzFIUOPD1zD0wTDGDWy+M0/FQpK6pRjoDBSZJx3e7FLPMjbTJCx9U+k5kztLpQ==
X-Received: by 2002:a05:6402:2788:b0:43a:e0aa:97f4 with SMTP id b8-20020a056402278800b0043ae0aa97f4mr44337405ede.329.1658250737513;
        Tue, 19 Jul 2022 10:12:17 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709063cb200b00722f069fd40sm6854661ejh.159.2022.07.19.10.12.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 10:12:16 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id r1-20020a05600c35c100b003a326685e7cso812421wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 10:12:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr277678wms.57.1658250734635; Tue, 19 Jul
 2022 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org> <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Jul 2022 10:12:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
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

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Landed on drm-misc-next:

2dbeef82d14f drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
