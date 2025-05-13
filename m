Return-Path: <linux-arm-msm+bounces-57698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A42AB55A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D29176D7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BF728DF54;
	Tue, 13 May 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgFcqkIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794028DF2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141800; cv=none; b=q9/ksX+4hXsB+zsfZ6IEPzn1B4q6gYfB1QTfnTTg4kLCcjVWbfYcggGRQOXp0ucHa9wv1VZK/A3YxayUukW2S6HktuuX4+/VYc2c6/X78e3EFbY1COXuNnSabntejlQE5ZIvrctkqaf9YR1MuZJFKS4G9MS5TjGgaDKu7s/79/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141800; c=relaxed/simple;
	bh=jfCoKS4Br98qE8qMWlnXf8J24ypY3RI8HsC6GR76r4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XG+HmOWpJT8iT5buVnmEUhRGcJVx/KQ+C0tbmIOXyq8Bw/d1seLFOMALkrEOVk7DbTKn0vEuMkaQhaxlxgIAk8PtXpU2jsKppi/oxayxpLeS2n3ej8nTrgh/V9KCp2QzTmP9Z3WkR/HP4xqc2uULb+tdEUOv08iy2ec4TeUcl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgFcqkIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCIKTZ007486
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgqQjoXn/mz0+0JWmqaVq0Nb/xIIVOaxCiU1TbW7BVQ=; b=BgFcqkIzTxWWbobU
	wwihS5T660k7P57/l/N+Aktm/klgf8K5wF/bCO3yxOR6D4EOWUvkOnpqRbuFrPJR
	tIG7MlCRMPdMMnim4lrWlzmWmzefdHJCsyOEMMsN1yILIGfX1RWvzfLaWGMCnxI1
	SE0XwMMLjHeIsM5WuJ/FI9yGC5bJ6jpQqTR0nLa7iq5yJ/OF9mMjeOBZR5WLCCHT
	3afO4dDtPVtU6oZ5tXG1El0kMtJILDbrx8yndvpf2GmW0sN+g+ui360TVndQLNwi
	OqPwFNamWtJj7SVEdsrUnAfwR8iEZ1jLmz83V95kEZP7LAwsmXHZt0PhGpzn6ecn
	9zE93g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxftcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 13:09:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54be4b03aso148118285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 06:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141796; x=1747746596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgqQjoXn/mz0+0JWmqaVq0Nb/xIIVOaxCiU1TbW7BVQ=;
        b=WwWV24JW9Ka4HkeBZs5As8P9EHpHU8w3ScK04oI/S3Pv9mRHVhUKLBY9flXQOBq7+y
         9zvi/w7FE/WDUfP0Q+ob3YFyt7Xmuxg1sYvnELLNzmiykFLDch6GIu0rFh5SsPheKauG
         AhEszAu3P5dqTS42fbpIltHvzrwcP5XOv2JyUEXqD13NixmjbaZFCt/OeVvjZ93TcHjQ
         +kIC+9A7jta7EruxoSERW1c20j7nIik7WSyd8gbm66eMRVPrOO7cfCj9aeYQeGEAGRES
         FnQ4Hascl/wZQD9e8GFRwB+GKxNaQEJ+YYDdrcUcPjl7VUHnqs92g0nCjV7il5M5cdjz
         AnSA==
X-Forwarded-Encrypted: i=1; AJvYcCXsIBx5bYOrxLgfa6c6XZT8rXjSsPMKudBqTDQuv/oEC62talkV/YccpOwOTm1/4Yy8LZX5dUpvYvIyKQKD@vger.kernel.org
X-Gm-Message-State: AOJu0YzTM3L3CkqR/vRJVq9KL3GduP57jSF3pqLkAs/bHzsq23krN0j2
	bUHLbEjD4pseu7Ij4UGutCfJehXOxriGHwPv/8r40kWqk9h4z03S+vvkyJDKWbByszh6NGSBP8h
	XQ3I2z/YTukpfK5yYcBxX6BH8n6XDc3D2vWuWrONw8T8gl+vrwEZxbfn6Ln6sr9Z2
X-Gm-Gg: ASbGncv/tdUk/+yTnLeFy3GGiwDZC2XEcSYJwSIOSMjNjFuFPBC8tk3iBBofLpEyreZ
	jj8A0vjgoXK5u2Vw+AfYok3+1cl/OojkJgA/tnxvOa/GEk4BynRzOhGe5KPCq5a7hDLj+fEJKGJ
	Hai4kOZ/8AEqpvGxifKQPnc00Zhc1tLiNThdsyWIO1B/1cpKUSVrlDHn2LkUcj1gZy4ToabNmoI
	mbwin1b0T/geG8widKk3xezd4grAG81Lf4IC+gH0m+mQJ/yo5Ls3cxhuqXjRe9PCkUU2rI0WpJs
	zHq2q3+epR7PNwo7PPcS1joNo0IFLmQrbyCKtSWA/HgoZpeeKyp7/MvFRoPqLAYKbw==
X-Received: by 2002:a05:620a:4621:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd01209dcbmr1133994985a.5.1747141795985;
        Tue, 13 May 2025 06:09:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdFtK9juUmc0ai1W7MGI4fFewuXp29EYzh0Mnsqifnw7jvpAjmStbjPMKlcmyqOWJnBAZi1g==
X-Received: by 2002:a05:620a:4621:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd01209dcbmr1133993485a.5.1747141795533;
        Tue, 13 May 2025 06:09:55 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22ba47376sm658958666b.53.2025.05.13.06.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:09:55 -0700 (PDT)
Message-ID: <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>
Date: Tue, 13 May 2025 15:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEyNSBTYWx0ZWRfX8puSJ93BkTid
 KedBjGEj+6JGzKaOYYvk7Ci+CHLYyGfqzoiqQcdLDDs4V8/B1MXR+naAAkS+MC2RVTPLoOLMIhB
 w+VaBxcd5T94+r0baJKEaeBTpu1E1n1VAQrVLaSgkY2m0D2jpFAo9zyIef6P0GrAjBajh09yydJ
 39rZ9EhpuT21K2rylNkFHWEOTpzGmlB8t8Ihtkjkxe2RhQHNIqh98yECVdnAlTQSoUrjgOJLj+z
 a6ql0BOA8XzRreoe2BU1WapTaVYC7X2MujlC5Jy4b20D6DVSDKMDRerEi/IJQ+dbiF5SFm0OOdL
 xJ93s6ZHML2vfyqn3iiMvT1P/lg8g/LNdfLq7TT8HYcuVqxQWdenuqnGp2DFoQOYVSehOW1v05C
 FtnVivhDuQQbM8CdBjo9LM4yOxAb8oapQ26/kR9MwgtutIObL7uii7gU5qwZaWssJY27fUuN
X-Proofpoint-GUID: 5A1lV5LGELYpUTEME46IMIn3qPi1rMT_
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=682344a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=UvE4O2ndLqCJbkWAjTIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5A1lV5LGELYpUTEME46IMIn3qPi1rMT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130125

On 5/9/25 5:42 AM, Ekansh Gupta wrote:
> 
> 
> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>> While at this, also add required memory region for fastrpc.
>>>>>
>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>
>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>>  1 file changed, 70 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> index 149d2ed17641..48ee66125a89 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>> @@ -7,6 +7,7 @@
>>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>>>  			no-map;
>>>>>  		};
>>>>> +
>>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>>> +			compatible = "shared-dma-pool";
>>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>>> +			alignment = <0x0 0x400000>;
>>>>> +			size = <0x0 0xc00000>;
>>>>> +			reusable;
>>>>> +		};
>>>>>  	};
>>>>>  
>>>>>  	smp2p-adsp {
>>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>>>  						};
>>>>>  					};
>>>>>  				};
>>>>> +
>>>>> +				fastrpc {
>>>>> +					compatible = "qcom,fastrpc";
>>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>> +					label = "adsp";
>>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>>> IIUC the driver only considers this on the sensor DSP
>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
>> next-20250508
>>
>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
>> 	// ...
>> }
>>
>> maybe some driver changes are still pending?
> 
> Would like to add some more details here:
> 
> Memory region is required for audio PD for dynamic loading and remote heap memory
> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
> is getting attached[1] and this memory is added to audio PD memory pool.
> 
> Additionally, if there is some additional memory requirement from audio PD, the
> PD can request for more memory using remote heap request[2]
> 
> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
> platform as there were no dedicated context banks for SDSP there. On recent platforms,
> context banks are available wherever SDSP is supported. 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a

Ok, this was mildly confusing given there's specific "normal" region
handling, but the DMA allocator takes care of this one

Konrad

