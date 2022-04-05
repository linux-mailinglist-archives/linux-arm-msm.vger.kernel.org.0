Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85BE4F4BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbiDEXEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572987AbiDERlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 13:41:03 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA11B91A1
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 10:39:04 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id z19so12348564qtw.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mc11sIS9JfwaQprz/kWFB5SamVxrqWxHuOoJav+3bpM=;
        b=sMuYTyBH6sFJJ/kI3ezfbHdqYHPicHbqgg2GBDd9/sQeVE/LcZZEuOwzbK5Z2V59QB
         1VWETcAl2QmE06O+1jZvFS/bFAzctvFBjHNBNhMA03QdKtmjeJe4KqGilkYoU3oaURbh
         Y//sAl7HZ+JrtNwIOM/o8ypm++6eIo1nliHzBDONj2YuRhoemY9T44boLPSbZKHFVQwP
         w9KH9ZzfMchMa5F8KJV2lABpaMnuMkQe7acMS1QxzPc5uUhHYick7lDansFo8qGp/RkH
         OIWO7ztXVa64+Pzni/eoOpY3GVvk5BZMolh4C5wxq9mzu+ayTuhYP/i/olbJzL0B+ybZ
         Ibzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mc11sIS9JfwaQprz/kWFB5SamVxrqWxHuOoJav+3bpM=;
        b=ODJ6Y3AtZ6posrCpqt5kEfjWMJv3j8i3H6i8qsdbq4VGxvCUJWrSLTyf9pOtCYKe6o
         Vch8JvZQwKes4kuAtUv5mcWNfwBFFOElvZXU4eF4sz9HVXrbo4YK5E96VWDWnApo+ZQj
         AA2OVoTfxaOU1DcCtXxcpPWgs1R7BPGpJyqKWhoflaZuTvf6SJb2znqZxA+zOjKdiQR5
         wB6GqwPMpRVV2D78g0FHE8ovKm9nRdWNbKyP9kHWBw4EkvNap+x9Rb0Tonbtodp4O4cW
         wANF8vBmoojAC9KhFrzI64MvXHhOwLLjpF6o7ZGmG2NHw5ShmpKAwGP0n51Z+3FR9nMn
         Hl1Q==
X-Gm-Message-State: AOAM532+hBhfW2qYBjHyf2RXbU/chAldxQcM/XziP0uW0hhhxg+MXBcw
        VqWwlDwvnqY1VSVMs6Pl5S7H62JgxCqbX5Y6g3dYDg==
X-Google-Smtp-Source: ABdhPJyWJzf5cUwFwchFaO1ZhACidGkZHABSyUzo6C/qL8kGrdaCZs8kEh0S+5YxmFJL6fFGz6xP3dnQAKNGrjTKf2s=
X-Received: by 2002:a05:620a:2453:b0:67d:9539:495c with SMTP id
 h19-20020a05620a245300b0067d9539495cmr3171070qkn.30.1649180343459; Tue, 05
 Apr 2022 10:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
 <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org> <Ykx6NWrcf4IA2Mam@ripper>
In-Reply-To: <Ykx6NWrcf4IA2Mam@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 5 Apr 2022 20:38:52 +0300
Message-ID: <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
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

On Tue, 5 Apr 2022 at 20:17, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 05 Apr 08:38 PDT 2022, Dmitry Baryshkov wrote:
>
> > On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
> > > All interconnect device tree nodes on sm8450 are 2-cells, however in
> > > UFS node they are handled as 1-cells, fix it.
> > >
> > > Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Bjorn, could you please this pick for the -rc kernel?
> >
>
> The change is obviously correct, but what difference does this change
> make with the current implementation?

it makes interconnect paths probe correctly. All NoC have
#interconnec-cells = <2> now.

>
> Regards,
> Bjorn
>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > index 0cd5af8c03bd..bbd38b55e976 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > @@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
> > >                     iommus = <&apps_smmu 0xe0 0x0>;
> > > -                   interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> > > -                                   <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> > > +                   interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
> > > +                                   <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
> > >                     interconnect-names = "ufs-ddr", "cpu-ufs";
> > >                     clock-names =
> > >                             "core_clk",
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
