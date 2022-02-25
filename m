Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC4F4C4D6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 19:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiBYSOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 13:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiBYSOa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 13:14:30 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC4B1F634A
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:13:58 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso7371605ooi.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
        b=hxBADu8QpohF0yutsmwPqmQlJ5vH4rfHMO43pUPkQ3zD+/AxpPBOrlFKGve21EVmSn
         Pvx1oUpXteHi4Oe0mliT2aJlgWMAtBeq85PCVsob6gU3/c6aQfSkQeHJ3In7+IZd9RG4
         +j6cDftYrrsCehirVuVu0t3rhTorY76CTwgNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
        b=hEo48gOuYOV6Ui5Zh+QR+9A89Z7228zrTKWyeqqVtjZrpYfmhw4oDrrCeUUdpGxcm9
         cK0nhiP4ifUxloVCXWgIuBXR84sgCK+80JIl0D9iUjFLK/SRY4bAPEvKFj6+1sC/IvHb
         jQkPXeSzORu9CZ0MzaBM+L824L8396OiRZX1R7YoMg1QtUAbZBEdWXoGkmxIb/opSpmT
         IAsJCE0roD/WwvnOBNiQ3gOz9041490tjH7aIPF7flhdI7bmliziFuIZ6nwpnIPRj7m7
         K5zHXN0sVuQsuZcokHCjOdnWJxlugYxmRBcGhNFTLAk18nRox3ZXdixcgPghXZkuNGqX
         KskA==
X-Gm-Message-State: AOAM530B9iSEkO6RnvPPjc1zq5gYBb5lVkze7H17WoFmfCif1Su3YhVM
        4ZmY+xO0Ch4FsQwjL4h5cEtifsFev7LlAAVovFR/dw==
X-Google-Smtp-Source: ABdhPJzLlkAkQdrZ22FiuMj2KKEe2l3uCK3eG6+MQ+vgJaB4N4/OV+2sjXjnVbX7YZ0UHqLBoWWYOwu4siva5+HTxms=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr1849727oao.8.1645812837029; Fri, 25 Feb
 2022 10:13:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:13:56 -0800
MIME-Version: 1.0
In-Reply-To: <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com> <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Feb 2022 10:13:56 -0800
Message-ID: <CAE-0n506iRCF0TjPDT2Aqe--RXEJbPe8961JiGmW6K2M5VJRUw@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] drm/msm/dpu: revise timing engine programming to
 support widebus feature
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2022-02-22 16:27:39)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> Timing engine provides driving force for this purpose. This patch base
> on HPG (Hardware Programming Guide) to revise timing engine register
> setting to accommodate both widebus and non widebus application. Also
> horizontal width parameters need to be reduced by half since two pixel
> data are clocked out per pixel clock when widebus feature enabled.
>
> Widebus can be enabled individually at DP. However at DSI, widebus have
> to be enabled along with DSC to achieve pixel clock rate be scaled down
> with same ratio as compression ratio when 10 bits per source component.
> Therefore this patch add no supports of DSI related widebus and compression.
>
> Changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
>
> Changes in v4:
> -- rework timing engine to not interfere with dsi/hdmi
> -- cover both widebus and compression
>
> Changes in v5:
> -- remove supports of DSI widebus and compression
>
> Changes in v7:
> -- split this patch into 3 patches
> -- add Tested-by
>
> Changes in v8:
> -- move new registers writes under DATA_HCTL_EN features check.
>
> Changes in v10:
> -- add const inside dpu_encoder_is_widebus_enabled()
> -- drop useless parenthesis please
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
