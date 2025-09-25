Return-Path: <linux-arm-msm+bounces-75023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C3B9E2A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B886438294C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4833C221540;
	Thu, 25 Sep 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IbXvGQX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE887611E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790882; cv=none; b=ZeIdFaC1YfyZomGcvNxaAMvJL7LZhYxu1eZ+d/1FQSadNkCex5FwQOKAtaUa27DS6uHEJwPYmUkbHJsWcUbHTq4YPK/u/wvhzhtC/+dUDx3+3y1etH3auFXyQN1rcmGVW4zMRxRwRoxI0iS4HaD8xbA6IW9e6ynXVZEF0zuA+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790882; c=relaxed/simple;
	bh=EG/AvOrhHFN3S+Jj8IoZt9yabjIQcx+99yVd/FA4AFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlRwJYTN1Gh2mS3n3+lxjKyNol5dgMngQZGzwY3/0Nao0M59mPcKfwvJ+7zfVEbgDVSbc7JXcxo6d6vn7rQjKokG0aW9m/KAd/d4wJ1dGIp0tk5I829ty6ymqKn5bTnZmEJXoflmb9ctXZxm80LpYSefnp/LkoyKFPIF+2867i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbXvGQX8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONwXio001842
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nErVNH97ngZj0wOMSCyf5gNqUyVQBeaqG4w7YWWN0t8=; b=IbXvGQX8V1Ly1SAK
	QCenpoRmD7G9gW4DKCPihkJS/26uFuWTsY6DzaXaowj2MkajtHnPhckRXIhbNr8M
	ScsW56gf5klrc2IdAi5BPEjQbsM0bGkPUQzNrIca44ofaRXwmLdOgDBPgJNyaf+9
	rLPO/o0CrnXMYEhtxQ8IIZaC6eklBZsbwUZkLfJx+LXqRLMs4cV1FNKzvmuyZC0t
	Gfe+Agllrq+uKgiTpepP0eC4MH7JWZNP+kiKFr7sVdk6RSR2uEINPQbpbSqY4hkf
	WHFpFDqkOpzVFdo1qeSIhlLo+IvIJIRw/YQjtiZFa5U/gzU2P3EJWxgQnftXOL8r
	5UgDjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98qexm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:01:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8c35f814eso1457381cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790879; x=1759395679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nErVNH97ngZj0wOMSCyf5gNqUyVQBeaqG4w7YWWN0t8=;
        b=bSycHUoN8GGCOgr7qWR/WObshn8nvxy3yQVHkIFNX6HGK74zmHqxJXXadaB3WYUImb
         F5aXCSgBErglQ6CLBxh4FHWIdTd+hEE/WrUQbsyvICJ9JeBUJtToP1/beVde2u+BtAF7
         7IBQTOZQvZRXi99/uRru/sUBvjnfjnZ+XuN2aAT1+XrzeKnrmEHVEt3CN7AAkki8l0BK
         OUfEglcifLOxQo43umIr6/4yOHuQ4LAo/VHEDbtRSdQkNaIeCehvsUR+RzcyiwX2UrTF
         s0oIVpR3YrU7GycEYJbzIC+jXaPXryfjSf16pRNc/OU8qy9yXuLlXuou8vUxYmQy4Cy3
         0cJw==
X-Gm-Message-State: AOJu0Yzxn5FnkQZS+Ti9TW3Jzvk0VJudTx5jg4Uz7NGxFemBGFLcDda8
	2WB9T9M5QQud+F2wHnnheMFIrGMtdUnL+Ed1AuSDsVR5PuZRTAM7K9goxiVzwYEPCkxzdZGR+CL
	iyEFAmbkZjBGWwMpd66BAF2eETRQ1s2GXWbu4CkWi+Nskny5AtOEujX7aBfZuOxrJHHTf
X-Gm-Gg: ASbGnct87LG0aCPMQrcEQuf81aiEY6/ZE3/HSpYH47/MwTh9ElmTUCt4m8OH7gXEnU8
	LCiNbeyHxON2OxiYGc9PLuZlPDiZwcLAcWeXIaYWSpCTFOCCgG4Oy9+3gzPvizFKjqO76cXIPHp
	TBl6lPQcv8ZJpXrmkr9DJ54IDsxbXIIqXNWQN2oiO2quuhqY+DiHH5HjVG1Kp2/xewJxyH1aJw9
	k7gFUKP5SJHF7UxRshEn7O9mhUMT0nohdHpPkVDTkNWs7/oQ6MBF0MhPYGV/v5RpY4x9yn8quuT
	RcGzmsRTCHN3ARUSEpv5LjkpLRSy4Yt6KjmUXY6H60ZCYZabcIKPt3MvT84TEQqjrfLxeTDqS71
	Y5g1Cg1a9EymMkuAL+m/XLA==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr24551961cf.5.1758790878945;
        Thu, 25 Sep 2025 02:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIEEiaQAm71DQ+NEF1w75pObhl5w775CkYKjl3dcMT0LtvrfJMaGLfpVDOYjnPi8DQxbLxdw==
X-Received: by 2002:a05:622a:24a:b0:4d8:7b08:64b1 with SMTP id d75a77b69052e-4da488a2d68mr24551451cf.5.1758790878342;
        Thu, 25 Sep 2025 02:01:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7547sm122337066b.67.2025.09.25.02.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:01:17 -0700 (PDT)
Message-ID: <050b2cc8-ddbd-4a79-879e-4a2c9e7d95f0@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:01:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JSL75UrlrkwnUHzfXi8xIzVEzuLbQ0eK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX6vWK1J4o/aA8
 xZrvXRwxfa1t92/PhoyLb0dsT2qVS2ZxyU/LjKPjkNcNIcJgymJI3zAvpoCiIaOc9oKEiDd6hXB
 yOyk3++Dr3WuiVGTbYkoImbh8M9y5VIhuIiYIPFjJD4if6kiBIp3tQOtz38MkaTm+IVYEeraWHR
 bsN6hLRv6p3/17kRxg4NT5pM8m9x8WFg1FOcMvTGceUi2Ag36anuVavs217iT0y376eYs11Va7F
 UEBKNJXsFMbAoLoiuLHU1ug3gJp+Rm8yq7S5SwJVv5MeZy0O8yS2Dw0753Yzmac8AjvocwATW/8
 IBzAN6e33WHm+YUh2YrqXBssmLL4iCxyK0W/oGs9b8OrRDGABF37x4JzcVVhCnvxgG64HBV6+Jc
 rlSCbfAY
X-Proofpoint-ORIG-GUID: JSL75UrlrkwnUHzfXi8xIzVEzuLbQ0eK
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d504df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=i6MhSZCOMBc9aSuCptEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/25/25 1:14 AM, Vikash Garodia wrote:
> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
> configuration as array such that the multiple configuration can be
> managed per platform.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

[...]

> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> -					     cp_config->cp_size,
> -					     cp_config->cp_nonpixel_start,
> -					     cp_config->cp_nonpixel_size);
> -	if (ret) {
> -		dev_err(core->dev, "protect memory failed\n");
> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -		return ret;
> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +						     cp_config->cp_size,
> +						     cp_config->cp_nonpixel_start,
> +						     cp_config->cp_nonpixel_size);
> +		if (ret) {
> +			dev_err(core->dev, "protect memory failed\n");
> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			return ret;
> +		}
>  	}

Do we need to do any "un-protecting" when unrolling from an error?

Konrad

