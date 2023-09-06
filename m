Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1587679457D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 23:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235726AbjIFV4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 17:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjIFV4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 17:56:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7643F172E
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 14:56:47 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5007abb15e9so438134e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037406; x=1694642206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0doNA+N+ip+sYWWL2XBTw81yVKdo/qeOq59PcF949xs=;
        b=UJAbTC9qSrofcwlB8DDjYtCu+Etpg5wkLR4u2PTbP4HJ0hTRFn+TQ9nmYAu9QtA/TP
         55Nl64wsVCgw7dDgOprBCWBbSAyv8pUfVDNm5hXBxOtOAPNe5mWxkodylNyoTpoXc7Kc
         VNH78yMJJhXi0hNmMs8nBLHl+lYw3O8HIt+yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037406; x=1694642206;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0doNA+N+ip+sYWWL2XBTw81yVKdo/qeOq59PcF949xs=;
        b=PfmxmvOYiiq/F+jd2qu1tNKyRVh9C3A6Erj5l5mxWuw2jfa0TYM9GMcWD4S0vSTyEg
         LgZgW7j+QYpyAHhRegB+EwBtCe+fveZzu2iLfLHiNUl8HzFVfoISljuUWzM17w4j7zdN
         Ws/dcEeXJriR6ufDAI8Z49TfOESWslSkCHicGrLcahoqJCJsb1xG4CiH3UHfIcVqVTR1
         YxByvSfMYSA7BYX2wh9Z/iu4Nde4+O2PR1jSct+VCZrPW/9XsWF0MTFG+IfpohYGdOdO
         slichEmUrtXEqcYolELR6tNmUvnAJvsvQli32fCvVXRxJPuBxCVvpiOnkNTlyPJh5G3M
         DTew==
X-Gm-Message-State: AOJu0YyJUs9lllE0oQKlooNQ0TMRsJZwn8Vx06G5ERpEuHjtaF1jPw9j
        g5L8DGrF8AmGXO6vHRI35WYpprMygd1a6DfXLsLsgA==
X-Google-Smtp-Source: AGHT+IEOR6WnFPSLkXOVzLfWyRQdEUQ5wG1/6vCzixejVuPlV0AHADuXMTZ3djwPjmNdkgs6D1BULLIrFCoK3LvKKoo=
X-Received: by 2002:a05:6512:3442:b0:500:bb9a:7e11 with SMTP id
 j2-20020a056512344200b00500bb9a7e11mr2792395lfr.48.1694037405762; Wed, 06 Sep
 2023 14:56:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:56:45 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-5-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 16:56:45 -0500
Message-ID: <CAE-0n51kkZ4ne0qFo7cXNWUZ8M6amGR4UXK5u9fBDJpnuzz5DQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: inline _setup_intf_ops()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:50)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 8ec6505d9e78..dd67686f5403 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
[...]
> -               ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> -       }
> -
> -       if (mdss_rev->core_major_ver >= 7)
> -               ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> -}
> -
>  struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>                 void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>  {
> @@ -571,7 +546,28 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>          */
>         c->idx = cfg->id;
>         c->cap = cfg;
> -       _setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
> +
> +       c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;

Maybe grow a local variable 'ops' that can be assigned to so the code
doesn't change at all, only the location does.

> +       c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> +       c->ops.get_status = dpu_hw_intf_get_status;
