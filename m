Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC71F53C5B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 09:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbiFCHDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 03:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242176AbiFCHCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 03:02:52 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88451C93F
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 00:02:37 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x7so4981050qta.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpTxhe8d1wfl9cxmRQmaPd/25jnJpClicp4FOUimKUo=;
        b=d50+tzVxqEhaFcPBBGejf2UJbunWjF5Abb00attFnWFaI9oPYW5zWBgJKvXsSpCdKr
         yDamXzaOpr3WL1MkwYlxNubMOr7It+wygCcPJeO0zaOIocMJq8WI7DEQfvTptzNRHoFW
         pLzInGxQ0yH3fV+FooefbDug8iJCNNLTKatYYsaXIiZuI5JVBgm5hwu/6hQ7dxvvfSNH
         0YSiAJS2kGeiHX8h/By+khNvN1NPsLUq3T+cTimx76r60JxFPn9PqTXBVF0c7HoDSP9D
         oM3nu4PnB+G98qyYwP6fz6PwwbpipeF4YuGDkCvSwf1sql+zht7Nk692c1ytM1bnUkNE
         goQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpTxhe8d1wfl9cxmRQmaPd/25jnJpClicp4FOUimKUo=;
        b=qp7rrhurWlUWculjqrst1Wdq2hAMeWyIcvJuyxxzakd0OvH+9SIRNpfiAEApDl7oBp
         rHsqzHXkW4EVZLBSTunLSAXGAwK/qcQ+HMhWt2Bk99GvdJrnrbwD7zWvvxj9Vkue2ug6
         ccrUk2+fmA/Sx3D0PKw2uPCgjLlLdkp0z8DAkLVEKJvYa6bj20tmfbOqmgqVc3idZ+yQ
         ARcHGU3SpveReQLMiBGhgM+BbHibaDSD48+BKXIS8XUkDBtpfWOdaJZZEE5LDgivnxD2
         O+TAlif/WqehK+lNOEhBwKhlfxde5WPT37jzJ1QoxcRaUfqH1d/B12ggiBJ6f7UaEziT
         uydw==
X-Gm-Message-State: AOAM532p4cXpyzd+aWv06eq4CfpWUJghHLGWnsHvEdTSppjQSwu7a3TW
        MqPD8Fd4A1der25GyM2tOecWs9qANNkJufZati9q9w==
X-Google-Smtp-Source: ABdhPJx1Tn+p+ALdFrzKUULQPAzAC+KVROpMIwSkRoSORmiBsKP2vXzREITjvn4vZsl/fX/dydtl1JPNPXChp239G80=
X-Received: by 2002:ac8:5990:0:b0:304:c8d6:3147 with SMTP id
 e16-20020ac85990000000b00304c8d63147mr6502086qte.370.1654239756957; Fri, 03
 Jun 2022 00:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com> <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
 <aa4617f6-65fd-73c6-61b1-686a72c515d7@quicinc.com> <beaaeb57-c144-a680-eea6-20a950d25205@linaro.org>
 <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
In-Reply-To: <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 3 Jun 2022 10:02:26 +0300
Message-ID: <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Add interface support for
 CRC debugfs
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 3 Jun 2022 at 04:02, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> On 6/2/2022 3:51 PM, Dmitry Baryshkov wrote:
> > On 28/05/2022 01:23, Jessica Zhang wrote:
> >> On 5/27/2022 12:46 PM, Dmitry Baryshkov wrote:
> >>> On 27/05/2022 21:54, Jessica Zhang wrote:
> >>>> Add support for writing CRC values for the interface block to
> >>>> the debugfs by calling the necessary MISR setup/collect methods.
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

[skipped]

> >>>> +
> >>>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
> >>>> +{
> >>>> +    struct dpu_encoder_virt *dpu_enc;
> >>>> +    u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
> >>>> +
> >>>> +    int i, rc;
> >>>> +
> >>>> +    if (!drm_enc->crtc) {
> >>>> +        DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
> >>>> +        return -EINVAL;
> >>>> +    }
> >>>> +
> >>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
> >>>> +
> >>>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >>>> +
> >>>> +        if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
> >>>> +            continue;
> >>>> +
> >>>> +        rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
> >>>
> >>> This doesn't look fully correct. Do we need to skip the indices for
> >>> the phys without a backing hw_intf?
> >>
> >> Sorry if I'm misunderstanding your question, but don't we need to have
> >> a backing hw_intf (and skip if there isn't any) since the methods for
> >> collecting/setting MISR registers is within the hw_intf?
> >
> > Yes. So the question if we should skip the phys and leave the crcs[i]
> > untouched, skip the phys and sset crcs[i] to 0 or change
> > dpu_crtc_parse_crc_source() to return the number of intf-backed
> > phys_enc's and do not skip any crcs[i].
>
> Thanks for the clarification.
>
> Is it possible to hit a case where a phys_encoder won't have a
> corresponding hw_intf?
>
> AFAIK, it seems guaranteed that a phys_encoder will have an hw_intf
> since dpu_encoder_setup_display will skip incrementing num_phys_encs if
> dpu_encoder_get_intf fails [1].

WB encoders won't have hw_intf. The code checks that either get_intf
or get_wb succeeds.

>
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2263


-- 
With best wishes
Dmitry
