Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7B044DD6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhKKWDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKKWDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:03:20 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF371C061766
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 14:00:30 -0800 (PST)
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2D4BC20393;
        Thu, 11 Nov 2021 23:00:29 +0100 (CET)
Message-ID: <8867e80e-fe7f-8a83-bea4-9da4901a5224@somainline.org>
Date:   Thu, 11 Nov 2021 23:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RFC PATCH 2/4] arm64: dts: qcom: sm8150: add display nodes
Content-Language: en-US
To:     Katherine Perez <kaperez@linux.microsoft.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20211110170330.1789509-1-kaperez@linux.microsoft.com>
 <20211110170330.1789509-3-kaperez@linux.microsoft.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211110170330.1789509-3-kaperez@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10.11.2021 18:03, Katherine Perez wrote:
> Add MDSS and MDP nodes to sm8150.
>
> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 92 ++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index ee40af469fab..38dbc39103ba 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3261,6 +3261,98 @@ camnoc_virt: interconnect@ac00000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  	

[...]


> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <460000000>,
> +						       <19200000>;
> +

I'm not sure if assigning F_MAX is a good idea, but it proobably won't hurt, given we have an OPP table?


Besides that,


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad


