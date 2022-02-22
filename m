Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118694BEFD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 04:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbiBVDMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 22:12:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiBVDM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 22:12:29 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8AC5FA2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:12:05 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id a19so37624514qvm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFJMqR0Uyd2kPZ5TICCuCWl+NAqTGxv/k2Ys7IDjf1s=;
        b=eyN6+87FrkdQPVOr02hchsIoth9vEfXRogzh61Xd1oI5aXdVT2uFWCEPPJYTrRv/Oq
         VCXMlqOIk0eiOge3ouDVg2be5IvzO2TyduP2cS0nh9yWZttszDJZi6DFD3FF6ziAIufA
         NygeTb8+dUkED6jzSHG85PAHSaXfRwqG1s/I7LyzCJbCtP/Aobb08J9aGGLTYB7QEmLM
         JdIIRgC58FkZtiXfZ07Cl92oz2NQvr2rct3+QCxxbEG2JUZkZgx5EeeaLOHw6rbKBbcp
         7ZF2OoukMgUCAkU6dyrbi04NWD/T1lz6Wt7AE3oDyjdLdd3MvkPV6Ig9D4LpPcy6s5iW
         sIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFJMqR0Uyd2kPZ5TICCuCWl+NAqTGxv/k2Ys7IDjf1s=;
        b=y//Svu1Sa1t9rO4NQnn39XXGIr0sZ039GZr7PFJ8vINjnOilIBnrHWsElne56aQMCf
         n+vpAm7PhVW+qgKLtRAyDC1DnlKsEdUq9qCmxiklYQ410HNBtMzBcD8bZyU9Vxtyd720
         pmSGOz+SPap6RXbvJEWlD6eFKnYeCrYV/NZxzkxotkK5B9jpNurJg0++anFt/kSqpJck
         8WLeMHm7UylGJV3oviyEJEzZ/2Xnjwnm+GLtg6yP9CZtZf5AAISMsOwj8fsPnupqWMtF
         hLgsEIN1MK0buSS51TyqFChoN8CSiM/uJQYn9ifzLHejHM1iloGI27OJaIaZQNyQwy0p
         irng==
X-Gm-Message-State: AOAM530uwlmDdq7MphHDLsWy1RPIbPyrYNM3KtOdmh85K6tWSPIAe6zT
        omBu/vd6nbkX8sz9qxca4WHeE6qp6ybMmk9gV4yXqg==
X-Google-Smtp-Source: ABdhPJzuBSQDu4totjZ87w+DOzd95iK77ndN1yjJvntgthnFEFwtdZKse38DWkEDhFKlI/9NC/pR/5/P6bLR2axIZn4=
X-Received: by 2002:ac8:5b88:0:b0:2de:23e3:62c0 with SMTP id
 a8-20020ac85b88000000b002de23e362c0mr7377707qta.62.1645499524196; Mon, 21 Feb
 2022 19:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20220222012638.6650-1-konrad.dybcio@somainline.org>
In-Reply-To: <20220222012638.6650-1-konrad.dybcio@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 22 Feb 2022 05:26:03 +0300
Message-ID: <CAA8EJppM=3R-h0Yai4JTSfc3j-nvV_oCgK+t5Vz_8X6A_AfO=Q@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/dpu1: Add a common DPU1 compatible
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Tue, 22 Feb 2022 at 04:26, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> There is *almost no reason* to keep separate compatibles for different
> SoCs utilizing the DPU1 driver, as it checks the HW version at runtime.
>
> Introduce a common compatible, while not removing the old ones to keep
> old DT compatibility.

I don't quite like this idea. Specifying more or less exact
compatibility string gives us more flexibility.
Few recent usecases to mention:
- qcom,mdp5 compatibility. If we had soc-specific compatibilities, we
would be able to switch the drivers w/o changing the dts. With a
single compatibility we would have to change the dts if we were to
change one of the boards form mdp5 to dpu1.
- qcom,mdss-dsi-ctrl vs qcm2290. We have to add special compat string
to account for the different io addresses. If we were using
soc-specific compats, it would be one from many, not one vs many
usage.

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Bar some very very very unlikely edge cases (such as need for some random
> quick being applied to one SoC from a family that shares DPU hw rev, but
> not the others, there is little to no reason to keep adding compatibles
> that don't mean anything.
>
> If this change is cool, then the question about what to do with
> dt-bindings arises...
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a84a77..335018542a3a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1348,6 +1348,9 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  };
>
>  const struct of_device_id dpu_dt_match[] = {
> +       { .compatible = "qcom,dpu1" },
> +
> +       /* Legacy compatibles for old DTs */
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
>         { .compatible = "qcom,sc7280-dpu", },
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
