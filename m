Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C898691D9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbjBJLJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjBJLJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:09:02 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3902071001
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:09:01 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id a10so4422094edu.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAtpgUZ+OxRTCx1yBUOCNZy2P/UDmhE7zGbAYq1w6w0=;
        b=MBFcnAygFr6t0Hh6c11ay3jvY9Cbt1fRbLM27Mxn4kxaTz5w+Z7c1vqV2oIXScbtMr
         hzqf7Q67e74dNeKCQUXH4iAumgHuJj/zFlg3Th6ODo7cpX0dEq+Q2dG+uAQKRZw7ShO1
         fDlTB1TdvecJgjSPyxDtEd9tHUmMxHqP9L37c2xH4fxqzNlMq/U0mbNfWtsQBMl0QJEh
         24h+gKI6Exy/659Uoh5QXDtpjWssVrG7nglgUVsI9JDj0ueQTutUBilDNNhoJqfI33v6
         41mXrbNOSkH/AdQRyJ9P4aPBHn9PlTEzjxByxoxqXxvSk2k/KTqE5IiKP/NPNJ27SIkt
         XqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAtpgUZ+OxRTCx1yBUOCNZy2P/UDmhE7zGbAYq1w6w0=;
        b=q9HXHIycJVAY+s3Cii+qW37VcUPHqdTVm/MdTFO+R4yOF9qskZGMDAIX85/HonZ0Gk
         uHely9wXfy3+fLLjDOH4IHs9qwGKwc22IZhvRmJ2nIhB/G8+mAaJ4/gOwKYDQSAD4J+O
         2LsKETwKRB0sJl56IxLEJWhNdGRJG5L0rqIS1Jk4w3WQi2V45i3ri/wyEl4ilrzbw4Aj
         PtLOWeI9Z+DIpz5l7pPdnB9bZuJwtR07eVXHfuZql0AMTqW6SdPpZPRc1hkXMWxgr3QA
         trvsItkSpj+GYAyDYnE6D2L1PW2TPAsJBykwHD+uOWNT+zDDyGO6ZSWQIUYbgwF6dQSo
         RVzg==
X-Gm-Message-State: AO0yUKXjAq39nLOTZxgiv/9RCo3VVOy/SaISYC60wUBZKuqII5Z7QRfs
        5CeIBDp/ZCsDuNFHSK+mo0vfyg==
X-Google-Smtp-Source: AK7set/RrYSghKU2TCi2d2pe/JkyXdET21wmcAMOmZQ1oerGmZdwtJ0Oy8pGgRxiHArAR2x2GqvlIQ==
X-Received: by 2002:a50:d55e:0:b0:4ac:1ba2:2041 with SMTP id f30-20020a50d55e000000b004ac1ba22041mr361992edj.15.1676027339831;
        Fri, 10 Feb 2023 03:08:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k2-20020a508ac2000000b00499b6b50419sm2024753edk.11.2023.02.10.03.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:08:59 -0800 (PST)
Message-ID: <df068428-c086-4f6a-3cda-9ef6ce665f13@linaro.org>
Date:   Fri, 10 Feb 2023 13:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8350: add dp controller
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-3-529da2203659@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-3-529da2203659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 12:34, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 82 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index d490ce84a022..eb636b7dffa7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2862,13 +2862,20 @@ ports {
>   
>   					port@0 {
>   						reg = <0>;
> -						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&mdss_dsi0_in>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp_in>;

No need to reorder these ports. Please add DP to the end.

>   						};
>   					};
>   
>   					port@1 {
>   						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
>   						dpu_intf2_out: endpoint {
>   							remote-endpoint = <&mdss_dsi1_in>;
>   						};
> @@ -2876,6 +2883,77 @@ dpu_intf2_out: endpoint {
>   				};
>   			};
>   
> +			mdss_dp: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0x600>,
> +				      <0 0xae91000 0 0x400>;

This will not validate against the schema. Please add p1 region at the 
end (I assume it is <0 0x0ae91400 0 0x400>).

> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +			                      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&usb_1_qmpphy 1>,
> +							 <&usb_1_qmpphy 2>;

Please use defined names here and in the phys below

> +
> +				phys = <&usb_1_qmpphy 1>;
> +			        phy-names = "dp";
> +
> +			        #sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
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
> +
>   			mdss_dsi0: dsi@ae94000 {
>   				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>   				reg = <0 0x0ae94000 0 0x400>;
> 

-- 
With best wishes
Dmitry

