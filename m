Return-Path: <linux-arm-msm+bounces-71777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E558FB41A24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 891A07A6959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45E22F1FD2;
	Wed,  3 Sep 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0GFhtF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C82EB5BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892071; cv=none; b=RKIiSCGPkwFYAj1eHL54kYRW6i4x8dlnHG+76JZtinMG2MBvCvma1zN75+H3H5Oa5DkqsprWcpqZVc4I+AwZTDp/42NXP8YZHmU4lBH1EVUys2nvGLBNIGuM6LUoX0TdkS4t4laUFEF1Gg7AHIPnzSYZNoWiE3dzXSwf3qC/hrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892071; c=relaxed/simple;
	bh=k99mFqKcbrXmSfgyxDpumBLWWztr6/dlbEmY47pyhfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WlrPYzqLQOPUZ9nE9lvS4mjku4eOxmaf9+kgZIcJpzwEww/CU8oxhoW+LYj385zi9cFWofXbwy8O/0FMsbHXSHaE33Pk3ePxYJorU1cPTD0hYPjLyJkxyBUp56x4u2qRuULk+1OWYgLwfByG4g+/z10osuyMSV1yamUkmjgCTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0GFhtF6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832R9Ft012670
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyPRprpshXznCs5FcBlCnF9Hsm/bulJY/Z/Gs/qTIaA=; b=D0GFhtF6O96nXgl0
	We9gI44TYrAuD0QNhqjRLS3X2/qW+3ILkHHjPl3sRk30HALepHXgR/oNiNahXobN
	1/WVyZbxYcHPuf5DXNLR9Jyg1IEkVsfFr6NBSfBUTnY0AaEEc7UYSDxgWeTK85mR
	yuRmOgVeXVoNQZqIB42PtV/GM28H8VtqdlbJTkncL0ZVeyfqXFtSZisFAI+rv1uh
	Cm/MkW62AccUO7nAqvMN9Wqm/qw+oVwPbqUfFNEUjJD7X/kAyvkVseIl0Crgl6tL
	Rl0s0rzjWhUNptJumC6GA9jqLnE1pFZ5Bd/lxMZx/JRc/svj6DCvVsumH4otwzc0
	IL2oDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk92ue4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:34:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32eddd8a6so7249811cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892068; x=1757496868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyPRprpshXznCs5FcBlCnF9Hsm/bulJY/Z/Gs/qTIaA=;
        b=UQaazxOInRinpy7ETLdyNhDQdO2T3cjyNI9IGo+DB6WPqc8NANTCLrYJ3829Kum7RJ
         kUWm6VvgQRqInXC1WojCiLacYIQXWDdspCpuqAUs3gHorgNrpPsFaMD4BGGxF2Xrnvvn
         MzaYtrSJgU1TaOFmWTVtKyyX+69kOzN6PLuGEId8FUIk9c24Qv25f92eUClMHBodRJp3
         d8fAaQ+Gbwm9HXPd/2rI2FENkEjv6UT85q12Gmi8ZGnOJvdh58q3K6n74mhcLPgB7uh/
         7k4TRGLnaSirbbD7dMo4s19vjGtMZFhCJIoplpPvffRDs+sEMAArD/dc9zIL53uNux/L
         2lLw==
X-Forwarded-Encrypted: i=1; AJvYcCV9SmmAdZytKa3GwZ3X8IGNwlbQqfIJBKlLg0J5WLZzlUV5MB5mYYBA+sOhm6X0OIfF8A6nOekAchiXKO6U@vger.kernel.org
X-Gm-Message-State: AOJu0YxJA4MVabXe2PJhufm/SQTXbNx4w4hGe7/2gF9SDS2m1glec/+L
	21Q0sQevI1nft810kYF3i2q/M3fwsQ/mqIq4o5XaH7YF86LAIzazAItgEMoOkBKIAS2azakzJad
	4COUcXQdRd2RoiJbuh7M77vbxObAjV2OkTKfkcb3ep0shY5wf3P0dezYoU6YOpLndpKwB
X-Gm-Gg: ASbGncuR14jNl2chqirbe9mF4ftf+IeUvdsswGquUapBUd7iIzTGVx++0kPdG1ceksc
	2HY2kuY5S8YySaeVnw/2FzZEktPNwFn1yXV24h0gitcBoGjWzfo5LenHI26n0ggw3FfB0MstD3W
	nyEJE91ZwcPqZKAvFbLpH8L3PS35pWwWjZDfKggB7rqGtFedD3M5zwigzCObnUDbLlFvMcTlgCw
	mXLtEXjBMmMbNumyc2G0aS9/FW0VN0QoLzdn6+PQlLfwZCoBzWXumwwikBmngSTJTkZUwwrqgT4
	pH7GKK7v34HtWVg99zPVbEH5bbJJwBbnSpbwBZKMxlmWS/jYGvvLfEZab1HNyA6DVEjzI9z0BZG
	G0x3xIdSFFc+TDDhURr4r2w==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr144441181cf.7.1756892068009;
        Wed, 03 Sep 2025 02:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFDTBcppto8XLOKJk5x/oor9svNZrww9ip34CnGvwDiPoUfu5cpSAuZRsl2sn0sMXTVgM2Iw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr144440971cf.7.1756892067585;
        Wed, 03 Sep 2025 02:34:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0ed6ffebsm1200591966b.32.2025.09.03.02.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:34:27 -0700 (PDT)
Message-ID: <666b4115-3e81-42c8-8519-f6d7b16c66df@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
 <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V-NBYLA97kHzR2o6of9Cl4zJlFuK7z9r
X-Proofpoint-ORIG-GUID: V-NBYLA97kHzR2o6of9Cl4zJlFuK7z9r
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b80ba5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=rH1WamYxNCqinqo8aXAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX45ANecX4m8Oz
 hoUh3fxhLe9oAK5k/SfmcdEuYU/8yjQFwKghU0v8LhwgRj7UkwRP0FvpWb6pE5Ig/sKDBh2tiJt
 U3Z9hXH5hCcd5fTx3bxx/HSh8wi/7bZZeDbhslgJgO2rtqz53Me/bAHampar2Idpxu04V0jmpnv
 wa4PbMl6PhNij6K6UP49YM5M3zYazF4hl1OMBPJfkHrjoEFzS0/nv/bbGVCd6k+zj1yA7g0w2C+
 EKTqJzkYCzco/ipZkD9c+DYBeJyzk4079vpKaZi7hekK9AMRLtre4yvnGDICs7RK3b3vKyclc9s
 qfuFIpOMMxFwS/fdO33U58dckRLF6EworwM2fZfakP/m8M6JahImns4dz3e0K8X6FoQmYkHV3HI
 2sCb8OU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 8/21/25 4:16 PM, Krzysztof Kozlowski wrote:
> VI Sense module in ADSP is responsible for feedback loop for measuring
> current and voltage of amplifiers, necessary for proper calibration of
> Speaker Protection algorightms.  Implement parsing
> MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
> as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +	uint32_t num_channels = mcfg->num_channels;

u32

[...]

> +		/*
> +		 * Map speakers into Vsense and then Isense of each channel.
> +		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
> +		 * [ 1, 2, 3, 4]

"[1"

Konrad

