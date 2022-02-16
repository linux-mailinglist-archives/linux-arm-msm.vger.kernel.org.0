Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D856F4B84D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 10:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbiBPJuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 04:50:51 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbiBPJuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 04:50:50 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD592B621B;
        Wed, 16 Feb 2022 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645005013; x=1676541013;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=61F7JEwWCoHq5BqpngRSjG/lDI+cF1JwaIhqjSql6wg=;
  b=oJl9W03FDge53WkdSFxzEuhE0/c/gBrPpmwNxa3gBtEj1HkYVqg5OiD/
   kjdb4S1DjIVZBm/Qcqa0MhqsZ3ESBfu0S/VQ3VnPVgy5/QOIUs/DLlVsC
   i5D5SLZjjnzaoekTsroNhzkAaVMI9mlppI3huR7mDobGhnU+MYqRiR/lk
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 01:50:12 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:12 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 01:50:12 -0800
Received: from [10.216.17.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 01:50:07 -0800
Subject: Re: [PATCH V6 2/6] dt-bindings: mfd: pm8008: Add regulators node
To:     Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <quic_collinsd@quicinc.com>, <quic_jprakash@quicinc.com>
References: <1644915231-7308-1-git-send-email-quic_c_skakit@quicinc.com>
 <1644915231-7308-3-git-send-email-quic_c_skakit@quicinc.com>
 <e7aee447-2ef5-b9af-ea56-5c406224aa7a@quicinc.com>
From:   "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Message-ID: <02a48b16-4cbf-ee10-ce7f-d751844e7f3c@quicinc.com>
Date:   Wed, 16 Feb 2022 15:20:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e7aee447-2ef5-b9af-ea56-5c406224aa7a@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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


On 2/16/2022 10:01 AM, Subbaraman Narayanamurthy wrote:
> On 2/15/22 12:53 AM, Satya Priya wrote:
>> @@ -102,7 +121,7 @@ examples:
>>       qupv3_se13_i2c {
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>> -      pm8008i@8 {
>> +      pm8008_infra: pm8008@8 {
>>           compatible = "qcom,pm8008";
>>           reg = <0x8>;
>>           #address-cells = <1>;
>> @@ -123,6 +142,26 @@ examples:
>>             #interrupt-cells = <2>;
>>           };
>>         };
>> -    };
>>   
>> +      pm8008_regulators: pm8008@9 {
>> +        compatible = "qcom,pm8008";
> Should this be "qcom,pm8008-regulators" ?


Yes, I'll correct it.


Thanks.


>> +        reg = <0x9>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        vdd_l1_l2-supply = <&vreg_s8b_1p2>;
>> +        vdd_l3_l4-supply = <&vreg_s1b_1p8>;
>> +        vdd_l5-supply = <&vreg_bob>;
>> +        vdd_l6-supply = <&vreg_bob>;
>> +        vdd_l7-supply = <&vreg_bob>;
>> +
>> +        regulators {
>> +          pm8008_l1: ldo1 {
>> +            regulator-name = "pm8008_l1";
>> +            regulator-min-microvolt = <950000>;
>> +            regulator-max-microvolt = <1300000>;
>> +          };
>> +        };
>> +      };
>> +    };
>>   ...
> -Subbaraman
