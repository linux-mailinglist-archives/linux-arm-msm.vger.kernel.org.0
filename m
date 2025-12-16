Return-Path: <linux-arm-msm+bounces-85372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F7CC37FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9034B30C68E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6C634DB5C;
	Tue, 16 Dec 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD1O5BHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gelnxj+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D934D920
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894044; cv=none; b=lvCZ4yjWYFpfbWXzjTJN9X0dJTlQSaATMrR2RGLozHsvaKu83X1xw7Rl6MBtJCnfLKRXECV9SaM/nKSzA6QgBgpJKALIjtzlBqVKqZs1KNg2UOspSZFHRKVeL1dSxPlxbJRC5m6nFLgw16sH7mSGVH4lEcrYzcJInWXeiRwpsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894044; c=relaxed/simple;
	bh=N0vnY3HcnC3ShALe60b7mAJTFhDTLzPVQZ2IovDZ19Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee9sPrccyGZa63FifMmQjgRQ9a8wquQ+Ykr9hMWjYqiyqtTSCYvOMymvWiti9Pgcp62sL9XRyLmhc8NnZZnkTULeuiTFNhXtBGb8I5Z6+7SAp/XT4SZ09AZZngvZWJOwaQdexgkPqkUnSNbEUnwr40L4qxfniwcLKSOva7lX7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD1O5BHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gelnxj+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGBOJwA3391330
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kc52L//RsWPCaHjiytXYgWdk/atL0o6gSee0I4wsNyU=; b=iD1O5BHKTyPEY0jW
	YQehAoF2UY7PcRuTlV/l3skFRomiUaa9a3Y/xQim0UljkvQIoojtC+Xz+rfdLnP1
	YorzWEYysKB6rfwvjlhMLcCuzShhlYrKfDmmLMykfwXTKK2t8/XoMVRUc9E+fBhN
	diJZ2hQNNjdR9+0bMANS6YjTbiTgECUzI8SnI6ibsz4VIDghqHwPymlxPl6QD7jo
	hVIWT+/hZVMBFh5qpyDmgQNWuQdoLVuUFfshokQwMFJWjiPx/AH8odU91668CyW6
	pJpcW/0N5qbn1h6cElBsT7Q75Y1/FRRa/JwfOzXPMhP/IvaC0EKo928XfwGjPWft
	ucumGQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b36h38m1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:07:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-640d4dc536aso1841965d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765894041; x=1766498841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kc52L//RsWPCaHjiytXYgWdk/atL0o6gSee0I4wsNyU=;
        b=gelnxj+oFz6wimNAGjxcOnAtK4dJ1/Ih3Vqn8tWD0ljytRooANRa/bfQTGN7uzTB86
         sE5/8wtuc5Eem9+F9C9AWFoWsHxIX2zZwIlIbKj6oJjJ7yXJY/EHDUkBlXsIKWQxyUjX
         ftJwkbc8WOwSjZQhF+5ZAUhgHCjOwVCnb3x6VRgcrzG+gUvKIUAb+47KPwhzNMonvUyy
         OKHbD92EaZ8zNqdvmfYmxIFpuaEnks7VFrfM/HydM7eo8sXZPw7Sod6QOVhwhK7mx9sq
         sq5Bs4Mgn1Xbro8cQ4ot2pAJPH+ElXPHWQNEs3CYHBROEpAhi5ll+LyDx9sst6gh4aJf
         3rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894041; x=1766498841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc52L//RsWPCaHjiytXYgWdk/atL0o6gSee0I4wsNyU=;
        b=aeiG6XWVFHZn5/Oa1Y9+sCGdtz351xEAUP/vzigrcdh4VpzdvWOWPWHjvBVEOqaeIi
         sZDlIJrxyOi0t/KpCDeGFI4ZO+h8TfcWRZrZhHRGquqpCR3GCRhES+pZCokq3zGJfp/j
         SXwKdsbPKVURY3dDYPzhZY3zIa7Xy/r0zwKKe5oPIObYQ32j8eM5c1rlmeOOp8fi1FHg
         YK9QHUFkH5BJdYsj9iyoZUQu1LsZujDusB7GR1Ajxcn/giNGnjxSeVyhXI+wnm824my7
         MoNjaxtkrXT0cL1eJa0qmysXJY6azvm3bvocxfdotnq5HXpEZlQCyjSHxgC9mo2Ai4lI
         upDg==
X-Gm-Message-State: AOJu0Ywjt8QDwI5l6z+nx5doMlyuPnb+VSfJHviVwCiPJ5JE5OFO2Qws
	AB/HcrZnGvxh8c94ixGPmxMK7L4pkhoi1X7j/MduD8Nv9NZ7Ixyh6nSG8h0nDOyMx8rh+Z9Ajvs
	Eb1OKVIfljAitf+zC0/Ee2UMMKyF0H5w31e2uwu48YeaPl1mp0+7ZoCk8Kp5jA/7AhPGa
X-Gm-Gg: AY/fxX6KvczC5NfwWwjh0c7uINjsP4ioY+HpSHfgr1gw2zDmwDqdJzynq82rKQJcJ7J
	PtAtSgUEPEj0ufi7AY411XlS4WvPhbgdZ4LNhOSWn99iiNd+aWYineqHChLE+iPRHbk5bpzFbx6
	bi6aYBjNI9Nvr478OMTZWIVZGkTSrgITV8WIwvMQ7gi4DvJpDVw9HtkIn57zrc87UeIc6mL+vU4
	Wm3w1CqMY4Ick7yJ6Gl9114p0enaChUENXEMrJuK9uCvz3P1BIx0sE1C1ILZGFD/ydQMmjiV7FO
	4PiXlk16ex6J4n+Lg/v+6Ovb5PTWYci31CSeVGAoTB+vu+DiAbGvp6babRwK5mQn4syuN27wt9X
	zqnLOHGk61hQoZ53z0Xsr3y6wzepyY/3mWvlB5kZLci2pBzvzYtpG2cZwnFzURCIR/g==
X-Received: by 2002:a05:690c:1b:b0:78a:8599:acaf with SMTP id 00721157ae682-78e66c43cefmr111508637b3.5.1765894040962;
        Tue, 16 Dec 2025 06:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEFJ7Q2nujWCboMFK9YsEtYpyDaxV6KeXRK5g+YEeoNMC8LZw3C2WqNcqD0cfUQe9nSO2WyQ==
X-Received: by 2002:a05:690c:1b:b0:78a:8599:acaf with SMTP id 00721157ae682-78e66c43cefmr111508257b3.5.1765894040414;
        Tue, 16 Dec 2025 06:07:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51b864sm1634502966b.37.2025.12.16.06.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:07:19 -0800 (PST)
Message-ID: <e32357d4-6462-4035-9a7b-356480c3d643@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 15:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 1/2] arm64: dts: qcom: sm8750: add memory node for
 adsp fastrpc
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
 <20251209-sm8750-fastrpc-adsp-v3-1-ccfff49a8af9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251209-sm8750-fastrpc-adsp-v3-1-ccfff49a8af9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyMSBTYWx0ZWRfXx3DbntF7J0nn
 Cv1CFE8PLf5+3uLzmcjknMrNa8AWGH+DTyX6JRvsIS5Czd9kxPQ66ByvlhIINM9ZTmIOH4XfqCY
 yWB9VWGvEjpNhliEY2soJ5rs0ESiqE4of3Vo1hB2kktfs2CWR6hgmQRD+1SlIKSXupVfS2mMnIi
 bj7LfLouChbxEZr45+pakm/Zf5qTYhvAo2uVzneWHRq/c8j8qDjNjZ8Bre1/VfVPOd5vo9UW8Jl
 +V2sJoU1p/iwn2M8ZKWRuMvfElMXfDPLJMl3HtB0Z/K8KV3wZuSqjHzIZyDaiYdDY6dPemldN8S
 Cp6zM76Z2pGLHJ+ho3D4tlUyJVKv0Dbdge4IXQbJ+QlrMzaRk6ZgfPqUq2X0zcowe9UDGjkRLN0
 EMDzx6FboOruVd7B+nBKkcxQf0iKgw==
X-Proofpoint-GUID: kvAkOm7Y6-t8X2I89GDWqOIiwdqC9Yme
X-Authority-Analysis: v=2.4 cv=QeRrf8bv c=1 sm=1 tr=0 ts=69416799 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=OJ3QmTlK_4weYT2pb6wA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kvAkOm7Y6-t8X2I89GDWqOIiwdqC9Yme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160121

On 12/9/25 8:37 AM, Alexey Klimov wrote:
> Add optional memory heap node that can be used for ADSP fastrpc.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..be89c65163bf0480100c09c883b68d03455c1870 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -524,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg = <0x0 0xff800000 0x0 0x800000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Ekansh, perhaps you'd know.. is there any reason for this to only be
allocated in the lowest 4G?

Konrad

> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0xc00000>;
> +			reusable;
> +		};
>  	};
>  
>  	smp2p-adsp {
> 

