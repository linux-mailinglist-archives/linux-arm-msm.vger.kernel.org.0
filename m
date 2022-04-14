Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48534501979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 19:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243092AbiDNREj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 13:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243462AbiDNREN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 13:04:13 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B466CAFADA
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v4so7083796edl.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
        b=N693k4tshoimUMR7PJSOzCwUrqo6jmdbynTTZ5/gGXiI4BUH5YFaTyhChlD1qYPwIv
         Kh7ugHtuZ2uky5ruCQ6mniUIioKbVQxsbZ/Rnh06noLFOOH9Mi+acFsRtex2XGvkaG4R
         Q3VlTKcErFU8W0iVIIxODoppOuI9yIftPOgPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zX+0Rp8KeI1bu36+dWYbiIQtitTDuR4Sdzxg17DTCMM=;
        b=PV6lBSqTJvCHxmdjjwIIztwoiDM8yo4CggBWY0L982eZVNkpc/qjTehJY2x0Us21Dw
         uEeOOR1ut4YjeQwzUm6kvUY+T2g26209EEEDPWW1t6pY6e/Sa4oGAggv5brPFaeD+4bH
         kNWGDQzmNtL8eUEQoVXmao1KWj+ZzLSWxavfat6J4TOQCgBTXbHm9294iadAHl93EwQ+
         LKewaZEEJy/axGkNfO8ingurGUqVvAIlYez8wUnNEzqOUT+l7shH4JoM1/mMYTCJ/q7G
         KHnXce9yRKE3hXPtGUUO14/1tzx4evee7gTFZKnc84tA/W3Lcd/rS6nbZiWtP6N0SkQR
         6teA==
X-Gm-Message-State: AOAM530w4Z5lvhVmIILChWMBfjorkbZKSk6Fuc6fDYmPoYGIkrTsRQv/
        VaP/exTOnT+HSUaan25fZxuxDpvZ2hWgDlEl
X-Google-Smtp-Source: ABdhPJzrfyiYnxTcKomkjO3JAXDNnhFzqkG3h4j9hnqA22Cz/jXSwJlhOAfRZTPGVc4oUreGg2FKPQ==
X-Received: by 2002:a05:6402:4499:b0:41d:7e83:8565 with SMTP id er25-20020a056402449900b0041d7e838565mr3978258edb.332.1649954433055;
        Thu, 14 Apr 2022 09:40:33 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id g2-20020a50bf42000000b0041cc5233252sm1264024edk.57.2022.04.14.09.40.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 09:40:30 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id c10so7729291wrb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 09:40:29 -0700 (PDT)
X-Received: by 2002:a5d:47cf:0:b0:207:ac31:c2ce with SMTP id
 o15-20020a5d47cf000000b00207ac31c2cemr2734623wrc.422.1649954428907; Thu, 14
 Apr 2022 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Apr 2022 09:40:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Message-ID: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add support for the eDP panel over aux_bus
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> This series adds support for generic eDP panel over aux_bus.
>
> These changes are dependent on the following series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*

You're basically depending on the last two patches of that series.
What's the plan there? In patchwork they're marked as "Not
Applicable". If they're good to go, maybe we should land them? If not,
maybe you should include them (with Dmitry as the author, of course)
at the beginning of your series?


> Sankeerth Billakanti (4):
>   drm/msm/dp: Add eDP support via aux_bus
>   drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>   drm/msm/dp: wait for hpd high before aux transaction
>   Support the eDP modes given by panel

One of these things is not like the others. One of these things just
doesn't belong. Can you spot which patch is missing the prefix by
looking at the subject line of all 4 patches? ;-)
