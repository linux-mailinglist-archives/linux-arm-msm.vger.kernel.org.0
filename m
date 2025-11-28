Return-Path: <linux-arm-msm+bounces-83753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7CC91C8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A55723AC7EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A980330CD81;
	Fri, 28 Nov 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb8mmnUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7WNQz0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2F3093B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328991; cv=none; b=uPQ2mFInPxCuiTWHk0gcv3gbEEjX+mVSnBxJ4I96Bz11M9ZRRm4w9AfmUonKt2/GQuhOXbEW0DGSI92zBEa6WOnm2RffM7hOjKWfY+wgSTh4XpbKXg4QD681L9FeXsaszW8BZ1gywgEZaNtSwtUreZvk58e2WmlypXgC/Gomrq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328991; c=relaxed/simple;
	bh=GnQc9kHU1tzVo9FIjgt9fU/S71UfR6ou8I7/3B/fuIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBieYcb70qhJj8H4CphdyzvrprbslLf0Edrsj+IT6DghaU7NeyninM1KJDtnEX+QjCtne29duBR/MbYoBelMKGAIK9e0JqSKHhvi/QDo3H767p7lzZ+U3GgXipfVjA6ulfhRaLBt1G94r+JfBvv8qhEWMVDhQsnuoj5mIWDLVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb8mmnUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7WNQz0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P99q2986617
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ0U8hOCpCHNCDYXg3tuisXN6zY0/nSXIeinPDkH7uA=; b=Pb8mmnUYTtvF5V4s
	25NI1AW0szd6qz0PVo3VoFcuAms3jpzIS59WS7bSQQ1gj5PSiJd6O2jjfpDUEeYc
	kzEY61ocwGf3ldA+Vb0P/49XC1Mp+wHK/3X7fKZhtmQQjeApO4JQwRH1G3C6sFol
	ULetq94fIAOK9l3pJsV90Xj+7avzRYa3J0w5KFHRKlJWdSsejf9r8YT3SyExFN77
	952n+KwzJE/gDxiko8oEsGl3LRoYisOXUslQc0qWt8MI/jHLGtQulwFMrA0HYt6b
	fI626VdwE5zfx1UIElsk9cnesb8Fh89WzjkJaeWVwjX1aqybHAAOcWzNE3J9I9OA
	WlHMXA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxk3v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:23:09 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c752eee3b8so485784a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328988; x=1764933788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJ0U8hOCpCHNCDYXg3tuisXN6zY0/nSXIeinPDkH7uA=;
        b=Q7WNQz0WJ/cL0F600OZnL3tq/qo42RvPNmo/O4HRE/QBwfxFKtsiJcixhSb9BM5AuG
         nS1mIbUnjurHxkp6+X2YHFhqTnJQyzPg48gJ1qUC6JqdAWWSQWN2OAdNP++tyn1p/gyo
         pjwaH5+bl36JepvGS/C+8aPln1AZ7oEM+weBNsdFCq+6Z3CKgqxxPwZDcomWpIlyLLWa
         AdTlDnrGRaOkKpsGQ5Q7EOJYKPBsYAhPmp8NSFuuNiSC6TR4cv0lud296YaNIXa/AcLC
         KRFBD9NsB7DCcYQ0b8dRExjohm7WVwqtnBEgM8U2VuzCjx8/ybzB221WI47lniSSYy43
         B//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328988; x=1764933788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ0U8hOCpCHNCDYXg3tuisXN6zY0/nSXIeinPDkH7uA=;
        b=gaSaMvyMFlo/9j0SdeNoq7Qe4f0g6rfOJ2d2Kf0RHQkWvwIP8abFjA09m4PxQn+Su7
         7FAflvUB2ra42DWykAEGtHP4njPjOn7MMNWUZPdVygfFp10Tkn4fqEtsiIW4NRLBFFLt
         i9QQld/ysA8IiTsg+cCG2k5EhQsWm60S2J5C6oVgevlWQ9YytJ7//REMyegi9AF6dplv
         iMrVsltYszGqoVVUSox/xD+NU3n55uURrkiTQMq+Nd/1EneTwqZtnwL/0VfYDYGtG69e
         xPSyrP178PUerogCptuuuvZeHQ1XSvxUvV9NHX4lg+3lEmk785JzXMe5zsGvcEJAZHis
         RxrA==
X-Gm-Message-State: AOJu0YxMmCiaCHG5fIl/DQYYLtY5rgjLK5UhCxXM8ApU5AyAjIZomMa4
	lZbjkxSUKayzPQ09miZfjOdxH+JnHz2cTtrm3Hd2c1ZM9Pw2BG1I6OyCErFrZfwWgjMdG9EeN37
	JqldWIzbQKJZONHTWyjm5O2iwOhFDKlcj3dhgK0pMgVm3TrYYTin9E1FtCsc0HIBp83L+
X-Gm-Gg: ASbGncuzMkDjV0fPoE1X11JHIJK+OagevBElMPCI9k7R7t+i5KKYri81Tdb48aYc0HC
	mI28pVYMTxryH9MZCmaE8OEwqCB2DWwe1yeyiOS7gllr9/7o2U1ZMue32WBO6h0i7RCbpa0f9bi
	efjk+avTAXmnfUjI6NoYDgrjqwvEwb/otvHmavGIkewEdh5A7oRhNxSmDrxQdi4aOUYHQohZ2gt
	UJPnJBLcTja5yMWuoKLygo1Wo4ug4bp7ZnMLG+ZdBX25Ev+b0YbgALfewUmNmV04xDLcX1kgS7M
	mvgpPVfcCb6TC0DdEEOUFZMEDX8/ADWJKUEyTs/mUwXkEdaYpwPauohIOQUpOyUvjppE1f2+bOm
	Y3l8HX6ofOHLiBt5na7lKG6Zzks1Wl4MUmNTlMIZlYSjiTdm1zeMkgu/QsLmYBq1AAtc=
X-Received: by 2002:a05:6871:7c03:b0:3e1:739d:4540 with SMTP id 586e51a60fabf-3ecc3d62291mr7002816fac.6.1764328988663;
        Fri, 28 Nov 2025 03:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHICtfMqIVz8gic6+QAMtvrZh+Wk/DV9Z5cigOpcZ7i1kIAapMi6HKUerT9ia0iWyUgSyahqQ==
X-Received: by 2002:a05:6871:7c03:b0:3e1:739d:4540 with SMTP id 586e51a60fabf-3ecc3d62291mr7002808fac.6.1764328988271;
        Fri, 28 Nov 2025 03:23:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510615c0sm4152731a12.30.2025.11.28.03.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:23:07 -0800 (PST)
Message-ID: <c0578f17-b9ce-4c37-85ae-feb3798c4e59@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251125033311.254869-1-le.qi@oss.qualcomm.com>
 <20251125033311.254869-3-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125033311.254869-3-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=6929861d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QZMLozYrrxf4bsumXaYA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: Se_xRPiTCh8VXK2bTc8SO9-sW0daS9ox
X-Proofpoint-ORIG-GUID: Se_xRPiTCh8VXK2bTc8SO9-sW0daS9ox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MyBTYWx0ZWRfX5y/tgTszyjKX
 AW/j9II4GSD4n63Nqtbo92qaWz9LwYHyuHtBYHLSa+qm9JKgdv0Dg9KEyrNgcNtrFbJFNe9Ql5L
 nJMDLKlsV/OlzBYDAcGOmNuZLrsL4SK17qJe5/L2UWB2VHVU+1gLMxF2OOr+dhQn8XvTNwMqQBg
 mFTJy3RkCmZTMQkYWazngeZ2GXUchZug93Tgy9t0sZ4BIbh+ehvbeFoBrcFEnuQgyF92AjjfWjY
 kiR6DYXAdO+3M5U1/rxt7AmrUucLaERef2v5PP9jbs/VvkmCFJtfTub3kEj3VdS5h1tdFvXJd08
 DJNafnj9xia+g5miH/n5cBOOcjclfDa3WSw+fVYKp4E6DR0dIBYZx0nmxOIBfXKAc7GYtvLY2CR
 zcdW/13MBB9w8n7gYRZoCT8JIhKSIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280083

On 11/25/25 4:33 AM, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index 8ca0699e3c40..3f382fb6d1f5 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include "talos-evk-cb.dtsi"
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  / {
>  	hdmi-out {
> @@ -18,6 +19,46 @@ hdmi_con_out: endpoint {
>  		};
>  	};
>  
> +	sound {
> +		compatible = "qcom,qcs615-sndcard";
> +		model = "qcs615-snd-card";

Also +Dmitry does this get your stamp of approval?

Konrad

