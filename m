Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08BF67A7020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 04:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjITCIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 22:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjITCIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 22:08:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A5FCF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 19:08:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426BBC433C8;
        Wed, 20 Sep 2023 02:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695175687;
        bh=YUTPoteLEsnI9uYlbmDVFgO/ezPSaPVSmDi66jXEgj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F5wWhvhVK0q6mN8GzybymtBfptjKK6Kk9ncXw2rJL58oP6UNhOMi6YLNr7QqikZ6G
         Q+z3QVzyyvXRQ5pkvLpsqP0+h8hUxw30Si3mCtkA79TzPbshOF2qzkxiQ62OpTrIir
         I5nFmLX67VH8BBodvHclrsbbNvTt250oU4VOnRCwqFW2xCk3KRCu4sJC+vOC8U8ito
         HS+euQbZA2wWH66n9Ks0JNKVyZe+ZziYe6AxtpYVJt+fkPlb9cnli0rvtCwv/wb5YB
         fyzVS6FycCfjC+Pv2lHesvFRFwkZJO3hI0Y+n+aCcvlrw33e9CkE963rBYuBnlXX3+
         b7ts/F6s5Mx/g==
Date:   Tue, 19 Sep 2023 19:12:15 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8250: Add DisplayPort device
 node
Message-ID: <4eaekxgmikdacvvprysb6btdqootbc6paomzhuqjtzd6rgqxkc@birohtqp4rbo>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817145940.9887-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 17, 2023 at 05:59:37PM +0300, Dmitry Baryshkov wrote:
> Declare the displayport controller present on the Qualcomm SM8250 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 89 ++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index eb00bbd3e1f3..8d705a1713fb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3638,6 +3638,8 @@ port@1 {
>  
>  				port@2 {
>  					reg = <2>;
> +
> +					usb_1_qmpphy_dp_in: endpoint {};
>  				};
>  			};
>  		};
> @@ -4405,6 +4407,14 @@ dpu_intf2_out: endpoint {
>  							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: opp-table {
> @@ -4432,6 +4442,85 @@ opp-460000000 {
>  				};
>  			};
>  
> +			mdss_dp: displayport-controller@ae90000 {

displayport-controller does not seem to be a valid child node of the
sm8250 mdss. Please make sure that the binding is updated, if not
already done.

Thanks,
Bjorn
