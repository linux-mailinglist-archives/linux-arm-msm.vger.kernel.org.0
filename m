Return-Path: <linux-arm-msm+bounces-82117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7BC64875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4BAF4E2B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B951335069;
	Mon, 17 Nov 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX/4W7hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsYVMytP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBDD334C3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763387435; cv=none; b=DQaKCswziuQ7En/u/irksjeJoTm1VQ1EAkZjnyjaAWn63M+CrA6RFPnZif7WW2Xw/rYd736nmDGOlPheKHqX95QT+68XP0zXaRrJmWahaLbAlUEzXRoKXTnur5NNSQwKjKy/P2gDS4nldJBrW452YVgWAC4y7rdm6ItHLrAFvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763387435; c=relaxed/simple;
	bh=HMlQVCG+R/tnnr+eT5WRAPtdgzvwu0W9zCEs98XyUEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ji6K2iCB5ak7sH053oOyVg7X591OEzbnJhRL/DlsOwgzG3r21NtSDTt+2O8ixvKLdjdOPXxUdcQxxgOwvdE4jbtW8UY/N6rZkJg5RPlJop5ddlUJFVF1sOU5QdHAIFwxUQoMhko9vkGMAch0qf8ZpQc3u4AJz0+GVMs+aZCzsGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX/4W7hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsYVMytP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2SAh3916529
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvFEnQh6WsbJ0vLH7CsfSNA/lxJzrUa4BNt4cTrgzrI=; b=PX/4W7hAtb+NmP/D
	DuKug9m3Hm2yU5s33kJxoCkoHR+wh4b2+g2xeel9Vp8mSn/tnzO08ay1ox7AWX4b
	op5msKi8sACXc04FaBX+et7RscbNqkUsgc0kVoPv4xm4F3j955+UI2g9ys5qiJrz
	i6HpXnza7//Q2ljkAQmMI1GaEaBbAwOyFly4a+J9C9FTwLzLypcnGPKwQqltp/Zh
	vHlMW/OOdAdpdIdMxW0KraDuuaOAuVvwoZnMDG5mX1gC/0GWhYh7CA7hLzr9YEIa
	kZBEDZzoqPzNJBaoUVT5XEBU0wacRjkDwv+VCLO34LVUq9ZYEph1iyfSMttbHNRb
	2mLvcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8ev2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:50:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso6431841cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763387431; x=1763992231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvFEnQh6WsbJ0vLH7CsfSNA/lxJzrUa4BNt4cTrgzrI=;
        b=HsYVMytPbDWU7NJABX1L3R3/n+232vzkVn3pPOmSTBkPvYr8+jZ91cZLNZSI5CiDwB
         L7401l/ZQnDRN0+dWw3kCgQ6NhqgXR0lOmsTJ0IWTZo/OjWNohjxCrFYSUuUVY5dfy/t
         08yzUgl7xy1JcquZolg7oh2HawWGOJ3w4bye7ewysXLJp9nV/jdl319+TQD/T4YZ+KYR
         g+JrSRJIDv+UohqMMWBvYq/0hwCZFTPGz2IRHanEt1I/g6eP89UoZ/WZseu6nINX6TI3
         18buLb4HBw6nsY2CUlU8JJgl8Jq3dXqmYysG7NFA3ZSpY2ZKNEynGznkiBilL5bgBKX0
         3u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763387431; x=1763992231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvFEnQh6WsbJ0vLH7CsfSNA/lxJzrUa4BNt4cTrgzrI=;
        b=Zch1sggeqb04PDxpkGcfI71Cvf3F57qfIGwcoaAmFGq0kgEfYRbX2DueQ8raYcmn86
         jFIlOyg/zmaP+/ybxz5bds6aO5gy947xdXGzBVMWNPYQ8b7oviGQVhZlm3Tvw1IRfpZN
         V354KOBpvABW0ne9KGElKHIvQV5qdQLgq0nJUDnPxkGfKQ+rgOeM53a2w35HjJH5qu1T
         fFGbU63TVHbfkmkFGcp9Kp6LqXVdmDHYrJGZ+cs4k8kV/eUMNkmuBbcxoIBTrSD/3NXc
         N+mkh9WNDX44KcbmCtNULslEBF3BrjFHl0oE5XGW8xBiMjjq58NJXvO9engmEnF0VS7Y
         wQZw==
X-Forwarded-Encrypted: i=1; AJvYcCWr/GnrF0dUtUWjAaJXLti1TQ0yph03+SjhBdj6KVk0YtjEmZsHXjF3eUj8Kl9QvegDv8m3SozGdkfI8ctd@vger.kernel.org
X-Gm-Message-State: AOJu0YwXn8BXtfmP60SKBLe8IRoaZG+QxugPZsb4IeV2ZxzP3Q9DkfQK
	S0yoWEjaFxTABFjDG1A3Xq8jDffGgpY0vwde0V8FvK+4bS75Kk2aqweXZhi6bcubOwkfTytvRDP
	3E4iJ6HpMuFsifnF8PUYq60bTFZbelxd8rOxriKQhMogekHDfansff3bhd3Qu9EUzOYCmskLOAJ
	Pd
X-Gm-Gg: ASbGnctEn/R03/Pi0KGSqZvw6E2Pu1srtD7RgIf/ETHDdKSWGFgUw9d6G+uWik05u4p
	c6JebzxHeCp7+Ix9sBB6rn5N6Mqx/K8F01Mjz5tn3Gtq9fUH0XhdYb9HRBi7X5I8paKpZt6WQEB
	HGpvEi0ISCrlHekg2M0OcC8q0+E0LMQHrRYAsuDOk9E4p9M1tdXM/0eYtaQzBt0zW8VtoDZIvzz
	bOip0v9+MY0IuD5QLPL51PXQ1ykNTQPZM/UNcRgc/4RKV17aF9vCbayfPZ3DD4SI5La4xpvQaqs
	boFPZpE7BOJBxj5lyYjHTVQ/TmJkQFuVz4g5cssEz1pjZ2S1tmI4SVIjsx+QNRAx+phYfv5PMbS
	q7aJFrCsleusFo4lbFsmD2bLbwHQcLS/wK1oc+aXl1Cp6xvGPxUL+mW4c
X-Received: by 2002:a05:622a:649:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee2bff3fa9mr6241321cf.5.1763387431460;
        Mon, 17 Nov 2025 05:50:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjWmYBibGGO4VVkCRYHGaDX2kTPI8sZqYMgUjVxzQ8jb1+nJYy1qhnAgJV28u9l3nhMUCv5g==
X-Received: by 2002:a05:622a:649:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee2bff3fa9mr6240961cf.5.1763387430883;
        Mon, 17 Nov 2025 05:50:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a2d746bsm10153800a12.0.2025.11.17.05.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:50:30 -0800 (PST)
Message-ID: <8e3c5d46-1d59-4636-87ad-e3d39e66bd9d@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:50:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: enable pwm rg leds
To: Tingguo Cheng <tingguoc@hu-tingguoc-lv.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-add-rgb-led-for-hamoa-iot-evk-v3-1-5df1fcd68374@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FcgQb5LVzfP4ApA9a-sStTBBBJOiqugV
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b2828 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4KYP6g0EmVGi8g6oHDgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FcgQb5LVzfP4ApA9a-sStTBBBJOiqugV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNyBTYWx0ZWRfX099Pul/JpFS7
 4YD8g7tmBYAlTHcbwF7jFRV1rl7vQxwfLxn++DsGKZ4H+qfQ4a9KMvcQr6S+QohTl0wVuclfg3d
 TNVgdjulUkjPb8LAJ2MgVTpwe/A6wXXF0NLdjOwNHYolHWt3cviS7zCedJe1+ls89iWl0oJ+s3B
 XRg3UEUehB9AobG7F+2+7marEGGmqTXC3Xf43ADZm5RhYsTMS2bHXGko2B2XIRaXe2hCMizD3K8
 WI+6+l9c6T8vnMtDjY9c76vWOHpnf7vFOS+2o0O0S0GBmBv+NgSv1WI7pR25PyWCqfVvdaY5vcl
 XtCU8QFGe4J01CoHRWwrLzxlzW3ylBE68RRfz4EodxQinhXGd7c707mEA/6B1i5w56tSU9xzqMI
 5+o1q+ExcEPUdxTSc05yNxv9fJmKQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170117

On 11/14/25 9:13 AM, 'Tingguo Cheng' via kernel wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add RED and GREEN LED channels for the RGB device connected to PMC8380C
> PWM-LED pins. Omit BLUE channel to match default hardware setup where
> it's tied to EDL indicator.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebased on next-20251113.
> - Validated the function based on the patch "[PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI".

I sent the patch now, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

