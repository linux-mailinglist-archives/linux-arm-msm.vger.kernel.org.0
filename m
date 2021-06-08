Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBD239F0A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhFHISv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 04:18:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37331 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhFHIS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 04:18:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623140196; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AIe7j1nemSal6jC2enjasmYH8a67XUaj0NeBSMSPDdk=;
 b=vbqVE2NITfP9rV0hh2tD4Qpk3E7NLjNzquhvP14OKou30Vrgi+DOe89jNVcDGUCyQiBpV6vG
 FA3B/lHn2mbsSjN+XRlG/h4nXJTpsTCtKfYlKxdcZck0I60HPf0aaxynqR1ztIARe1UZqA9r
 cFHG0NRT2Aji5yTq0QlVj7OJ8ik=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60bf2764f726fa4188a5dc3f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 08:16:36
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAE70C00456; Tue,  8 Jun 2021 08:16:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09E7BC43146;
        Tue,  8 Jun 2021 08:16:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Jun 2021 13:46:32 +0530
From:   rojay@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/3] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <YLxF4rGFDrFXQRDi@builder.lan>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-3-rojay@codeaurora.org> <YLxF4rGFDrFXQRDi@builder.lan>
Message-ID: <d21d2a2f579824899b3219b2620b6d1d@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-06 09:19, Bjorn Andersson wrote:
> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
> 
>> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V3:
>>  - Broken the huge V2 patch into 3 smaller patches.
>>    1. QSPI DT nodes
>>    2. QUP wrapper_0 DT nodes
>>    3. QUP wrapper_1 DT nodes
>> 
>> Changes in V2:
>>  - As per Doug's comments removed pinmux/pinconf subnodes.
>>  - As per Doug's comments split of SPI, UART nodes has been done.
>>  - Moved QSPI node before aps_smmu as per the order.
>> 
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  97 ++-
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 750 
>> +++++++++++++++++++++++-
>>  2 files changed, 835 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index d0edffc15736..f57458dbe763 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -292,6 +292,16 @@ &uart5 {
>>  	status = "okay";
>>  };
>> 
>> +&uart7 {
>> +	status = "okay";
>> +
>> +	/delete-property/interrupts;
>> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, 
>> <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> +};
>> +
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> 
>>  &qspi_cs0 {
>> @@ -307,16 +317,87 @@ &qspi_data01 {
>>  	bias-pull-up;
>>  };
>> 
>> -&qup_uart5_default {
>> -	tx {
>> -		pins = "gpio46";
> 
> Commit message says "add stuff", but somehow uart5 is no longer
> gpio46/47 and these gpios are no longer specified.
> 
> Can you roll this in a way where the giant patch actually _only_ adds
> a whole bunch of stuff?
> 
>> -		drive-strength = <2>;
>> -		bias-disable;
>> +&qup_uart5_tx {
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
> 
> Regards,
> Bjorn


Okay, so shall I split this 2/3rd patch into two with
one patch modifying uart5 node and the other one with
_only_ adds rest all nodes?

Thanks,
Roja
