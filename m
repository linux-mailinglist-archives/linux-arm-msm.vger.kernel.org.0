Return-Path: <linux-arm-msm+bounces-79339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 165EEC18984
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E21C351AC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1208330C63D;
	Wed, 29 Oct 2025 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKIEO51U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZArwAC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0F30C35E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761721938; cv=none; b=KP4tltwGRUvdkisq7pyx2pC+6AvvSRtdyMwSuAKkxKpG+PfjwQFjHmtnt0M4e8d7qsaDqR88s0tcnfo85f7ooT+gEwxq2R4hIlQjuFZh+FbQImTWADzXmiHnEOtIF2ZxUg9NEitTapnPnvbczf3M2XUjHc3f2Vdk3XGgt6EufmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761721938; c=relaxed/simple;
	bh=rwDdWmG6X90uRcqoXDRG+H+UNTWRXJ8T/OsBaM+E4jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3tBgR8Y0VMZd4I5hGpa9OlvrCjKbLcekRVUv/UCQ315x8XJpvvbIa2Me+QKsQXxk58UHV/xLbJKkU+6+/ArH4MOt4RYpVLUGUTXVYEeGYyYL+mTQJRc3o4n/SaO5AGUdYl5gZo/zux2bWBZxM3eG5xpYd96E5XIBm1R1bDNEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKIEO51U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZArwAC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uotS3720142
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4el9iPVgZB2aGFoUjGQilQhpdmAQpRU2juC/C9AUGPw=; b=MKIEO51UEyRA9iGf
	cW8gpeO7h24x5PIcc2L3L/6tla/mSjIhXQOCk3PKnVGUU5qh7//vmPpUenseY7ki
	ieWV9q8ZMrqN2S20cK7Tu0zrotxpM4HWJsgm5j8ykF+VxRNRjNKEqF+Soai0EcWG
	RlRF7CnPOY7noOjFSaxcPlmwHggXx2Q2ajgHzpI9eaDQYkDro6NsSEkYDyqQs4hF
	/2X+T4Xmsz4Ut022+tHC1vd26RWxgev9o6Pw3HT6TXxdgJ0KFx+M1fqk2K1dtciu
	r8yXu3XdiGHKjLGBstijXARv+2TDlaDPyUON22IaFsDhW/R+PerKI68nydfX74UQ
	WkpwLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a21k3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:12:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2924b3b9d47so61663995ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761721934; x=1762326734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4el9iPVgZB2aGFoUjGQilQhpdmAQpRU2juC/C9AUGPw=;
        b=kZArwAC8gPyrkhZA9L1onmXKiRS4ZiPUgFvVz/XBxrLMuKg7W/reBvduDZGKawGZnf
         St1RHIvfr18eF0j8Kky7FAe5kU6cL8LeVDlzXWqLd1nxc1L0zXk8mdXo09M5Oi3J4+ki
         KPHgOriwGeI/6TadbtGtBxz4l7By6gDAKUr3T3jIjDn/6gX7Onl3XI+U9v6kZLzgmQq+
         qJKaJmLcGtBFGHxkwfOt/AANaoi6QSdbg+382u1LNLyh6aeahEj2YVi8whLX/7RmZB66
         3+YTcy/N5sBJ0cOA4onLntwcwPHt7q9XoHOrblOYRrtK5EpWslxUgDvC8wnz2iAAoEEO
         /rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761721934; x=1762326734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4el9iPVgZB2aGFoUjGQilQhpdmAQpRU2juC/C9AUGPw=;
        b=ni8Bg+wd1ST4//UfiHABaxqujFznoyz8MjmVpPcgJyQTiJU0KT334+p5PPPCUPOuSg
         znDzf9Ty+LwRBUWSZ7p/HtmKZ3TPXFg+1YqDzDQoNIibdSrJvAitMC6Yz0CXlZgEtj/J
         C1YcizyVMClIcJAe/auHD5y5+1J9D+/V+fFbEuU8drN+pUvKhV4ZnrxZ5sunxCAuB4Pa
         l2kvz7S6kSWvnXJn+ANPuQzBnerIS45V8/bhzbhL67KKIVNYji3aE1e+MVwp9szdzWTo
         J8mp75F13qQnVMuj3derAecQtrXU1ZP9eAJzf+IRybTIeb8glADeKLyLOjP9ywtOG0jf
         6ysA==
X-Forwarded-Encrypted: i=1; AJvYcCUwM66NuKiAbGdzqRe+vRCKO2j1k1/RJ+g9GjM2z7EwBirpm1HIfXA/HBw3dPWzK+Z+el1RNnFGDes9Y9zD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywszn5gELwC8Ian91Ty7R+i4j2hsJOTtZPtRZKHpEbZj/MamC9X
	Hja/79lvlGZ426yf7TZ2sZiss/yDKV7l2H6cWALrZfdPX1EBNKFzhUjCjVTeZ7+C7cy0lH88rIa
	djOoO7LXLik0h1PynUfNQywaDCQKSBYpNaL2yA8nJL0WD2YYOLRl7EbD/yc1zPdOsZvES
X-Gm-Gg: ASbGncvN6VIW/vxWpITILGctQ54zMsUMkdSR0twdW/sSp2w3FsyGZLaRDyj1J4eyM+5
	rYIrbq/AUtRNQBCzXjidhUGZo711NTXGvSBwW+TG8u+Opuu9Hm2gT7DEXQ7hLW9MEGkN4uNS7nC
	NTnoezS73SV65EBkKrH2l4HOjomY2jJf57VRaPAVGvrLcz/N+VEoIHPfHggEHKLPcoT1Jlj/JDZ
	XlD1MsFcIeXtDFBs5UUm6HiL0ULh4Optu/O6oVAG3aE3PREPqoK0uGo86qSXvdCeRzEAULgx5uT
	a2Grmo0hDEjDjySfL1eBmG842oTWy8eMmrHVHPJlg3/SJmc1LmyG4bMJkcoxhso3P30LgbCniHG
	rqH+XWMqbROgku66C/7ltXqnsaUWqVgM=
X-Received: by 2002:a17:902:e382:b0:27d:6777:2833 with SMTP id d9443c01a7336-294deec92afmr15468675ad.47.1761721934322;
        Wed, 29 Oct 2025 00:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo4Qluv/4LPjKCYl6LkuhjN5aWgs2yWaDqP2nizkpIZtyYnzkFDuNxrskuDUwxbVD+zGItow==
X-Received: by 2002:a17:902:e382:b0:27d:6777:2833 with SMTP id d9443c01a7336-294deec92afmr15468425ad.47.1761721933736;
        Wed, 29 Oct 2025 00:12:13 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e3d2aasm143529375ad.88.2025.10.29.00.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:12:13 -0700 (PDT)
Message-ID: <87b3871d-88b3-2851-07ee-db8f2ca1d58f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 12:42:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/6] media: iris: stop encoding PIPE value into fw_caps
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-3-48b1ea9169f6@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-3-48b1ea9169f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1MSBTYWx0ZWRfXz3bAYgY28XkI
 1gNycDZ01s+Ns3sLjpo6YOlsszZ3oSA8DiFnpC7MFllGIkU+eZKfJxd5Vs44vox5kJWtuj3cgdG
 ZNEKQrBbBt/JxGYCmZG3nJNse3ofpmMbDkVOa7lHFavB61ppcBRM7C5nefZecA6L89Ik0YYKaL+
 dajsUBh47hr+tf5NZpSXR43jrqF5orF62oA5eQ5QdkZltD1zU5uWxA0vQXXc+U9cKIZODwZ5rfm
 qX5ef8TX8g8ytCydPHXQCRE/ljBPIQw6qEN73/VHGmneR4Qv1CGgdShXdyitSY+A8pVap/bH/vB
 M1sOcD8OlVJnrnklejFlSxUZuJTJqrulCIeBuI8Y1gnWLx0ehQL8KNVHx9zYHF0gb6nM7yCwP6Z
 VaRHH+g0lsBCE99wucveXnBazk/cjA==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901be4f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SvJZJoMY8oi3fNviAK8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: NmHLwfubgN4MLJnLyKvjRiy9hjUK0oxr
X-Proofpoint-ORIG-GUID: NmHLwfubgN4MLJnLyKvjRiy9hjUK0oxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290051



On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
>  		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>  		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
>  		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
>  		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
> +
> +		if (cap_id == PIPE) {
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].min =
> +				core->iris_platform_data->num_vpp_pipe;
> +			core->inst_fw_caps_dec[cap_id].max =
> +				core->iris_platform_data->num_vpp_pipe;
> +		} else {
> +			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> +			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		}

The same change would be needed for encoder as well.
Pls fix this.

Thanks,
Dikshita
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	},
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_2,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_2,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -20,10 +20,8 @@
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>  		.set = iris_set_pipe,
>  	},
> 

