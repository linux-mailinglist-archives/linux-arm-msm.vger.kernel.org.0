Return-Path: <linux-arm-msm+bounces-62850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF34AEBD6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 18:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3737D3B9152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DEA2EA72E;
	Fri, 27 Jun 2025 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK0B0BLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476172EA724
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041794; cv=none; b=U62LueFLHj5VfIdhMuKEN1mbISrlETTkPpO36lp8QEHv+2bLHb27NKB5Z+G5qZqpeZ9Ntcfl56HKYHQSXLE057lKPCCHEIAZuO3NWy8bUV411s+z0HZQiY/H5jRHeKxpcdNdcFHR4DRsk5uwnxPoirHWVFtkxZA1Bv9EL6Cz26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041794; c=relaxed/simple;
	bh=NrGK48K7TQeU1xseYcuZfl/9SljGlDumg0v1gAvyRpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCDAtqDO6vKNdJ6eE7A0Rzr3Zz/dza63oQRC/FTXJGW+BD0NhJAgPUYceTp6tUS7JsTSJnPV6v6WS+GJf/blE43F6tpnKOT5A2Hv/gpReC7PodLLABdI5AkuU55mK9B9mfG8w0sBuceQrbCAeppcwogu+gt0VXtSzKMlC4AvcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK0B0BLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC2t5o014317
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=; b=eK0B0BLsvANOWBLf
	r/vOxgOREIkIBPzBFZUhFxEJ4Qo6a6bYSpDwgKvKbA5vBk8orFvplOfypQ+yoLlp
	y9RSkeQkKY0qP7KNBPg7KFpEJfQyic1BkxFxYb5mGEQbB/7L0RSGzD/Zd8ayyngx
	CyM0xn5VH8rNtATrXg4iGMDWIR29SIyZ1oM9NzqcRWPJJK8E4Nw404N8q71QQKsC
	j4OV8a4pVyjCKWjQpomm7PbjOnJ1SOnm3g+tgG1CRhPeS6ZKFtOGXoyIdmgIueV7
	UkIaoZvqzKJLvy0nO1WH2TuHaz+/1Dy4duYKaaLgTOqGqGGwsEzqFIy6dAC/JpC1
	OTGd2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn18fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 16:29:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso47197285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 09:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041791; x=1751646591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shUYCckqGDoPHtxcGMdfXcvC7MVgYdxUw3VFoF/9ZMM=;
        b=WPRG6+fguR3+ca24oTOgixfal188j5nw56terwnueILiWZwbmJs8cU2fl9bu8XkRia
         vne/GTb136OFpFcpfgttLtj2XdxPcQvwkmJIYQZoTwxMduO459ViMf0maLiscjSivrvb
         6uWJG7jToLwmhuW3pFCE8Z5e3NtU7ThVlG7E3sIfAVvzRhygzbg+knORbDCyhYD6ZvXr
         KL4kGLtHcoDYcHuG/XgMBzv/xCadrg39LsAbrhWRjKc6edz+JXTFJTZr35giu8D89J8q
         4glRWrcTKqC0cQEQ5cZR5/Ev5/wfb69jV/uu02/gM7/2+n/U1mg0k/PcYOsetHKfX6yC
         54JA==
X-Forwarded-Encrypted: i=1; AJvYcCWDL64yjcvkB+SDFdY6FEKw2ZSNnvxiqe35fYgiuXo/x4fRMYB68Zd5YOoalzjKxx6hfC4FJhIv3iVkSkjQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZtc8clIKT3REC1JljscnrImUQY68yP4qFYkZIbMtvMagQUxj
	F4Oge/JXoyisqBEMS4HYVq1GY/18qyrK5AKTsj0aHglvfERH6x5G9DE6/tKU3EpH4wLiYKkH+sI
	oWqEblbhqJNsjmVkN2ocqrYZoXdZlB3g5iLpho24C/pLeX2gtjQRRN1NrgqyMFEhhGIeC
X-Gm-Gg: ASbGncvZRbScckM8wiqic8fKoqzt50NO14rqWxif4YgM9X/bZY9xpE2QimTzBqIZVBe
	LSupAYy5n1TWym1VsQ9y1ftWfNj+z9uwLTQvtpeLQD525SEGhj8rJQNUpKLX9ibr0+4LbGj647Z
	PwoaygtENEia3iqvhtQqD5JlNylPEVbC1OJs3EZKLSkjv3av4Jaah/VgSHUmRugenTGvvNbWiPv
	ahI8Ij0vkU9E9h1KAWnCPw+/sDFTh3c8cr/011Nvp9bvbgozvraQQttt0yV1l5MbQ5vl29CZ9KN
	IUI0aucKMeyqIr9HpKo/G0ctVCVYz6PKkcU1NPt9W2cnxfF34ktrHra8H378wZK3AvG3x+sbacq
	PJHQ=
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190527585a.6.1751041790738;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBijy/RXNIZA5o3Zj+gilVydMuaF00wJeZLo0nI0AAKKzcmDXHmPcvX9CZJiPxPp/SwW8UkA==
X-Received: by 2002:a05:620a:8c3:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d44392c133mr190524285a.6.1751041790172;
        Fri, 27 Jun 2025 09:29:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0160asm147363566b.89.2025.06.27.09.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:29:49 -0700 (PDT)
Message-ID: <e1fe370c-6435-4a84-b7d7-1ce4db4dbfea@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SDgGfp1V0LuS-9nR7u1gZZkM3r2qNcoX
X-Proofpoint-ORIG-GUID: SDgGfp1V0LuS-9nR7u1gZZkM3r2qNcoX
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685ec700 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wpCz0eZ45CY81w7ywFIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX4Ue6m4k7IRYb
 hAzp0nZtQx231ZaWqvrp2oj23ZsqILNBiN8SGfZwy7ip+gMtbXZfQb+oa6YSmmV3A6IxLP2PivG
 sqLjMvfcX1gsL7Sqvom6n7OSs2hJVTCfA+6mz9roH6aY+cpPVb5g0iLCn3Qk7OWDAYGZRWG/8/F
 vWvEV4dHo3+jFYQ6R03BBD6mXNjPuBpmpGs/cQl3esr6fqEuyJLigkxHwb+TQlaOZyAvcyx003K
 lfO7SBzQSpHk2BCOc1svwSNM1nfMJouUPCOztsu7TxyRLKSXSfCSr3YXX7Eu6oGqAgAjtnh7dU5
 vEm8FyY4kdSvuk8zdAK2pGnTXcZlMNpV1sAxv4hY4oH5oVVPoqGZULnu+OBJasUPYW4wq64aMXA
 C/7sujp3lxpRJXJvzgxTkLO8aElkT0L/zlA/tmkuJaPVOlkCAvQQgpZEThx9Nj9GSj7M0vte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=650 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270133

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

I think we can do the same with e.g.

sound/soc/sdw_utils/soc_sdw_rt_amp.c
281:            sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
292:            sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);


and make sdw_bus_type private again

Konrad

