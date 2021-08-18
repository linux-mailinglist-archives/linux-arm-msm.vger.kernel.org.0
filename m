Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA2E3F0931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 18:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhHRQfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 12:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhHRQfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 12:35:38 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765D1C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 09:35:03 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id bo18so3065890pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m1+hMN42icqTlxVWLTEkH0/pkiGKB8NQcMU6EbHVJG8=;
        b=Mt3IY0k0VkCNIkfPQhsBY3B4z79w4r4++PooLHAONBUnzJjrzVuEhPjAJwV2FL8xp7
         PlhWqmkMBIDvGjH6i1IM7fMtFTAbntsgFrD6Qp3BuWQzTM0aBspGJJyKpSV1wQ8uHkBK
         KdD7ohp4BxnIm8kEKQUkbL4T3wU0KSqNL+E74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m1+hMN42icqTlxVWLTEkH0/pkiGKB8NQcMU6EbHVJG8=;
        b=OCxYkVSIKyIXtGaNo01PLBw3NB/aaj17UyBHl3NcqNufej+q4MS2vsz6otYk+vL29w
         kSkFRZXNqOhy6ySb080xGLzl/TqSNHAziuridh9SFXAVslDNEn1uBx5XkzyA/b62YJck
         7PaLAJBqxaxA3UahymN7dIRKTxK1PJjey+jCOybSfjqzYALJ644NUZ27zg9pjkjkMk45
         5hE+BpNa4YoU5L1IVK8t4I65GofJWcIFzoSgwlSWyct6qSGZeI2HH1Fb8fr08o/Hc9Qq
         4/bJDjE4BfCT0eud4IeIV8cvoF1zUjJ0nfUtTwi/15AJQyeUhivC/q2k4zwPhc/6ZgN6
         RenQ==
X-Gm-Message-State: AOAM533eqgI+ZjkGlvuCM7ywF0YGo/BeHYj8uKeBZiKZ36Dr59us8L4U
        1/n1uQKQKtjMncm9aj2a9BE8Xw==
X-Google-Smtp-Source: ABdhPJzW2zNeRcHd7qe6M0HKGzkNMa+UEgzEFvjDRd8IQcbcxugUUS9wiUmRFP2v2rVEL64AsplTrQ==
X-Received: by 2002:a17:902:c94c:b0:12d:905f:d80d with SMTP id i12-20020a170902c94c00b0012d905fd80dmr8031229pla.21.1629304503073;
        Wed, 18 Aug 2021 09:35:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1d24:fb00:9009:ffbe])
        by smtp.gmail.com with UTF8SMTPSA id p30sm261393pfh.116.2021.08.18.09.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 09:35:02 -0700 (PDT)
Date:   Wed, 18 Aug 2021 09:35:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sc7280: Add DSI display nodes
Message-ID: <YR02tKJcautEPQHC@google.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 18, 2021 at 03:57:03PM +0530, Krishna Manikandan wrote:
> From: Rajeev Nandan <rajeevny@codeaurora.org>
> 
> Add DSI controller and PHY nodes for sc7280.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>

You should sign off patches you send, even if you aren't the original author.

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index fd7ff1c..aadf55d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1483,6 +1483,18 @@
>  
>  				status = "disabled";
>  
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +
>  				mdp_opp_table: mdp-opp-table {
>  					compatible = "operating-points-v2";
>  
> @@ -1507,6 +1519,95 @@
>  					};
>  				};
>  			};
> +
> +			dsi0: dsi@ae94000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				phys = <&dsi_phy>;
> +				phy-names = "dsi";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dsi_opp_table: dsi-opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			dsi_phy: dsi-phy@ae94400 {
> +				compatible = "qcom,sc7280-dsi-phy-7nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x280>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};

I'm not an expect, but this looks sane to me and it's very similar to the
SC7180 config.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
