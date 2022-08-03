Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D222588E22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 16:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbiHCOA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 10:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238466AbiHCOA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 10:00:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A3C7644
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 07:00:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id c24so874677ejd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
        b=Pm+xw36k75MgbBYWtIlvzPVrEx1sxmMi8PhC7QjORA4TpioAt1Y653gXwcZnqM9GAJ
         uRV1XrvItB7XOV23G8z6Tztth/UWRNpO9yBmRRYZxXJI+jL2XiuM4cAujb2TzKuEofAQ
         AScoKYAzpWNkClXatjzcWb6M+Nhj0lckjKEBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
        b=TJjjUxRcaSzhOxg1q7epPkl2M3Y4rJ8mJ9LG9MyblwqPao4RL+P1BxFdMGD4xMcLmn
         ghSimROPPoTuC0hUet+3900+IjZOCqQmCvF4x7htsr++NQn91wuMxwkvrAryvVCGFj0T
         InViGfBzZJPU3XchQ5sgQqj2G45FqvM03cgKjwgeglpxUTIxpJIlsBc+9/G07GMFKRUy
         YGMAdR1TTfc3yb1CYHDA1wpINPES+Lu8bF9ENpFkRn25qk0i9UvXLr6CZne6A191usMK
         z1d4se8RlDT1rsh9QICyuaUI6D3iEGWPfzf9ICHJI9XHs53Aw7WpTLAa6MgQMrNm87r0
         9w2A==
X-Gm-Message-State: ACgBeo0xVxFtVClIkvYl9t+PP6dIMAXu+r3R2xtZPQ7TcHnDLi1IhFCx
        QyvCnqkedZ517QVgpdAEEuOXz++A6Ae0sTdVyBg=
X-Google-Smtp-Source: AA6agR64FrUW/ixYdowLYavMDS3G6mwNG+wmm/2NNcpfc6hxhpwMny8adHKXeDzOjVrqUCrrzw2ucQ==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id ga13-20020a1709070c0d00b00730a85d8300mr4572805ejc.558.1659535223114;
        Wed, 03 Aug 2022 07:00:23 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id q23-20020aa7cc17000000b0043d0955d546sm8753522edt.69.2022.08.03.07.00.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 07:00:22 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id c22so8762448wmr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 07:00:22 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr2974636wmg.57.1659534836576; Wed, 03 Aug
 2022 06:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid> <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
In-Reply-To: <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 3 Aug 2022 06:53:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 3, 2022 at 12:19 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of the commit 1de452a0edda ("regulator: core: Allow drivers to
> > define their init data as const") we no longer need to do copying of
> > regulator bulk data from initdata to something dynamic. Let's take
> > advantage of that.
> >
> > In addition to saving some code, this also moves us to using
> > ARRAY_SIZE() to specify how many regulators we have which is less
> > error prone.
> >
> > This gets rid of some layers of wrappers which makes it obvious that
> > we can get rid of an extra error print.
> > devm_regulator_bulk_get_const() prints errors for you so you don't
> > need an extra layer of printing.
> >
> > In all cases here I have preserved the old settings without any
> > investigation about whether the loads being set are sensible. In the
> > cases of some of the PHYs if several PHYs in the same file used
> > exactly the same settings I had them point to the same data structure.
> >
> > NOTE: Though I haven't done the math, this is likely an overall
> > savings in terms of "static const" data. We previously always
> > allocated space for 8 supplies. Each of these supplies took up 36
> > bytes of data (32 for name, 4 for an int).
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Ah, so to array conversion is already done. That's great.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > ---
> >
> > Changes in v3:
> > - Do all the PHYs too.
>
> It would have been easier if DSI and DSI PHY were split to separate patches.

One of the earlier patches in the series (where we remove the
"disable" load) was harder to split since the DSI and DSI PHY code was
sharing a single data structure. Once I had one patch touching both at
the same time I figured I'd keep them all like that. If you need me to
rework them to be separate patches to make it easier to land then
please yell. Otherwise I'll assume it's OK.

-Doug
