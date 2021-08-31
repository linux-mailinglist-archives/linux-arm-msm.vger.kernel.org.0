Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54003FC0D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 04:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239380AbhHaC3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 22:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239339AbhHaC3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 22:29:50 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C746AC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 19:28:55 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id bi4so18767880oib.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UIQLT8EPduQMUqMI4iVttelDDuEcYdyw9o3jt4FJ8Z4=;
        b=jkKB3Whxj1ObFBcZOwXML52FUZsXQ51zcfUXS2/G13PcYd4RFkMQVtJJgSgr5iH9Iy
         CHwLPDijjUcAbnQq+rwwbcPRoGw5a+wn4tbpgF9bKasEAbH+p4/WwSzdlsFE2uyrFV45
         7URjVqzsq3YxJj6+4VhowJ3bvTB5tbhukDAL2OdSsEn3xQk54oUKssA/WNOs3VWagAmg
         IKAKbEQX1DPpXeZqP6yvkq8KLv5xbXRUIueZWBOOivBEw37Jw+qhpXPi/Ep//2NZ1TG1
         V09Q4JN2GXOiECodR/u/AomRt7McGvbyDXw/bmoAdJ853WnmCbwozJ/rNCV6otBe7w9p
         FLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UIQLT8EPduQMUqMI4iVttelDDuEcYdyw9o3jt4FJ8Z4=;
        b=JvGoFN2MjfmULSSsCh7ga5Y9gtQr0H0gKV8Q1gng4c5S3JbCp9nTruCoLRWMC7kaUr
         SPOWT4Wa4sCFZIEbC790ZoLVknE3Vj7e6mkIhPNIDlv74fE57RHpVe0ERdFtIlVxu57f
         wigzMuzlJA3a8If2lIr2yC9WwceN8ykeO3FodQCuMcdmq5lyXPRZyypTZbi2fnw0coRB
         6DM19mKcmiGWag7gXfTbwIshZ/Xn05q0QWheuQ46ofTqAV7kwxdjLXfLqg2Nflc+kEX9
         AKB6vGMvh9EaIoKZ82+TXdkyq+TINtyd6HSq591CgzdVsMOvcddOZTMTZuxvQ+BvivZN
         0sOg==
X-Gm-Message-State: AOAM531dfgewSJJoTqZcFMUryP/xHPKomIUA+ECNv1OoeIo7dG7lXJLZ
        2GzXHuFt4noKZw61Eg512oZtaw==
X-Google-Smtp-Source: ABdhPJy1iru4/pf2lh8rlhBB57xc7Cxsy9R4pxXrsP+a9+ayWIoQnSs1HmZun2WV8JDylC7ar87Ynw==
X-Received: by 2002:a05:6808:1449:: with SMTP id x9mr1533304oiv.14.1630376935083;
        Mon, 30 Aug 2021 19:28:55 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g8sm3631746otk.34.2021.08.30.19.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 19:28:54 -0700 (PDT)
Date:   Mon, 30 Aug 2021 21:28:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add Display Port node
Message-ID: <YS2T5M9ozfz7tQu7@yoga>
References: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630339489-23172-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 30 Aug 11:04 CDT 2021, Kuogee Hsieh wrote:

> Changes in v2:
> -- break this patch into 3 patches
> 

It's only the DRM tree that want the changelog above '---', please move
it down.

Also, why isn't this "patch n/3" if there's three patches?

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 88 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c29226b..f224029 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3202,6 +3202,13 @@
>  							remote-endpoint = <&edp_in>;
>  						};
>  					};
> +
> +					port@2 {
> +                                                reg = <2>;
> +                                                dpu_intf0_out: endpoint {
> +                                                        remote-endpoint = <&dp_in>;
> +                                                };
> +                                        };

This block seems to be indented with spaces?

>  				};
>  
>  				mdp_opp_table: mdp-opp-table {
> @@ -3389,6 +3396,78 @@
>  					};
>  				};
>  			};
> +
> +			msm_dp: displayport-controller@ae90000 {

Prefixing the labels of all the mdss children mdss_ instead has the
benefit that the nodes group naturally in the board dts.

> +				status = "disabled";
> +				compatible = "qcom,sc7180-dp", "qcom,sc7280-dp";

This isn't a sc7180-dp block.

> +
> +				reg = <0 0x0ae90000 0 0x1400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names =	"core_iface",
> +						"core_aux",
> +						"ctrl_link",
> +					     	"ctrl_link_iface",

There seems to be some spaced among the tabs here.

> +						"stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +				phys = <&dp_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dp_out: endpoint { };
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> @@ -3398,7 +3477,8 @@
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>  				 <&dsi_phy 0>,
>  				 <&dsi_phy 1>,
> -				 <0>, <0>,
> +			  	 <&dp_phy 0>,
> +			  	 <&dp_phy 1>,

Same here, seems to be some spaces among the tabs on both of these
lines.

>  				 <&msm_edp 0>,
>  				 <&msm_edp 1>;
>  			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
> @@ -3525,6 +3605,12 @@
>                                  };
>                          };
>  
> +			dp_hot_plug_det: dp-hot-plug-det {
> +				pins = "gpio47";
> +				function = "dp_hot";
> +				bias-disable;
> +                        };

This seems to be indented with spaces?

Regards,
Bjorn

> +
>  			qspi_clk: qspi-clk {
>  				pins = "gpio14";
>  				function = "qspi_clk";
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
