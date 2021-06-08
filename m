Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A239F062
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 10:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhFHIHo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 04:07:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64467 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHIHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 04:07:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623139552; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/QL7H5i8psHPbWf0si8r3yMNu1vhRv7gNi4MXIe0QSo=;
 b=SqhMIVfFaEB6oURPsfQXXLNXpajjo5/+TroT6kxcBBssmU7HYyVZoVC7FFzplBM7kl1XLXn2
 9BgvDMMeMrJRZ0gIPAmTsarGQO5khlQDmT5opbCnkY8SkcQFr5GDjKdDiC2FhDikBfrLVPzk
 7E1pkqX19Q24iuml93J7BfP1eq8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60bf24dfe27c0cc77fb0ed85 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 08:05:51
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B877C43217; Tue,  8 Jun 2021 08:05:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27598C4323A;
        Tue,  8 Jun 2021 08:05:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Jun 2021 13:35:49 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <162284315655.1835121.6817703229350764867@swboyd.mtv.corp.google.com>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-2-rojay@codeaurora.org>
 <162284315655.1835121.6817703229350764867@swboyd.mtv.corp.google.com>
Message-ID: <a90881585258e67b76661b58c29bdd15@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-05 03:15, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2021-06-04 06:54:37)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 3900cfc09562..d0edffc15736 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>>                 };
>>  };
>> 
>> +&qspi {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
>> +
>> +       flash@0 {
>> +               compatible = "jedec,spi-nor";
>> +               reg = <0>;
>> +
>> +               /* TODO: Increase frequency after testing */
> 
> Is this going to change? Please set it to 37.5MHz if that's the max
> supported.
> 

Okay, will set it to 37.5MHz.

Thanks,
Roja

>> +               spi-max-frequency = <25000000>;
>> +               spi-tx-bus-width = <2>;
>> +               spi-rx-bus-width = <2>;
>> +       };
>> +};
>> +
>>  &qupv3_id_0 {
>>         status = "okay";
>>  };
