Return-Path: <linux-arm-msm+bounces-66955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1DB14795
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 538E95436CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF9B230BE9;
	Tue, 29 Jul 2025 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+aJXax7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6FF86250
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767156; cv=none; b=Xaqz+TmuLhZXyllRCpN6d4G6ph8TZGMvZd6YtKO6bH5NyiGXZtqPh3JwL6xKdIKiBzRdMqkSeCeyKZT5DrhnKDTlmUl06yLmBM8y1FY0tvsIVvDMo2ouzBvScgnNycTWYZun5/kjdRtjTKE8vj7UD9Z99sg4IAHNq/u8LuHeGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767156; c=relaxed/simple;
	bh=nuMlNotkWbwaJdkiNuDkwLG9m0fVeiM/6XTgBomor9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QD1Hg6USDvB641Uui3vZgQ2AlSKageL8pzW9Q7zcRMqNRRNesR31s7PiWHnKFUWsK55nRI8iURj0qxJijodUigBQhOx1AzkVyXP+PFU7Ee/e/ZngzqbKPmVQqxWM5uMyPgKKrSMfLB0bicDTlaEShu2GJssg1+SIfbvfYUPfoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+aJXax7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMg8WH023477
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TQM0bLQT4y+lcUbM3B1dK2Ki/fMYU8F5ddDAixVjsc=; b=e+aJXax7rLwgWRzN
	zHvKL3inCRbYsevrhnI43gASHlW96+kGozu0ne3vPnWuEmgwXxe7PwZWD5CPw/t/
	HzLyttRlHe3F4SFE3CdDiaJChjX5bqXRisduB5fH7XrJgZmidFIZDJ43zh6IppBa
	L0IxdIQXCBp0Oxn4HbTsvvSQDN2b/l4nnoQElvIYdr191JwDUumQODqIK017I6hy
	+gbTG1VMH1iTobPFlClnxS53ZVqDFPoXCYY6K1II+EQIk9UoiE6jzTi7SeoTudyG
	99LrbIA8O5cCvIMQNlQVnRy6ZsWq4cCVudZFlv4T2h3pborD1uLU7OqzHqvNbKnn
	RHqLhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qpu59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:32:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23638e1605dso40593465ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767153; x=1754371953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TQM0bLQT4y+lcUbM3B1dK2Ki/fMYU8F5ddDAixVjsc=;
        b=L5wcZpinc7LpzMl09VzW2ISVLxKYpPE5Is4Iq61N/I/SJ14+7ZfjZFpDZVOCF/R4Xl
         Nqe46At2jvLL10wk+JbQmo1+jCpRcucHeUTXES25xPfiHV/20cRRFcY0HR0Y03XPZUvh
         h9ordnSDQeWVhn9kAC1112JEOQuDr0VlPvmjUwLeMqMlM8/KGYqw1J8U3mHA0ax9VKNM
         UzdbfTjSd0TMnqPy4rDMPpPx7sBl6+6twhwVpqYWQjdej76VIEkD5nn2+jCp2k1E7cxI
         iKr3gZHjmVhfb8sFBYyvmMM+dK+VXSNiGD0O1dl9ekkjUtOblucMOHyCsaRtjKjG263s
         +bsQ==
X-Gm-Message-State: AOJu0YwMeK3/l7RInhPpef16qeglIJUG3t/rGNh/YQBuXdILa90RCich
	tSvMEK5OCeZ1sCmA+/TO05A5ZS/XJI8RQcWRBapnXd5zeiL4HQWnDWosMicAoADUMoRrbt9jory
	HP8dp8/H8vmJI2VUsDy5gQtXR9Z0FC79kip8EiRHmM3YwCpebGT4uPLRnMiWgM7c2nQdRsP6ZX5
	Is
X-Gm-Gg: ASbGnct1w7ZKLCKow72uyVduFBEDOSRmS7IhQLihKLOOTfzGdgmN2Gkr6iYOPmJnfXO
	UPVrQowCnAdO0co7b6G5WyzBqnzVzwErvkWaW7+A7Js88HcesnPXoS1wx+LCkV8LFClxCWFq4M9
	OV0BIEUBSXK/OuGST+c24T5fGtNmfo2yaclo6f5i8ar8J+tvtdNoJHOgI/eOKexlR8C+bQkttf/
	h+pcocU7FhtntAKmFB8r5sK3dJo1/v56nE02pQahF9ZBG04YPc/3KHPxcE7yYEsf4L2oZeMdwSf
	ZVTfjImSoAVY3U8fm8/HRsyNSzn7KwiSJ974dv8AEVe4bOSu0KIqdGEwnrnFb4GJdliOBUNyL0V
	WbA==
X-Received: by 2002:a17:903:1105:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23fb307acd2mr217929565ad.10.1753767152685;
        Mon, 28 Jul 2025 22:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzMEYvT4QnWI434D6bbEM0kf3Z29Y5c75ODQRyFfOAHIRi23LKLWWLZmICAFHxXw4XEgMbSg==
X-Received: by 2002:a17:903:1105:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23fb307acd2mr217929175ad.10.1753767152226;
        Mon, 28 Jul 2025 22:32:32 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240765051e6sm3120425ad.82.2025.07.28.22.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 22:32:31 -0700 (PDT)
Message-ID: <cd4f5dfc-095c-495f-ae4f-782646d6c601@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:02:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250724155632.236675-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <452c6a6a-3d65-4712-a105-386d8540f2ff@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <452c6a6a-3d65-4712-a105-386d8540f2ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAzOSBTYWx0ZWRfXztUlk2ZroQ7V
 dLg6mj95rP325T15QOyzZVQWX4W61OsgbCgFu4Va6+Txxm0bUAqamDljQi92ckye3AVLvXupI9s
 s2/4m9g6e8bHBc9S3s2sprjrMAMjrNoLMacZ5o4IzHCcYVq/l1Icaa/mZ9XFd82vSgbNOt0rt3z
 5WtUtjFVAbbE+AVzOeNdEzR/m5PIt0yAZgJzqc7Wkj72lDp9ACigz8WaOk6gn/2H+dX0bCM13to
 uXSrqTjXblUfp8rmB5jMPsTd9bK0br+8KIi+tR8OrGLs9csLy2qJC+elBXybj8SBDu2+3GgktO6
 iay2e10DxBPL3PNt+i8/4l3f8uA1iaNNSe5TUDGixgWpTeVHRjOopLS5dv4Qh1SWvdNQ15qajaS
 tAzyk5/fa8i4jcipdj0o5Q9k+9U18crFz0Nk8BK8sauzibhA9DLDbqxyWaUxUaaid4sxXXoM
X-Proofpoint-ORIG-GUID: E3Bskl-IDUSW5HVFzlsbe0-kEIg08NDC
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68885cf2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NuTrWsM2-O6NPpDJVOsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: E3Bskl-IDUSW5HVFzlsbe0-kEIg08NDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290039



On 7/25/2025 2:47 PM, Konrad Dybcio wrote:
> On 7/24/25 5:56 PM, Mohammad Rafi Shaik wrote:
>> Add the sound card node with tested playback over max98357a
>> I2S speakers amplifier and I2S mic.
>>
>> Introduce HS (High-Speed) MI2S pin control support.
>> The I2S max98357a speaker amplifier is connected via HS0 and I2S
>> microphones utilize the HS2 interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> index ba8a359d8fee..a2d9aaa641a1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> @@ -5,6 +5,7 @@
>>   /dts-v1/;
>>   
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   
>>   #include "qcs9075-som.dtsi"
>> @@ -20,6 +21,57 @@ aliases {
>>   	chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>> +
>> +	dmic: audio-codec-1 {
>> +		compatible = "dmic-codec";
>> +		#sound-dai-cells = <0>;
>> +		num-channels = <1>;
>> +	};
>> +
>> +	max98357a: audio-codec-0 {
> 
> It would make more sense if audio-codec-0 came before audio-codec-1
> 
Ack,

will update in next version.

Thanks & Regards,
Rafi.
> Konrad


