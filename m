Return-Path: <linux-arm-msm+bounces-47586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209DA30CC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43C247A10C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB795221D8F;
	Tue, 11 Feb 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIJPjNon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F386320F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280270; cv=none; b=H/eKItjxMk5zyOYMooyKRCvVUvaBt1Y3PdKJWvo00KHtHSpp6oY+fy56VZtfZrTDGXfCHiByJJH6NOdllFTl6QmsbEPKfKkQAx/XkRyCvWYF3bJpZocrqDbweLg0ePr9YeNaL/jlasxN2TrmiAKHNs5jmeVCX8KpCqIfVB89nFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280270; c=relaxed/simple;
	bh=faoFeqrYKEAf9svlTJWzo4t+5/zdVdV4o0bV7POm6C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2o1WpQgD1B1wEcLH0CecZr4HiOgSIwHSa5Lvsdx6BZujOd+nK6ge2dOgKo7Bn8dYv9psFn059SoHgkhdCVQj3SGx/NCI42JbHEe4veSjA2cQKSufepb1OMZFPBPE5Gb4Sn20iMcAu9TOJAb32cCEF8ZZx2+VpPojhbiYq8qagA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIJPjNon; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B71Fme006138
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQVfGCv09vBoDVQrh4Ze9mUczCoghiYMGRI0q2XkcrI=; b=nIJPjNonXVIHRGvn
	VYTMpCDZc8Wz0AG0xRHsPUAyBgR8KxmaLnTpHvQy4egNSJQXf3Eegxvatmf3Qe++
	43SEXFG7/Tifn2Nq2oGkGebHMX8lHb+lUk9kePBs+KxnfgXo8AVlQwpgCmrx2nKX
	565eQMG12nov8zLuwYbNOTsw/EdKJ/EPNm1O02Gq7+dbm4i+FseXDdlYnSXOBINM
	pAa8fNMPVjYav3iVG8K6MLgYRGlOGcTa2YEFSbTuDD5y1yeIrH2MEpjzSO7PcnEZ
	sHQkPHk2uKjOgArQrY8ipN0xA3uijyvx07Bspg9rTUp/rn69QB/An8hwJuvCqm2k
	IC+GYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mv7pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:24:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e78a271d3so8143161cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280266; x=1739885066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQVfGCv09vBoDVQrh4Ze9mUczCoghiYMGRI0q2XkcrI=;
        b=pGmvB0npA+j9LnasxcAxFnrHYL+Rs6yiejmNLz2mwJSj88Sw4Ntuvbgw7YoKcy/WyX
         ov7OKzFniaZqnjtig7b5Ybij7Qxk6c4SkxQlCsIVA5lHDhWHj3kGdfoGRB2pN4KAVtNZ
         4I89MgWpuXEyfYONokM0SfV+JSW+KBwI8u27yLapezVrYvpWY4iCLVH7C3ECtDVOzOWp
         e3ycaZFjblwa2JrBcbEqkTElgjL6pphBA2SVL8T+5gPw6/DH8pWY3gDPOuisMHovJVd5
         HyFZ66ptgczW18N7bJRR+mnaQHhyKLEWWqEjbNcjdhUipHVTJEyVWqgmu6T4vAD9tknR
         vjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUAIAiIJtStKjxPSIgRkwnjDdDY4UcEF+BZ2wdDTWut1BJPm/t5LM7bAJcTJXznf+bpdZ1qO1Qru2GKn4Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAMgq+fcN31ypRs7Hk2WaYgceT05H8LAkhclZHadKAWuV5N3v
	YRXtG/wJIzKS7v9pOcvAtCh1B6Im0ulSYdGGlde9Nyi5ts1O0WkhvGN6Sg43ommt4Zia69nDkpz
	bYDxx2fc2k3BxHNtpM9uupPVxGfg250SApB17RGNrhINY0wkit0ggeYhDqYTQBrNg
X-Gm-Gg: ASbGncuJlAEfF9c/FATi3aK0K6qxcHjVmcU8ACHgRjoX1BXQ6Q7T3xXk5vCyF55LxZC
	uF2cRtEt9QdGLLVHrxrSs8l7WVkRwg4yV2hlK2/cR8MgyaSPHPh50ROxZhf9GaMT2DvfaArOFhS
	urfKSviQcVqKtZ4Wlz6boZp6JiPUZ/Yk1xzLcGLtI527OYKvFHD5B4HkPiHjGV/YTC+RHGy5WJ+
	SzdaMzOtGHlEZWM9s7cza4+dzSTXzLuMn/wNvAQjA1lsSKnEUQSkqGQrEVbIq2qWvAgRKJb9wEF
	t6aku3T3EQr9gcJ+aZOACJvLFLMkV+CwMBY8sxVFmT30CAX8xsO/YCCeMMI=
X-Received: by 2002:a05:620a:19a3:b0:7bf:ff64:3370 with SMTP id af79cd13be357-7c069d8278fmr124538585a.15.1739280266061;
        Tue, 11 Feb 2025 05:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuDMhfu4vsIuZpH9egkjC6KW9vClwfQVhdNexGYBZzWrK+zKQWg/bT3kho4XEZz7VPxtBwww==
X-Received: by 2002:a05:620a:19a3:b0:7bf:ff64:3370 with SMTP id af79cd13be357-7c069d8278fmr124537185a.15.1739280265736;
        Tue, 11 Feb 2025 05:24:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de61830117sm6150225a12.6.2025.02.11.05.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:24:24 -0800 (PST)
Message-ID: <ed47db4c-42d2-4fb2-9b48-733443c62a70@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:24:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 5/5] arm64: dts: qcom: sa8775p-pmics: Add support
 for MBG TM
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, quic_kamalw@quicinc.com,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20241212-mbg-v2-support-v2-0-3249a4339b6e@quicinc.com>
 <20241212-mbg-v2-support-v2-5-3249a4339b6e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-mbg-v2-support-v2-5-3249a4339b6e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oXr282Zg3yY6FehLAJq8xhjQ_QQTB3s3
X-Proofpoint-ORIG-GUID: oXr282Zg3yY6FehLAJq8xhjQ_QQTB3s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110088

On 12.12.2024 5:11 PM, Satya Priya Kakitapalli wrote:
> Add support for MBG TEMP peripheral for pm8775 sail pmics on SA8775P.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 116 ++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index e87f95e9ba9f59e3f067af0d5565b8e3ed4b37fc..eade5784f18629dc9f7ebf0257551bf96bea9a4c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -89,6 +89,58 @@ trip1 {
>  				};
>  			};
>  		};
> +
> +		pm8775-mbg0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmm8654au_0_mbg_temp>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";

These could possibly be 'critical' if 115C is the TjMAX or near it

Konrad

