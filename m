Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD93D76D6DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 20:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjHBS1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 14:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjHBS07 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 14:26:59 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EC11717
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 11:26:58 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d299ed34bacso1813835276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691000817; x=1691605617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2kycR0Rej9mk0/Ul3oZ8lC/K6cbrAIKHpNfGiUJNsc=;
        b=pG/cwwGxwL8K9DY05fflMdjuI05aocY49zSsrmlgbte1u+iyvw9qwl6VdknYPpXU2B
         fbKPOJAqrpso0JBkQjMBTFqeMXcc005v+IaQrjqTJCa5HQ9hJoSmauvW4QpTGAitS95+
         nq8GdHFsq7Rn2+OSzFirfknZC/BIqyURxqFQBhp/og3mfAt61D7y91ZcC6d85z0RxF9a
         KnPmJBbyrqwdD59DmlXzUxi52u5HPI0IpSzVXJIkql5I8dWV4py++RUTfpgp2upF3eGo
         tm8vlEEABEyzgY1/UqNflz5eD3A6si4QZzwx4IgEtbqFBMq0O9DylTweqecVEr2ZmkYG
         UZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691000817; x=1691605617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2kycR0Rej9mk0/Ul3oZ8lC/K6cbrAIKHpNfGiUJNsc=;
        b=O0KkIpBelpmUfnmSiJ0cLzh2x8HBjgOdhcXq4gfzjIJ6Os3II9p+Pb9WDiV6LLl4fB
         prkOiUcwgr1GjFu8zbFcDQ/z8bpK88jYleQ2/ZXb6bJSMn3CsXjtV7tIVYEPlJGcqgsd
         eWlGbavJCvp0c88s36QYYoe4Mb16w7KYB13wNb02cB7yZN2EN/MSV4Ft10oMYhLCO8Sh
         M4mi8Tihqmm5TR1S4606s4OdAwkqqHEBwApghg8QEiWPaQBXxZ2p20u9Anm4kVBmFVH5
         DlDnEJJXKMQ6PU5d0bjGx4LiVg75YOGqYzkZnXsg8LoNsd0/btkUvF/gogpe609b1NPH
         uoGA==
X-Gm-Message-State: ABy/qLZ7igDaSMmyT+Y3DHVIjRnU4fmeLnD0SWWUY1IP5JIaVMTIdYZa
        1YqESQH5H6+kRsj5OJLouYrxMuFYmId3XyjiMXFZjw==
X-Google-Smtp-Source: APBJJlG9ivgacvY4n2XAnJntPbYCwP6SQaixesCGEKMyS8OduUC0pD3jeUwApOPyphe2EJx+brqKVhn04sOOez77Ovw=
X-Received: by 2002:a25:26c6:0:b0:d05:2616:3363 with SMTP id
 m189-20020a2526c6000000b00d0526163363mr19476049ybm.26.1691000817731; Wed, 02
 Aug 2023 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com> <20230802-add-widebus-support-v3-3-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-3-2661706be001@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Aug 2023 21:26:47 +0300
Message-ID: <CAA8EJpq18HjMFut4LgL_F5-uDNjFf5AKhgJhe1Z7HJz2A0Xxiw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Aug 2023 at 21:09, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add a DATABUS_WIDEN bit to the MDP_CTRL2 register to allow DSI to enable
> databus widen mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

(The patch will probably be replaced by Rob syncing up msm headers).

>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index a4a154601114..2a7d980e12c3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>         return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>  }
>  #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE                      0x00010000
> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN                   0x00100000
>
>  #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL                      0x000001b8
>  #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK          0x0000003f
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
