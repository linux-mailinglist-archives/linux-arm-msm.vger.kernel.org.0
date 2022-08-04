Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A440589D54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 16:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240030AbiHDORU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 10:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiHDORT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 10:17:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124D72B188
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 07:17:18 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k26so21449539ejx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
        b=JkX7XwsJCHIlFiF0B5fxtl8ET99tlQYq3RS+0DqL8n+QyFBMY+jCN8PnuswadccSA5
         v0MdTihTLtD8ubvNIhYjEY+sngNIR8YxPzP/ayFfUmaggZkgLAMOBQ4VFkROAMr386p0
         BLiUb6KVyGjjtpbltPlz+BraNZwXSKA3psbVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
        b=Iibc1/KoL+3TJY/XAp49JSd+EAKzzIDeWb+lA93zpYLiaEZXmrlG9X+Y4stW2+enRm
         yUeVxCL+Q0ekJrF2hpP7lYZPG3EG4VAQFrzyTFddXtK/dYgR/CxQsC0sy8Z1lm6HApNJ
         Ks0L/ZDZ/6WKWkF5eOqsJlx3IFxUsvBcaWXTYdbKaJhT4Y57808z2FHncfZYr6+kE7DL
         oXFirNapmre9ugoC5xUGGZTh/8PrI5Q8+r81RJOguIAk4PcL4Am/KPFRTuV8185myooj
         zU74fKVRfb2CUxf+H3InEQzQ5V64gAhePwr87/F2tQD+EIMDJk3Ylgz6BOKfE39DDj/G
         nL1w==
X-Gm-Message-State: ACgBeo0ox1In6yohCW74W+lsraMij1T8pU5d+HN9ut8KUBpJQy8B8C0f
        kyoeosEOvdGSZnXzfJ6TYfSfLn5ib/518ywy
X-Google-Smtp-Source: AA6agR4AaetM7cXX5shldJRe3FcBRGJ8RW3/S98sBiFyD9mSejNSxRxSPqK6cMI6W3TkfgjYsyvD3A==
X-Received: by 2002:a17:907:6288:b0:72f:90ba:f0b2 with SMTP id nd8-20020a170907628800b0072f90baf0b2mr1528665ejc.696.1659622636442;
        Thu, 04 Aug 2022 07:17:16 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709061b4800b00718e4e64b7bsm397564ejg.79.2022.08.04.07.17.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 07:17:12 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id v3so24527386wrp.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 07:17:11 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr1554422wrf.659.1659622631172; Thu, 04
 Aug 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 4 Aug 2022 07:16:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 4, 2022 at 3:29 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> +static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active = 0;

nit: don't init to 0 since you just override below.


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ac15444..8ecab91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
>         uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
>                 enum dpu_dspp blk);
>
> +       void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
> +               enum dpu_dspp blk, enum dpu_dspp_sub_blk dspp_sub_blk);
> +

Given that most of the items in this list have kernel-doc comments
explaining them, probably you should have one for your new one too.

-Doug
