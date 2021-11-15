Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915DC4509BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 17:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhKOQgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 11:36:05 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:17652 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhKOQgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 11:36:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636993989; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZYfsU0xjbXrPXTd7HBWhKtTgS/cxAjUcw8AixupPPrs=;
 b=djP/3/klqqo7Uz/ReS7TT573vQkpi5lJ30n/FhaM0PO+a2xPKhL00DxoVr0GrsWO4xNNXZI+
 HGQUU+qaWCEi0Xf+kFHZXQmQMeVh2QmWmEiRy8Sv8fMusPi9Jkj+0LN9XBrGnRd3Vg/LoyQS
 Oi9UVlOa2hj/kWUL88KqRCzqaQ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61928bc4b3d5cb1f55cc7b83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 16:33:08
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75522C4361A; Mon, 15 Nov 2021 16:33:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FC4DC4338F;
        Mon, 15 Nov 2021 16:33:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Nov 2021 08:33:07 -0800
From:   khsieh@codeaurora.org
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, quic_mkrishn@quicinc.com,
        quic_kalyant@quicinc.coml, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add Display Port node
In-Reply-To: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <473499ed0710598c59a507815ad11aa4@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-02 16:44, Kuogee Hsieh wrote:
> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Anyone has comments on this patch?

> 
> Changes in v2:
> -- move fixes of dp_phy reg property to other patch
> 
> Changes in v3:
> -- delete "qcom,sc7180-dp" from msm_dp node
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 89 
> +++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index fb2f1506..4414abc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2709,8 +2709,8 @@
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>  				 <&dsi_phy 0>,
>  				 <&dsi_phy 1>,
> -				 <0>,
> -				 <0>,
> +			  	 <&dp_phy 0>,
> +			  	 <&dp_phy 1>,
>  				 <&edp_phy 0>,
>  				 <&edp_phy 1>;
>  			clock-names = "bi_tcxo",
> @@ -2807,6 +2807,13 @@
>  							remote-endpoint = <&edp_in>;
>  						};
>  					};
> +
> +					port@2 {
> +                                                reg = <2>;
> +                                                dpu_intf0_out: 
> endpoint {
> +
> remote-endpoint = <&dp_in>;
> +                                                };
> +                                        };
>  				};
> 
>  				mdp_opp_table: opp-table {
> @@ -3018,6 +3025,78 @@
> 
>  				status = "disabled";
>  			};
> +
> +			msm_dp: displayport-controller@ae90000 {
> +				status = "disabled";
> +				compatible = "qcom,sc7280-dp";
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
> +						"ctrl_link_iface",
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
>  		pdc: interrupt-controller@b220000 {
> @@ -3120,6 +3199,12 @@
>  				bias-pull-up;
>  			};
> 
> +			dp_hot_plug_det: dp-hot-plug-det {
> +				pins = "gpio47";
> +				function = "dp_hot";
> +				bias-disable;
> +                        };
> +
>  			qspi_clk: qspi-clk {
>  				pins = "gpio14";
>  				function = "qspi_clk";
