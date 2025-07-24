Return-Path: <linux-arm-msm+bounces-66479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E38B1070D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A4EA567246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28062571B0;
	Thu, 24 Jul 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRYW6abE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02579256C87
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350876; cv=none; b=dWcvvUzkFsF7MIIkw+aUuvvScTg5tRUunXMgs7DYGjmepSm0HMUhf4w8Fdrh1FHMg8zgjdWYb9eB9aAAiVJjVSMIPW8VimIQRvIPQZiJjzFpcR1kQ2Fv/W51GRVaqJOzM9JWC0Z7IxSIN/2M+NsQp3xfXfKNITp69HjSe5PDPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350876; c=relaxed/simple;
	bh=+5q2qNOD8Tn/j37N5KG5nuQJGGlh1MNufHfPZ2yKNhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rN1pzgnY7f5Xs+mwP1s/BVq8WO6byruj8feaPnM1ih+AgurnUU6plFlMUS4vNuzggt44bqgfhdBLhYkXULpCknWds9w51c+EHfKWzBWGImlnrDQNgPxak702FXglxPxF7fvaqpLWVObgsU1fwhPJ7c7tf7gmsbE3bPWfrtgOmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRYW6abE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9gLg8018111
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxvzvN8HZ7PTYaCkkSpGFCHtnjuMT1vwIoj9nxyQaEY=; b=DRYW6abE5xyNhb0J
	v3KL9CO9afFiolYYcJ/nLQz8Wfcg5l2Pm7vrci2TFsd0my9WH63hMXJwpiZbtxJ+
	jiYM6LRPQeEzduA6wEJ+1hOUyfRdM4O5a4sKGEpcGuz5EClL6NEoFSm4JA8PAQCM
	vlY1fUAJbjbq3yTrAwuGejptctnhmMKX0yGD4qZLDJhigShgMsEy8JqfP/zEbnzJ
	Y+7/2ZFiId2zIVDOm7gxeJ+xgkWvxw+pKyH23iR4fi+ifBEUpiWypf2NGeJpzWUh
	Mpn225DK9LNnO4eH+6d6o2ujZ0kUyeBOj+9zxDvbUiUoz/STTObu7xcwbyHfDzV9
	9WO0vg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6te79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:54:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-706ff7f3e4fso16628106d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350873; x=1753955673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxvzvN8HZ7PTYaCkkSpGFCHtnjuMT1vwIoj9nxyQaEY=;
        b=B78xJZLEzIC+TdWLfwU6p2k+tDYb4ojnuz+b3kaIEcQ04gu1Xc/e83I1lw1PR4IbiE
         WF3IKFz8ha9LFx6a9KWWgZA5ZWI9Si6Li2OKJOCKlncToqTRaFLv4IlkKDOHJOHMcOPt
         Leew6M8OEQBvzs/Z79CH0ChsdgjJJqfHVtr2elutb+GQvg5LlLUu8KZ6DSM5N6WuMgEh
         4d/2aaxo9HQnwDI9czmg0NlSItV5lxWTD4N9QDOGI2j0rqHJmE16Riflp1EcwRXZjeVR
         Js0XEXoc3Sxw/ZEmm94A57sh4bZyEBu9bvKcMrlRlqoCLWRCgWVNp2sn6y/CBWnhbRrV
         KzYg==
X-Forwarded-Encrypted: i=1; AJvYcCXQGl2f4+bUR0pSFVSUy8F/qiZvbLJqUMytSev1DGKiwKelqBj28fD9O9ZZt5tJYHVVV0vnm8Yy8SxdkFSX@vger.kernel.org
X-Gm-Message-State: AOJu0YyYvfwpa7dzcFDLQcL3KzrSfzKjjexVBPdIfSVK12SxHl6wo5UB
	Frh+TzerSvGYwZM7EyIbPN+VyrFJNmeVb3YzyvtpuK/dsqhDQRz/3h3/aiGGFh0bNlUFZjbHDiS
	uzcdJgxao3HNcRDCSsg5qZSkVSA0LP12nR7giWPTZcdMu5r33j1jexv5E942XPJrIKHYJ
X-Gm-Gg: ASbGncv8Qhoecp/pyRdLJOJIFR+v73VIHO2PjCgEGSRb+BUXZMbLa/Zyfc1zhnEgGHX
	ub6gcZDGBI7Z1ar5Ij01aOP9DwELmqjxBqNH04hhI0EDGN5DYiQxHjx8T7jX1eb3c19XAmiNKRG
	vg4EHh8OU7QUEItl2oheV70c/Bp+fxl+B83Bw16YwEtsJYumLQRh8S9Ls4yvLuWzknSrwqi9Xrb
	Lb1t/n/m8LDlTRGmBZhnNfRIQISLQGAAQl7tyQtbjz7BQ68q+oVdAGgJH4upjV7bBh7h3gkDjYQ
	2tOA9q1TsiyeL3YH7iAMr68J+wNHv0Jq8/GX50iwETvdjvU17KtGOECVTBcZXvkNcZA=
X-Received: by 2002:a05:6214:5185:b0:704:a757:979 with SMTP id 6a1803df08f44-707004aa0ffmr81875566d6.1.1753350872783;
        Thu, 24 Jul 2025 02:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0wcvFy3RX/SAF5EVqrfzAK6u3mdIncXaZCbiRJWRoP7EdfCWvSPBX3cKc1kjBtcKk9HMI2A==
X-Received: by 2002:a05:6214:5185:b0:704:a757:979 with SMTP id 6a1803df08f44-707004aa0ffmr81875236d6.1.1753350872189;
        Thu, 24 Jul 2025 02:54:32 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fcb8205sm1638486f8f.55.2025.07.24.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:54:31 -0700 (PDT)
Message-ID: <0a1b44b4-fc3a-4ffe-ae1e-0b39a6f66d4f@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 10:54:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/23] arm64: dts: qcom: sm8650: use dedicated audioreach
 dtsi
To: Neil Armstrong <neil.armstrong@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-4-srinivas.kandagatla@oss.qualcomm.com>
 <93d80822-afa0-4bff-9e73-3ece36e8c23a@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <93d80822-afa0-4bff-9e73-3ece36e8c23a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688202d9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=STcPxrrilPF-DVHAOgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iwWLzxVsvtteXYyrddUH1WO3Ze2cC7BH
X-Proofpoint-GUID: iwWLzxVsvtteXYyrddUH1WO3Ze2cC7BH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MyBTYWx0ZWRfX3t9ph4XbJlmw
 Gf641av7Dx9zuuHNtYeJw063LUID9DnLfCtmuF/JU57y5oCCfsgmSYaB/bS7YxqrKmAVuKUoJPD
 ASRiBS575cQ2ALDJ567p1ze+NuNLm9t5JOzX0EUZJlssnbf7lI/z9BayWS+EcFdd8QmWC888uCn
 UGPFFfhP2Na1skPwyeB/oeautCN8StHYee5RnDX5yooP8lDtf8cscXMFJOg4dJUECtBLv3YLTcY
 8rFJGKYrzjSR1BeE0dmltLFtFtiJn21PDhUCryw9KDRygKKr9ZbTphgwYOFFp6843gzOw/U8olK
 P5fgsSVuqUIIwm47jLXFQpUfzALV0weMl6Cd1jbZdkAoWjjFPRCp9zWQbo7aQUQTSPibgt5QqcG
 Iwgurjc7RSRRDUsRUTdwzJtmX1Xkf5nSgHZ0iOYJD11PLRCukCTTUPM0mFTzk6+8zf8BdP9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=614 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240073

On 7/24/25 9:26 AM, neil.armstrong@linaro.org wrote:
> On 24/07/2025 00:27, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Make use of audioreach-audio.dtsi and remove the gpr nodes from SoC dtsi.
>> This move removes duplication.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650-audio.dtsi | 10 +++++
>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts    |  1 +
>>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts    |  1 +
>>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts    |  1 +
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi       | 43 ++--------------------
>>   5 files changed, 16 insertions(+), 40 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8650-audio.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-audio.dtsi b/arch/arm64/
>> boot/dts/qcom/sm8650-audio.dtsi
>> new file mode 100644
>> index 000000000000..14ae50e72e4b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-audio.dtsi
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +#include "audioreach-audio.dtsi"
>> +
>> +&q6apmdai{
>> +    iommus = <&apps_smmu 0x1001 0x80>,
>> +         <&apps_smmu 0x1061 0x0>;
> 
> As patch 1 comment, I'm not fan either of this intermediate dtsi, or
> perhaps there's
> some bigger plans for those files ?

Thanks Neil,

It more of duplicating the same thing over and over and i expect them to
consistent across all the SoCs, however its not the case, some of stuff
that needs to be in board level dts is now added into SoC level dtsi..

Moving to intermediate dtsi could avoid things like this.

> 
> Anyway per-se, it's not necessary and it should be in the SoC dtsi.
Will give that a go with some inline include in SoC dtsi.

> 
> Thanks,
> Neil
> 
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/
>> boot/dts/qcom/sm8650-hdk.dts
>> index 259649d7dcd7..94fa52437d79 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> @@ -8,6 +8,7 @@
>>   #include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "sm8650.dtsi"
>> +#include "sm8650-audio.dtsi"
>>   #include "pm8010.dtsi"
>>   #include "pm8550.dtsi"
>>   #include "pm8550b.dtsi"
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/
>> boot/dts/qcom/sm8650-mtp.dts
>> index 8a957adbfb38..07e62918422e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> @@ -7,6 +7,7 @@
>>     #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "sm8650.dtsi"
>> +#include "sm8650-audio.dtsi"
>>   #include "pm8010.dtsi"
>>   #include "pm8550.dtsi"
>>   #include "pm8550b.dtsi"
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/
>> boot/dts/qcom/sm8650-qrd.dts
>> index 7552d5d3fb40..7f26095e6f07 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> @@ -8,6 +8,7 @@
>>   #include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "sm8650.dtsi"
>> +#include "sm8650-audio.dtsi"
>>   #include "pm8010.dtsi"
>>   #include "pm8550.dtsi"
>>   #include "pm8550b.dtsi"
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/
>> dts/qcom/sm8650.dtsi
>> index e14d3d778b71..5212000bf34c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -23,7 +23,6 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
>> -#include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   #include <dt-bindings/thermal/thermal.h>
>> @@ -4447,6 +4446,9 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>                     label = "lpass";
>>   +                gpr: gpr {
>> +                };
>> +
>>                   fastrpc {
>>                       compatible = "qcom,fastrpc";
>>   @@ -4506,45 +4508,6 @@ compute-cb@7 {
>>                       };
>>                   };
>>   -                gpr {
>> -                    compatible = "qcom,gpr";
>> -                    qcom,glink-channels = "adsp_apps";
>> -                    qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> -                    qcom,intents = <512 20>;
>> -                    #address-cells = <1>;
>> -                    #size-cells = <0>;
>> -
>> -                    q6apm: service@1 {
>> -                        compatible = "qcom,q6apm";
>> -                        reg = <GPR_APM_MODULE_IID>;
>> -                        #sound-dai-cells = <0>;
>> -                        qcom,protection-domain = "avs/audio",
>> -                                     "msm/adsp/audio_pd";
>> -
>> -                        q6apmbedai: bedais {
>> -                            compatible = "qcom,q6apm-lpass-dais";
>> -                            #sound-dai-cells = <1>;
>> -                        };
>> -
>> -                        q6apmdai: dais {
>> -                            compatible = "qcom,q6apm-dais";
>> -                            iommus = <&apps_smmu 0x1001 0x80>,
>> -                                 <&apps_smmu 0x1061 0x0>;
>> -                        };
>> -                    };
>> -
>> -                    q6prm: service@2 {
>> -                        compatible = "qcom,q6prm";
>> -                        reg = <GPR_PRM_MODULE_IID>;
>> -                        qcom,protection-domain = "avs/audio",
>> -                                     "msm/adsp/audio_pd";
>> -
>> -                        q6prmcc: clock-controller {
>> -                            compatible = "qcom,q6prm-lpass-clocks";
>> -                            #clock-cells = <2>;
>> -                        };
>> -                    };
>> -                };
>>               };
>>           };
>>   
> 


