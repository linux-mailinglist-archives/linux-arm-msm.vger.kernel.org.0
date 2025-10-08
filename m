Return-Path: <linux-arm-msm+bounces-76361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F682BC439D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34BB03A9EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F315F2F1FE9;
	Wed,  8 Oct 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfNkUtXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725042773E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917442; cv=none; b=aBtP7r2njEpWFWCFYnsvglJsoRNCa45/kzsDiT1k/K4gJJcN3WkR78pgXo0YO16PNK5ykVJg884xEgvzV8qm8V5nTGFqEoy/9E8YMx24ndAVX7M8ayLTHXKwwwCcn98cY7GqHxMa27PHdxJL5PmRMglG++3HiUBQAd3N+/Jy70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917442; c=relaxed/simple;
	bh=DVJrxKdK6T6C1S06dSzhYTnVMFtfTVXjqzA9qNeJ8qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOQS7m99dsA7Oe48+3ZFWkwpFalVmqlFS+S6FIfO6yVxmkja7l/chPJBmjZVEY31gKKKwjVsZ5ojOO1dL33OkXTNDeqfX1u5rLryU9UrMOLjJNd3hlUsB9VYLz4TpRKUgJAPkusbuIhUO0RmQa15E7pVvlc51ifQCCtcutykr0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfNkUtXg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890ejB002274
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kh6z01hInW5jZl5o818rE8DrFBNdkVBlFHg9qK1tSx8=; b=cfNkUtXgdzPZ4WJi
	xrREBrmM/Y003iSCSVdQ5toK4wUwFzmtx9tAREPKLk+xym1RovYRvU0NYWRT+g3u
	QC6+FAUGeXLBX656DSU5Lm+4nudfc0Kk4ME2qB4oyE8cIgCZwWDSjqM8BiCnTjQX
	CN4hKUtEt5bh8VHLFiA3PDf16xE3BeOPeMn5/T05EZwIqPFyh2V+rUcnPHxsn3KJ
	h+Zc7vaS1+JFlUD/RtIhCvmhgnKtcoKXYWzQNirL8qRzQpAih4N1FpV2P3bWSh8V
	HW3DIqvMvDfgSvDiB9bXvs8xgh+H1ziCgHKMm+RT44RSAAoRQHcoAltjLDr5OV9d
	UwIkIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy7213u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:57:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-879fa4a2989so7454226d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917439; x=1760522239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh6z01hInW5jZl5o818rE8DrFBNdkVBlFHg9qK1tSx8=;
        b=gJOy6H0Z0DauAtXOnNO+exqDNJc1Kma+2EdRwx8IHnvSDlu3YvKvR2/BO4FlC/dWXn
         vg3zY1ZgST7UPKl3rDHhRh9SUwX9iIUJysQ0cxlAxSxNqlOyeiqFNLnelm1s/KGWYLOt
         WdwpaUanCf0zbLYfPdZ5adena+x40WPcQekovZZBoBsUPfO8LSlX3RXCpN3yP4Zj2A9s
         EL48XVHMjWsEWUqgY58xIsXox8ZI7kFyOdAY0b9WxXRPS01Oq3W5mPK2zR4p9bzOEngR
         voTeiHy0BvLACT7Zl/pcczJpCmnT/Ya0GUZMhc00vBmwfHEvxsUZziftN2SJDnT5VDE2
         3slQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpFz7Gvt8CBli4mjyQJlIrmhNIWTW+EF35R8c6WLhpA0aLY3BQLIou8oXiAuQbuBSQFQeWcpStSNWT+ibj@vger.kernel.org
X-Gm-Message-State: AOJu0YyG294Oxz39uvNI5xfzVmcmkUw18zbL0c6XJb6a7sDY8vZc0LeG
	YkjQWOhBFrPFcUAS81GDMxHxxXXV1vasYWf6/3h9QcLdrljBE0OCfcUujxP8rj9CDXu0JtjL3C1
	vAu3TmCgaC6qQ9lE6S5PHM45jNFHrTQ6fqBYf0gS/oYtOAKSoStKIsRkRd05gNdcqwgcn
X-Gm-Gg: ASbGncvjQyeg3RKWjAMSAsnQzRm+5Q/sKCkPMCf4PmXsVqE01YqJKEaCd6w2O/2nZ6U
	6LVluqozHT5tmGfLEHg8r94AfDFY1wdGgj38dJnqYWyV1G9+iXY4aMNehyAe+omDzYT3WFJGwPl
	2umswZSKD2oBbc+2wadDLhO9gi/WeEefMxjeRlq+gV7n7BKSTHNOnfJ5keehujmzVfbF/TjZZq+
	e/w6SsYIEoEBMYmWOTwEGbuhB3i//IIwVQFFZd6YlYQ4w7D1ZxKKTg0ICaVAEAC0R3OwFnCEVcE
	+4zTAH77pNNp6Wonaz8O7+V4jnOSI0/ksmm4vN1mxuaJvw8bIix8ecTyAL4jy1WzV4ZwJXhOq9p
	CpC7p0DY3AoDP7XdsAyjIFjAoZN4=
X-Received: by 2002:a05:6214:762:b0:782:40fd:8abc with SMTP id 6a1803df08f44-87b2ef43757mr21852256d6.4.1759917439546;
        Wed, 08 Oct 2025 02:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQwC39aV6Eiozq4oSjoYh+UWPNaHxLpWlCKmz1mk4NlIvmu3qMzpe4liTZk+jvQPiHhPsQlg==
X-Received: by 2002:a05:6214:762:b0:782:40fd:8abc with SMTP id 6a1803df08f44-87b2ef43757mr21851966d6.4.1759917438830;
        Wed, 08 Oct 2025 02:57:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110224sm14248430a12.39.2025.10.08.02.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:57:18 -0700 (PDT)
Message-ID: <92e715bd-8439-456e-b293-8b63702ecf8e@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e63580 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4C4mPYFImK3W7d1_daQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DJBuo_Db8c4Wh7CZg1KmlEcMRo-JR7yi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXzUD4s6du3fOV
 sCYGD95/1gsNWxNR3N0iNGdOHIW/OpmEgddqHSyCilHbU6i7gVxwQBjhix80364HldZ5y1lWlGT
 VOG+K1QuqldvGMpj//2+d0M9ei4cA7wG0mj0ukS3sjw5QVtzLW6k7hp+FykEj5Hu1uP7zWWzmFh
 ar6O40Y15NqAztqWS6oshdKUcJgV7j1Ng0j7CYhd3peqCL35Z2mbM5FBlDjnDfkd8KYljXyn22q
 Q9q33o0ZTfPnHwckLHiK7CXmq9J9ENZ54zKSipWobrxiz1g30NcWbkY0zGr83pDHyUWzHw0zXFJ
 kwtVoWGbw9YH5G7fLCHpigJYCFTlmEb2ZJdBgD59CXOH3/KZ/5fiULaGG837KJbWwB+ctQfnKEz
 X9PeP+CqTgdB7UzyhjN447CwL+CAGA==
X-Proofpoint-ORIG-GUID: DJBuo_Db8c4Wh7CZg1KmlEcMRo-JR7yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 8/13/25 7:37 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 3cf1d4bc7e4a..538b55a89f28 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4641,6 +4641,177 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0x0f00>,
> +			      <0x0 0xac7c000 0x0 0x0f00>,
> +			      <0x0 0xac84000 0x0 0x0f00>,
> +			      <0x0 0xac88000 0x0 0x0f00>,
> +			      <0x0 0xac8c000 0x0 0x0f00>,
> +			      <0x0 0xac90000 0x0 0x0f00>,
> +			      <0x0 0xac94000 0x0 0x0f00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x0400>,
> +			      <0x0 0xacad000 0x0 0x0400>,
> +			      <0x0 0xacae000 0x0 0x0400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0x0d00>,
> +			      <0x0 0xac89000 0x0 0x0d00>,
> +			      <0x0 0xac8d000 0x0 0x0d00>,
> +			      <0x0 0xac91000 0x0 0x0d00>,
> +			      <0x0 0xac95000 0x0 0x0d00>;

Please drop the zero-prefix from the size field, for consistency
with all other nodes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

