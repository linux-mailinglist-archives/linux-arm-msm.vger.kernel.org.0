Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29588121223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 18:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfLPRqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 12:46:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:21456 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726141AbfLPRqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 12:46:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576518383; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rzuAqWFdTzrWO4clWvy7mwhpSIFXq93mC1ouQT7d0SU=; b=i+RmSP29LGcKHFfGNyrdMulgcQoTL1fMWa+2g56A1ijBU+6wW1OHXRPy3p/ayLbTInSiXXjv
 suGv1hY4/MWcWERJpeqc0TuCDF7HwNrC6n5F8PjcOvfHMUWDygDwa9+e6mcvqGUjOwx7c0zx
 PjNdaSR6xmUyWHfQM4GVYrkxfpo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7c2ee.7f4ad81ac420-smtp-out-n02;
 Mon, 16 Dec 2019 17:46:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A126C447A2; Mon, 16 Dec 2019 17:46:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C946C433A2;
        Mon, 16 Dec 2019 17:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C946C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9c591-d04928e8-6440-488c-a956-3b5c9b8988bf-000000@us-west-2.amazonses.com>
 <20191203215248.GA1688@bogus>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <a19623d4-ab33-d87e-5925-d0411d7479dd@codeaurora.org>
Date:   Mon, 16 Dec 2019 23:16:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191203215248.GA1688@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Rob,
Thanks for the review :)

On 12/4/19 3:22 AM, Rob Herring wrote:
> On Mon, Nov 18, 2019 at 02:28:00PM +0000, Sibi Sankar wrote:
>> Add optional "qcom,protection-domain" bindings for APR services. This
>> helps to capture the dependencies between APR services and the PD on
>> which each apr service run.
>>
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
> Is name and path 2 values? Length is always 2?

Yes the length is always 2 values i.e service name and the path where
the service is hosted.

> 
> You've got the same values for every case in the example. Is there a
> defined list of possible values?

apr bus is expected to track just the "avs/audio" running on
msm/adsp/audio_pd on msm8998 and sdm845 SoCs. So shouldn't
make much sense to list all possible service names:paths here.

However the qcom,protection-domain is expected to be used
on fastrpc compute bank nodes as well, where they track other
services:paths. I'll make sure to include all the possible
values that fastrpc cb nodes depend on.

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
