Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632F96BE90A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 13:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjCQMQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 08:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjCQMQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 08:16:11 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B3FDDF24
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 05:16:10 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id g18so4850452ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679055368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB1pjDrIFDWl/GpnCbpbfSmQwQ+xIhoM1uzp4DIQHWQ=;
        b=H6MhW6SzQiMeHBTvrvFr8MqEKjtlxGlnonkYx+iGaNrit8BJgHWetw67L/OP1m4Ay8
         9ntl5JOeLbwVH4RqpdhWw4olLzgfP7Jkl8MqZd4mn4NfrYwauMdzHpJdQHBmnsa/p9D2
         ynAvhUoL3P9sZPhVlywR5Z/pdqGzyPkpFaFyziF0BwDnCMH1GtmQmFZl61H9YH98tW3g
         X0tn8FVQfYrE20ZPR4U0FVkg+C6W+yO6U/18IYQciRXC8hwLJsu+wk67tF0EOJWqdVO6
         tgcAIDXNNCFlUB2NOBZe5SqRmn59p0nqQQVYtN+VAyumq6JXpmMDHl3pB/P/SaxQZL2q
         c2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679055368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB1pjDrIFDWl/GpnCbpbfSmQwQ+xIhoM1uzp4DIQHWQ=;
        b=yjjIqD7SrR8FCoSVf4htgImZexWz04oKM6DuxpQgTQfumjyzKMjziDgRJiHXSLnXV3
         ++HcrpqwPuM4wgxW2QmeUPukzcg4uHupymziJ+gsOSWyv7HGrnxr2OEDN43BGdqdNVnK
         Jzb/71lNEJKaJl1d9riY9Ik2Cl/Za9Fu7VdD2nWfV9NyU5ks2VtC7+0TFjNWnCUeMr3t
         RMPjh3ukFkFB0xQ05WARL7tVsrVoPnxv3EIwoUAC3VsMz3VzFArNK+YHrUQMBY2MvdFu
         kyOluqZMFrkuiTSzkQ+mf1ZZx4QPFL5BO7iWq9bRSzdaFTtt3Q9aX66rpaDDOQrXTpj5
         2BTw==
X-Gm-Message-State: AO0yUKVPPK8c09qXiL8AwWsRyCS67qlgguAum/Kic5z1Tm5cGOFSDEiU
        gEQaOL+l9x8Wt3EWzLU8BzdGjQ==
X-Google-Smtp-Source: AK7set9FBPeEYHssajhG7VTonP8sMECPpkGtXFquBIb7N6Ao22R/+hFH2lC+l6bFgRFFTNA/f++GWg==
X-Received: by 2002:a05:651c:550:b0:290:6e01:8d0b with SMTP id q16-20020a05651c055000b002906e018d0bmr4207323ljp.26.1679055368130;
        Fri, 17 Mar 2023 05:16:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n2-20020a2e8782000000b0029335c12997sm380673lji.58.2023.03.17.05.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:16:07 -0700 (PDT)
Message-ID: <ac42e079-6db2-0934-bdcf-836229b3d0a5@linaro.org>
Date:   Fri, 17 Mar 2023 14:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sm8350: add dp controller
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
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v5-3-a27f1b26ebe8@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v5-3-a27f1b26ebe8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/03/2023 11:12, Neil Armstrong wrote:
> Add the Display Port controller subnode to the MDSS node.
> 
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 74 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 975ab4cbe57e..37ae4a948be1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2415,6 +2415,80 @@ dpu_intf2_out: endpoint {
>   							remote-endpoint = <&mdss_dsi1_in>;
>   						};
>   					};
> +
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dp: displayport-controller@ae90000 {
> +				compatible = "qcom,sm8350-dp";
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0x600>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
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
> +				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
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

I think we still need an OPP entry for RBR rate (160000000). Downstream 
would resort to low_svs in such case, the min voltage for MMCX domain.

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
>   				};
>   			};
>   
> 

-- 
With best wishes
Dmitry

