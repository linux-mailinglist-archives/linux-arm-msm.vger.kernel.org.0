Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BFC527223
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbiENOoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbiENOoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:44:19 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B781169
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:44:18 -0700 (PDT)
Received: from [192.168.1.113] (abxh168.neoplus.adsl.tpnet.pl [83.9.1.168])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 45F5D2053A;
        Sat, 14 May 2022 16:44:15 +0200 (CEST)
Message-ID: <d0c61f8e-c647-1c2d-7ebd-0634b1ca857d@somainline.org>
Date:   Sat, 14 May 2022 16:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 01/12] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy
 by default
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
 <20220514141041.3158521-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220514141041.3158521-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 14/05/2022 16:10, Dmitry Baryshkov wrote:
> Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
> They should be enabled in the board DT files. No existing boards use
> them at this moment.
>
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 240293592ef9..8697d40e9b74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
>   				phys = <&dsi0_phy>;
>   				phy-names = "dsi";
>   
> +				status = "disabled";
> +
>   				ports {
>   					#address-cells = <1>;
>   					#size-cells = <0>;
> @@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
>   
>   				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
>   				clock-names = "iface", "ref";
> +				status = "disabled";
>   			};
>   		};
>   

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

