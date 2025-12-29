Return-Path: <linux-arm-msm+bounces-86829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F51CE6A68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C2133003BF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8826726D4CD;
	Mon, 29 Dec 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLoYEx1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWB/Dw0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B73C2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010227; cv=none; b=Tbbjq0rvjfFAr0V/UZML4KuYM9NhlR1MBUQ4ZYX5n9ZkiI5pKpTSjtQqMhKByQY4ZyFi3uvQT4YhfCCyK5ITPhUBO4jZ8BFTLdLzULAKGLbCvSaXFLJcXsMMBz4LoXOUr1wTjMGDD8X99RewRmMqAQGduUAKxwQEpFLhx/PNwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010227; c=relaxed/simple;
	bh=A8l/+tDY4TSpp5rdRSoRXaPmugwLl49j/YF2EoHHkPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joJbkMAcMzKrJYq1CAv/h3ASEK7Di0k5aKKiGQQnXK4O6Yw3/jthRzCbt+07rJ8lNBXcaDK+59c579Cjgc23/9SxibvBQuUeF6yYxIG0kNwIsK2ix/kmV20Jg+G7eXAU3YIt7RsQ7TQ+5u41PGI92wZER/pj4Oc8d/9RUaSdR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLoYEx1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWB/Dw0P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAQIcu2990007
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmRcezJoOaqIculwtm+fWIvmXsoW/ApmQVfbb+Mg22k=; b=BLoYEx1EISjcIZyy
	fpmNK0s13xsxN5PV8gfPO7I46X+5K4ieea1rJgAHkWBFDVwIEK23juj/Kl21VXPP
	qYJCszqcvo5Rb6VWvMBEbluZ00LlnwGOn+IVOtEbMW6hjRrXvw05dcnS3Xw/PdgY
	licow/pNbO7p+MmSuxt7DO60KBULfKeTSpujplhMM2baZEAiLXS0vGRrCj03n+Cc
	emZ1RW8JOaFkY4y5i86UDyviNdIHmRqVnfMQr/j3GpNMa3EgGTs23KLaDK4eDNPf
	nm+k6XEBwrim4Fw69UwAkHnGp08PgtJKK8CIdCZtrSdZxvBaYnd3w3LMXdicQA7S
	2fRNBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6c6g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:10:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1aba09639so27019751cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767010224; x=1767615024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmRcezJoOaqIculwtm+fWIvmXsoW/ApmQVfbb+Mg22k=;
        b=UWB/Dw0P6tYqXlttQ1MpO9ZJ6gtln6lVXXztcdPE3nZ65+43K2Dnminvecf9FK7Y1g
         pizJjMTBt6CajjtzSSvt2WGOEU3DuMV6mIP5r8ce9PP4pOsvV8BUtBZusMS5U9YYS9mO
         i93acPVmuCocPufWSWODVlKOa8Fy8rq6NkOh920ypLN1KcwqHUQT9DZHA+IoESeljbgn
         jZg9te7gASoq8qZzvuAa6hxQwzT2xJG+TllocvDWMclqesVid84N7+qImvq4fxUyTKdA
         u4WtjEiHL+W+DSL200IJ8+s27UXzT/7E5MUiW5lFZ+8Q6MUYKPMtsV1bYRJsVvQzZPJ4
         X2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010224; x=1767615024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmRcezJoOaqIculwtm+fWIvmXsoW/ApmQVfbb+Mg22k=;
        b=V3E0Eb3gDRdTL25gLM5T6VfaInvWZ+KDSoD9mq2EvJljnRU7csq0nszyeK6UeMfw93
         DqnNLTY1QkzgnTC6Vjp4UVmRaMui9a54U7shtgP4NjAgmCnMHlx4j4uUG7den2LZSXMO
         ak16KGSHn8gq8Gz69mfnZamvvJ8fA3/bwuBwo+7tQl8Bx0mPNQrVmjiU0pvb/hjOHBHB
         il2cBRcfRbdmTx8PAWzQyeypw2eBFWW0o8iCm3L1mhZdGo6K8ce0Hzn7yenjm/sdo1Mb
         Qd4BfRCFl8+6kaX8aXWM9o+usj+2OIF+jkn4LGch054aGqHXkvsYOfDQ17bpZhs8eoQ4
         DxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5PxjsPz32s3cEZON+MMPg+tLWOcSl5tX6yDPH/n98CRbfjCE4Nr3yXEFeUS43pk23BfWbjLhEjWDoQuNw@vger.kernel.org
X-Gm-Message-State: AOJu0YwW84bQwbnF8aXWdA8WYBT4jzOtySOGEppNA7GDCLhgHGx3Qt7d
	l4jYklqhcGzdMSt75RUTBdMKqA0nT3JT8Xrk0XACtd4G3899LSq1Gd5qgfiYIsGQYwU2pW88zy/
	Gbj8HCczrDhHiwVBMnKW575wFYh4iqusJOLUY78lrnDV5oYMKnf94G3ukeJnG0n4R0g/p
X-Gm-Gg: AY/fxX5jZp24YdoiUsgd/hGS3FSGrhsupG+44DXEtYryUBc7NrUc07hTjR94kfsd6Kv
	FyJNmB1Xb8nBjhsrCUniZwabSFWc60cvcn8qLQy0fBMo3rjZwEyHXjlW8+Jq8fGbKnvr+3EafKI
	a1MoPQ1FWHAeLqiSmzpW3LRzvWDR0cPIrllyO+O1IZ/xMNZGwyDX+Nz+R9VsJPHYgtnG2BFLm5n
	f6oYpv4xsaQxDlhz7wIpx26JJc5POvXyjgL4OJdwSfGj6mtctnU4sPWBmFBadxeHbPka7oxyor6
	gCLfcxUnso8zgJMLgI8qACsSzcdIOxqxDCUQVFEV3y2574i3oZGUtpd6HiWQZKklhTBa8vpTUv0
	enZuJyqCP/0r+783HZcwDIIytzO8TWC4lTAnuJTof5nRDZd8gsgDz/NumcrB2FU25UA==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr308986311cf.2.1767010224107;
        Mon, 29 Dec 2025 04:10:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMKnFdxvstgWTORVPMJFQFOVOtZCz+Jhu7xlTUqWcjCXkeMyACTrlFS4i7qyXEw5yTNfv1NQ==
X-Received: by 2002:a05:622a:1920:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f4abce1e37mr308986151cf.2.1767010223711;
        Mon, 29 Dec 2025 04:10:23 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60500sm3289805666b.13.2025.12.29.04.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:10:23 -0800 (PST)
Message-ID: <fab117be-d9a1-4f4a-b91d-e808c50960e2@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:10:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: qcom: sm8750: Fix BAM DMA probing
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251229115734.205744-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229115734.205744-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69526fb1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HqMmv6ACb4lSiKHDWTEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3nORjX8DLBr0rR-VJ3Gng7HzGLztxLAl
X-Proofpoint-GUID: 3nORjX8DLBr0rR-VJ3Gng7HzGLztxLAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExMiBTYWx0ZWRfX7Rz5eQta2bhT
 m/om1+BePmdnaZF3MdR+Yvv9MPg2HrzXrmtyQrroUkBI3G3YIsq8sc//EH4z/bz9yy9Mc6BGme/
 BQaZHhVoChBUGZM20EowihKpR1nVEhtYlExuhL3D3haRMC8tfgMCmtr9pabX5OEEKgCMDZFZPxq
 JRSq4/G5Md6jh9jDCmiHjFS56ts+URx9Wx/zyRbSdFsPnptgSyaoYZ84fIEQiLt+3OUDMXzTm3I
 GA8oPJsJ23IYOzLd2slctJSPev2h/cBLOQFp0h7Oxxksv9kTkDK7e2iks8qe0wbppslIzsSpWhs
 UZIpW2jk4Owcz8HJM4X0hZ1IrvU00eWftgTNiDZJq6xY+X/W5xJQyKFzWVA5/aag1bFBNMvaESZ
 NRG0ynRalTy5DI1LS+Rju/rmIuMRIEKSueu+lvH4JYaed5ZBbHkeRm6jDvjKg1pi5VAkVO74lCc
 6y6FK1GjS8h4gSjuRuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290112

On 12/29/25 12:57 PM, Krzysztof Kozlowski wrote:
> Bindings always required "qcom,num-ees" and "num-channels" properties,
> as reported by dtbs_check:
> 
>   sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
>     'qcom,powered-remotely' is a required property
>     'num-channels' is a required property
>     'qcom,num-ees' is a required property
>     'clocks' is a required property
>     'clock-names' is a required property
> 
> However since commit 5068b5254812 ("dmaengine: qcom: bam_dma: Fix DT
> error handling for num-channels/ees") missing properties are actually
> fatal and BAM does not probe:
> 
>   bam-dma-engine 1dc4000.dma-controller: num-channels unspecified in dt
>   bam-dma-engine 1dc4000.dma-controller: probe with driver bam-dma-engine failed with error -22
> 
> Fixes: eeb0f3e4ea67 ("arm64: dts: qcom: sm8750: Add QCrypto nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

