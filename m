Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B714A6198F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiKDONg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiKDONf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:13:35 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC1127174
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:13:33 -0700 (PDT)
Received: from [192.168.31.208] (unknown [194.29.137.22])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6BE033F635;
        Fri,  4 Nov 2022 15:13:31 +0100 (CET)
Message-ID: <109c5c9f-5786-c27c-18c9-db214d088cbb@somainline.org>
Date:   Fri, 4 Nov 2022 15:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 1/5] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_D1
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221104131358.1025987-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04/11/2022 14:13, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8450. Unfortunately adding it
> in proper place causes renumbering of all the opp states in sm8450.dtsi
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

>   arch/arm64/boot/dts/qcom/sm8450.dtsi   | 20 ++++++++++++--------
>   include/dt-bindings/power/qcom-rpmpd.h |  1 +
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index eeff62d0954b..250e6b883ca3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3197,35 +3197,39 @@ rpmhpd_opp_min_svs: opp2 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>   					};
>   
> -					rpmhpd_opp_low_svs: opp3 {
> +					rpmhpd_opp_low_svs_d1: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp4 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs: opp4 {
> +					rpmhpd_opp_svs: opp5 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs_l1: opp5 {
> +					rpmhpd_opp_svs_l1: opp6 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>   					};
>   
> -					rpmhpd_opp_nom: opp6 {
> +					rpmhpd_opp_nom: opp7 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>   					};
>   
> -					rpmhpd_opp_nom_l1: opp7 {
> +					rpmhpd_opp_nom_l1: opp8 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>   					};
>   
> -					rpmhpd_opp_nom_l2: opp8 {
> +					rpmhpd_opp_nom_l2: opp9 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
>   					};
>   
> -					rpmhpd_opp_turbo: opp9 {
> +					rpmhpd_opp_turbo: opp10 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>   					};
>   
> -					rpmhpd_opp_turbo_l1: opp10 {
> +					rpmhpd_opp_turbo_l1: opp11 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>   					};
>   				};
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 578e060890dd..69aef395d85b 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -168,6 +168,7 @@
>   /* SDM845 Power Domain performance levels */
>   #define RPMH_REGULATOR_LEVEL_RETENTION	16
>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>   #define RPMH_REGULATOR_LEVEL_SVS	128
>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
