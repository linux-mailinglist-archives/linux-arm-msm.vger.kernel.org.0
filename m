Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64769B3E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 21:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjBQU0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 15:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBQU0s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 15:26:48 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD283604F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 12:26:35 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id p196so937794ybg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 12:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WCSSMYViyiTMLOROYH3IrJGmmqS7oInkoOdg65bTdg4=;
        b=nO7sJFdaBQSMwbAopDB/Giox8VXoxCeMdKJ4aZrjtHo391X9nFPg2D1qOHdP8n1Os3
         hvJZZgpNAZJ83vBBQCLGc2mQEgEqtnzO+2/EkWiSpoKPulC127h9jHIKeFUIKWMRb2q/
         YYO0OUWm2WQvsu0wJ+hKyEsgIrK647Gw8PqXdU2UWtXOLPEl+MfdAzE+y1+BNoy93Vbu
         g+f4YiWCRO2tf5hgjhJ7TPel3lPMSJ7lBfBjT9zGapcuiGse+z40bqgmKzRQLo45XdYt
         L8GHHEa3j0KLDriVDvocDV356z9fmjvNWO1+jJ1tW+5yoC4TEn+wjCdHcV/nJnzsLAr3
         TXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCSSMYViyiTMLOROYH3IrJGmmqS7oInkoOdg65bTdg4=;
        b=mZLqx6dwQ+0CNAkEHZvpN4uk42a6EG/hpXo6cIwo0U3OQYPscO/65L8m9RH7z2jjob
         jbjIgK/JSRIW7NJ/6WnoSCklvNWvZaOPiXFFQCkqS9ABqopCap6HFAFHADun1OnhbHVo
         /Km3R7U0OLrl85xcLWUgfjO3+uLvHuel9hSFNlp+lUue07o7HQO2q+w3G9Q/vGUxvHtg
         T2HtgX1qxD+0gFP8rr1lbSaqsPyIrWmMOaAmzNo5QjDbpAnwe2qg8citoDnvtzzfRCT1
         VRLjQikf20ec1RHn9jjpEggK2qYRKK0nmKK0QH/smfcq0JJzMvYxrEvfAFQhEKxY7bzV
         c9Wg==
X-Gm-Message-State: AO0yUKV2xdhqdfkh4EmikKWL7e9FXe3ElAxXVBicV4xdCOzZLE+5HO2E
        GAzU5HAP0Pzwc7m5LKoxUwiRiBOmDFp8jGFFR1tL/g==
X-Google-Smtp-Source: AK7set968hBHAf6UFDxyD7E9EDu2oRMAiC62sL3MTzHnSERyhZEgXwKhHSzAirxK3Tk0iqe/cw9W839LqKb4ywkl6fo=
X-Received: by 2002:a5b:4c8:0:b0:8d5:5d9d:d088 with SMTP id
 u8-20020a5b04c8000000b008d55d9dd088mr1294760ybp.229.1676665594789; Fri, 17
 Feb 2023 12:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20230217-topic-icc-fixes-v5-v5-0-c9a550f9fdb9@linaro.org>
 <20230217-topic-icc-fixes-v5-v5-8-c9a550f9fdb9@linaro.org>
 <8c4f1cc8-c1f8-06b6-53fe-7507d74ca958@linaro.org> <3c205131-632a-6592-5dc0-82313b26e5f6@linaro.org>
In-Reply-To: <3c205131-632a-6592-5dc0-82313b26e5f6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 17 Feb 2023 22:26:23 +0200
Message-ID: <CAA8EJprJYPAsFZgu-DwjOHm6FsUEJ309zDo=Muh04L4B4oWhmw@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] interconnect: qcom: msm8996: Specify no bus
 clock scaling on A0NoC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Jun Nie <jun.nie@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Brian Masney <masneyb@onstation.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, 17 Feb 2023 at 21:53, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 17.02.2023 20:27, Konrad Dybcio wrote:
> >
> >
> > On 17.02.2023 11:46, Konrad Dybcio wrote:
> >> A0NoC only does bus scaling through RPM votes and does not have any
> >> ICC clocks. Describe this.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> > This is bad, as devm_clk_get_bulk{"", _optional} doesn't
> > check if num_clocks makes sense and passes "-1" down the
> > devres alloc chain..
> >
> > I'll rework this for the next revision by simply assigning
> > the common "bus", "bus_a" set everywhere instead of relying
> > on it being there by default..
> Or maybe I shouldn't, as that will require redefining the array
> over and over again.. Perhaps just passing <&xo_board>, <&xo_board>
> to a0noc's "bus", "bus_a", similar to what's been done on SDM630's
> GNoC would be less messy?

What about simply skipping a call to devm_clk_get if num_bus_clocks is negative?

>
> Konrad
> >
> > Konrad
> >>  drivers/interconnect/qcom/msm8996.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
> >> index 1a5e0ad36cc4..45eb8675fb11 100644
> >> --- a/drivers/interconnect/qcom/msm8996.c
> >> +++ b/drivers/interconnect/qcom/msm8996.c
> >> @@ -1817,6 +1817,7 @@ static const struct qcom_icc_desc msm8996_a0noc = {
> >>      .type = QCOM_ICC_NOC,
> >>      .nodes = a0noc_nodes,
> >>      .num_nodes = ARRAY_SIZE(a0noc_nodes),
> >> +    .num_bus_clocks = -1, /* No bus clock scaling */
> >>      .intf_clocks = a0noc_intf_clocks,
> >>      .num_intf_clocks = ARRAY_SIZE(a0noc_intf_clocks),
> >>      .has_bus_pd = true,
> >>



-- 
With best wishes
Dmitry
