Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978754C19D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 18:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiBWRWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 12:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243359AbiBWRWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 12:22:04 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9156559
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645636895; x=1677172895;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5EKhfuk/coV4wXHsSnx1QP6vOM5XWSxtlOIzzZeCWkA=;
  b=pbI0u3edXPCHwb7h12YxV9xy0JpkcDuTFZmAMu1Tsk+yd8TMv+3xvfC5
   4EX8TxDV3LI2cQZRB1UiFoLs41VozAZyK5ZEwOkhT3Nw08vLviSZKqMDV
   /n+XbUoviGbCtUvQ5P1bSrtN/4w/ALXd022bkOPvU69ZWhmR9qwGgP5+s
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Feb 2022 09:21:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 09:21:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 09:21:33 -0800
Received: from [10.110.64.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 23 Feb
 2022 09:21:32 -0800
Message-ID: <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
Date:   Wed, 23 Feb 2022 09:21:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/18/2022 6:22 PM, Dmitry Baryshkov wrote:
> On Sat, 19 Feb 2022 at 03:55, Stephen Boyd <swboyd@chromium.org> wrote:
>> Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
>>> On 19/02/2022 00:31, Kuogee Hsieh wrote:
>>>> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
>>>>> There is little point in having both connector and root bridge
>>>>> implementation in the same driver. Move connector's functionality to the
>>>>> bridge to let next bridge in chain to override it.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> This patch break primary (edp) display
>>>>
>>>> -- right half of screen garbled
>>>>
>>>> -- screen shift vertically
>>>>
>>>> below are error messages seen --
>>>>
>>>> [   36.679216] panel-edp soc@0:edp_panel: No display modes
>>>> [   36.687272] panel-edp soc@0:edp_panel: No display modes
>>>> [   40.593709] panel-edp soc@0:edp_panel: No display modes
>>>> [   40.600285] panel-edp soc@0:edp_panel: No display modes
>>> So, before the patch the drm core was getting modes from the
>>> drm_connector (which means, modes from drm driver itself). With this
>>> patch the panel-edp tries to get modes.
>>>
>>> Could you please check, why panel_edp_get_modes() fails? Assuming that
>>> you use platform panel-edp binding (rather than 'edp-panel') could you
>>> please check you have either of the following:
>>> - ddc bus for EDID?
>> I don't see anywhere where the ddc pointer is set for the dp bridge in
>> msm_dp_bridge_init(). Is that required though? I'd think simple panel is
>> still being used here so reading EDID isn't required.
> I meant the 'ddc-i2c-bus' property for the corresponding eDP panel.
>
>>> - either num_timing or num_modes in your panel desc.
> After reading the panel-edp's code I don't have another cause for
> panel_edp_get_modes(). It should either have a DDC bus specified using
> the mentioned device tree property, or it should have specified the
> timings.
>
> Kuogee, which platform were you using when testing this patch? Could
> you please share the dts fragment?

I cherry-picked your patches on top of our internal release which is 
usually have some (or many) patches behind msm-next.

where is "ddc-i2c-bus" located?

                         msm_edp: edp@aea0000 {
                                 compatible = "qcom,sc7280-edp";

                                 reg = <0 0xaea0000 0 0x200>,
                                       <0 0xaea0200 0 0x200>,
                                       <0 0xaea0400 0 0xc00>,
                                       <0 0xaea1000 0 0x400>;

                                 interrupt-parent = <&mdss>;
                                 interrupts = <14>;

                                 clocks = <&rpmhcc RPMH_CXO_CLK>,
                                          <&gcc GCC_EDP_CLKREF_EN>,
                                          <&dispcc DISP_CC_MDSS_AHB_CLK>,
                                          <&dispcc 
DISP_CC_MDSS_EDP_AUX_CLK>,
                                          <&dispcc 
DISP_CC_MDSS_EDP_LINK_CLK>,
                                          <&dispcc 
DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
                                          <&dispcc 
DISP_CC_MDSS_EDP_PIXEL_CLK>;
                                 clock-names = "core_xo",
                                               "core_ref",
                                               "core_iface",
                                               "core_aux",
                                               "ctrl_link",
                                               "ctrl_link_iface",
                                               "stream_pixel";
                                 #clock-cells = <1>;
                                 assigned-clocks = <&dispcc 
DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
                                                   <&dispcc 
DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
                                 assigned-clock-parents = <&edp_phy 0>, 
<&edp_phy 1>;

                                 phys = <&edp_phy>;
                                 phy-names = "dp";

                                 operating-points-v2 = <&edp_opp_table>;
                                 power-domains = <&rpmhpd SC7280_CX>;

                                 #address-cells = <1>;
                                 #size-cells = <0>;

                                 status = "disabled";

                                 ports {
                                         #address-cells = <1>;
                                         #size-cells = <0>;
                                         port@0 {
                                                 reg = <0>;
                                                 edp_in: endpoint {
remote-endpoint = <&dpu_intf5_out>;
                                                 };
                                         };
                                 };

                             edp_opp_table: opp-table {
                                         compatible = "operating-points-v2";

                                         opp-160000000 {
                                                 opp-hz = /bits/ 64 
<160000000>;
                                                 required-opps = 
<&rpmhpd_opp_low_svs>;
                                         };

                                         opp-270000000 {
                                                 opp-hz = /bits/ 64 
<270000000>;
                                                 required-opps = 
<&rpmhpd_opp_svs>;
                                         };

                                         opp-540000000 {
                                                 opp-hz = /bits/ 64 
<540000000>;
                                                 required-opps = 
<&rpmhpd_opp_nom>;
                                         };

                                         opp-810000000 {
                                                 opp-hz = /bits/ 64 
<810000000>;
                                                 required-opps = 
<&rpmhpd_opp_nom>;
                                         };
                                 };
                         };

