Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EACEE59E5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 17:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243621AbiHWPNK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 11:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243673AbiHWPMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 11:12:53 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4775113D13
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 03:22:42 -0700 (PDT)
Received: from [192.168.1.101] (afbd223.neoplus.adsl.tpnet.pl [95.49.29.223])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3C4D33F63E;
        Tue, 23 Aug 2022 12:22:38 +0200 (CEST)
Message-ID: <3eaa26a5-dde7-06e7-f47d-cb836fbd495d@somainline.org>
Date:   Tue, 23 Aug 2022 12:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0
 node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.08.2022 21:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 38 ++++++++++++++--------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index bc773e210023..5843e46a3164 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3571,6 +3571,25 @@ dsi0_out: endpoint {
>  						};
>  					};
>  				};
> +
> +				dsi_opp_table: opp-table {
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
>  			};
>  
>  			dsi0_phy: dsi-phy@ae94400 {
> @@ -3663,25 +3682,6 @@ dsi1_phy: dsi-phy@ae96400 {
>  				clock-names = "iface", "ref";
>  
>  				status = "disabled";
> -
> -				dsi_opp_table: opp-table {
> -					compatible = "operating-points-v2";
> -
> -					opp-187500000 {
> -						opp-hz = /bits/ 64 <187500000>;
> -						required-opps = <&rpmhpd_opp_low_svs>;
> -					};
> -
> -					opp-300000000 {
> -						opp-hz = /bits/ 64 <300000000>;
> -						required-opps = <&rpmhpd_opp_svs>;
> -					};
> -
> -					opp-358000000 {
> -						opp-hz = /bits/ 64 <358000000>;
> -						required-opps = <&rpmhpd_opp_svs_l1>;
> -					};
> -				};
>  			};
>  		};
>  
