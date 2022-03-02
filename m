Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662964CB2F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 00:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiCBXts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 18:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiCBXtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 18:49:42 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400A965816;
        Wed,  2 Mar 2022 15:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646264934; x=1677800934;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rnm9IT6icR+D1zeLKO9N9LcDFz1RD+efyHBDALGfxug=;
  b=fzCdk6eRe95o9XtkBW8g6t5e4Ahd8cku/n4L1timL2/+s6o0IE12h9+k
   E75PQnrliLvY6sfsXBdEcER5WVt58UEO0ajsXBsxKSVwfl7NNlaHelT2K
   OXV+5r7zSbjCi9vFHhpTqc6tWqy4e2RHrB5xEt2HWc6dfLFNCgGv1lR+m
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Mar 2022 15:48:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 15:48:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 2 Mar 2022 15:48:53 -0800
Received: from [10.110.107.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 2 Mar 2022
 15:48:52 -0800
Message-ID: <2a664269-df14-11c0-c678-6eae696cdfae@quicinc.com>
Date:   Wed, 2 Mar 2022 15:48:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v2 5/6] arm64: dts: qcom: sm8250: Drop flags
 for mdss irqs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
 <20220302225411.2456001-5-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220302225411.2456001-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/2/2022 2:54 PM, Dmitry Baryshkov wrote:
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303ba047..956848068871 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3200,7 +3200,7 @@ mdss_mdp: mdp@ae01000 {
>   				power-domains = <&rpmhpd SM8250_MMCX>;
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <0>;
>   
>   				ports {
>   					#address-cells = <1>;
> @@ -3252,7 +3252,7 @@ dsi0: dsi@ae94000 {
>   				reg-names = "dsi_ctrl";
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <4>;
>   
>   				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>   					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> @@ -3325,7 +3325,7 @@ dsi1: dsi@ae96000 {
>   				reg-names = "dsi_ctrl";
>   
>   				interrupt-parent = <&mdss>;
> -				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <5>;
>   
>   				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
>   					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
