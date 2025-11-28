Return-Path: <linux-arm-msm+bounces-83707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E68C91493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFE7E4EBEC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0AD2EA73D;
	Fri, 28 Nov 2025 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enTxEcJu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5o7J1vJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37DE2E7BC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319328; cv=none; b=NGV9jaiUDBfAEeW8+76ADeuEck+ZSYMrjDE9zev/N6VR2gB+JSlSvRHxmmv+ZofrwpVBX2NrJ2WO1TSjC4qqZL9oBhZ11y7hE4dcaDCn7kbPgvYEIyEgkzW6zxcx82OqpOT3FAsiA1HBh9fTPSkDsxElph3vP7xuDT2/JSOACm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319328; c=relaxed/simple;
	bh=tnOjjVCXrQ7QdNvjUmfq74RRS59KNMSEyTyXZxlqulA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJlQR2f6Rm90gqzsqDWQVcLMXz0RSnh75zmaId2iNR8AhhIleC3BFCP1slM6Yw+0IZTnQHrLF04/IeRFBiwrrgtn2wKUQi0/kHXrK8fYn5lStYxZNTyJyb07xmc+bWEGQHlEtVE6jcChCjbygfLZcRS4VG799mby/fNZpIp6nqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enTxEcJu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5o7J1vJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OOGU3967541
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rC3IXtJ71fawjCfcSYYkZhrERBU19d0xx2IIZKrjEG8=; b=enTxEcJuvY3jWSF7
	0tjm1ssNF/kE0Kw94veUwsHOiPi9hJSDQ6bcYkZAxdPw73u79Sv2PaHS7g6ajHCB
	o8bEdtGZf59mdB9GbKdD5d3bkWaC0OfzfW0ZBLAbp2rjqwMr2w/I+R17QJODARrB
	NzBwMi5UInmtndHUpXLEfM2Qyxqky9H45zxXxDDvdyqs5yooPf2n1XG2ejIDSKcU
	a02CfC6C949K7xP/3XYDAhmgO5tDXEno5XbBymvvq+MdhJOPhNZiSVtQQ5gBzl5I
	fKgaGv34jSEB6bG5cH4atnRXBv1kDkvGTD0k/zMoqoRW+vPMvy/2BRHD1EPaRLry
	znSTGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5jvha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:42:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1700610b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319325; x=1764924125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rC3IXtJ71fawjCfcSYYkZhrERBU19d0xx2IIZKrjEG8=;
        b=L5o7J1vJVsYhY3Y/yV69PZmul+zhCRw2F8egujbp5Dneh1gmef2takb2+ZAofAsvos
         h5KShrvxRw5XOAz5BLnvES0qBhzpxtjH8K4maRvjsOL/VYeqQaqbZpPT9spPImPeb8NG
         6NuTb3pcoQkByIAS0sFxg6crcuTKK2lNIkE6ydpLzUSqmGDMhMAE5brZvMpBYjH6dZQE
         XA15opv7rogwuA4RoUeV/lmZITy2FAZzXfxIK+44BxMEEMjY1DFTRIziP4U9wXt306i1
         nkR7wTsYrrz6AiMYF9XxnYfNqBvNnzDmu+NMsMklRGWe/9jx+CmqUDtr3DRjZsaMLJ6U
         sBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319325; x=1764924125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rC3IXtJ71fawjCfcSYYkZhrERBU19d0xx2IIZKrjEG8=;
        b=KEGIxzXAdX2SYFXH5R/SS6qWDsuYtaMwcyyP0hFJ5KSHGzWx3GkLfsbNlkpm3ATuu4
         dGrQ6XzmJwUV4fGzaNwvebN7d5PH+26XIdH3sR/Oosa/PM70hRNgjjoA3GWabRlZZkP6
         Y7PvLd9Bk9Dem9JJP/E0fLj4p+E8+bWifjoyFwo1IHqLQ+jjsunMuJyfxm2WvaXzfokd
         fCa0XWK46kDHuQGlXRFGubTpENZTff4udgytPTtK8os08hAX9YLktMMQVXDiees6BC9R
         N+WbiN+39KF29/tgl+NxDRHDr5P5Op/8+zFVk7JCk7DqtdG0tvZwyellf/SLrgGcuAux
         BHpw==
X-Forwarded-Encrypted: i=1; AJvYcCX0SVL11aeC0YX11fO44i2zoLrGLGAioR4eKA/7OkXkoQf3e3o/RiAYKwAkCxTO5xZddIHIDfJkf0XoRd8D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9JURyZbZVnxzI4tnQFO3AQAMZaGJsA0Yb/gmepxfHs9uz+Y3
	S3dmgEgQUXuge9Yx5DRO5sln81/bEHMOfFPucv84dl4a6DdXdldEJhUoP9hg8VB2hifYhEKuMRE
	AUzHfYLuprV/gHJxf489G2MaGZnyd1btASC9AsFZGMhZDB52h+BroUbrTRUsz5V42ub6N
X-Gm-Gg: ASbGncs3VIueMnfDRn/cIUNItCCT/gH0KPrqTVrgLkyQfzn+9D2ITVV1c8aFBC0pheC
	nGX8DpxpVwkoKCvrw0JPHmBGQgqe9D/g9Agv+z7a4Ey6EKs/meN0BmvOVJz3kss35ZlkTSadK7a
	mho/UpH5xcCKi4VBiYf2Cjr087v49PbJcjdE9jWlV5ED9igqC6CuHzZe9vQGpfcmkumGZxwiIQR
	rEQT4J+QKZHmMDVjsrQNnbr34piMTGXdi2MwUYb0g+P9LB32qMFYGWleChJE231jxGZXIlzkwyJ
	uBHetg4kihhf7PSAAXrrTSQEMGnJQldxXrWzO/Izoa9+07bcpC/XalnknvhIeu1buIS06sLnAFw
	RvGqqCFPQVs/oxShig5iZFVoKJ7SHTn14JQ6czg==
X-Received: by 2002:a05:6a00:4f91:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ca8abe60e7mr15387997b3a.16.1764319324673;
        Fri, 28 Nov 2025 00:42:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVmanqQu5o49HpCeGoGiBFz8hXePIS5vMhryxeAlfdLgUR+44F9m45j8efoNz7tf+elyLShw==
X-Received: by 2002:a05:6a00:4f91:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ca8abe60e7mr15387972b3a.16.1764319324190;
        Fri, 28 Nov 2025 00:42:04 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a03a3sm4292231b3a.29.2025.11.28.00.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 00:42:03 -0800 (PST)
Message-ID: <9a3c2518-3a32-4165-a7e7-22171488991c@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 14:11:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add videocc node for SM8750 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com>
 <7a69ced3-c698-4eb1-b705-58a48048e684@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7a69ced3-c698-4eb1-b705-58a48048e684@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mymOQm9M7jsHDrxFgFfaScqnC-tEbucK
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=6929605d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MXyLJijZ1nuMT1Ge3pEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX9t8t1Y/i2fxd
 yUkJa51FnQxIxPCSVLwXB3IRKuckek4yw9sUmVP/L4sCHe54Xk/HqlrpXfUJwGxgyxzNV94tkd0
 d2xCeo5KZHuk4v82Fczs+U3ToJATENYC6GE8iGppwAA4OmAsFK3Twxu6TIW/35HTmTEK6oBhRhN
 hM41gwmTIJ5vQW+RExJvRJjUC9n3bkZj6GHe/m1kCPeI9PqgkefJwKwRlbyO8JeyrFgS4A1qezV
 eCD2Fh5ZzyUKHURFCY+vq/3HrLwGq+glVQ94PMB3Y5mQa7SDoLyJTbIgnnuC22+reVFQt7g/nuf
 rdJe2LIhmIebfdzjvYNoQhu92raAt4ElrwuliDxUoyEvyAkk9Gc/8ZsSyDD1N90RR31puXnTELv
 vfxC9u8qEvvE/wjlmB/z4k4foX1L+A==
X-Proofpoint-GUID: mymOQm9M7jsHDrxFgFfaScqnC-tEbucK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280062



On 11/27/2025 6:00 PM, Krzysztof Kozlowski wrote:
> On 26/11/2025 19:09, Taniya Das wrote:
>> Add device node for video clock controller on Qualcomm SM8750 SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..18e43c509f1f24785d55113addc5cd9f96e986f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2740,6 +2740,20 @@ usb_dwc3_ss: endpoint {
>>  			};
>>  		};
>>  
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible = "qcom,sm8750-videocc";
>> +			reg = <0 0x0aaf0000 0 0x10000>;
> 
> ... and the code is not here matching style.
> 

I can fix that in the next version. Will you drop it from your patch set?

-- 
Thanks,
Taniya Das


