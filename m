Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A84322F3F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 17:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbgG0PiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 11:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730580AbgG0PiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 11:38:14 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD63C0619D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 08:38:14 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w17so8185822ply.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NkVbGEZqq2gtUYFFHihdCf9UlSJbj6QF8gPVaF8Bfbo=;
        b=SQNYbubVmJC7AL7K9qiuOd/Gn3pZrb2Pj6GSZkzj5uiofy/xe8+FFypgWHTLDIlppl
         JCleeZ9of5qVBsZWWlVx7kXEfl+m3LqjmR2QBW7rfu9QuEuS5xziWEVE6GYrMCSrSs7O
         kXoF4xAo3teKyO/XcsnRddniMMAbVRMgsTEv33E/v4LDLxnHshM4KCBgvpoy/iQTXhIR
         Btb28CisbS4v3W9GLSU1hM0q+zgKqoP8W0PEu1aTj9UldG7y3uuYRHT6tHkNmGwLJ2MN
         99ss8OhFnJUsX021lCurIDBdvJGxzfmGkcXigsmA+phWdEJgEe+K7PpzOC3sq58gPFd7
         W0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NkVbGEZqq2gtUYFFHihdCf9UlSJbj6QF8gPVaF8Bfbo=;
        b=WFI4b5euyUnmeRTeOTqXPW9PCtwGvWb0Un1HJpKiubchNLJkQiyZhxPXGyTbj6OMVR
         bvSw5i3jYou+SlrJzIMD+yKdEnxUU47Xtx/+zQb1CZYbduzcA2tMugP5iAhkDvGlQFUo
         IAA8rBmjiGBoapiFEz8LON3yhMI9qup3suE1BytAM9PqyNcljA6Lcko+AK1eDZdMw+re
         gJEoA4DehzoUfHAA9bWcptekZBIw9M04YsN/4Tp/msl5DtuZuq3Okg0oOBCF5HS8v6FZ
         uUkDq0X/JrZ6T+vNzIH0SZQgMwaMUSjKUSAiwndalNKDTiZvsvoUclPWE83/eILN03uH
         JTNg==
X-Gm-Message-State: AOAM532VhdSVgliV2gEudmwiiRCsP8wxlYLSWfD2rQyEU5bVvnSs+k+z
        Wg3+xDyITPS2Xv3+kclyRU7dsQ==
X-Google-Smtp-Source: ABdhPJzAXd8kJn2pS6mbPjKZXLIavxQW9wr44q5/JPYSYykSlpkS173kdTtzJWxxIonR/XqZ3Jaxlg==
X-Received: by 2002:a17:90a:ea0b:: with SMTP id w11mr2833577pjy.80.1595864293473;
        Mon, 27 Jul 2020 08:38:13 -0700 (PDT)
Received: from localhost ([223.190.9.130])
        by smtp.gmail.com with ESMTPSA id y19sm4363801pfn.77.2020.07.27.08.38.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 08:38:12 -0700 (PDT)
Date:   Mon, 27 Jul 2020 21:08:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
Message-ID: <20200727153806.kgegadvghmkevch3@vireshk-mac-ubuntu>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <94581989-e069-55e5-6b70-919185eda33e@linaro.org>
 <e0c03ce2-136c-2c5c-6f36-bb0c69a82e2d@codeaurora.org>
 <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8af2da-cc3f-005d-47e6-b36be1104d6a@codeaurora.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-07-20, 17:38, Rajendra Nayak wrote:
> 
> On 7/27/2020 11:23 AM, Rajendra Nayak wrote:
> > 
> > 
> > On 7/24/2020 7:39 PM, Stanimir Varbanov wrote:
> > > Hi,
> > > 
> > > On 7/23/20 9:06 PM, Stanimir Varbanov wrote:
> > > > Hi Rajendra,
> > > > 
> > > > After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> > > > below messages on db845:
> > > > 
> > > > qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> > > > current OPP for freq 533000097 (-34)
> > > > 
> > > > ^^^ This one is new.
> > > > 
> > > > qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> > > > 
> > > > ^^^ and this message is annoying, can we make it pr_debug in rpmh?
> > > > 
> > > > On 7/23/20 2:26 PM, Rajendra Nayak wrote:
> > > > > Add the OPP tables in order to be able to vote on the performance state of
> > > > > a power-domain.
> > > > > 
> > > > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
> > > > >   1 file changed, 38 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > index e506793..5ca2265 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > @@ -3631,8 +3631,10 @@
> > > > >               interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > > > >               power-domains = <&videocc VENUS_GDSC>,
> > > > >                       <&videocc VCODEC0_GDSC>,
> > > > > -                    <&videocc VCODEC1_GDSC>;
> > > > > -            power-domain-names = "venus", "vcodec0", "vcodec1";
> > > > > +                    <&videocc VCODEC1_GDSC>,
> > > > > +                    <&rpmhpd SDM845_CX>;
> > > > > +            power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
> > > > > +            operating-points-v2 = <&venus_opp_table>;
> > > > >               clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> > > > >                    <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> > > > >                    <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> > > > > @@ -3654,6 +3656,40 @@
> > > > >               video-core1 {
> > > > >                   compatible = "venus-encoder";
> > > > >               };
> > > > > +
> > > > > +            venus_opp_table: venus-opp-table {
> > > > > +                compatible = "operating-points-v2";
> > > > > +
> > > > > +                opp-100000000 {
> > > > > +                    opp-hz = /bits/ 64 <100000000>;
> > > > > +                    required-opps = <&rpmhpd_opp_min_svs>;
> > > > > +                };
> > > > > +
> > > > > +                opp-200000000 {
> > > > > +                    opp-hz = /bits/ 64 <200000000>;
> > > > > +                    required-opps = <&rpmhpd_opp_low_svs>;
> > > > > +                };
> > > > > +
> > > > > +                opp-320000000 {
> > > > > +                    opp-hz = /bits/ 64 <320000000>;
> > > > > +                    required-opps = <&rpmhpd_opp_svs>;
> > > > > +                };
> > > > > +
> > > > > +                opp-380000000 {
> > > > > +                    opp-hz = /bits/ 64 <380000000>;
> > > > > +                    required-opps = <&rpmhpd_opp_svs_l1>;
> > > > > +                };
> > > > > +
> > > > > +                opp-444000000 {
> > > > > +                    opp-hz = /bits/ 64 <444000000>;
> > > > > +                    required-opps = <&rpmhpd_opp_nom>;
> > > > > +                };
> > > > > +
> > > > > +                opp-533000000 {
> > > > > +                    opp-hz = /bits/ 64 <533000000>;

Is this the highest OPP in table ?

> > > Actually it comes from videocc, where ftbl_video_cc_venus_clk_src
> > > defines 533000000 but the real calculated freq is 533000097.
> > 
> > I still don't quite understand why the videocc driver returns this
> > frequency despite this not being in the freq table.
> 
> Ok, so I see the same issue on sc7180 also. clk_round_rate() does seem to
> return whats in the freq table, but clk_set_rate() goes ahead and sets it
> to 533000097. Subsequently when we try to set a different OPP, it fails to
> find the 'current' OPP entry for 533000097. This sounds like an issue with the OPP
> framework? Should we not fall back to the highest OPP as the current OPP?
> 
> Stephen/Viresh, any thoughts?

I think we (in all frameworks generally) try to set a frequency <=
target frequency and so there may be a problem if the frequency is
larger than highest supported. IOW, you need to fix tables a bit.

-- 
viresh
