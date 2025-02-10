Return-Path: <linux-arm-msm+bounces-47448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940DA2F371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDEF1881168
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2EF2580DB;
	Mon, 10 Feb 2025 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXVoBLs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F882580E4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204865; cv=none; b=fgcUz0vbK1f+DpuFUP+HJxrS7WNrWMB60uvb+f6yndbJ9s3IGukbksBn/nv1Xwl+CjmIg1BPy+SVUjWm2DhBuhyM7LJEX7bbAH+wTvoPphHesj1R/CPIggQQSAIpDOvrssEWSOh1l35cAF4PB0i5FXBHO5E8I2RgQcLPASLZ5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204865; c=relaxed/simple;
	bh=bgbA4/tbI+RaH9q0GW0mJYweN8Hc0YBvKk53/gEE68U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHjPx/B4DqJY+ERa8LqBvsAYGvOZjfaZfYo58pQviy9ybM4Ww7Hy5IfRYXUtrV+RKd/O6fzBim3dpu++U4bksIXAQc2GEGGtH9nCHuJ3eIbsBy/Y0+oAH7Oxiw426aFQAP+hnLAzxSE61OmRLObHEXSN5514OsYIIcAL/mwMNRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXVoBLs9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8h7Wr015777
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNyUZ1/cNkqbwICCq8WDQ2UI+lFq00bVJqx6GxRceGQ=; b=RXVoBLs9wL3m7Nr5
	my6FztBXcqPi0B7pVjAy8qUreH8ZnsBb/RDuaaM8E2rMZKiE0nydT6RQUIHVDGb9
	jVWfsZNOpmtBQ9CQIZGe/bKfL2dABlF5dHSnognTH+yoDTUBkme0XllVg20KhZaW
	tl1hc8e+trnDBwxocXr+smdIlhJAISnqbRNpAbqoQR0XynzLJYoDizSvPPhXonwe
	nLds1VAWWFW41UBxsGue4VTggzxNVW0jy60uVmKAk0XbxVQY6HeVed6cJR+tZB4h
	MgWN/j5WU1XTTKjuJrEDIlwsE8F3Lfri6pDfkLwIKEDucSirJ2GkowHN53yRvkR1
	8M7FuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe6ns851-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:27:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4718a18521fso2148001cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204861; x=1739809661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNyUZ1/cNkqbwICCq8WDQ2UI+lFq00bVJqx6GxRceGQ=;
        b=f6E636ttmQ2QikrvkG9Ws3iUuTlotOI3I2Kg7ON+LM/+U6uOqy/djAj6RViQKm9uNL
         WwYaFXmnYBsKJoWRFY3oeUbrVz55ut33vLidWLDeIBF9mJGIJhBOHtrslCVTWrCcIrvY
         /yqM60VaulMzy56ZZk0T85DlfjZAxpJMI5YrXDjDw/8ePLrbcBVAHp/ind0Reh7G7bkW
         5kX9AP1Q6kZ6kHbxjVfVh1AR7g1qPf+I426mQCxcyvl/vVd4ls/mbsMwmrX3h3vz6Mom
         QQiMnjU7F6GnFu3s1N0lJmKyNeX+dzZMMeY19XQ8egfpHRjjlKIgly5jbzGw6ZithGtr
         1DWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9XAn5mMxzbfYu6OZ44gCUlo6gtxamKePZ2U2jzESJ5RqZDGfGSces+hgE1wBqFmHaq4WNfHCmgwDA2FJe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OeYDcj66Fwr8ViiVpGqy511Ep/IdU4aK9YgEaWflePMIXxKc
	5pNrw0qyXz7Pm/84CB8mnCsCw7tlCqXrC/8aoluvRvlZbUayK5ffLhaxg296XH5PRr4JbGJ5/CF
	r8kzRJnR+yk9uvPoc/nVRcoVjW1L6EUH+IfI4Fz6XrFuHmfxqdFf1wR0VRwAfJ4R3
X-Gm-Gg: ASbGncuvHg5vI3DuZmY3ZfWjm55HMqj/iLaDed5qEQ9L0o/YCQ7VSn+2swOjPgfaTop
	il69teweMCCqHSqCDeO9C5r9MxD0aVwyK+qPHjHk4gBGq22fCX5JOM1ijbQxJYaHCVUQfk2vDno
	oc0puVJrCW8iKpWDLM9hTizjp0kxXqbJ3uQYOeOtt5gsdQXjWJRYLoNyHJtb5nfHW0No5xvijWQ
	Z3aDdP7oz9V0r3YnRiSjVTv6wzLMRNGJPaLsZWHVTFN+cpI8fBrXuPJWMZ23zk5PT9J2w+Hww2E
	KsB6QuGBHMnIcK3qu2jB7M8UuighxfBaorGzb62Azfcbl4K3ExUh+ljrkeA=
X-Received: by 2002:a05:622a:24e:b0:469:c8e8:d50d with SMTP id d75a77b69052e-47167b09376mr88247671cf.15.1739204861554;
        Mon, 10 Feb 2025 08:27:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExesRcNEXyjhOLlWdz1NfG7qiFCxNd6PtuwSzVqZ6Bizzd0VTM0MIEo1/jGvfoq82tMnVoJw==
X-Received: by 2002:a05:622a:24e:b0:469:c8e8:d50d with SMTP id d75a77b69052e-47167b09376mr88247451cf.15.1739204861075;
        Mon, 10 Feb 2025 08:27:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de541fb84bsm5922998a12.54.2025.02.10.08.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:27:40 -0800 (PST)
Message-ID: <437d8b8f-540e-42f6-8656-859a9ad9af12@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
 <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
 <da980161-087b-4fd7-a1a9-56576b6dfff9@quicinc.com>
 <ff574ebe-041b-44f0-8335-6bfa332d8077@oss.qualcomm.com>
 <4787c96d-0397-437d-acb4-da2857d32abe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4787c96d-0397-437d-acb4-da2857d32abe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ILnLjwCKgyA9FNvET0NHSi7rA2TfNNB6
X-Proofpoint-ORIG-GUID: ILnLjwCKgyA9FNvET0NHSi7rA2TfNNB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100135

On 10.02.2025 10:33 AM, Taniya Das wrote:
> 
> 
> On 2/6/2025 5:12 PM, Konrad Dybcio wrote:
>> On 4.02.2025 6:33 PM, Taniya Das wrote:
>>>
>>>
>>> On 2/3/2025 7:44 PM, Konrad Dybcio wrote:
>>>> On 19.01.2025 1:00 PM, Taniya Das wrote:
>>>>> Add support for video, camera, display and gpu clock controller nodes
>>>>> for QCS615 platform.
>>>>>
>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 51 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>>> @@ -3,7 +3,11 @@
>>>>>     * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>     */
>>>>>    +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>>>> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>>>>>    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>>>> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>>>>> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>>>>    #include <dt-bindings/clock/qcom,rpmh.h>
>>>>>    #include <dt-bindings/dma/qcom-gpi.h>
>>>>>    #include <dt-bindings/interconnect/qcom,icc.h>
>>>>> @@ -1418,6 +1422,18 @@ data-pins {
>>>>>                };
>>>>>            };
>>>>>    +        gpucc: clock-controller@5090000 {
>>>>> +            compatible = "qcom,qcs615-gpucc";
>>>>> +            reg = <0 0x05090000 0 0x9000>;
>>>>> +
>>>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>>> +                 <&gcc GPLL0>;
>>>>
>>>> This would normally be GCC_GPU_GPLL0_(DIV_)CLK_SRC, is this intentional?
>>>>
>>>
>>> Yes, Konard, but on QCS615 GPLL0 is connected and not the GCC_GPU_GPLL0 sources.
>>
>> It looks like you're right.. if I'm looking in the right place, the _GPU_ ones
>> are not connected anywhere..
>>
>> It also seems like the reset state of the _GPU_ ones is OFF (as expected),
>> should we remove them from the GCC driver to reduce confusion?
>>
> 
> Yeah I understand it might confuse, but I would like to keep them as the code will match the clocks present in the hardware.

Alright, let's just keep that as is

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

