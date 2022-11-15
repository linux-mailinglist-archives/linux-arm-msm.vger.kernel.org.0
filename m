Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3A1629E54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 17:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKOQB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 11:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiKOQB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 11:01:29 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3062BD5C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 08:01:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id s5so6303288edc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
        b=XSZ1UsKd72WGVsU13AkxPx13kvV7eBMN2rk9mYv5/1BlvJuWdPfmvCjHqGY1YHuX1S
         ZKcO4QYOE4Wc2+/sm0oCJqKm0mbgDpEta1QZXmLqmoik9/WEh1cA5d8rjRXkfeZwUrS2
         t1agO5hRMm5K5WuuenC90gkUkRgs3BSOw1BPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
        b=ZaaPhZAA4qK2rTDXi53o8h7cC1bWZW18rS4woqO5RS7BfKOKTqXfxot8L9XVZW3i3w
         jIF/it8O1WSbSfYVCOfAExYbfgnXfWnC7JJV+1EH/mBNg5ub6HFvcDYeFb15QeMdkRm4
         AWv88F6wTcP/LZobP47BlEQ8vliXIstayint0x4tMPP1ekmEjKTDpB91sWG0gfVLlnhL
         RyVWzXrxCuHrqNdRbhZocYRRkOcvIyc6bFXLxg0hbICYrXyVDVVA+UARcyRK1u2WTOpX
         A+asqsBSmHds5ARkeIHMmVF/7+j2JU0HvkaPrl0WFV0Z9U2VnpRQzIP/XajI+hCZk7CL
         VT4A==
X-Gm-Message-State: ANoB5plTagQebsSAvuDsSPXy6v7f8UzHWFFAHWqhKyzCOujz7UG8u9NB
        8I4ue1KvsmHWszWliQHfbVHxjbACp27DKMeG
X-Google-Smtp-Source: AA0mqf4h24CGDob9i0IQbAv1vSSY6dJlPHzB0ovRNfb8c78eED8jDuBnnA1zojw1vshPEQ+ZPKC/Ww==
X-Received: by 2002:a05:6402:e8a:b0:463:53c6:56a5 with SMTP id h10-20020a0564020e8a00b0046353c656a5mr15476681eda.223.1668528086310;
        Tue, 15 Nov 2022 08:01:26 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id t23-20020aa7d717000000b0046800749670sm2409337edq.53.2022.11.15.08.01.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 08:01:25 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id z14so24898549wrn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 08:01:24 -0800 (PST)
X-Received: by 2002:adf:f145:0:b0:236:5270:735e with SMTP id
 y5-20020adff145000000b002365270735emr10938918wro.659.1668528084437; Tue, 15
 Nov 2022 08:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20221115155535.1615278-1-robdclark@gmail.com>
In-Reply-To: <20221115155535.1615278-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Nov 2022 08:01:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Enable clamp_to_idle for 7c3
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 15, 2022 at 7:55 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was overlooked.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
