Return-Path: <linux-arm-msm+bounces-86825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E61CE6999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2FC3009AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717562D63E3;
	Mon, 29 Dec 2025 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nV+sZL9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLgaYJ+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0142D5432
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008908; cv=none; b=cm9GevHgB/LV6m25JKhTxY5r6PDJRSJurl490I4EdOwmkSSarANoQl9Wcv6UBJM/dQFCP4nLyuOYjefJmXH/uroOX/LYKM0AWs5YFvAXgECBdhydD4c/ZDd0XfOjOKmqRQia0x+s92vwKGchiLh8DoLPAxqRizeRTKo0unU+Db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008908; c=relaxed/simple;
	bh=fbErg+DAWCcYhV7EN7duW/Ip1YxF3oLKzJejmVLo95I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCiv4Gd4HSGrTk/+6dTn9pGeCnJVbWRA9gVFQ8i8E02dGhECKMWwucxHFQeJh38nK0MWIn0KEH8DnMfDHoiX/+5f4nf4Pw4c0cFq7WkPwCqhiGnJwDKLEHjSYZxltwUXSB3tg2nBDa1DdQ9dwjKyqW6EqZqGGeVn+xyQ71mV6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nV+sZL9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLgaYJ+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA2gqG3289552
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=; b=nV+sZL9pVVZOMhlG
	lZvH33EjC6qOkdIbU2fX0wQ55+UagwgArCVaqP9EjPWoYeIdFAEdVYi7KkGhLZrq
	t/IsuJFOoaFt7ld/3otXz8x3+kFgdbfwhT8vcE204fxZTDLxv7zxGmpZHUguGKIT
	OQbK3O6HBdAGIZGcl4FrknFQl158YPyCpt8lcRvLBEG93WgJ7A7aD6GbOC0L5Nam
	+IQ4ESlVdZICg0ZAvmw5eFySwZQ8pSgiep5lxkqYRek+gcbWTKyjXLI4dT0S38dn
	bjj6LmuRVqS+z6w9++P92M/JKEzhxI7dhUC7kSjuFZ/WydF1pminakXzuTuDC2KU
	bu9Jhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnvebk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so29705461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008905; x=1767613705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=;
        b=jLgaYJ+Io2u1T5wQjMP3rKM2vkPJPxk+wYEH3+kx/5DArNLHrShrzeTUkzEURyLgF3
         v8wIJf5hFCBuZIxp232WWSp6HjD3zISfile1HjhP6c4RpnTr29NMXhWq+L3RisDr9gkD
         UT1KgaxBCLnGz1vpwyoitvB4oF9Iu5uvwLwuE/aclPs1JPcDnOPEPuBmHzaS1eybYg4F
         BLS1cWm32gwfxVDwRgWRKkNpSLsZNUTHix+308Tk6yM4vcXlrOZj1VYhoVoLcQ6671Xj
         30vxc2GRE48zlz0upoXIb+nm2nCUdT9SFYliC6ZkDSo21jjbU2mW6vM6h1ThnI2qI9g2
         vhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008905; x=1767613705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=197vYatdgxzcBa15cIBvM/1x4eTpxhjqkNIKVJh5980=;
        b=ANN6idX7E06sTcoypKjw1qjy+luF2qKICh4XTXCtlCBRDs98gUYjqTuKaBSCuBlFQ+
         9xnTxNGd5G/1lteUseUQhhjFIHRGQHMK7T2akBY27ggbtMJj7oWYYXqRjWBWNi7ycrtu
         sHCIOrD1QEqXaJivof1nmtIWOnfUgg3i32AjJ+0+vuAYn9JK4+5Kv539V01/ATW/QZyR
         Uja8652VPPSn3vjXY9WMyp7AOtx+L/B5EShPL/JXrInT78BHe0N0smpThDBj8Rm0vERa
         erL1r3GNpPRkfNmCLDXhixDyptgUMZmcAeyGg4eENtyShjXEjK9jJxxsejIX8oYQ1WSb
         auGg==
X-Forwarded-Encrypted: i=1; AJvYcCVC+J7kcJqubBR8KV6fxMgN1nWEEpzHrQq0kmAJV4lRKyElUJ2d5YO1MXKyyfOCViiX5f1mm8SXhzy02JvR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf50hkK7P0Q9TfxhMFLugb7XDvgkSTirPPQYAO+BWTM6FqKFGE
	MP4Sn3c+i8nuhY0ztTRXxBxb4uqMLl6635+ZwvtoTMhclk5quudeG3D2Js01yakklb/Xb/jEhE1
	UewLQSnze2VF/ipPvsN9mHUqIhzrtASoiYFpKHeXYB/l+j+RkJineA3ejNlI4pQpLdIeJ
X-Gm-Gg: AY/fxX744QnKSGYBZV4z1AXr3k2QV4Hy0BcQWudcikCgNNJOUtUe8NpxSKWO/6aw5+u
	BnIRi/DPlt+JJnSBYSbXrtGqm20JDTe3udtseXLdUM5Rv8aYLCQHyamJTe7ZwbD3BsUgenPPO3z
	y1HL67yUiTkIRAm5ev5kXMZFQkcLr3KZLdm07YsyurY0h5ev+0Dsq/jUKzeeJCaAWsY3k1JUO6S
	wfB95B18aSGLXBJhTcfAqUztbDD+7Bj1ocTVrWgwhwkOw8gymUX3VqjFqdZWmDblNycncI+WrhC
	RHk8Vrwld+pYsjlk0yjQI5f5bS4TE4OlQpgRgTwFSAWC0im7IYnQRwLhYC2LMo4XmXGB8oLi7qO
	3XTN0Ebe51XhVDcX/p3TwqdvZ4LK328wDczlcmMUZOquUYCUn7342jsVMBr2ALV7p3A==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr314602501cf.11.1767008905271;
        Mon, 29 Dec 2025 03:48:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1P2FyJAMSSx6XzaoQprEUStNYsVSCWjAZgWVJEifL21TGZpMhyQBU1RbwOWaNYz3+xX4sHQ==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr314602371cf.11.1767008904785;
        Mon, 29 Dec 2025 03:48:24 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3297200666b.24.2025.12.29.03.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:24 -0800 (PST)
Message-ID: <7c13ed57-3ae8-4dbc-9ee8-472a84e2dc40@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
 <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69526a89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jtJCHLo7aIGmxyxyT8UA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WDmZhStUEiU9fh6b7kkVDhuW7NvRDV2I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX3MBiHMZ/2Gmr
 c/nmysvSzgRSKPwMwktoUE0jNUK5l5cKQDKC9ytZLkJguua7GHckwXR638ev8ehyRzmtU0O03jF
 OgoksStqmBzXQ8BQSmSm5Zy5Avdb3rc/Bx+8lxd1vlFPWmPXF5VdmC5tYGrKugf1fhemjaBOtda
 gMp81uKS75Kv4LCeejncFndZ955QMy5Cbv30wcrITtt7FQ6dxATT5+Di5IzOrHgei1LX0nXB7kz
 v3XgSIWoGIEd4O7currQx/VzBNyPH4FWYNipq9OOYvuCGjO89h/HT5jL/kTk49QtEt9s2JPjV4A
 FM0ycRZV3D7JxU4zoKdoCzb9YCwYIdYlb/q7TyYNsvmpvG8mJfKVz5X1v8bOtcYZI8b07fp9HXn
 gf4tI1w2/ClCU3MN+bHtxMlGrsl7LyZnjnqCyFizY1b5ObUwvg+TZDRhj5F3RXiRccF/W4SKhPw
 /5XZw7UU7knlnNPuLgw==
X-Proofpoint-ORIG-GUID: WDmZhStUEiU9fh6b7kkVDhuW7NvRDV2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290108

On 12/24/25 11:45 AM, Abel Vesa wrote:
> The watchdog support in EL1 is SBSA compliant, handled by Gunyah
> hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
> block, same as older platforms. So describe the APSS WDT node and mark
> it as reserved, as it will only be enabled in EL2 overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

