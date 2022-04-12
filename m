Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5DE4FCC75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 04:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbiDLChn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 22:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiDLChk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 22:37:40 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FA419C35
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:35:20 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-d39f741ba0so19393513fac.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=27t0/Qo4lvhMaM3TOiDm3Op0HQcIUZVxhkHZUsq/h+k=;
        b=Tx/Tmmv9cHXeVpqxCWqj5GsiGQfPuyPwy4ZJMqCZoCmjSIUC2mrhsAqTGh697Gst1L
         QFHWj6TLIKNnv8EJk8n/SO9zlOHUFgyrE3AOsDxCbR9fhedJk6tQYkJnoew1SfXL19IW
         iJb7r8PL73g+YsrPSvfbkQyH0Ug3gUohwbGfcH+uEV5vxkngt2D9/qreYYvdETlrj2fz
         tzpN451OGElP9tZrzg5+SE2DuAg3kiloaUDwSZSNxbvkbwOeF3N0y7bAWuW9ByPM2WC6
         5H3rpSpxUBsmzS+pXakv/NZVpPCRpjDXT6ME0mbbGumtz4FVeQru8tPLQe832jmxBi+P
         F3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=27t0/Qo4lvhMaM3TOiDm3Op0HQcIUZVxhkHZUsq/h+k=;
        b=vZ2Srl6LgELXZDE7CDTwCwPeZ7IPxQRrF3iou1U5KA7k/Xt4ucP+Eho82eEo9qlVJY
         XXM/etsJXya5Xgk+ZJbqNuhZroG5dk3V9X2kf6pcRPJtSJhniMCmcpVrKhvLnyWpmzQw
         KOMwR+ylJjsbyJTd/78lN8d4/oR6Y1bXFFBmq6+904lY5hrXaevY+QwJU4/6ZP8ujKPz
         XhlOjhjIKnXSBoi5HLJ2PD9MR0z0Y/1yc6FFML4+GNhdsDJ/u4+8Ss3feC88XBQSHDse
         ndSs1FA3asBdu517PQMkf59SBX9scr0q6Ezwlm0A4Tm5bzdcXGLXQlPEiITKUj/zsnSL
         +OQQ==
X-Gm-Message-State: AOAM531YSg0qaHunJQzTsgJJJL3s16dy8rU52MQsgoe9t3coXqQtRT+/
        px6EPVdhRK4jl43z9DivZ6R/cA==
X-Google-Smtp-Source: ABdhPJw/w+OlcERZQK/Rj6XF2LKTmJs8sqZLOUp33SNe35UFdg2B00DCfvuhLcn2uIV4Glaep/a58w==
X-Received: by 2002:a05:6870:f104:b0:da:b3f:3248 with SMTP id k4-20020a056870f10400b000da0b3f3248mr1138491oac.248.1649730919742;
        Mon, 11 Apr 2022 19:35:19 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id i28-20020a056870891c00b000de777f1a41sm12756872oao.46.2022.04.11.19.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 19:35:18 -0700 (PDT)
Date:   Mon, 11 Apr 2022 21:35:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Message-ID: <YlTlZa35A4lu02oI@builder.lan>
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
 <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org>
 <Ykx6NWrcf4IA2Mam@ripper>
 <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Apr 12:38 CDT 2022, Dmitry Baryshkov wrote:

> On Tue, 5 Apr 2022 at 20:17, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 05 Apr 08:38 PDT 2022, Dmitry Baryshkov wrote:
> >
> > > On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
> > > > All interconnect device tree nodes on sm8450 are 2-cells, however in
> > > > UFS node they are handled as 1-cells, fix it.
> > > >
> > > > Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> > > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Bjorn, could you please this pick for the -rc kernel?
> > >
> >
> > The change is obviously correct, but what difference does this change
> > make with the current implementation?
> 
> it makes interconnect paths probe correctly. All NoC have
> #interconnec-cells = <2> now.
> 

But there's no code in the UFS driver that calls of_icc_get(), so what
does this actually do? (Other than correcting the dtb for the day when
we add that support to the driver).

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > index 0cd5af8c03bd..bbd38b55e976 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > > @@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
> > > >                     iommus = <&apps_smmu 0xe0 0x0>;
> > > > -                   interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> > > > -                                   <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> > > > +                   interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
> > > > +                                   <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
> > > >                     interconnect-names = "ufs-ddr", "cpu-ufs";
> > > >                     clock-names =
> > > >                             "core_clk",
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry
