Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DDE5EF9F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbiI2QNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 12:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236091AbiI2QNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 12:13:42 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABD51D6D06
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 09:13:40 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id a41so2643693edf.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
        b=U5nWZ+zCnE6ObM1a1HTcsz5fUlLj7t9tsv+E5+LhXtnz9e4+xVV3xDQOTnsLxYF47t
         2ZD30c3FM7IESBJDjIyKdNG1CIQ3oPQsfMBa45Rch5e+Fgg7012WK4guAP0mWiXKAOHg
         TK5WpXxFwsqpDoq6d1yO9pR9vCsxPFGrv9CUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=V7QLJZSIzhY9dr2OFvy6n8FCoALGEpJ2vGDHHoAqT/I=;
        b=a5ubYlmOH2KuFCQgB9pLd93bm0GSJGnZit2WWV1GkxB0ZMnDYJrR2r9/73C/NHmhRx
         4elMJra2Y6I24+t9PdjXrSz2VcO9W1AnkyLlAhx5jmp3RP6iH6sBDqEkmk/V9vcLbLro
         UNTtEwVdw5xtLsxWt4AOpE3oD+94fzhk55WThV/6mk9/Bolxnm2SmdtpOEE7wjT49T59
         PPhIPIOYSrLmp+tfcqENyK/aphMfL1cmYT+CQTigaBP3VPoJI5Fi+/6oy89l69jYKQey
         H45fOkHZT4h2i0nPzMx7f8Z7FTe3iHuBFpDbrxtC9QmEcRNSqYpg0MAxI2UnCp/uo1vE
         SIog==
X-Gm-Message-State: ACrzQf264gJud0YfhpNYZFE0noDS/ZINTYFl9nOq6GBFJXTZJmUwYdvr
        ETkZzUwXajiNYl8cyi1nxbFWiA9WrD92/xHz
X-Google-Smtp-Source: AMsMyM74HDXRCTOisqJ8Vm8j38a3CmCoeH/GRwATEZ7wHr8d6EH5nv8/CRz5tBdXXxvHcvBiPK6XkA==
X-Received: by 2002:a05:6402:f0f:b0:451:1ecd:a61f with SMTP id i15-20020a0564020f0f00b004511ecda61fmr4020831eda.125.1664468018958;
        Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b007402796f065sm4193756ejd.132.2022.09.29.09.13.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id bk15so2928999wrb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 09:13:38 -0700 (PDT)
X-Received: by 2002:a05:6000:168c:b0:226:f4c2:d6db with SMTP id
 y12-20020a056000168c00b00226f4c2d6dbmr2895434wrd.659.1664468017868; Thu, 29
 Sep 2022 09:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Sep 2022 09:13:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Subject: Re: [v5] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
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
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Seperate ops for the sub block flush (Dmitry)
>
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 35 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     | 10 ++++++--
>  5 files changed, 50 insertions(+), 6 deletions(-)

Breadcrumbs: though this is tagged in the subject as v5 I think the
newest version is actually "resend v4" [1] which just fixes the
Signed-off-by.

[1] https://lore.kernel.org/r/1663825463-6715-1-git-send-email-quic_kalyant@quicinc.com
