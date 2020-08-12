Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8289D242F41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 21:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgHLTah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 15:30:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17007 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgHLTag (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 15:30:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597260634; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4+/wN/ZFlubPC8f06kWYCcnSStIOeSWNXCfdlUIBb6Q=;
 b=fnmQgif18+rrHBPtQURkn7WKszJ2D1EwL4w7C3+i1pCQZI6l/bHSgbg2oUAbFOybzBZg61LU
 56cC2wgIjtDWxe03OtLfXtahMK5TR/UFkBRM8yk3h8oEMLgJHn4QncDEpVErksvA98PRkmTC
 f3RqS8fS9/HhhRfGrzWb4FEA6M4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f3443514c787f237bb0c857 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 19:30:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C1637C433C6; Wed, 12 Aug 2020 19:30:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC4C6C433C9;
        Wed, 12 Aug 2020 19:30:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Aug 2020 12:30:23 -0700
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        airlied@linux.ie, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org,
        seanpaul@chromium.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org,
        dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5] arm64: dts: qcom: sc7180: Add Display Port dt node
In-Reply-To: <159717422853.1360974.2200109790995932014@swboyd.mtv.corp.google.com>
References: <20200811021553.25023-1-tanmay@codeaurora.org>
 <159717422853.1360974.2200109790995932014@swboyd.mtv.corp.google.com>
Message-ID: <70d8a4f073abf7a038c9830ec6586709@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-11 12:30, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-08-10 19:15:53)
>> @@ -2440,6 +2447,71 @@ dsi_phy: dsi-phy@ae94400 {
>> 
>>                                 status = "disabled";
>>                         };
>> +
>> +                       msm_dp: displayport-controller@ae90000 {
>> +                               status = "disabled";
>> +                               compatible = "qcom,sc7180-dp";
>> +
>> +                               reg = <0 0x0ae90000 0 0x1400>;
>> +
>> +                               interrupt-parent = <&mdss>;
>> +                               interrupts = <12 IRQ_TYPE_NONE>;
> 
> Please drop the flags. It's not required per the binding. It should 
> just
> be a single number, i.e. <12>.
> 

Sure. I will change DP-bindings accordingly as well.

>> +
>> +                               clocks = <&dispcc 
>> DISP_CC_MDSS_AHB_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_AUX_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_LINK_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +                               clock-names = "core_iface", 
>> "core_aux",
> "ctrl_link",
>> +                                             "ctrl_link_iface",
> "stream_pixel";
>> +                               #clock-cells = <1>;
>> +                               assigned-clocks = <&dispcc
> DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +                                                 <&dispcc
> DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +                               assigned-clock-parents = <&msm_dp 0>,
> <&msm_dp 1>;
>> +
>> +                               operating-points-v2 = <&dp_opp_table>;
>> +                               power-domains = <&rpmhpd SC7180_CX>;
> 
> Can you send another patch to add the hpd pinctrl binding for the hpd
> function? It would be useful to have that in the SoC level in case any
> board wants to use the hpd pin on this SoC without having to implement
> it themselves. It could be assigned here too as the pinctrl but I'm not
> sure if that is correct. Probably better to just have it in the SoC 
> file
> and then let boards pick to use it.
> 

We have tlmm node in sc7180.dtsi. We can define pinctrl definition for 
"dp_hot" funtionality there.

>> +
>> +                               ports {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       port@0 {
>> +                                               reg = <0>;
>> +                                               dp_in: endpoint {
>> +                                                       
>> remote-endpoint
> = <&dpu_intf0_out>;
>> +                                               };
>> +                                       };
>> +
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +                                               dp_out: endpoint { };
>> +                                       };
>> +                               };
>> +
>> +                               dp_opp_table: dp-opp-table {
> 
> Can this be called opp-table? I don't see the need to make it more
> specific given that it doesn't share the namespace at this level with
> anything else that is an opp table.
> 

DSI and MDP's OPP table names were posted here:
https://lore.kernel.org/dri-devel/1594292674-15632-4-git-send-email-rnayak@codeaurora.org/

So, It makes sense to keep naming conventions similar to dsi and mdp's 
opp table.

>> +                                       compatible =
> "operating-points-v2";
>> +
>> +                                       opp-160000000 {
>> +                                               opp-hz = /bits/ 64
> <160000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_low_svs>;
>> +                                       };
>> +
>> +                                       opp-270000000 {
>> +                                               opp-hz = /bits/ 64
> <270000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_svs>;
>> +                                       };
>> +
>> +                                       opp-540000000 {
>> +                                               opp-hz = /bits/ 64
> <540000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_svs_l1>;
>> +                                       };
>> +
>> +                                       opp-810000000 {
>> +                                               opp-hz = /bits/ 64
> <810000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_nom>;
>> +                                       };
>> +                               };
>> +                       };
>>                 };
>> 
>>                 dispcc: clock-controller@af00000 {
>> @@ -2449,8 +2521,8 @@ dispcc: clock-controller@af00000 {
>>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>>                                  <&dsi_phy 0>,
>>                                  <&dsi_phy 1>,
>> -                                <0>,
>> -                                <0>;
>> +                                <&msm_dp 0>,
>> +                                <&msm_dp 1>;
> 
> This bit will have to change when the DP phy is split off into the qmp
> driver.
> 

Yes. It will be <&dp_phy 0> and <&dp_phy 1> assuming dp_phy is DP PHY 
dts node name.

>>                         clock-names = "bi_tcxo",
>>                                       "gcc_disp_gpll0_clk_src",
>>                                       "dsi0_phy_pll_out_byteclk",
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
