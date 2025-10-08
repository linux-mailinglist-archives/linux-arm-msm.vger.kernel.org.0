Return-Path: <linux-arm-msm+bounces-76319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B94BC3BFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87C004F72F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A3D2F3608;
	Wed,  8 Oct 2025 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co+kXAzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942862F1FC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910636; cv=none; b=gO9pf0vwnX+phU/N5jf4ejBQskLup97d24oPRotQlt6NWnKv3z5H5DT5ALDYAHAhuz7kfr12YE7e24fPAux/8Z7OhlmajZ9q85AO1PiX9Eq8xcF6YQglL+Ygs3ooiNDm9/lVPLQsq9GvoozXZk4AfImyrhGGecW3cpOCum5HEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910636; c=relaxed/simple;
	bh=cZ+CGhMJyte1AFBapr1UWxlFCeVreG3WjH6UVO2Zk+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwKtl64008GJ6lQseh4PgM0Fzxhr5ginYX5tub0VypOZ+zeqQANNQKY/BYMvgz8uXcfe5cY+eGb67Iy4dk2XRJ1TUYngwqS6ff9wfrzMPshR9ZLKcxBzNE302Flg38S8xUUYDn75NCXGAXOYIWg0YzwZfYmUt3M18QAc9E5XaM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co+kXAzV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987ar0v024080
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLFhrNT3xxkAGIPFcKIeeLwCuF2mI7yMFZU7xOawpq0=; b=co+kXAzVc1383Au7
	S9U3iiGAu8z8puHXRJJyLG5xU4KxQNk2cv4DrGPReFIu+8QXQbY3Q3wZXeJd5vvE
	ZWMGNpQBzta/vQF640X989SdXXgrtk2G0gXgIkl3zAmb1mZdkCMqlT3ZnjY8oV4J
	x+6Fmnct8czsA2W5j///VtR6OLo9rY7Zin+jXUNnrxV3OesbbmObddGFDeu1vLFC
	WWZtAjviQfukjIN1CMaMuEL6X0cxYR56oz6VhtGxj8Ov0/zztJ490L0LBW/zVpGe
	0PeOlfQ8za9uJpsleW2FG75RLWVysXGhu4qrhazfVUfUoDrx/g7BG57pY71hkPzY
	lr8u0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgss8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:03:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-879e3de728aso151177885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910632; x=1760515432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLFhrNT3xxkAGIPFcKIeeLwCuF2mI7yMFZU7xOawpq0=;
        b=G2g+xTdFoXagaxslrz6kv9MxjoZ8Zh9xHoJOxMllV1OXiuMSk1TjacvurHcoeSIGuX
         ow7UaGFyPrztQOlvHY19gTDD8IfSR2kY77CWG4APSyzRTfXBa63I0lfb8Z/UBrOsFaw7
         W59cgId+TexkBDHpg4+G8YUmcS7nDrNIBPXEvh2qc0+F0FeUukZD//3/ANiyuRVme8e7
         Un2L1Ej/IhEDQtGqOCeatEWPAJLO0Hv7UmCDkk4JpmWyP9BK4V66m2/qovmlbFGt7EXL
         kJZFN3QC9fOUqHG9+mJseqcENZpL+DfkrWQdak4UBt7nHti8MuQnUculCtkv0eHy7KnS
         6P3A==
X-Forwarded-Encrypted: i=1; AJvYcCX8vh16NtgJNDIAtmkH2KKHh+4ixHm3x47KMxKNta95LdHZAX0Hy53dsdWJ+KJPUtgwmJ85n2yUMicto0yI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8u3vBgjCzi086/4qndhS4SFlunhfG+v+HsqC+2Lxz++dkfKUn
	3EFlV0ujdB7q7ZwrNdnZdsDlPpbGgc/l/652K1kQ2LpSI+Px1FRSpXf9+oqCsZdbt9JXdDmVSoe
	nbCc1CCBkFC6IYuLpbjbrc7Y9WMdpf8ZyliilipZHo2OHi6+l4Y5WT7Ng5B0qphhXrLNB
X-Gm-Gg: ASbGncuspNJZQlvWNp4j0MQMxH7ZtfHFvW4k0tSPMuBAOWfiO/50PFNkk94DrJSW39E
	4v2XMjsNu1XIycxVTUStQ2kF+6ypi7lrDi0z1dswQDBkoGsVLYyVhHYwE7sAOUlSPHcw7+1Ny5y
	kytll1FlhKkNkHI5y+wiyM/7FWHid0U4ki9UyQBLE1I9fSE7uu/azqg74LA/s82+F/u3ZPHm7fr
	h/dyT7pt6EtqUCAuvMTXkgg2FLGb1ZnDWsINwS2VrAsM1J5ArxbuVReV2REOI9IoC3bB7i1HlBq
	MVaBSyiAWSGQ65FhE/7csmolwlLPZ2PbVIDlPYXs5NwX5TIry8zxNg0l5BdkA37qslwR/9PGw6+
	PILEaF8d3soZAJPiDNh25MR8n1JU=
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr250960285a.8.1759910631535;
        Wed, 08 Oct 2025 01:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUen+p7TkoJJtINpFELadPj734JpkHmGQl5lhM+jJkqG23scWPoS+3uXq/eIFHltmLRIhShw==
X-Received: by 2002:a05:620a:269a:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-883541153abmr250958785a.8.1759910631027;
        Wed, 08 Oct 2025 01:03:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a786sm1649182766b.46.2025.10.08.01.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:03:50 -0700 (PDT)
Message-ID: <d9b6ed42-d70f-46d2-a0c6-a98df4b46607@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:03:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-4-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX+Pnbr7fCCAN0
 nbHAn0YQ21peWTvhksi2/r+OvDQVMZsW530WfmWBswTeWBaBcGITVlbL0K8L9GVaValKHsGuKcX
 ABhWG6NOVKeI96qola6AFzleNVHbtwLGVDSZWqwUG6vZGUhzkeF++EHxZZEPz6H7rTsbOTupeRZ
 d99w3vh9ZEMW2fEYGPsDmQIig5LTmYn0A3PZ0p2hLtj3y32ClqyiR+QFMCETBcJXncl6Lg1w6ta
 q/47q/BCnSWgvG0C7ae1RpGH7EAZil8gZfRHzSAsWWGy/JspENIKzfKAAXnwfhDmT9A3rGQPF48
 TxntJiVwgsNdI6LzX6qghDE5BqRWqsWVO1GNoroElTXsocvHmcenTfh6DzMNr/Lpz3+GGmn3HlP
 LZGBEHahPpT8y/KVUbTf49dX8mglGg==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e61ae8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=yRfd9HfqWQK8yE8Ax7UA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pXMcRuBgjDyFJJSlNx0BymovgRNtSA4U
X-Proofpoint-ORIG-GUID: pXMcRuBgjDyFJJSlNx0BymovgRNtSA4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].idx = i;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		if (cap_id == PIPE)
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +		else
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;

I really hope this if-else won't grow in the future

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

