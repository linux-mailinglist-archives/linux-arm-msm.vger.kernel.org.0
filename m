Return-Path: <linux-arm-msm+bounces-66501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F86B10943
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFBCD3BC959
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FE81362;
	Thu, 24 Jul 2025 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsnNLeKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECFA2750F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753356774; cv=none; b=sf8JDdQHsm4wuBY4ZFMt/AIkfW8GvRtrgae1hQqMyGozD7tc52G42GY5sZTzN7lbtR6Q+hPoTUJAqPjUEVPnsnNOUrTOHiSPS/ogxraHqRf/S9BAU/l9uFOADrcwDybgIH3yvFu66JhiBIC7ZXUshB0e5Oiv1JjLb8daPS4ogjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753356774; c=relaxed/simple;
	bh=9ldZRzjPyr6R/RppclDLygRd+Xb1MSv4FA3aRAISP2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLhXZB/aIY64rFC0rUpBeAtT22atQvTOpwqX2S9+rj1HGDaHJ6GDV7ye/8zAPsbl2AqV+KJKNdflPZgKEavm6R27BXSPq/IbrqBFKMRdS+M6QRYAsBY5M+1KannQTd5SyNfAnQ2uDd60Kf8YNpfSwUeFySUwaafzGqLYWhrlOFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsnNLeKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9slW5007119
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vkdub2D9Ix1D069ciMfnOnAi5gl6FNprDE8EkZawJbc=; b=KsnNLeKqMsS2T7M6
	JOUAt83eNYVCdBQORuxYxBMrmBsGi/hyXdyd9Kr1n4RsMecLu0iq0B/SFjN0eVwK
	KxK/GGgjCfGl4convg1Pz6b2gFTQfS4UgVInOPvJTFFqagB4N45CuoE6Fm7FogtO
	5X9eU3YeI98Pe8xO0OEPizvz++dGhZ+Mrr50079rbsO+CJqPVjFX4eqkQcBX8KlQ
	9gJ1Gmp3WmT8ovM/Od2AFQvG500f3gKKTQ67kt4zXfhp37b2qEL2vOepBMuNjgFW
	/kylU9wvuUcIFTspFzaxpuCTFnFFBn7DLqRoGnhogQnF7B6tvmNLyDEy3mY+ncns
	4IqS8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qgjet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:32:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab60b83e11so564101cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 04:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753356771; x=1753961571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkdub2D9Ix1D069ciMfnOnAi5gl6FNprDE8EkZawJbc=;
        b=I8Yjt5X3NTz/A8FXHD75kz7G7yWCd5ufi80fgEOgHiO+Rg+ARAxMngrUcmyn0Ts7qh
         Ht83e0LqKsbAmPtCNos+IjROtUJ/p619AdwCxg+yNPSBdaL0+ZyOcIjojCORteE0Dcvg
         RQ3gVgmdW9OGJwW/1KeuhBRuPI5JxQzvVqLHoPxqJv0Z6oklWcSi+iUqVoUVUO9IM+iZ
         fafEXrmYq2O63a61M93d68cAL724h4pd1x0RDlb2B6CBGPOS5FkqDvUIrVZn7lsGRe1Q
         GzYcDO5ncugRc705CnVbR0/hpzdXxrlrcC9cN1Nh/tKuWUDvtrJH1rJSqvaiEKrKaSGT
         0mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6KFZdrslu7k8ZPGkTQKmgfwAwhUpf4VJR04JxAFrrT/St0J0IVFDqWHCrKFnIazHfpKFETmX6xovLrtqd@vger.kernel.org
X-Gm-Message-State: AOJu0YyBb89xBcjUgtGEUwpr4QSJkSC25h24zlB9Ng1D4gvuCt5R0quG
	AgAMVeRhQJiFfQsyuXLXJh1PFNs/SAKGr3akHcDvR21kjiNGmFL4OkfOQn4vDlLu/1QQPRBtcpT
	G73D4k1ik8d+esS1pCyXUaoBLRuoGEZ6OIwC4v8LMDjKXcXNtEz+k5wbwqOZ+/T09Um/u
X-Gm-Gg: ASbGncugzAAfrFKi3I/Wc9xAyu1+NJ5IUv9SE/Aqzv5bRztSsAh1YwatdDUOsIhVQ1G
	T87UKaDwrQDZyEWjXCeL5hPIiD1R9PCL1oUEqdZwdKEugvrrVcqACB70b45ARr5K9XdsfWRhfEO
	8fgA35RgmRXawTOv5ju8Zq4CcKlG0njVtDKdNh84oCsYSjotVWc0CmODfCD/GDrqFRPZ3FDBnM0
	sG1XL3xFEtaajRVRVsqDlcEMGJY27TNYRp2mzkzA9qNYYnfqcmrVYpiAR0mRTmG6cEUEueNPDvy
	8MStm0p8QVRKD0DeqKxIBKYFhUnDMj9p1g0PdUFHyBsGg3p46cUpN8BhiKoYAZdvPvwzxmvHYp0
	n4rzR1aTpKwg95gykaQ==
X-Received: by 2002:a05:622a:10:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae6df468f3mr41507731cf.10.1753356771053;
        Thu, 24 Jul 2025 04:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKMYrc1c7gJLpPEnvGZQ+JXFEW97UbToOxYYGdHgUsXZHlT+nAbkoU5dqSLoVTSIkv4LWWHg==
X-Received: by 2002:a05:622a:10:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae6df468f3mr41507511cf.10.1753356770583;
        Thu, 24 Jul 2025 04:32:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd335fc6sm741550a12.67.2025.07.24.04.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:32:49 -0700 (PDT)
Message-ID: <4ab97f28-ac2c-44d8-847c-d3a49e4f38a6@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 13:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] arm64: dts: qcom: x1e80100: move dsp audio nodes to
 dedicated dts
To: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4NiBTYWx0ZWRfX8OmhSxIiVCng
 Z3vnxRei6k1CitKueU+eM6scQziIQ8hvEdSjwtx+1alI38b2tHqU0nHGbs/7/sAkl5srZt49KJX
 W2/VTsgyAT62INhJpy9UYJCgWdOLOeR10vYUWGfj9SbX9eqWXkfzGQ+ly8mJgyFlh3ULadrRlkt
 RlQT2Z3IIbpQb4M/COpUMuoK3/dBn0bpNnnsI8A17hu/LmFYQ5hmFrtD0fM7i1R/TV5eZOjje8E
 ze8IUD50M+kHaJGYXRNKTb6XN7oDcCU5RdK9VYyiwo9epmWYedAt0XJOpPhCtYfkz/A+83kgur3
 kpjALtCR5x1qweMK9QHRynYblEyT3kHXLMRjvflMjg4eSIgjmv5J23nHe007fEsUDvy7OYd41dO
 aa19EmRXGr1dfwgaBVpwBOuS7UHnXQwmCvQVJ9n3YIijTAIqq7OMwXPJDvxUHvZYaYPWD0F7
X-Proofpoint-ORIG-GUID: qj20PnoGIwcK56Ia-ky7w3e49dYHUPcQ
X-Proofpoint-GUID: qj20PnoGIwcK56Ia-ky7w3e49dYHUPcQ
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688219e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4r3GGkRPDdsNF_bvXIEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=791 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240086

On 7/24/25 12:27 AM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> All the device tree nodes for audioreach dsp are duplicated across all
> the SoC dtsi files, Move this to a dedicated dtsi file so to remove some
> duplication, make it consistent across all device trees and also make it
> easy for new SoC's to add audio support.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> -				gpr {
> -					compatible = "qcom,gpr";
> -					qcom,glink-channels = "adsp_apps";

This seems to never change, maybe we can add some internal bus-like
matching to glink that we could put a cookie in the GPR driver for?

> -					qcom,domain = <GPR_DOMAIN_ID_ADSP>;

Similarly, this never changes (unless call audio would go through
modem and require a similar structure or something, I really don't
know)

> -					qcom,intents = <512 20>;

This is also always the very same

> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					q6apm: service@1 {
> -						compatible = "qcom,q6apm";
> -						reg = <GPR_APM_MODULE_IID>;
> -						#sound-dai-cells = <0>;
> -						qcom,protection-domain = "avs/audio",
> -									 "msm/adsp/audio_pd";

These never change either

Konrad

