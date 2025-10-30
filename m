Return-Path: <linux-arm-msm+bounces-79656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B6C1FAE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9436F1A25B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB41354715;
	Thu, 30 Oct 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B30hNtPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCTl/Fee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A6263F30
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821946; cv=none; b=Xs7hd5i9AzbSA4Y8d9YJJsCp86ykx7XzxXBhSA3dze9m+cYdHo5sAFqfN0lMGCZDGg9AQf5sxlpfoVFurPNm1V5ejiKtIlLibzVXYLYuhQ80P5iLvAAugA5zCYf7hi1IziiZj86MltbJysRcYVYm9SgrDqjLU7Z/xzCtPqkS7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821946; c=relaxed/simple;
	bh=vUUVSj8E9thWN08gmpeopsMdhSWCUQAqEroW1mBfldY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASzLOZPr1ctJxCGxvoiAYJZ3IgIRNWozv4zV7GiunZ+CJKjK9mAlMHgn3dDoLj+i4FniWppULjr7egsUjdLlVzSUTTicPXsqGuzf/vDUuUJ80ZlxGlZx2PPzbHQMSoLtcstQnl1PTImjcuOmCv38GQGcByE0Bu7MngQQFdsnZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B30hNtPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCTl/Fee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7md8w1578970
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9y1z4mEyvwZRYE8ksxY2lk7GLI5eH+hSE4sn1DeXX4E=; b=B30hNtPuPsEH/xCb
	du1Ezp8rJBEWsZFLTXhlXrGdiS9qX8e3Bwr9iIv2WcMQOBzy6u5eQJrRzPQKguWi
	+E3edtRPVrfBq5eHSwm8gAMTQO7DSkbnH4RQA+tbK5J6mfKRaRbkpQoprgSAVagy
	dNVrVAK6emVmYkEf6FO67YJofpZxeQpJYPWFqHAKEZC86rLefOurS+IJGUzISanC
	f0sNvqayvXdN4LwDNtH7fQIh7WNds8p/BT8jcD8Ghlspmr05ybVmjK3/Qc/wsGm4
	v1ZGCYAUWh+I8OrovvNjk+QzRflXFL7JmdktxRbAUkbJYLT9Dmtjhg8q1GMIcPre
	VRrDfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjej32p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:59:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eb9f5d6a75so1439961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821943; x=1762426743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9y1z4mEyvwZRYE8ksxY2lk7GLI5eH+hSE4sn1DeXX4E=;
        b=WCTl/FeeUqI5NYdQ3nPnCedpna1SQzm29n8y0Z/CNBfUxZ1FnnpdgaqNL/Hwxhe/fk
         Vjy2/n0AlK9cuAjxX1k1W3xmeq8+iIMKHVwjJXcNf0Yb1pgwBCCiH/mwU287MWO6nFX9
         zHhvLsRIuADBemuFGszY3uDvcC4pQ1oa/eYuKdTfNbmYiB4ac2soNuXScw6Vba1tESgY
         iSR827j8fOfObyHF7BUQPN5VcDRmpV0okTaOvgS/IJ2TrHTE+c7iS2wAO/wWMXULMLn6
         VZfKjsizifV8dnxZNppDFYEtmyMqWsC7dYcrhj1ZTvnnFRmMaMmeqR2sTndFutvYKQbo
         RuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821943; x=1762426743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9y1z4mEyvwZRYE8ksxY2lk7GLI5eH+hSE4sn1DeXX4E=;
        b=HgfzwjQulivPwVn7FisQIUIQGuC/1QdjXt1/Hz9pF4Ma/7Q1zeRtYV3GZQqk/ECXoh
         C85RhALWrZmjC67W8Q7Em7aBe1N+R0b5idcwj9mTcLpbC7OgtQFgscH4FKWZu1Vwoy+I
         FuJqMLtOuiJVdMi1lOm5I1nG9ToEnPT+wNb8GHofT4u3wTQyVO4CMdOhpF2QQpfhhOay
         swICZgl8Hwa6IQ/1pjh3sNYZIKdJHQfYVoP6OzObkZ8mn+tyZwk0jwtiTM7T6hFX+mr7
         elpnui4HCt0mrZd3VSDarTtUMTJD97O7XgvHD/CGtGo4bHDIf+JPEsqUu+zVfwS1QYvR
         LBiw==
X-Gm-Message-State: AOJu0Yx376nvfoyvj2xNv6pFW6JJzb2ch8PXr0DaNy3Gv8z6rjkgfztH
	iSEz2BOT8JDXoYdycpqDPffHYPn3G9hx8ilE4mw8gCLEJdIS7wVlsXE0GAILsB9coLz4x66T3GU
	ev9sKGcuvvvSG+p/n+uAisqDAv+MYzvgbFutofkx4t75hJ0vvF8jH4PmcW0wufeuyfExJ
X-Gm-Gg: ASbGncsJm3HOG7NScm4030ixNlCLv12EE4iZzSYLlRbcqSEFOgy6tocxCmhqlfWfk6M
	ggF41YIdYovun29RM6WAunr752BLqtJ3s3i4YP9EyJ9wwhiIjTEdYLZtSsU63DGXSA/r90dOwVj
	ERdl4kIfEiZ4oLzPFcwSUPEsaukAOPII34X+FigGWZBBEpu3WEH9hE7VeeBQz6wNO5kAOpoHBIS
	L5Q3b2nPOyzSO72ynuP7aC92ASS0Ipejjeo0zmZ/eL2dv4UUfChoZc2cYlGEg7T6tiwfeCnpyLv
	OqB9BmUEHYEPRzrHK7Ilk9c+L2gv2qvgIdR8BxVYAG2UvP6tTrK3XHjLAfPOaYB8N8Cl+thK8N1
	KZYrkQ2jLqKHSNOc0BHAQdQ7jjqEG2CrvfO0lhRt2ucigL35B8RlUP8Cg
X-Received: by 2002:a05:622a:54c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed15b4b304mr58734991cf.2.1761821943000;
        Thu, 30 Oct 2025 03:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfCaRS7P66E8fpyWxu/cNDIAnOinRSMgEpfNpG3X9q9v7Ln7XLvUOlaDL9I2MG7Ue/ghjcPQ==
X-Received: by 2002:a05:622a:54c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed15b4b304mr58734851cf.2.1761821942529;
        Thu, 30 Oct 2025 03:59:02 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f97f7sm1676382366b.51.2025.10.30.03.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:59:02 -0700 (PDT)
Message-ID: <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:59:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Asjr8An01a9Q0_XlWM64laRUGPytcnPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OSBTYWx0ZWRfX7Ujnt0csg3e+
 Bnxgw4dyBoe1c77TUE2BsY9jlBIAASNKsNih+UU3z49fOS01+J22CydVaq+ckLTkiNg2astUUgF
 IafvZVJzUXcdqSi3FWg/d0ELEEfMP/V2D8/mdE/mLEZoV15UXIIFSIfPPXSmiAWpG2CXiZaGDqH
 BAntdJ5sY5vsOot78n3LODhWzYrF57q/g0MpQfJJehOiTaO+rYYUMNiad/5u57dWKN57mvwUoJS
 dGtX14FB3JzPSMfvu/gYyQXtfbhOnDktEnB1PT7k4f4B/BO8lxjR1HMma8SLvkWFqfD4NpS1G7f
 kPnXyjOh5z6E0SSvpKh9v5PvSDjO+OhbSsB27uEJ/ttmVX37OVXYk7rwGtnwrTXOPqZhBB1/v8U
 235LjffWRnBFnx379SoiIrKyDnPf4w==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=690344f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7iggq9TOLMvyslGYsGEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Asjr8An01a9Q0_XlWM64laRUGPytcnPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300089

On 10/30/25 11:58 AM, Konrad Dybcio wrote:
> On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
>> In order to reduce duplication, move common GPU memory configuration
>> from individual board files to sc8180x.dtsi.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
>> @@ -14,6 +14,8 @@
>>  #include "sc8180x.dtsi"
>>  #include "sc8180x-pmics.dtsi"
>>  
>> +/delete-node/ &gpu_mem;
>> +
>>  / {
>>  	model = "Qualcomm SC8180x Primus";
>>  	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
>> @@ -444,7 +446,6 @@ &gpu {
>>  	status = "okay";
>>  
>>  	zap-shader {
>> -		memory-region = <&gpu_mem>;
> 
> Hm?

I "hm"d at the wrong line.. why are we delete-node-ing gpu_mem?

Konrad

