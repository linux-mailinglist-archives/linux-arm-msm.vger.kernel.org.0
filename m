Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CE778E352
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 01:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344504AbjH3XiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 19:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237374AbjH3XiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 19:38:23 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C638CC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:38:20 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d71dd633f33so78228276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693438699; x=1694043499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0OA6F/cJGjE0KJb9/0REuMAEmnQQM4Zu3TAc/AkZeiw=;
        b=fIIByo55YBM8ubkoYY8RdooXzgIHOL5zcvS6tozV3zd/LOtY3czWCgOuso9SeH/fIZ
         U4u4N6strL8+WcJRUljkvPYwbNmMCTwx2v9WzLd4Pjf8gxoTSR0ycLFz2wONMLyZ8ICw
         WFje5tiS7A2y1CzjkysZNd9KnN+PhWeb975+pF4nqJaN9riOisZiKX17WIabum4JIfkZ
         AcOq6H/t1sKrVkOdU8aHF1Yy5FnybfnpkL1NSSNyqskAEAC/p7j1NV+tYA63IJQtJKo3
         kZBJM+JrAcTJpylYpFZ6adA6QCWRHeTjzEA4Nw8xdTB8+UXQEzzii/E4CzFPN52IubjP
         KHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693438699; x=1694043499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OA6F/cJGjE0KJb9/0REuMAEmnQQM4Zu3TAc/AkZeiw=;
        b=FRVykDmPrjA76HjmvU/miW9HNwV1DxyFlGX5bqC2V1nUsTM28pYw7ZShdybRiRPGTR
         WJhDvpdZtLK+Ogkikl/1hn7ijmSU033x8lvjrqgn3aTOYaSklV6hmnJAcIK+/RTnDU4w
         V9ImYGgAU0JVQDDcYmG1Qc+lAFpB4ERMoTz4iXInDVdhzsP032gOzdatcNSsuw+L6pIv
         H1A5XHMNm5dZWsfT72IK1TsT2UouJtvJ27a6RWWdcXgjXX6tfllSG7Hefr7nXSAeE9gv
         JuWWd6KSvsUY038bW/DAt7sVzmp01nv3GblX4TrZ5f28w+sEpr19hR8Urb3ZUjuqhmC0
         2Etg==
X-Gm-Message-State: AOJu0YydbQWYDCgVb0KktMSUOsq20Pgui42WG+1fvisXBgQ2NC26ypw+
        OlZsNdtq4m52mcwuVckdGDOWM8l63woKXnhqYomIew==
X-Google-Smtp-Source: AGHT+IGeQW7IWHk2KJWCy3x28ARi2otnY3Ztho5B4SiUmBLUWIBSTp+/mtvRVCUvyoWZFH12R61ivtvnFWmJDdFi1/M=
X-Received: by 2002:a5b:748:0:b0:d3f:208:b8ea with SMTP id s8-20020a5b0748000000b00d3f0208b8eamr3491103ybq.11.1693438699616;
 Wed, 30 Aug 2023 16:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-2-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 02:38:08 +0300
Message-ID: <CAA8EJpoc6ig=Vy7gFJ0nnsAP5HvFB+=ajk94x26Ah0D_g2yJug@mail.gmail.com>
Subject: Re: [PATCH 01/16] drm/msm/dpu: fix writeback programming for YUV cases
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For YUV cases, setting the required format bits was missed
> out in the register programming. Lets fix it now in preparation
> of adding YUV formats support for writeback.
>
> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")

Since we were not exporting YUV formats, this tag is not correct. This
is a mere functional change, not a fix.

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index ebc416400382..0aa598b355e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -86,6 +86,9 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>                         dst_format |= BIT(14); /* DST_ALPHA_X */
>         }
>
> +       if (DPU_FORMAT_IS_YUV(fmt))
> +               dst_format |= BIT(15);
> +
>         pattern = (fmt->element[3] << 24) |
>                 (fmt->element[2] << 16) |
>                 (fmt->element[1] << 8)  |
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
