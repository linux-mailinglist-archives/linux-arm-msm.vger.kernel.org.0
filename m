Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B401D69222C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjBJP2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbjBJP2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:28:53 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01440B44C
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:28:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so4343030wms.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cy3a8kpnC+sCTHwnDRky9CsOJtj+AEHdVOXHEunigCk=;
        b=PkiaUU4Zh8w7S5KZ7RSgZNScttYh+zu0ske93eSlt+tyBCQqvOXN+yqGYjBoX5SW/f
         ELzb7vjcr3Q6CdAQTrDKTwoGMQ81ZCH5037ShmcW5Dqmodu9HmC+dhUh6VWoZuzfDD85
         1KE07ON9oCiyIwMCCu0xiA1SreeKAcP5qtP4AdIj1oH6KV7/XvK/hcEIwvQrcJ2+Xz4I
         y0GBkXYNfmx2ZFkD4ivRmy5OrM9YyqDxxvM3+FX9GsyvOTfGS4Dbzz4hXbZjpDTvbU4X
         TaetDQLcXaRvni3gI1Od8oYy2R50UtFRodIiIB8VT3TeSoDrofelK/Hr/mPfarA6CACk
         /mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy3a8kpnC+sCTHwnDRky9CsOJtj+AEHdVOXHEunigCk=;
        b=b8Akjl2cbhuHuzMnQwKGBVe5Tit//Rceh0/9F+n5yMZ79fsxdlTb7FbvYRDzLUFeg/
         bL9E3LOaORsmsPpnqzHUii9IFoLBzm+NuJKHoDpl0la0giZZzFQzIvPXXef1Vn4X1ShT
         9zF6lHXKw9AlIGXPyzvOShdy+d6FcMNdWPlEWgVvdxQtJEqSqTwHeYXIgbcDEP88mI9w
         BNCizxQt1oCJm0aQzrZkPkXVgbzHHQ4vckei6KbP9+xeLYSYKm1pGLZ3E5Lrq6C+ejV3
         a7rO/S5r++6YWUvLWXzCgi6i0TfSC5kHCa5GhzOJJJJ93hwKXUe/+GyT2beMwrpxM9DY
         QroA==
X-Gm-Message-State: AO0yUKXZF4ttBsTIgvis0VVYoWssUvgdI0mW5rOogA/+0PTDO8N3MoeE
        if83RGmOO3g00EItnAiNPju4Bw==
X-Google-Smtp-Source: AK7set9dJHbLStYnrL4YnYUOr+Ln5RaS+sdzjXiz3BANjDIv1Cves2lX6rNkwGhLjjZROxNrUfajjA==
X-Received: by 2002:a05:600c:3411:b0:3dc:545f:e9ce with SMTP id y17-20020a05600c341100b003dc545fe9cemr14324355wmp.24.1676042930507;
        Fri, 10 Feb 2023 07:28:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003daf681d05dsm5832013wms.26.2023.02.10.07.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:28:49 -0800 (PST)
Message-ID: <f5a26fff-2dc2-2397-a80c-2477176a5864@linaro.org>
Date:   Fri, 10 Feb 2023 16:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
 <347a5193-f7b1-7f8e-0c60-3d435bdf952c@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <347a5193-f7b1-7f8e-0c60-3d435bdf952c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 16:24, Dmitry Baryshkov wrote:
> On 10/02/2023 16:44, Neil Armstrong wrote:
>> Add the Display Port controller subnode to the MDSS node.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 6caa2c8efb46..72d54beb7d7c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>>                           };
>>                       };
>> +                    port@2 {
>> +                        reg = <2>;
>> +                        dpu_intf0_out: endpoint {
>> +                            remote-endpoint = <&mdss_dp0_in>;
>> +                        };
>> +                    };
>> +
>>                   };
>>                   mdp_opp_table: opp-table {
>> @@ -2783,6 +2790,78 @@ opp-500000000 {
>>                   };
>>               };
>> +            mdss_dp0: displayport-controller@ae90000 {
>> +                compatible = "qcom,sm8350-dp";

Exact, must fix.

> 
> Missing "qcom,sm8450-dp". As I wrote in the comment to patch 1, I'd suggest having just a single entry here rather than keeping both 8350 and 8450 entries.
> 
>> +                reg = <0 0xae90000 0 0xfc>,
>> +                      <0 0xae90200 0 0xc0>,
>> +                      <0 0xae90400 0 0x770>,
>> +                      <0 0xae91000 0 0x98>,
>> +                      <0 0xae91400 0 0x98>;
> 
> 
> While this sounds correct, usually we used the even size here (0x200, 0x400, etc.). Can we please switch to it (especially since sm8350-dp uses even sizes).

I don't have access to registers layout for HDK8450 but the system freezes when using even sizes, using
the exact register size works fine.

Neil

> 
>> +                interrupt-parent = <&mdss>;
>> +                interrupts = <12>;
>> +                clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +                clock-names = "core_iface",
>> +                          "core_aux",
>> +                          "ctrl_link",
>> +                                  "ctrl_link_iface",
>> +                          "stream_pixel";
>> +
>> +                assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +                          <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +                assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +                             <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +                phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> +                    phy-names = "dp";
>> +
>> +                    #sound-dai-cells = <0>;
>> +
>> +                operating-points-v2 = <&dp_opp_table>;
>> +                power-domains = <&rpmhpd SM8450_MMCX>;
>> +
>> +                status = "disabled";
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        mdss_dp0_in: endpoint {
>> +                            remote-endpoint = <&dpu_intf0_out>;
>> +                        };
>> +                    };
>> +                };
>> +
>> +                dp_opp_table: opp-table {
>> +                    compatible = "operating-points-v2";
>> +
>> +                    opp-160000000 {
>> +                        opp-hz = /bits/ 64 <160000000>;
>> +                        required-opps = <&rpmhpd_opp_low_svs>;
>> +                    };
>> +
>> +                    opp-270000000 {
>> +                        opp-hz = /bits/ 64 <270000000>;
>> +                        required-opps = <&rpmhpd_opp_svs>;
>> +                    };
>> +
>> +                    opp-540000000 {
>> +                        opp-hz = /bits/ 64 <540000000>;
>> +                        required-opps = <&rpmhpd_opp_svs_l1>;
>> +                    };
>> +
>> +                    opp-810000000 {
>> +                        opp-hz = /bits/ 64 <810000000>;
>> +                        required-opps = <&rpmhpd_opp_nom>;
>> +                    };
>> +                };
>> +            };
>> +
>>               mdss_dsi0: dsi@ae94000 {
>>                   compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>                   reg = <0 0x0ae94000 0 0x400>;
>>
> 

