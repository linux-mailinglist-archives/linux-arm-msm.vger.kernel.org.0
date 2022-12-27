Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E2656ADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 13:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiL0MWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 07:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbiL0MVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 07:21:33 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78213EE0A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:18:21 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id t15so14209645ybq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MT35Wy/vgyGsnQSdR3P4BkZLQ4sxrgSNujIQe36ifI4=;
        b=GHlNjtZ1ePZDamd4yQr1QhXhgYvBVOGXYO6WQK3vzD+8bNWX8KMwePtqzetxWSjkna
         zotwJtMSzFIE6KZtzWk/HkNXjtLHGgIaah6XlDWW21iQobfyx2Yd5ZpO+DU6AdvHd6Hf
         qkAqPyjuc0GuFgLw2xFO6ncJu/Ubf4DOGGRtYUatJatt7T9P6daSXN6dSoFzEez0opZA
         1Jeo3JkVN7tT/WVXvfNJsKc2W7no3bYh5OQbcpF5JHf0eSCNlhVo3HURUe++sZzHkRDF
         C+vgjMdF0ozXq4RMdQ/kQ0PUsii38tGeMQSEsTgid6VYuD72QAMGiMRYgMWhMsZktxx4
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MT35Wy/vgyGsnQSdR3P4BkZLQ4sxrgSNujIQe36ifI4=;
        b=wbVplOq3ntQ9UNqi+jXJyeG7T327Sa4zmffJ8+836H2FP0epQzxOJm7g97u/eGVQFp
         4zBQ8bv3XG4SQ6Jwi5DP6xsqSoxtrxkY3XektJanaNPTTVp+G5cgyufqdcYwQCBjv5cs
         rY2XQdiEQf2d7+1JFfBzWF28bg2eVcF8WiD3n+b4BR5SbXk7HZxHUsWbWFE4nyX300zm
         WFMfkRENuqV+/wzD2Lyp5cTraCfh0BqKLB1Z1fVNaUQixLGoDGD3Aoa9bk5ke+3/sbfJ
         pAKiIgHbgfBBOmZ4KGoPW8p9CJwdjxeJuynbmUt9KvUqU1rrKr8Op63s25KcFFCLkTbt
         2q9w==
X-Gm-Message-State: AFqh2krpLV0/bqmJ7OYyUL1QRxgcjYK3XRP9qa7cOApB9LfzkXjh0smE
        R7dP1h0G05zMJRkohAfXnxLWeruhybo1dA63SkqZcg==
X-Google-Smtp-Source: AMrXdXt6WexlgjyQ0WqJ/qZOzu56fpjkePyD8ACuFjYqrdT6ADKBN8MgyXd9S6GPUl76lCZMr/d+jXQ8MlDepkFmkI0=
X-Received: by 2002:a25:aa0d:0:b0:76d:bea0:8a05 with SMTP id
 s13-20020a25aa0d000000b0076dbea08a05mr1356971ybi.153.1672143488604; Tue, 27
 Dec 2022 04:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-8-dmitry.baryshkov@linaro.org> <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
In-Reply-To: <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Dec 2022 14:17:57 +0200
Message-ID: <CAA8EJprLwjE0woynmRsB2yn961Kdt4SpawB8rrk=tTdQPp-srQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Dec 2022 at 13:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> > Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
> > the multimedia subsystem.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> I'm thinking whether it would maybe make sense to put 8974
> and 8084 clocks in a single driver.. They seem close to identical.

Unfortunately the bindings are quite different. So even if we pack
both gcc drivers into a single one, we'd still have to cope with
different numeric ids.
The only sensible solution that  I have in mind is to have a common C
file, containing common clock definitions.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Konrad
> >  drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
> > index c26e222c78d4..7085d2ccae49 100644
> > --- a/drivers/clk/qcom/gcc-apq8084.c
> > +++ b/drivers/clk/qcom/gcc-apq8084.c
> > @@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
> >       },
> >  };
> >
> > +static struct clk_regmap gcc_mmss_gpll0_clk_src = {
> > +     .enable_reg = 0x1484,
> > +     .enable_mask = BIT(26),
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mmss_gpll0_vote",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &gpll0_vote.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_branch_simple_ops,
> > +     },
> > +};
> > +
> >  static struct clk_branch gcc_bam_dma_ahb_clk = {
> >       .halt_reg = 0x0d44,
> >       .halt_check = BRANCH_HALT_VOTED,
> > @@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
> >       [GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
> >       [GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
> >       [GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
> > +     [GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
> >  };
> >
> >  static struct gdsc *gcc_apq8084_gdscs[] = {



-- 
With best wishes
Dmitry
