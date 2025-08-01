Return-Path: <linux-arm-msm+bounces-67369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6266B18326
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52FCC1C241C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA967156CA;
	Fri,  1 Aug 2025 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUHuZ0Rz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAA20D4E1
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057025; cv=none; b=A+gC8/LH9WkKrKrWcw6h1yV87Zi1JNAs1j2CmTMfGjwcUFHBufopzd5ZhkOhQf5gUvCZNDmAJyv3ELM/DD7ta8RY/Wjovo4Z0tWe1FRKahIOQCVfZpNyC5PBiAEgVqGpg4+DgVWaDNlsAZ3Bz0dfORXe45bvRYG5RUfetilzGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057025; c=relaxed/simple;
	bh=H0ySXzvDbuoWs7r8TGqzxLl3oxORf/aA9p6f3Jf4ccU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mp5owVsShjsjEFSglzLDu6TxO5n6vUi6eFnd3oXhi1VTuRzTWIGdLbiLqiRMljpI+5mKH5x4E0bai9xqq/RJ4Eg1BWN+d8QGVBbyllU61aXJC/zyMzWWfSqAs8lsh5dDiP8MeQfekHynUMfOHlqYlR+x7LDChtBPIBSDBy7VHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUHuZ0Rz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57197AW8020633
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 14:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku4N4bPFyWj4gyqNPk2SoqswYtjh+OxCezwK2kazDYI=; b=oUHuZ0Rz4u//HTxw
	r4wqWkXnzLwbX7kbEO6hUaGP3GUbbfWS/MKTVZV9puSfAKQjR8fySBYonmFkXrMa
	6RSNw3vERBBYFVlQG2+AMHUWo+ZrWkw69sCJOzbheaOrGyXliINiIK4Drm5pU7AA
	tJf2klSUKTcS0Crs3dacU6XtuJZGX0tJroP6YlJzzQdNLKFADC2cnfd9HjnWGKme
	hhzfKpmHULqbE755maFP0gTHbPwH6DV1ZDwjvclDdz6JaCDK+o99qo8wbRs6HqqA
	wDhDuhydRg7dywZ4GEKhG27z2WBFrZfWZ5cru8VIJmCONueEQ7xgG76NZXnaalzR
	DRT5Dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aux7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 14:03:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af04ff1dacso1522841cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057022; x=1754661822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku4N4bPFyWj4gyqNPk2SoqswYtjh+OxCezwK2kazDYI=;
        b=nuubCwE8mGZaoJlt8AgfHBpGb5R4gtq4LpxfBrQepF57afeB8kHK3jyqNTSY1QnAuj
         X+zi4CP1AVtJlQWFnPhvAD3Ih7gJjz7OwNCTbbayi1nTixpCtuj96owSMG0nmfBXYPXn
         jhzEEpFWGafS9mdcCFqo7LExnhrrjPCEOa9ln5rshDtHDCquAeRxAjGK/ots43p3mQ1U
         jHHb02EbM7k8Sj5hHl7QFgDNpKzkjhrMbryhG0PwFG2Gl01oU1mzMe8R1zUIO/EWnvtL
         n3ErG4FpmWOFtXNPWN3hiFjC1aOpsEmIUc42EMRy5ffS1DS8N+rUmTOrPji3ln6XxGOS
         wlvw==
X-Forwarded-Encrypted: i=1; AJvYcCWbT/l1Ku7zXGmEXR43+QIRzrzSxBsuS4YtHNsD8jFl0+2A5ShVvEVXj8Xbyxxg02TlPRX+1oqUjMVXQHFM@vger.kernel.org
X-Gm-Message-State: AOJu0YypUIX0YHRvJb0F/9Z2RL7A2qpv4uqrA7sgCb9v2Wo+LDYJLaao
	nLAF/6sKhrOvhIcENPcjmynpNA8VXUgEIu0NGlaO81Sij7KSdmSZa30uQTN1LbpLVTufgoy1HhM
	Q8XZ+tlsnk+raEaUFfVIhJtoPcyk51FUz/xhqke/qZwmhzVscgYGj6EXNMV+AuSJrE2ZB
X-Gm-Gg: ASbGncs26rj4QGelQt694wTOg22vN3V+bkBRufQtxpUGJf4hSXa3N6uNI6qMX6j5G0z
	v/S0z2Z2SbdGxeavBMgoTjowCbAOo1mlsRO/XSDZi0zpNLnasAmLBLXunyo7Yr2LRSywmmqItFv
	a6RD8Atb8xtj5WkabC76kLCnsT2wX8jplZOY+tUkfbv3dFxi388IBiwMecSUc/HlwwEten/wB87
	yIwpxpe+SVi/0MunSw/qQk4PtJuVMCbHzOKd3U8bycfStksU9d/8+NxVm3z5yZzsKeWj4k2B+oN
	FrTNQzTtyPwrlWXAoEIeeizbYwkvV50K3t9JTKEtPXT2Pro/p+dcDZ1w3IdMqLLF0s4KvkpSrbF
	oCWv8eBP3aMUQ//eibg==
X-Received: by 2002:a05:622a:58f:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4aedd5400d5mr81763121cf.2.1754057022078;
        Fri, 01 Aug 2025 07:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZJqOtBrMXyVVQfE+UWYMn4cGgzAWWjRieoBwwyqh9DqIDo0ajPxhm1mGSkLgOOIHkgPsdxQ==
X-Received: by 2002:a05:622a:58f:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4aedd5400d5mr81762661cf.2.1754057021467;
        Fri, 01 Aug 2025 07:03:41 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a241bdfsm293472866b.131.2025.08.01.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:03:40 -0700 (PDT)
Message-ID: <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:03:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>, cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X7FFQ8GjdaW16hp9z8kWoqXqp8SFwsxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX9sx5pIo5bjTK
 guQBkCMhPQczeBDSpMf4ub58alXAx131TLMd+BqEjZo9OPZ+shjzSA59yhIYeAi6puf33q5Xzbr
 U3cBfvbgicBx55PuhLzePqu4J9j6Vt9yb0eFMN5AsEayTSMPzmXHMC9Mtm1hrNWuygkZVQb1ia/
 SyVQxbzJSUtTsX5AWXFhZdbjf2ssZv15ViVwR7TVEzobMkT+yqe8X9fvtYNMX6Mk9ZRgdJHa4ZQ
 mYuiUbAorp+G5BaVWWxMwqNuaHJAlI5fSFqc5x67L5EDtldwiEKvknflZeZU042GXukTW0hfMRS
 CeEOmqtGSLCNteRYozKNOysX0pDPYIDvq1tXXOtDfbztT/F96ygiJF9ZX1Qae+BKCkj5PNnfvub
 Sk7fVBWBJz7EqMWrEp/+V6YPwN7UqCsu8M2kMray9RyDu1t0gRbUWAixweGr77tJ9yIlS5cP
X-Proofpoint-GUID: X7FFQ8GjdaW16hp9z8kWoqXqp8SFwsxB
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688cc93f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fLAofa3itH1hiLrtIDoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

On 8/1/25 3:51 PM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc2570ca04b771ffef3ca 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1176,6 +1176,22 @@ platform {
>  			sound-dai = <&q6routing>;
>  		};
>  	};
> +
> +	usb-dai-link {
> +		link-name = "USB Playback";
> +
> +		codec {
> +			sound-dai = <&q6usbdai USB_RX>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6afedai USB_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};

Because this is SoC component <-> SoC component mapping, this could live
in the SoC dtsi.. but then 7280 is a glorious mess with the firmware
flavors, so I suppose it should stay here..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

