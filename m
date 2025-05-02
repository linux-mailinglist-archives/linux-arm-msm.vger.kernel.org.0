Return-Path: <linux-arm-msm+bounces-56468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A39AA6E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13419A8142
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 09:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3B622F75D;
	Fri,  2 May 2025 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc7bBJNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8F22DF91
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178713; cv=none; b=DG+oKmh/Z5M1Rdw8I0P0BNxvZuITezkdPThS1f9e+WxY2RvIaSYZsGd2AxcWPLleI4keRdC1rlzwzkIF6kTKML1ydlyQpn28G6Ti3/2qo0xLMnw8/U/GcPUD9+wVCQJjmartUC84KVC5RtneWUc9juZVZ73VUuT8FIohxJWdemk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178713; c=relaxed/simple;
	bh=NLLvyIIHNwAtuEV0aozIKj+fc9Qr8j0sIrTyMsGIABQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAvp9ITcsCHsOGVO500BAGV9Wa7536toG0vGjBiNkp+Cd5dS9sYJnfrbUS/logztpEGlRseu80dadMnheQoCPfoNqeIfaWQJFOFPIViaQbka4uUAdp+YPfie77ddXJnYJomF0KGsVfb+DnTeYeRp8cTfA3cgixjJOIB5BIlOI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc7bBJNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421MwRE009257
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 09:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4WiodssTyTUeYCWBBLu8Exg0/NivSkSrrcMmrg5JIs=; b=Uc7bBJNOUyIWqKJZ
	rIgngeVBkRqeHblOE9MEJXJlTP9CrLg9Bqkzd1O7aO8O9C+RZLYRzHN11w8zs72c
	69p9e3EqSgRmRjbcoda8L+pgpJX5xHUr6DaaYW0kdlXq0+Mn8fhk9I8c4Tt0q1N0
	Xbn9jCBaOgz+XEq5qvnaPggK39c6AjJS3SxByxGyHx8kdXPXBpv/sLJxVP+rXvcn
	GpMJHRrEks7wjB6VRXUgPidUE+LXbFYRrDexTcZAr3WKICR9QwcYLw8f1ntYDryL
	DUHdUGfc0ggnu4fBRBKgLVMWkjNgem2qH1O7Po7whg8G/+xZFgn1TEXYzcnPVbAd
	i6bbVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubquwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:38:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so5449651cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 02:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746178704; x=1746783504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4WiodssTyTUeYCWBBLu8Exg0/NivSkSrrcMmrg5JIs=;
        b=twBCTCEWEZCT8SReqcUv6rYJeOBGeBggPvZuqqPwbVWvctUo+2GKBMiXliJVtj8B1v
         kIhFK4bqIx10aoqK8eeRtsg0tRTyZqkhYBHwl2lVNLjMg8QeOeEIJAUUF2xGSVYh/LLk
         OOAGBvRzXSeS48p0Wj9abF63pyJ/0/Wz+5dhd5eCRi95DNv3E5ffh6R5Do7XtbicTZZV
         Z4ca0X0HQPlJJdRIZ1eczY9F+kW1o/w6QIGNQtejXleI/GBt5A/5jhLkC2EYdyMPqTQr
         9UWc3Bn0kLeTgSBpaWkn2b6eTjQz9IAfCCTog/BL/TzT2+1Ir6HOuDIPKM0ii3grzbab
         WroA==
X-Forwarded-Encrypted: i=1; AJvYcCWMbuAEXcOqV7B0rdS+/LjHnTUoARa6mq/xmRYYFAcZza116dKwoOQeIPA2mhd42vYgy25mvkNolUK3xEXP@vger.kernel.org
X-Gm-Message-State: AOJu0YwbupTbhb5nJVLWDArSDvo0+y84f85nJwIWwKGFQ0SyszC4iQJJ
	WqGyEko9405GUyH6kMXTsVkTVPHUoTXq2Jhsurs4hRjLHD+RKxAI/qm0hGzli8j2NzZcOHKMQwJ
	xBcYOoG/aMJMwUeBW8oHQmc6+SIdCAmfZ7ayL7zdUwBWq/ziPIrzTVsqnNjvvAYrC
X-Gm-Gg: ASbGncuw7dIkTcXqVVskvjh9zW38qUq6j0JSaSRJMLimPD2Xrazc09uSfVUWEJizPc+
	c8goRafZJ/dOn2hbelZ7AsBq3xcuzyWTxbP3b7qXHGyjFPpkXDFM9gf65/FvDEj38o8pybK8f3F
	q3nc09WROjs3ZQJnU7m1Af47ujp6yMsm6EZFulfX26xC7z0X71uUZ49hYUMXqsiWVn+XWlUU98z
	x3kDvUkwqHZSLzoRipjXpasO9jCXfbr8roHtqRFMWb8NMI8oyJeoQz5qkiaZchB7hhikM86GdOl
	i1SlyuOzD2Gcfs4A7bHG9Fw/JS6gvHeznZ/Z+0gjKDDWqdTBMiiLp0EueUa6Hep+3k0=
X-Received: by 2002:a05:622a:107:b0:475:1c59:1748 with SMTP id d75a77b69052e-48c32ac7ee4mr9762031cf.11.1746178704308;
        Fri, 02 May 2025 02:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGplNT6UL2AH5Q6cD4nnSucsQ4tbT2oyVU6ywNClcUBdOxGbjYILgTlk7z1kZTgo/jqQ6unpg==
X-Received: by 2002:a05:622a:107:b0:475:1c59:1748 with SMTP id d75a77b69052e-48c32ac7ee4mr9761891cf.11.1746178703973;
        Fri, 02 May 2025 02:38:23 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01b2sm22103166b.109.2025.05.02.02.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 02:38:23 -0700 (PDT)
Message-ID: <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
Date: Fri, 2 May 2025 11:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502011539.739937-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QdHNPTcxOza8Kf7zRv5vv3vBczH_DuQL
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68149291 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=i5LmXQDNGShexaeZTkYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3NSBTYWx0ZWRfXwFP6TtvJHDh/ HCJlloxoF0umRmUr4JCru3mAk4Rpr6nnaF/ApBfgYd682uAMO1ZG01ckwiQZFgfuGiTGmbViBGo JsZeuTSaTobGQ+n58q4j4J8r9grBZYKSQnRAX/peYCb61BOWaIR0YGUWUW9UffvrM5axg4mwi48
 hJXJ2FLdh4oGD5rZgiywoXOk/4mS/TphJ27HBwS2Z6B2a8Pn1/D+sPhpgaKqssnvy29ycxtvPpH nDlyOpP/xc68r8Q5kqF0b5yUok4rLjnNF4VJgtGuUjCkwyHXwqWD2+s2ULcDmt2+X9YSIUQ+VmQ f6A96IcdyW7luvjwk60+vLkB1J4uOAgR8+GMxmqSqG9ub1xxlz7O5a1h+ncfRROK6sJ2Tmf42Pp
 cNmnIJswUWlVAHjcnRYKOrS365Ujs/Px0c1YpRKznZQhinmdxZIgB0EwduEAvktsXL26mjTW
X-Proofpoint-ORIG-GUID: QdHNPTcxOza8Kf7zRv5vv3vBczH_DuQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020075

On 5/2/25 3:15 AM, Alexey Klimov wrote:
> While at this, also add required memory region for fastrpc.
> 
> Tested on sm8750-mtp device with adsprpdcd.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 149d2ed17641..48ee66125a89 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg = <0x0 0xff800000 0x0 0x800000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0xc00000>;
> +			reusable;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;

IIUC the driver only considers this on the sensor DSP

Konrad

