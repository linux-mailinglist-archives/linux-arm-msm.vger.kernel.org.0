Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5061566F51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbiGENg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiGENgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:36:17 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B8D71265
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 05:58:06 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c13so13445615qtq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMiUEOKk9r77VMVVPa8z6NBhDHlBwjJXvsubB7Baxfc=;
        b=XZkg/spioxcX8d4p0KVTXf2AzZ+QZdxO5jRoERcJDRn+wYuBLyyF0qXMrGurDsjXJ3
         Cwxh7oa+Tg3jd9appJk2J5mgUwI0zYSI49nCEv9ZvJorCWddYfje/ZA46AwPmDriGZX2
         SCFTLWTbDb0f6iVSgCfwSZ2JkcJGiG7ZudIIPn2Ky0Qvun2YS+6JteCNtOZVYabpn9AH
         kDm7ecpxsQsEPXKSPEMdNm4mAznc8UDoepnUl+tPQEfsSTUZY/T6YUD0pUjhIeg/pAkU
         TIHzzqROEXOCQy+qVc28s2NZDhufhVqxvag0R40IhJBS9NAd8QPr/V/Ps88g+ZHM3IeQ
         KaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMiUEOKk9r77VMVVPa8z6NBhDHlBwjJXvsubB7Baxfc=;
        b=ks1Cxu7FVC2fTmD/oVYxGR5RTR5OQ6pWitUwrjNtMupcjy2glcw3GgFQneUSagCY9X
         BFv+VJi+uLEu477dnGnvCC1gqsXkzb18aJoQqzYj5DSe1gqAybzz6BtEklTkOtVKAlX6
         cbNBqXdmTNgtwpjwTQKGiYNzNwadlwx9PpOQple3ZJAyj4PpWZ4hRM/ZLST2Ze+CbV1h
         6hhSs7B0g2BW8kuyRomVMcreZprzgbuHeLfRA39j4fgF+1Jy9EcDuehjxySj9dL98ZRa
         RhiiJcWV5jRodYftEvpsxncENIWAMDqXkD7EdfJAscZ+u8OI0hVNXsBj08z/jVvrLcyn
         IYrg==
X-Gm-Message-State: AJIora99tZL+tAW6p1nB2bw33FnprK8AxM8AY/f5J5YQzVS23yA4meas
        sGFbWuk8xu9txw6CpMXCBjcRsgOy8lLHwCGLT8UYMw==
X-Google-Smtp-Source: AGRyM1ssdGXVsDEnncHVzsnICuUkRzm3oDpktel2aLTMIiD9A0pZ5wNtjnGOM8AVX4r9KvV3eFAob7pightug7CfKbo=
X-Received: by 2002:ac8:5956:0:b0:31d:28dc:17c with SMTP id
 22-20020ac85956000000b0031d28dc017cmr26185913qtz.295.1657025876136; Tue, 05
 Jul 2022 05:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220705114032.22787-1-johan+linaro@kernel.org>
 <20220705114032.22787-2-johan+linaro@kernel.org> <e3b344e7-4100-e0d4-0dcd-aeef4893ad43@linaro.org>
 <YsQztl9KHS5csu4A@hovoldconsulting.com>
In-Reply-To: <YsQztl9KHS5csu4A@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 5 Jul 2022 15:57:45 +0300
Message-ID: <CAA8EJppskvGeccyxAE7U3O+e_g4r-UhzwK=x1TSF-fZF-Yn67A@mail.gmail.com>
Subject: Re: [PATCH 01/14] arm64: dts: qcom: sc7280: drop PCIe PHY clock index
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Tue, 5 Jul 2022 at 15:51, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Jul 05, 2022 at 03:42:08PM +0300, Dmitry Baryshkov wrote:
> > On 05/07/2022 14:40, Johan Hovold wrote:
> > > The QMP PCIe PHY provides a single clock so drop the redundant clock
> > > index.
> > >
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Hmm. After checking the source code, the clocks entry of the phy@1c0e000
> > node also needs to be fixed.
>
> I assume you meant pci@1c08000 here? Thanks for catching that!
>
> > And also maybe:
> >
> > Fixes: bd7d507935ca ("arm64: dts: qcom: sc7280: Add pcie clock support")
> > Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related
> > nodes")
>
> Maybe, I'm a bit reluctant to add a Fixes tags for these even if they do
> violate the binding. But sure, why not.

Yep, I'm also in doubt here. In this case this is more logical. I'd
allow you to decide then.

>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index e66fc67de206..b0ae2dbba50f 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -818,7 +818,7 @@ gcc: clock-controller@100000 {
> > >                     reg = <0 0x00100000 0 0x1f0000>;
> > >                     clocks = <&rpmhcc RPMH_CXO_CLK>,
> > >                              <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
> > > -                            <0>, <&pcie1_lane 0>,
> > > +                            <0>, <&pcie1_lane>,
> > >                              <0>, <0>, <0>, <0>;
> > >                     clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
> > >                                   "pcie_0_pipe_clk", "pcie_1_pipe_clk",
> > > @@ -2110,7 +2110,7 @@ pcie1_lane: phy@1c0e200 {
> > >                             clock-names = "pipe0";
> > >
> > >                             #phy-cells = <0>;
> > > -                           #clock-cells = <1>;
> > > +                           #clock-cells = <0>;
> > >                             clock-output-names = "pcie_1_pipe_clk";
> > >                     };
> > >             };
>
> Johan



-- 
With best wishes
Dmitry
