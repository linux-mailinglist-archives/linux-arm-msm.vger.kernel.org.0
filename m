Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3B86F4D84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 01:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjEBXQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 19:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEBXQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 19:16:45 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782783A93
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 16:16:15 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a8e9e2c53so16627147b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683069368; x=1685661368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXO6retkz2cq9N6Jojgiaaj/1/92QkbNhQxs4uHhF3I=;
        b=TUnCAgtse7NCZmfBiGyU47uHwFzhUCP+slxkJTryq8tRdUaUwWya6Qhsqt1bdELd/I
         1r1FvCJhpa4334JZSrZZZ67zW0z17grxMDnPBsJoz8Nilv17RhLrxSqtEo/Fucnh4dH1
         OmQQvIvWoJwDeUJSWCWWHazCzftGtE0RmJYDqIndUZNzMTIkW8+9jVSdUNRTxcD1L43C
         ARO9Ukpml07DDOHOtkyYYWiRaK98bMzNAyrOUrLARvosFOvm1p5n+FQLIB7aCEBWni2w
         1nni+92gNZzFF++j81kaNvCkf6MBUninDcWFZqaSMgD/k97rl2hjA8GhIBOsFNkDrrLc
         GzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683069368; x=1685661368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXO6retkz2cq9N6Jojgiaaj/1/92QkbNhQxs4uHhF3I=;
        b=eu4vzoYDBcWFR7rKvGYFgTKvI4c4tcPB6hgx2gSlj2wRE4/vA24qFpNhbLfX+gWtBu
         ggZhfoi9CdKIrLypU1BR/aw8IFwnlNhRzGy+tvPJawrAZG13m2g1Ljpky8DMqJ6Zw01O
         CHqwdgGtcNAxLhyJYWsHI6wXJAT+LOymuWjvBizMrqJzgRBebXHu3Qc4H6ovDq/UID/V
         ECz+GXcGDMHsDQmK0VX8u9ApzZ53PhNk8sBlFg1z5blAvIhS0bFkOKOV3B7pSvV/qZLL
         NSgNLTK0JMo65Z+myETg9UhvnbGM7nS/+g1dbt80e9CrZlM0ujpXwHDfSeLq+XCHEKmK
         qf/w==
X-Gm-Message-State: AC+VfDzMpty4I6+RqwlX71pWmRZLjaTBWj58FKgTuB3niAurFDisuPdH
        7ukARmNhKMlRNtPeAgq5y8cAPuOmeUGgecWEQalHjw==
X-Google-Smtp-Source: ACHHUZ59UpLKTEsqEYDETaLcDqOxHO1Z3WJOekgCiVwPByWYulavqGuvXnGzGLFj+PIAxsTqWknU+ig50eMk0+Sfl+M=
X-Received: by 2002:a0d:f3c1:0:b0:54e:ffbc:7ac2 with SMTP id
 c184-20020a0df3c1000000b0054effbc7ac2mr19499019ywf.45.1683069368113; Tue, 02
 May 2023 16:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-5-dmitry.baryshkov@linaro.org> <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
In-Reply-To: <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 May 2023 02:15:56 +0300
Message-ID: <CAA8EJppO3GhsRVY-5UjOO-GAw_NZONPaNBigO4P4_axXxNxsaA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop duplicated intf/wb indices from
 encoder structs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Wed, 3 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> > Remove intf_idx and wb_idx fields from struct dpu_encoder_phys and
> > struct dpu_enc_phys_init_params. Set the hw_intf and hw_wb directly and
> > use them to get the instance index.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>  From whatever I can see, this will not affect functionality of intf or
> wb and cleans it up well , so I am fine with this. Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> One minor comment/question.
>
> <snipped other parts>
>
> > @@ -761,7 +761,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >       struct dpu_encoder_phys_cmd *cmd_enc = NULL;
> >       int ret = 0;
> >
> > -     DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>
> Was it intentional to drop the index in this log?

We don't have p->intf_idx at this point. I think we can use
p->hw_intf->idx instead, I'll fix that for v2.

>
> > +     DPU_DEBUG("intf\n");
> >
> >       cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);



-- 
With best wishes
Dmitry
