Return-Path: <linux-arm-msm+bounces-80924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED86C452A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22F1D346A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F242E9EB1;
	Mon, 10 Nov 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2Gsn99O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkT8TYAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02028B4FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762758402; cv=none; b=hprFYdxRlbJJOZExhjEUfrbNL83iAq02+tqWv9TsOasSQwn0g5wDHIkaM8sHxRfbgxMBnX7iigI2qGpE46bcAUoxc57KmK8pYnQnEYjQi3h4I8uzzaUFcOTWVhyJKYUnIARYmwykd8f5TBrpQS9MfJooX7aUm9DGap4UGnJiiu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762758402; c=relaxed/simple;
	bh=6y34u6RaT+nzg4b3hpOMmZhuhiFWojZouwS1Ayd8lEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6J31VfVHfldlIiYrgxD5GqkrPo7KixfRm0RstLGPtP4tZ4tQqOgFDMvUHD2xfitMqvoOemPg2VdNVp3l1uUQu6wEEl23VNzUFwLqMHXnqnwf7cfL3psoPErUGQT03ubdjbFf2NojKaz8JZYjVSnJyfXs7LJRmXxT1lVDsZG9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2Gsn99O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkT8TYAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LCrKN1365169
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gf7NF+ZMZboshilYBiH2BDV5pYgK67DxhrLWqZ1GGh0=; b=m2Gsn99Oi5j2J1qZ
	j+4VeApgEfMTPwjRWrWNxg5OlsDtpbbAItb1F10p6YAV+gcUUR1iqOg+n3zZHx4/
	3UEiSmoJOnm561wd5Kbd05175Sg5e+F8mcXOCLllbqc4CP1kWi3hBk0TDkFfsn/O
	EHvWibt2T+kxibcfAEzGycKiYT/7cmvqEVRkRFuuxRwzqbvZag2xrwovE82u3UMh
	FXAZmlFH7ERpyIjs7Gd+zIKK3+SiO94cFO5IsToB3rhoPVsVouq1y8wGuyWUAid1
	+1/4ejoDHj7toQ+z3iHgZdywJWbNxwFCg9OpbSpbdQ0thz1JVapwOOaOPqkWKCK6
	QatxWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab2nxh1ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:06:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b0007167e5so491781b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 23:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762758400; x=1763363200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gf7NF+ZMZboshilYBiH2BDV5pYgK67DxhrLWqZ1GGh0=;
        b=FkT8TYAuml3KdRFkxvEyhCC+BEVBfVVQYCe9hLarR/bJqMjIjjB75MFRAqmldy4Q5/
         yvYPYUAuqeKiMNJgaRDlv4OWDoh9FS76VAZa3uQC12J7Lgw7HUy0jAwW0VCxvtXpBLVX
         Qw/WcTL3wMrDqTULH4DSFqTcls/rQNsZBNHQi9T9ATdUJ8kbY3G6CAHUXxf3x0yLQBxY
         pJnGZbj2m2ntTjKlTGK4mLlRTQsM4i/p4YxLWepgfY3kd+KPXhonZCrDVj9y/rGuciRk
         rWw+NSk5N19TTnH7p9sRj8ci5NrtSVCq3Nq2ibFgebR3G5sQ8LWIwm7y/p/0pRo+0OAH
         xYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758400; x=1763363200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf7NF+ZMZboshilYBiH2BDV5pYgK67DxhrLWqZ1GGh0=;
        b=wXQrJb9QdcUgzB4aTXB/x4FKsbKNpV4NKcCNNCQHR2Mu8HUOCi/NdHImFHIfyaDLkn
         LHCYIsM/R+ujV4G9C5013+c/1EBgiADJUM10HWmBLT6JR77eEX99o1DDT9i1/Yc7XmSi
         GKjeZ3GsOf34LZwYgA+WdVEgTxHz6p2O7IEufxU5hmfDA8+Ux6LtnIqxL83eyOD631Yr
         d+agZ68hOT97Vsd+Csibm0+EbWCCu0UtRpCFy9wukYMot91yAdkljDx5K4QdFrL7ZOKR
         GhGcjGcwli+4Il4MqHR12JczT+B4K0Dmm60JnL9ITGDTkLq6foQlr0EMEaKB635E+1ue
         MbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW8bV3m0L77muN8xsuhrpilEAvBSgY1IRcJ3uAHSfXiJljB5Pyk4O2cO2CLJFvQTGCvM9JfCcfcSstIG/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGz9e2w6G3wiHfSQQD4DYx2Yaut4t2IaR84hC8dS6zFRrIC/j
	jnic3WzA8Zo6HN5Njud8rJK+7+pS+x0jRhPIcOv3f6pVSxEeyOnewOR3rIo+8D41mKUz1Cj6LWv
	FnirSao09tb/MLahYHXggZoXwKbwU0XAQL8vbjGajHGRxzUcwFpK0qlWxaQ/wCgEzOkQ=
X-Gm-Gg: ASbGncu/5f13aJVpTSd8AKmzGe5FQSBZVLGFAGKSKkjp/QFCiMC3NcZSdtZmA3Tqlyh
	PTKtWWFb8LY2yw5HJQFOXNkwk0EKgC/Q++mNG1Rynq+YckvGjkEapQ4y1AkF9rueFUs9DuJEGwY
	sWeQ2SKiZWkhT9bt8jAGcU5K5TShW6paXzr8GBzvRrXkBdNKkVu1yJESW+rR5Ex9PQffe/lj8VX
	yVgYnczivbwkdFGrVMh8xiQzS2m2nSrOSuVxLJOj76C8J/fVj5DsJGK37Q/lfN3R8XEc23wQfkA
	RkGMqA/VxLqQpYAUE8uzNbKt5gg0pSZWWe9Df95RYUJl7hQHDgGutSi3wolKrNrzX7DoLUBf/H5
	TulauoTF1LxVuL4/hZA9ig1NuCupV
X-Received: by 2002:a05:6a00:805:b0:781:aad7:214b with SMTP id d2e1a72fcca58-7b225ae0732mr5584903b3a.2.1762758399952;
        Sun, 09 Nov 2025 23:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRFSS6GkwLPQNVWNZHwu5xq0XbLuutQ4cYKERNy84I+GMieGr3c1RjoF8alYPGi+2b9pwv8Q==
X-Received: by 2002:a05:6a00:805:b0:781:aad7:214b with SMTP id d2e1a72fcca58-7b225ae0732mr5584875b3a.2.1762758399408;
        Sun, 09 Nov 2025 23:06:39 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc175d61sm10420472b3a.39.2025.11.09.23.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 23:06:38 -0800 (PST)
Message-ID: <0fccd9f6-f833-4192-b7ac-cadc4a048cad@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:36:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
 <20251026111746.3195861-3-sarthak.garg@oss.qualcomm.com>
 <3170ad12-0d79-4cb1-aedc-d2c9f1da366f@kernel.org>
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <3170ad12-0d79-4cb1-aedc-d2c9f1da366f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RRabexCg9Rf0HEgBfOCC6Hp3DpWjbDiE
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69118f00 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JSWoISg-RgQ6qR-L2EQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: RRabexCg9Rf0HEgBfOCC6Hp3DpWjbDiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA2MCBTYWx0ZWRfX3WWzwQfKEwS8
 9NfMOlCrFK76T6tkRDqapYvdRXrT/qaqVcLRLQLQhNbAgqbQowFRlSW+J9Si7jEIdslx64Se6BB
 go6eqKB2kOykA8HfSi5jP2PHAbUsWjEKO16CtWCI2SdMOZ32fBRZs7f/oeNbGFn07YomctTpQ9k
 +yVTD06CK7J74dE6kUtS6wH2rxiUDn4j7B7XaakND8urilmd4OGvsNQvFa+m5ScDB+HHUv26e4r
 04JWdze0GGbUodvIrY0zgmqI88ji7yP7srJQYe9lpvCp8Gb9CUsb5MM6Lw51Oc1wf8/e7WxAm5Y
 hwj+VmvB4AGUyxuKBGxmoxPEcNfMmxUayx3QWolvAXPVQPxEyctzu2MGG4q9D61gXSZfwX7kLrB
 9R1Zk+Y3yJipn1emb01vrpEEep3tgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100060


On 10/27/2025 8:02 PM, Krzysztof Kozlowski wrote:
> On 26/10/2025 12:17, Sarthak Garg wrote:
>> Add SD Card host controller for sm8750 soc.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index a82d9867c7cb..50e1fa67c093 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2060,6 +2060,60 @@ ice: crypto@1d88000 {
>>   			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>>   		};
>>   
>> +		sdhc_2: mmc@8804000 {
> Completely messed ordering.


Do you mean the property order within the sdhc_2 device tree node ?

What ordering do we need to follow here ?


>
>> +			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0 0x08804000 0 0x1000>;
> Use hex everywhere in reg.
>
> Best regards,
> Krzysztof


Sure will update in V2.



