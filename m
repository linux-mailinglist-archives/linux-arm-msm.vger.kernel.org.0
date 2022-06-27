Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4E155CBA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbiF0XpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 19:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240875AbiF0XpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 19:45:15 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9123E16585
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:45:13 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-fe023ab520so14937206fac.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JaMdLUpzUEQzCOSIwEtqS/GjUV8YB+oAIJlz8iaWB+8=;
        b=JghfqMZr64wnajx380Ff1UlvS6R6UvF/CHEiPFbxidjKIVe7Iw9MzbHFkYCLEI5I64
         vSJeAU77bam22qw+2fkx55Nzg626PgmGZ1M/8BhjD8BPkEQC4atkUCnEXqk3D7FSqDIK
         ublEJGlYKx8h4gXRx2562uFAv/WOMEp+puSDKgQoPf9e0s6zYJPnULxn7tFippMOViKT
         rH6whOiSrqkRuqYKzaLsDxTkV54v1N9NUzuNIzz+7R9hcfRLoyWsBG9dgemfWqbC2j5M
         9OUwy1CXkaS49Tw+68bmjYvQ3R/vuMFBvnG7202RPjZCyreNrY98EaNsHFd23Kp2dd3O
         jApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JaMdLUpzUEQzCOSIwEtqS/GjUV8YB+oAIJlz8iaWB+8=;
        b=QX45sdcN4H6l2Ow7PHoo0eFzbcFEAOOydATN3M/JBG/BSTZZ3dW+WrFTZjgVw+dV64
         SPn802rbXcvh3L/YS8y/fjwHUUleps9U0vAS6CUe9B/89a+ADrb6igKeWhtux28p7d+A
         LzWaEA5moz+tzT20jA03Mlpbtj/dHC5LkQrJNlD3ISsB3ERHsZNA6Sa3hYBj8TSLJ8AU
         FUrobzMZHVnlWKdVgLN0ZBY/GfB/YTxKNfuTtBy9y5+yhEI3+rCa7FOMuyfkKDxGR1jD
         5akrt3bJwoxXurTrOD8CMjwqlJqbC/h+wOQlyqlUU6uinvkAXZLKuy29TuXRNAsFwAwY
         Y2LQ==
X-Gm-Message-State: AJIora+ji+EXm9jdYYRL5k6RrchTMssiY2y6FwmT2NbrbnZRPwEnIOhw
        JjSjCwY9W9JSNZxx1LKS6PX7rw==
X-Google-Smtp-Source: AGRyM1sMuQmjxILi9LTtPRGd4OD0XjJ1elk6f1SJCAPbmrKGzSRTftlh28jUl3kkreE4f8lvUpo5Zw==
X-Received: by 2002:a05:6870:c8f:b0:106:a09f:e79f with SMTP id mn15-20020a0568700c8f00b00106a09fe79fmr11663883oab.174.1656373512901;
        Mon, 27 Jun 2022 16:45:12 -0700 (PDT)
Received: from baldur (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p2-20020a05680811c200b0032e3ffc5513sm6177925oiv.4.2022.06.27.16.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:45:12 -0700 (PDT)
Date:   Mon, 27 Jun 2022 18:45:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
Message-ID: <YrpBARCYiFKF3qXm@baldur>
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
 <20220624003714.918ACC3411D@smtp.kernel.org>
 <62b50863.1c69fb81.be104.158e@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b50863.1c69fb81.be104.158e@mx.google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Jun 19:42 CDT 2022, Christian Marangi wrote:

> On Thu, Jun 23, 2022 at 05:37:12PM -0700, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2022-06-23 17:27:18)
> > > Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> > > > Use parent_data for the last remaining entry (pll4). This clock is
> > > > provided by the lcc device.
> > > > 
> > > > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > > > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > > index 718de17a1e60..6447f3e81b55 100644
> > > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> > > >         .enable_mask = BIT(4),
> > > >         .hw.init = &(struct clk_init_data){
> > > >                 .name = "pll4_vote",
> > > > -               .parent_names = (const char *[]){ "pll4" },
> > > > +               .parent_data = &(const struct clk_parent_data){
> > > > +                       .fw_name = "pll4", .name = "pll4",
> > > 
> > > Is there a DT binding update?
> > 
> > Also I'd appreciate clk patches be sent to my kernel.org email instead
> > of chromium to help my filters.
> 
> Sorry for the OT but as you mention... there are many series for ipq806x
> all reviewed. Wonder if they can be picked or should I RESEND them?
> 

Sorry about that, I'm hoping to catch up on the pending patches in the
coming few days...

Regards,
Bjorn

> Some of them are blocking me from sending other fixes as the current
> dtsi have wrong definition that would cause kernel panic (if things are
> correctly implemented on the driver side)
> 
> -- 
> 	Ansuel
