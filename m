Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B9955175B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241416AbiFTLZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239999AbiFTLZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:25:29 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B17E15FE1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:25:28 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id n15so11396325qvh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QXZowmyjbre5HBlPw3yqu+8qdh4czis+s/CTNbxfBk=;
        b=mQafKe2Tm9xdswCmldeqcHt1fjBKl9ptnU71Xm/Rw84HrhNZNF80DuTq36zf94ZtJo
         vE07HJ54i72Y9d7NQlxK3V2abLQKr1LyFEAlI1pdFcY3eCwzYer4t32WtdsTBlaDBbJA
         DfzVE9A5eog4x+xrXoZMLVFhD4cE0m9BWJRQsY5V+/F12TmIl8e+EEQstY+glIOBU/zZ
         QcKkI+ORgju03rBX1DDFesHusTYlksgZD4JgJeehdROl2ECH52t8s/gzg71QpuzVHfyR
         iOdANIXfUKG3y3+5QliefCmhczpr1+qs0Ex+fsNFfVHYIvA4aQIva+D81L6qk+bGvGj0
         VHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QXZowmyjbre5HBlPw3yqu+8qdh4czis+s/CTNbxfBk=;
        b=6AK/g+85K20/2lpqcG9KenUBHD1cZTQJDqp9hzprXlyGunUkdOX9FZwh+JzKvK41ij
         Fthh6lmYFhlVsaWXIxk764FFjplz+sreWEjGeywFuksgWVTBvV1pOnO+lJFD+U87hUSN
         A9vLsy2Ekz9NRwq4CG0H7h1m9m+SmP7ay2GZoj8sxIfqDE+eUsuGHKH7tQz08c0lsewP
         IlM4UZdQolgcofSPKJ0eU4EiixTnLUKsskuKV2F75ZnpJJPb3wF0ia0XHA6epzV+fDPd
         QxW/mSWuy2LDMi95IoookdYgrrUUEQ2qKCIR9UUe0+5ABquTGk0MqICLnaPlUvycaIT+
         mGTQ==
X-Gm-Message-State: AJIora+5uzQl8+l2P8KXkCN3GlIMTDJp4HY7W/tG6/MsHGBVCPVU43fH
        xGz2xfnaxaYIk41oyWv0AbT12NL7mBwjqmNjZtKyyw==
X-Google-Smtp-Source: AGRyM1vQQ/H5C3sjvm2Eix6rA9rAxd2onuNFPRmD6ek/uCZhHOyx6DbTyq3GL/pzz23MuJhfJ7hBe3R9FBy/Q7nxuME=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr18934135qvg.55.1655724327833; Mon, 20
 Jun 2022 04:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org> <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
In-Reply-To: <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 20 Jun 2022 14:25:16 +0300
Message-ID: <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jun 2022 at 14:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/06/2022 13:07, Dmitry Baryshkov wrote:
> > Add pxo/cxo clocks to the GCC device tree node.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > index 47b97daecef1..61e3ab0ebfd3 100644
> > --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> > +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> > @@ -50,13 +50,13 @@ cpu-pmu {
> >       };
> >
> >       clocks {
> > -             cxo_board {
> > +             cxo_board: cxo_board {
>
> If you touch this line, please correct the naming for node - no
> underscores and preferred some prefix or suffix, so:
> cxo-board-clk
> clk-cxo-board

Unfortunately, I don't think it's possible. We are bound by backwards
compatibility. Node name is used as a clock name. And other drivers
might reference the clock using the name. Thus, if you check other DT
files, we also have similar clock node names.

> >                       compatible = "fixed-clock";
> >                       #clock-cells = <0>;
> >                       clock-frequency = <19200000>;
> >               };
> >
> > -             pxo_board {
> > +             pxo_board: pxo_board {
>
> The same
>
> >                       compatible = "fixed-clock";
> >                       #clock-cells = <0>;
> >                       clock-frequency = <27000000>;

-- 
With best wishes
Dmitry
