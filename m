Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8D078FEFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 16:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349977AbjIAOYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 10:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349973AbjIAOYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 10:24:33 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC27210CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 07:24:30 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so1612451276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693578270; x=1694183070; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4JTq3QyNvEDgshksBGAuADiMeaDa0EKwLIahQgHW96c=;
        b=g8dj3tbrowzKoX3GNoQ0+h6daW1xO9Fyk6FnoUKFNpIFQmXax3E+XyIViPHEl5jfNo
         GHJUeDjUEG9g8KEMbCvWV2Ap4BIxaHhbblI83sk/20nboZs8xutjMiOyAfjthfQPbFSW
         r/Nv3YzwCBaJMOiyDKtn1YPIAs3E0uDnRrjeyzdYwKQFQhavzLp04cDAubWNPORLaelB
         24HiHlovsCO09/Pemg4Wfxl3s00fpq/UGdSru92PmdpaxuKm110we9/+p1mHzpjs0jJE
         McE/Aa9g9NCNjNAqGw2D0o5axBdvMeCsJoToYQCmyJ+mzzANxDoCKnnfA9+gRI2Iy7zW
         0iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693578270; x=1694183070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JTq3QyNvEDgshksBGAuADiMeaDa0EKwLIahQgHW96c=;
        b=QQaL6UFCxs74Of8uQABUDMEOFr9ZFO6J00YWVh4kt6QL3p5z50N0Dxbb0X61jHd7MX
         +zeWQmp2svCbeo+c+TIvZmKhRtSl4TgpBk2e54mb+dbxmvMYB7cqGwOKYvRZyDyeRH3N
         1ambVZcQPnhH/u8yDhY1TXbxbV2GJKr065lrijz1mJ7GPX7lYRx4c0kzQm0RSqXrr0ks
         Z0Q6h4YSNhFnhkPDzALqwY8noGL96UA0xSO0gsqH7Ud/2mIBbgJMPfn+L7sWI3WtniVO
         TGtlkhbM7HTfLWVw/6qSa9kMQn+vuqZ0G3uXwIu2bY1fAOXvSmsVNeTwSP3t6P1JM/ML
         JtdA==
X-Gm-Message-State: AOJu0YwJ3bP2fkAJzWtNn1/JYPEbUpi98VkljaqGzoGHqRZbJhN1syl6
        lT2G3Hw1qEIHbv4SmXT5BIgh992c12AGU2OlSZ+FQQ==
X-Google-Smtp-Source: AGHT+IHYBbed9QoyEbl7nDLpZlbr4GZ0M/NYtjSG2pehE4nSWsii7WiwuTpje80SdlHsY6HjPJArMMUKjrm3BVULFH4=
X-Received: by 2002:a25:d14:0:b0:d7a:8e37:6d4d with SMTP id
 20-20020a250d14000000b00d7a8e376d4dmr2820258ybn.43.1693578269933; Fri, 01 Sep
 2023 07:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
 <20230324202244.744271-2-krzysztof.kozlowski@linaro.org> <CAA8EJprF==p87oN+RiwAiNeURF1JcHGfL2Ez5zxqYPRRbN-hhg@mail.gmail.com>
 <99045d3e-53b4-dd75-fe57-9a3465d49b6c@linaro.org>
In-Reply-To: <99045d3e-53b4-dd75-fe57-9a3465d49b6c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 1 Sep 2023 17:24:18 +0300
Message-ID: <CAA8EJpq2K0ZJM==8Va7eSa1oqYz8u5-_6k_gs_D=hjVr_TaXOQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: apq8096-db820c: drop simple-bus
 from clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 1 Sept 2023 at 11:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/08/2023 11:04, Dmitry Baryshkov wrote:
> > On Fri, 24 Mar 2023 at 22:23, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> 'clocks' node is not a bus, but just a placeholder for clocks:
> >>
> >>   apq8096-db820c.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> >>     From schema: dtschema/schemas/simple-bus.yaml
> >>   apq8096-db820c.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]],  ...
> >>     From schema: dtschema/schemas/simple-bus.yaml
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > This patch broke audio support on DB820c. Now the divclk1 clock is not
> > registered, as drivers/clk/clk-gpio.c doesn't have CLK_OF_DECLARE().
> >
> > Stephen, What would be the best way to fix this? Add CLK_OF_DECLARE
> > support to clk-gpio.c? Or simply move divclk1 from /clocks into a
> > separate device?
> >
> > What is the rule, which clock drivers must support such device-less
> > binding using /clocks/foo nodes?
>
> Uh, sorry for that, I think my patch is incomplete. I did not notice
> that not all clocks have CLK_OF_DECLARE. How about moving all the clocks
> out of "clocks" node to the root? Then they should be instantiated,
> regardless of having CLK_OF_DECLARE.

We can do this, but first I'd like to understand the rule with /clocks/.

-- 
With best wishes
Dmitry
