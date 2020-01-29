Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4526A14C7B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 09:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgA2Iz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 03:55:27 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:53382 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726482AbgA2Iz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 03:55:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580288126; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=m1aJ2Qp8X5dBwtzaU0ERZTgZJkpnmU03rRacyFrY9dI=;
 b=EKeIdXiRssKjwnUmIcrFxx2QTFH2kBa43PEHOXFvVLAODnff1hjPjnfDxyI7njT3BChWMlHk
 8/d3o5Ww+4xVy09KEYQQmhTUJckzN3TMCYrrRLokur3Cwq5e+e7NmD0Z+E26JpjAQEHPcviH
 1YyZpPvKyv4fWCiHmThkBvnQ5AY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e31487b.7fbb18ae20a0-smtp-out-n03;
 Wed, 29 Jan 2020 08:55:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3CB9DC4479F; Wed, 29 Jan 2020 08:55:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: harigovi)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 756B2C433CB;
        Wed, 29 Jan 2020 08:55:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Jan 2020 14:25:22 +0530
From:   harigovi@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
In-Reply-To: <20200128203222.GD46072@google.com>
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
 <20200128203222.GD46072@google.com>
Message-ID: <e9b02cfe89db7b8624bdce56c3f9ceef@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-29 02:02, Matthias Kaehlcke wrote:
> Hi,
> 
> On Tue, Jan 28, 2020 at 06:54:44PM +0530, Harigovindan P wrote:
>> Add display, DSI hardware DT nodes for sc7180.
>> 
>> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
>> ---
>> 
>> Changes in v1:
>> 	-Added display DT nodes for sc7180
>> Changes in v2:
>> 	-Renamed node names
>> 	-Corrected code alignments
>> 	-Removed extra new line
>> 	-Added DISP AHB clock for register access
>> 	under display_subsystem node for global settings
>> Changes in v3:
>> 	-Modified node names
>> 	-Modified hard coded values
>> 	-Removed mdss reg entry
>> Changes in v4:
>> 	-Reverting mdp node name
>> 	-Setting status to disabled in main SOC dtsi file
>> 	-Replacing _ to - for node names
>> 	-Adding clock dependency patch link
>> 	-Splitting idp dt file to a separate patch
>> 
>> This patch has dependency on the below series
>> https://lkml.org/lkml/2019/12/27/73
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 128 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 3bc3f64..c3883af 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -1184,6 +1184,134 @@
>>  			#power-domain-cells = <1>;
>>  		};
>> 
>> +		mdss: mdss@ae00000 {
>> +			compatible = "qcom,sc7180-mdss";
>> +			reg = <0 0x0ae00000 0 0x1000>;
>> +			reg-names = "mdss";
>> +
>> +			power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +			clock-names = "iface", "gcc_bus", "ahb", "core";
>> +
>> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +			assigned-clock-rates = <300000000>;
>> +
>> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +
>> +			iommus = <&apps_smmu 0x800 0x2>;
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			mdss_mdp: mdp@ae01000 {
>> +				compatible = "qcom,sc7180-dpu";
>> +				reg = <0 0x0ae01000 0 0x8f000>,
>> +				      <0 0x0aeb0000 0 0x2008>,
>> +				      <0 0x0af03000 0 0x16>;
>> +				reg-names = "mdp", "vbif", "disp_cc";
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				clock-names = "iface", "rot", "lut", "core",
>> +					      "vsync";
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				assigned-clock-rates = <300000000>,
>> +						       <19200000>;
> 
> The clock rate for DISP_CC_MDSS_MDP_CLK is already specified in the
> parent node, do we really want/need to specify it twice?

Hi,

The parent device ( MDSS ) configures global HW settings which needs MDP 
CLK to be turned on with a default rate.
mdp device handles the composition, and it will compute the frequency 
needed as per the layer stack in the composition, hence we can have 
multiple rates on the CLK.
