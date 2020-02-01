Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E491D14F7F7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2020 14:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgBANpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Feb 2020 08:45:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:32185 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726497AbgBANo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Feb 2020 08:44:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580564698; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kx/TRpLiN6MhH/0aT3PFHHx7YsUxVPLS2D3qTV5hyEE=; b=jEYarw61WXk7IlvSy2iFTehmkCHaSvNCL36dCOMQyOXG4drcrZqDueUCR1sa9/PlsUDs/VRC
 2IORFEzXzrSdnSc3jEy1Payw2WPgvex9oM1gOlmAx14MNy+Aeo0E4L9ov+YrbAsEVSQCgi7c
 rz39y6idvVk33GxJQbMrpsQqkrM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3580d8.7fa0e953a5a8-smtp-out-n02;
 Sat, 01 Feb 2020 13:44:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2402AC447A2; Sat,  1 Feb 2020 13:44:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28AA3C433A2;
        Sat,  1 Feb 2020 13:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28AA3C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH v3 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-3-sibis@codeaurora.org> <20200131143436.GA14822@bogus>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <d94fa6ad-c5f9-fa5a-6a23-0bf773f105da@codeaurora.org>
Date:   Sat, 1 Feb 2020 19:14:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200131143436.GA14822@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Rob,
Thanks for the review!

On 1/31/20 8:04 PM, Rob Herring wrote:
> On Mon, Dec 30, 2019 at 10:30:07AM +0530, Sibi Sankar wrote:
>> Add optional "qcom,protection-domain" bindings for APR services. This
>> helps to capture the dependencies between APR services and the PD on
>> which each apr service run.
> 
> This is meaningless to me...

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
between the APR service and the PD on which the apr service runs.

Is ^^ better?

> 
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> index db501269f47b8..f87c0b2a48de4 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> @@ -45,6 +45,12 @@ by the individual bindings for the specific service
>>   			12 - Ultrasound stream manager.
>>   			13 - Listen stream manager.
>>   
>> +- qcom,protection-domain
>> +	Usage: optional
>> +	Value type: <stringlist>
>> +	Definition: Must list the protection domain service name and path
>> +		    that the particular apr service has a dependency on.
> 
> How many strings can there be and can you enumerate the possible
> strings?

https://lore.kernel.org/lkml/a19623d4-ab33-d87e-5925-d0411d7479dd@codeaurora.org/

Like I explained in ^^ avs/audio is the only service
that the apr device depends on and is known to run only
in "msm/adsp/audio_pd" service path.

However there are other service:service_path pairs
which will get documented when I add support for more
clients like fastrpc and ath10k.

> 
>> +
>>   = EXAMPLE
>>   The following example represents a QDSP based sound card on a MSM8996 device
>>   which uses apr as communication between Apps and QDSP.
>> @@ -82,3 +88,56 @@ which uses apr as communication between Apps and QDSP.
>>   			...
>>   		};
>>   	};
>> +
>> += EXAMPLE 2
>> +The following example represents a QDSP based sound card on SDM845 device.
>> +Here the apr services are dependent on "avs/audio" service running on AUDIO
>> +Protection Domain hosted on ADSP remote processor.
>> +
>> +	apr {
>> +		compatible = "qcom,apr-v2";
>> +		qcom,glink-channels = "apr_audio_svc";
>> +		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>> +
>> +		q6core {
>> +			compatible = "qcom,q6core";
>> +			reg = <APR_SVC_ADSP_CORE>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +		};
>> +
>> +		q6afe: q6afe {
>> +			compatible = "qcom,q6afe";
>> +			reg = <APR_SVC_AFE>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +			q6afedai: dais {
>> +				compatible = "qcom,q6afe-dais";
>> +				#sound-dai-cells = <1>;
>> +
>> +				qi2s@22 {
>> +					reg = <22>;
>> +					qcom,sd-lines = <3>;
>> +				};
>> +			};
>> +		};
>> +
>> +		q6asm: q6asm {
>> +			compatible = "qcom,q6asm";
>> +			reg = <APR_SVC_ASM>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +			q6asmdai: dais {
>> +				compatible = "qcom,q6asm-dais";
>> +				#sound-dai-cells = <1>;
>> +				iommus = <&apps_smmu 0x1821 0x0>;
>> +			};
>> +		};
>> +
>> +		q6adm: q6adm {
>> +			compatible = "qcom,q6adm";
>> +			reg = <APR_SVC_ADM>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> 
> Perhaps an example where not everything is the same. The example shows
> me this isn't needed in DT.

yes will update the example.

> 
>> +			q6routing: routing {
>> +				compatible = "qcom,q6adm-routing";
>> +				#sound-dai-cells = <0>;
>> +			};
>> +		};
>> +	};
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
