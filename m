Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D9950BCA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 18:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353308AbiDVQNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 12:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbiDVQNr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 12:13:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0135BE78
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:10:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id lc2so17247644ejb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
        b=oY3R9eMENeA4yFgfxxAh0CIL63NfU/4cQZy0VBfnWqdkaQCrjP1OSsrzairEuqTc8h
         dCnx5NBV16wwOh8IExGkxkRthS5yV1+uEB61rOzpqQGfyzUlUPRRrILpKog4hvbptgGe
         HyH8ZzQX9V8+aRsclZdqqy2LK9aUqTNtjPWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
        b=jD0z1iJ5uWXdK3IRtBNIyydPqVob+t57sKjX+2+tS6r81Y5H0SOWFCX6kSPROdKjDz
         +7yzduWK96BNPFQr46IjRwllQ07FZJyVMXncM/V0q+VihxTFelKF6NZH/q4dSC/+D3zT
         OpQPISKoewUsOV3Uhk28lXzs8vco03kj4AzoqhqnMvBpFatdOZZnWsxvR5ieTd1r05Y8
         kSAij/+Bx1e69XiMKh2CkfOxny1UmhjNkQyyfPTzVuir1jDI+A8xm65o15h2iTkYbxZM
         0G/Tf3ID7A0CkFFz+PK4e1qkSw+XlkGX7Z7fxx6hJr30Xxw/Bc+iCN1Gcdsj5iEHPRAv
         HDKA==
X-Gm-Message-State: AOAM5314Xy8bDR7Ve/sXSnq3HO585ujV/5PEK1/pffSgijK53tqqe66w
        3aOwURtFZZHNYG1Wvt7Y6anFRqMgQNpRDnlBSxA=
X-Google-Smtp-Source: ABdhPJytmqbH08JpUjHjifAy0J+uQVISiEL/brxiLytuokxRBURSZAaIsMNISLKPSVffSG91eNqrCg==
X-Received: by 2002:a17:906:5811:b0:6e8:47dd:c55d with SMTP id m17-20020a170906581100b006e847ddc55dmr4824699ejq.191.1650643851967;
        Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b006e0d13f65e5sm885484ejc.167.2022.04.22.09.10.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id x18so11793220wrc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr4418755wra.422.1650643850709; Fri, 22
 Apr 2022 09:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com> <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
In-Reply-To: <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Apr 2022 09:10:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 22, 2022 at 9:05 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> For the lockdep error, the splat looks similar to what kuogee fixed
> recently.
>
> Can you please check if below patch is present in your tree?
>
> https://patchwork.freedesktop.org/patch/481396/

Indeed I did have that in my tree already, but the lockdep splat is
still there. I think the problem is that we're now calling
dp_hpd_plug_handle() directly in dp_bridge_enable()

-Doug
