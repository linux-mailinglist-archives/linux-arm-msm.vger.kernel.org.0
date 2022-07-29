Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADD45848F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 02:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbiG2ASw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 20:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbiG2ASs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 20:18:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C9779EC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v17so4083815edc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
        b=XgGvjKM+Hr42e4KmwAK3a1argfHnnskNbRdLej5zKrxwQdZsp8y8yMpZaRkfb6IxQr
         C8PRTgOCkSzXDctTwt3AbbUt42+nPjnl1Ik5fW1fT+au0znVnOZDXvJpfPbucVm4Bv+n
         ty8qUI1gfDrvRlxRV1sm3ItakjLTxp6xy+YLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DEDxzOgHTQRQ+rvv/SEM8DOqN9V3eUaGY5hH+UtkIUE=;
        b=3DXeOLimZ+DzYR6K5dniGs6FV14UCpqLUjzlhYi1jcvLlowGglinqMBBr2LUecTSM4
         71UMQvGeEEJNFsGRkcv4ZQXDsYBeREOPuyWVohNhOjBlO9TK1s2BQMLIn6Owwan6vl7d
         z7tooktzJONpHIlK9ObAPGzmU5iIjzn9qdVtmPaK009WTri7FpdcsEc17hNwG3mzy08f
         iuXLdFfcBRqHaR2cNd4QLOvlJ9RMIiZJ0sgDQ6GTtUH44xCZlGYZlLf+CPVs/R7B+FXY
         rlPs3xCsFCPpwOPBbyPBfwB9UrP9QU8u5UIEwNmmgQVEdQG9bigHGyCO8UrGggNXqtEF
         Toxg==
X-Gm-Message-State: AJIora86qoAnFlzZJY2s1e54oHLzPC5ikmF3SUPKk3E/9tR7lwc746ho
        N9k6MsAGfemLSpwoFbp7DxdjSpKfYn5A5l9D
X-Google-Smtp-Source: AGRyM1s+urzZhnm+V+czLaVo5ch2Y6OqmD1DrYyA+GEPzOXEatTmVfFXfu7uPFGdpxKbc/I7C/gpQg==
X-Received: by 2002:a05:6402:1e95:b0:437:ce7f:e17a with SMTP id f21-20020a0564021e9500b00437ce7fe17amr1232033edf.169.1659053925643;
        Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id w6-20020a1709064a0600b0072aa38d768esm964454eju.64.2022.07.28.17.18.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso1786997wmq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 17:18:45 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr1007498wmf.188.1659053924819; Thu, 28
 Jul 2022 17:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com> <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Jul 2022 17:18:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
Message-ID: <CAD=FV=UXKHrp63wosBdXDBKKcierbgfUOT-W1QF2N23No+MJBw@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] drm/msm/dp: use atomic callbacks for DP bridge ops
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Use atomic variants for DP bridge callback functions so that
> the atomic state can be accessed in the interface drivers.
> The atomic state will help the driver find out if the display
> is in self refresh state.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ++++++---
>  3 files changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
