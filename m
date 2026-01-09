Return-Path: <linux-arm-msm+bounces-88255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD7D08AF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ACD030845AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176FC339714;
	Fri,  9 Jan 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NprL9ete";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDKVEP5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49092737EE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955496; cv=none; b=r61vFeZ+EqSQkkURsYkCuGJEDlsrUOnskM32XAh1lrtJYlGqx0nCAZTkWOwrejtsXt47eDUfn6d7ZArHUgv6AnezlURfzH2nyTapwTvYznoGFeb5CblM3pAlBo0gvT2mFBVuth/Na5CRC3MXWkjYdFMoXofqFYdH0cP4RuTdo3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955496; c=relaxed/simple;
	bh=j5HYWQgbSfaXGsAPfq7ARbiLLqxAGtHW23UhfJZu0HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCufVOsfcJ7ajF/E/ysMuc/hldWrvglrZdQnEHA2LRnm87SbPCG7zhFPv2GdAm4ZXE+4ENLrkz044wf8orCp7NevbjEqaNRz1yaFpn/Sn/iL7mP/rbzxYkUATLYKymUijCWmVfZmIuyfRtzRO/Gg08RX+4joLA305klDAe9lbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NprL9ete; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDKVEP5i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095nNuG1701990
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 10:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=; b=NprL9ete3g0nNeEi
	NRhe8pTqB8RgdhzK4ww5oz93aDvMu6CzwUJsJobPedqP7ryaQ6gNufKquk/+X3Z8
	NqjUhMDvUKbwnkLiVLP8teHDCWPAIWqYl0uyuI06W16EExyUXrzcTHROH4iLVddG
	8ZrHqbeP8x21M2y0B7391F6ct6F5eVyz9kBR5ERnoQy2TfYLrY/jfW+8s3iocuGo
	kJoQ/O1wXAzdqH0GjhUXcR7hfBoAFNuKwnZa9xGKLM2KOL2JYP5S3aSUF/EFFKEu
	QB6SIMnFXEHtW9xoY2vNnbuzkqhebMbS5bLUkAhpqu3KtVv9PPo01Uz43ZgdOv8I
	NXqBCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdab0uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 10:44:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so13268191cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767955493; x=1768560293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
        b=cDKVEP5iSOvyZzRkRqgyZ+y5tEC7A3kH2lg1f1n8vUk1OperNezbkmVA1cuTU6wV1t
         Zt9kQ83aXVN4e40Xl53k78NWAWRMlT5LZiDoPQSggrnfU1oovOm6zFredsrERJWQdmJL
         6BwyjW/kWAJTVGRuIDJbCJajfxTnlTdFg0LpL7WxccM7vQrCiNvrt9/AHnh5r7OI8w11
         lmzq4SUlHTAO/EXmkX2ssovv9c5OcBTxcecyeHApE0dHsfh7fWkybJF3x9SyG2cqMIEw
         tgZaHtOItadfZd6WDX1RM9o5sW9ofMa/W8SQeu/NRNhx0BbOtcqrL8IL3vbN6zqMxfI5
         l9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955493; x=1768560293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
        b=lbrQ0F2A9d6Pyz7gv3ghU0kmCsTpPxqZokW3MTRjsfRs0cHg0G5sEssm8UbEOySWFe
         h7ax5UpGkp40Fp8UlXY9KDsIvatZvkh5LyFN80963xZVCKfIZXGb3IYs4ofrlE64yYiO
         WwGYIiqJiY30DBXiIdAWT4msrn0/gfoSv8fbsilz/QUCBIb4QPJMVi/UB2xY68hnDdL+
         T+PABtaUunIjoQbPgPuQ8+J1fXfdEQSwRalXOZarnQkkqBAFF9EBUCZNASc2mF8cs6e/
         mDlPnKaKHSTOUgg0gk8eAygTgv11GepdQqgx0WA4zqX8D8OfMOZ+a65TFLdlDf0ZHCvs
         EXtA==
X-Gm-Message-State: AOJu0YyYGEBlQOCAaL6+h2+ZdFsr93FrUnVOEFiV5xpepGtvvWQ5QNMm
	HipslZJ0kfGQE9RaByh1t75JYC0qn4TIouy17HAq4W3+V76dP3uPyotNLTAXDJGrkb/O9oM08yR
	X3VTPBLfOzjMWsyy9dwro26kw8N+7kyl9IE6dVVa+zse6BIDtle7sdZBgHf9t19Z9rtOo
X-Gm-Gg: AY/fxX7uurYoATMVKj000ze2QfSaik4i2LL2vsTd5kYBou2bkqU87v221gdXF4bY8zb
	6AEI2yw8lw7IxSRMfz9mn8MFCn9dg1CbGBxDkS4r4Wsdyc4e1Sa/15A5kMtGmmf3o54/Xls7FCK
	EuMlY7Gv7OvnN0hUBXhNHEe9hIYsQJUYFtWycmetCalhDLvLan0wTDETpEYH3xn+BKkUsdQzdIL
	wP9OXr35Po5Qpz2HJXuVx4MjQOhV8mkyQ1/MUeuu8A8ozg/iRvRFFQ3n6N+mdEUcoNcWdUieoIt
	B2znWEqGeyjrSmxB1HloKenNda1SpZc5mrrbqo2y0C8g8iL3jqcIfaWmLvg+Z958G0X6+rshkn4
	5B8x0U9JAtuCn2TCjQKfO6iYXOYyulddFPcmsgM761VMQ36o3gQHymwLK+0kXrt65yKE=
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id af79cd13be357-8c389405d75mr800542785a.9.1767955492549;
        Fri, 09 Jan 2026 02:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUpKCBKMBJi+XzxFemYbEOa3ADoNK7YYzJnMXnJTOfqSPRMkTsVJDQkKa7InHZ//GdxnUhHA==
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id af79cd13be357-8c389405d75mr800540485a.9.1767955492001;
        Fri, 09 Jan 2026 02:44:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1089465666b.68.2026.01.09.02.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:44:51 -0800 (PST)
Message-ID: <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:44:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960dc25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MqSUJ6ohGVtzaGjW0LAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: O82R3uaqQxwHazgyPN0uM4y8VyI8RnPo
X-Proofpoint-GUID: O82R3uaqQxwHazgyPN0uM4y8VyI8RnPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OCBTYWx0ZWRfXyyq2nqLCOuPG
 dquJSR7jWIBcM3fC9jaTIutwyrTA3J4Fu9Pc/dymiKAsXp1HpdSrPGehTNOGm06ZwPUs/rX3/Ht
 +TEIsT760UqlkuTw3YpZvWhy5snigi0CX9fHMcCdwXo+MWWVdiTJcAvVLr3QKLl17N68EFRzRni
 1I4WvmF2PAGTnWsF8h6KJWTgRMZgD/wfUdnK1gO6aCnPBXhZ5ElEO7b2NGJg6aIS4AsmtPS+I4x
 /azF++BNtbQMib5FH2onPqGLv92rAKh1xeg129iyPIY3sfBI3saV+MAo6PZUUhONJiFd6Z52skp
 D150br+KDwJMxsBEZ3O+MSLZuq0v1jVl/6XbZNhDcbaaWQp1n8gt9dn8Mc9Se7sMJ1ppc8v6BRT
 BIep0D+OmDwta6R0/KStIfc2hrHQ1s2Db2HLdNnyp+bMRwOVSXTuKB6HSSlC1crH719XghFlOYO
 FBCGY3GrKNHaqZB1kJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090078

On 1/9/26 9:38 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.
> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.

So what this message essentially says is that dev_pm_opp_set_rate(dev, 0)
doesn't actually set the rate of "0" (or any other rate, unless opp-level
is at play), nor does it disable the clock.

Seems like a couple of our drivers make this oversight..

I see that originally calling dev_pm_opp_set_rate(dev, 0) was forbidden,
up until Commit cd7ea582866f ("opp: Make dev_pm_opp_set_rate() handle freq
= 0 to drop performance votes")..

In fact,

$ rg 'dev_pm_opp_set_rate\(.*, 0\)'

returns exclusively Qualcomm drivers where I believe the intention is always
to disable the clock.. perhaps we should just do that instead. We don't have
to worry about setting F_MIN beforehand, because a disabled clock won't be
eating up power and when enabling it back up, calling opp_set_rate with a
non-zero frequency will bring back the rails to a suitable level

Konrad

