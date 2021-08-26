Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5443F8838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 14:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242466AbhHZNAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 09:00:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11765 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242369AbhHZNAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 09:00:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629982783; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vNEMBaGIbgQu53uZUr40P4nXthIpVErA1efIhAAM6Sg=;
 b=BiK+kSPo6mHYbo39xZs7FQLvrQOQe9vMo645haDqoJPOeXgUhuWrW33bHdJVTWz1uhbYH3cj
 hPlgwZq8T0tOc95gTtQ0gjojIBy2aqylJ2mpCt+aMGTaYlgZXvayp8be0bhOqpH0sSn6dIwC
 HagmHWSt9Wa6ajXT5bFbvnY2alQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6127903e096d475c7c85a7bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 12:59:42
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88886C4360C; Thu, 26 Aug 2021 12:59:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D70EAC43460;
        Thu, 26 Aug 2021 12:59:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Aug 2021 18:29:41 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 1/7] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <YRUdccjvf+ivbqor@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-2-git-send-email-rajpat@codeaurora.org>
 <YRUdccjvf+ivbqor@google.com>
Message-ID: <d271d1dafe56cbb58d35a63ec6944b14@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-12 18:39, Matthias Kaehlcke wrote:
> On Thu, Aug 12, 2021 at 01:11:12PM +0530, Rajesh Patil wrote:
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> 
>> Add QSPI DT node and qspi_opp_table for SC7280 SoC.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 62 
>> ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 53a21d0..f8dd5ff 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -415,6 +415,25 @@
>>  		method = "smc";
>>  	};
>> 
>> +	qspi_opp_table: qspi-opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		opp-75000000 {
>> +			opp-hz = /bits/ 64 <75000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +		};
>> +
>> +		opp-150000000 {
>> +			opp-hz = /bits/ 64 <150000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +		};
>> +
>> +		opp-300000000 {
>> +			opp-hz = /bits/ 64 <300000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +		};
>> +	};
>> +
> 
> From v3:
> 
> roja> Can we move this "qspi_opp_table" to / from /soc?
> 
> bjorn> If you have made a proper attempt to convince Rob and Mark that
> bjorn> a child "opp-table" in a SPI master is not a SPI device - and 
> the
> bjorn> conclusion is that this is not a good idea...then yes it should 
> live
> bjorn> outside /soc.
> 
> I didn't see a follow up on this, was such an attempt made? Is there a
> link to the discussion?

For now I am keeping qspi_opp_table  and qup_opp_table outside the SoC 
and posting V6.
I will continue the discussion with DT folks and once concluded I will 
update as required.
