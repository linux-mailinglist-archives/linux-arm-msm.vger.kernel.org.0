Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8463E9041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237254AbhHKMPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:15:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17646 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233655AbhHKMPO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:15:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628684091; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eeQDSyTuRUKPuLNTBtQ/IN9VyL6uflUZq+4lo9oZ6Ck=;
 b=AiOUcjIL8SeWGaJJZAKt06gY18UddK72aUluR9u9q6kwoBCvQNpdz4b7n2V+8oUXRvE65//s
 Xqhbe0Wmhn7pqJxH0GCvmtKPnK0n14W96lpD6bnsKbBEttL1x8O4CTyY0ggCgW0jLP7fMWUN
 LhUQICgvX00IriaFYz3tijoM09o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6113bf21b3873958f5726bc5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 12:14:25
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E82DC43217; Wed, 11 Aug 2021 12:14:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA4F7C433F1;
        Wed, 11 Aug 2021 12:14:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 17:44:21 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <YP7d3gZGnfj9YqSY@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-2-git-send-email-rajpat@codeaurora.org>
 <YP7d3gZGnfj9YqSY@google.com>
Message-ID: <4b676cb57f0c179df56bb7681555d409@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-26 21:37, Matthias Kaehlcke wrote:
> On Mon, Jul 26, 2021 at 07:10:44PM +0530, Rajesh Patil wrote:
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> 
>> Add QSPI DT node for SC7280 SoC.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>> Changes in V4:
>>  - As per Stephen's comment updated spi-max-frequency to 37.5MHz, 
>> moved
>>    qspi_opp_table from /soc to / (root).
>> 
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
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 27 ++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 62 
>> +++++++++++++++++++++++++++++++++
>>  2 files changed, 89 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 73225e3..b0bfd8e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -269,6 +269,20 @@
>>  		};
>>  };
>> 
>> +&qspi {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
>> +
>> +	flash@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg = <0>;
>> +		spi-max-frequency = <37500000>;
>> +		spi-tx-bus-width = <2>;
>> +		spi-rx-bus-width = <2>;
>> +	};
>> +};
>> +
>>  &qupv3_id_0 {
>>  	status = "okay";
>>  };
>> @@ -346,6 +360,19 @@
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> 
>> +&qspi_cs0 {
>> +	bias-disable;
>> +};
>> +
>> +&qspi_clk {
>> +	bias-disable;
>> +};
>> +
>> +&qspi_data01 {
>> +	/* High-Z when no transfers; nice to park the lines */
>> +	bias-pull-up;
>> +};
>> +
> 
> This configures the SPI flash of the SC7280 IDP board, which is neither
> mentioned in the subject nor the body of the commit message. IMO this
> should be split out into a separate patch.

Okay.

