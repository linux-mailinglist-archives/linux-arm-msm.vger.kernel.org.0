Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0FD3B8983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 22:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbhF3UK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 16:10:57 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45686 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbhF3UK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 16:10:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625083707; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aipWx0eXu5H1+PAAnZ34CVHzoEMTtgLG7iEC7D6WI5k=;
 b=j6B0VazRcu/vc1AgLfCXrbPLy3xTIQTPIxZR3kRHXRKSnpTBd2zlyQfbwGt1R7sFxz/VrTI+
 n218T7pK9UXonvbgr2hstcu2Ve0ChmVMbB3iN0F13IO+ZnhhkTND86YiX8/KEUOxQGdR5Is9
 mgqxaGtn2o0ctoJDooFevKZRLzY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60dccf34ec0b18a74527508e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 20:08:19
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 208ECC43460; Wed, 30 Jun 2021 20:08:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3B2CC433D3;
        Wed, 30 Jun 2021 20:08:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Jul 2021 01:38:16 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
In-Reply-To: <YNodaqE9n9+sQUFq@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-10-git-send-email-sibis@codeaurora.org>
 <YNodaqE9n9+sQUFq@google.com>
Message-ID: <c561f99cb281c28581d10e5805190df8@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-29 00:35, Matthias Kaehlcke wrote:
> On Fri, Jun 25, 2021 at 01:17:38AM +0530, Sibi Sankar wrote:
>> Update MSS node to support MSA based modem boot on SC7280 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
>>  2 files changed, 23 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 191e8a92d153..d66e3ca42ad5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -343,3 +343,10 @@
>>  		bias-pull-up;
>>  	};
>>  };
>> +
>> +&remoteproc_mpss {
>> +	status = "okay";
>> +	compatible = "qcom,sc7280-mss-pil";
>> +	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
>> +	memory-region = <&mba_mem &mpss_mem>;
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 56ea172f641f..6d3687744440 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -586,7 +586,8 @@
>> 
>>  		remoteproc_mpss: remoteproc@4080000 {
>>  			compatible = "qcom,sc7280-mpss-pas";
>> -			reg = <0 0x04080000 0 0x10000>;
>> +			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>> +			reg-names = "qdsp6", "rmb";
> 
> Binding needs update?
> 
> Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:
> 
>   reg:
>       maxItems: 1
> 
>> 
>>  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
>>  					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>> @@ -597,8 +598,11 @@
>>  			interrupt-names = "wdog", "fatal", "ready", "handover",
>>  					  "stop-ack", "shutdown-ack";
>> 
>> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
>> -			clock-names = "xo";
>> +			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>> +				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
>> +				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "iface", "offline", "snoc_axi", "xo";
> 
> Binding needs update?
> 
> Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml:
> 
>   clocks:
>     items:
>       - description: XO clock
>   clock-names:
>     items:
>       - const: xo

qcom,sc7280-mpss-pas compatible requires
just the xo clock and one reg space whereas
the qcom,sc7280-mss-pil compatible requires
the additional clks and reg spaces. We just
overload properties where re-use is possible
across boards. Hence it would be wrong to
list those clks/reg spaces as requirements
for the pas compatible.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
