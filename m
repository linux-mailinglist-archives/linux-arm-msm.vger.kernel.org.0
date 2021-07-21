Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F083D14E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhGUQgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 12:36:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42293 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGUQgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 12:36:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626887801; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Aryz9BE7KQB5j7/QPvZiX2ovpmVP0IZNZkEvie8KRCM=;
 b=WazRerZpbZnoV8zDXRvLReu3JLxPZHBwUUwJTCv3qFJj/4w5wLF4Z/QpCNA4v2QJt267iJY3
 jHSOZapnIQPwvLOSNCHnRZGQ2sokhCosPWAFrMAWzcbyugpe/ub2GUx1AMVw8z5+uY2LF7ni
 25P0/Gzv4a+UrEwR0VQFc7mm/Ss=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f85661e31d882d18196c6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:16:17
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 191EBC4338A; Wed, 21 Jul 2021 17:16:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9900C433D3;
        Wed, 21 Jul 2021 17:16:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Jul 2021 22:46:14 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
In-Reply-To: <CAE-0n53bRGouiycpcukPYB_+Gyz_Dr=rCAnb2MH64=+Q899aOA@mail.gmail.com>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
 <1626775980-28637-11-git-send-email-sibis@codeaurora.org>
 <CAE-0n53bRGouiycpcukPYB_+Gyz_Dr=rCAnb2MH64=+Q899aOA@mail.gmail.com>
Message-ID: <a021012616af266905099e0563d0fff5@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 11:17, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-07-20 03:13:00)
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
>>                 bias-pull-up;
>>         };
>>  };
>> +
>> +&remoteproc_mpss {
>> +       status = "okay";
>> +       compatible = "qcom,sc7280-mss-pil";
>> +       iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
>> +       memory-region = <&mba_mem &mpss_mem>;
>> +};
> 
> Can this go above the pinctrl zone in this file? Preferably sorted
> alphabetically by phandle.

Sure, looks like I just added
it based on sort order. Didn't
notice that it fell below the
pinctrl zone.

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 56ea172f641f..6d3687744440 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -586,7 +586,8 @@
>> 
>>                 remoteproc_mpss: remoteproc@4080000 {
>>                         compatible = "qcom,sc7280-mpss-pas";
>> -                       reg = <0 0x04080000 0 0x10000>;
>> +                       reg = <0 0x04080000 0 0x10000>, <0 0x04180000 
>> 0 0x48>;
>> +                       reg-names = "qdsp6", "rmb";
>> 
>>                         interrupts-extended = <&intc GIC_SPI 264 
>> IRQ_TYPE_EDGE_RISING>,
>>                                               <&modem_smp2p_in 0 
>> IRQ_TYPE_EDGE_RISING>,
>> @@ -597,8 +598,11 @@
>>                         interrupt-names = "wdog", "fatal", "ready", 
>> "handover",
>>                                           "stop-ack", "shutdown-ack";
>> 
>> -                       clocks = <&rpmhcc RPMH_CXO_CLK>;
>> -                       clock-names = "xo";
>> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>> +                                <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
>> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "iface", "offline", "snoc_axi", 
>> "xo";
>> 
>>                         power-domains = <&rpmhpd SC7280_CX>,
>>                                         <&rpmhpd SC7280_MSS>;
>> @@ -611,6 +615,15 @@
>>                         qcom,smem-states = <&modem_smp2p_out 0>;
>>                         qcom,smem-state-names = "stop";
>> 
>> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
>> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
>> +                       reset-names = "mss_restart", "pdc_reset";
>> +
>> +                       qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 
>> 0x28000 0x33000>;
>> +                       qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
>> +                                        &tcsr_mutex 0x26004 0x26008>;
>> +                       qcom,qaccept-regs = <&tcsr_mutex 0x23030 
>> 0x23040 0x23020>;
>> +
>>                         status = "disabled";
>> 
>>                         glink-edge {
> 
> Any reason to not combine this stuff with the previous patch?

I split it into two separate
patches just to show that sc7280
supports two ways of bringing
modem out of reset and method
used is determined by the platform.

> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
