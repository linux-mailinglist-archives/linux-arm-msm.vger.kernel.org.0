Return-Path: <linux-arm-msm+bounces-56244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0373EAA49AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD37C3B470B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE3C248F7D;
	Wed, 30 Apr 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiIz+EgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231321B9E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011925; cv=none; b=g1IDv16BE2gwbN6WYMw0zXtXbV2m1eZlgQzv8lvSG6p08XyQ10TB3uxO+07kmJIoBLKp8+dLbreSggFa7kM8VcmBsN9CAhyNrat4+UWlVWAzsarqP3BDCKK4y6PswB0fE/we7VPr8rHMnaY3K7afMJlOp/WMVYY8f+Mv8BQdB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011925; c=relaxed/simple;
	bh=uDbXMdLMY6+Z0MkTYq2usZkfsYZmZnQqQCBd2W1mE48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXbC/3+Q6B/Q/z8C3Ib0u/8rFJqDZwzs0A/cPJnMYOXjZSB0/oAn+Mxp8BIsT8Yvvduz3Lzb0wOX6/LeZc2A7FmdvQ5SWH4M2MzDvTCZ2URqTPY7ixfChZu6RN6v/B5l2spXWe8Q5Q82YFe1SRKO77mzWdhU1UaTFHmpU2phhog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiIz+EgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9XaXr005570
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 11:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ZFIsCqDMndsS+cxLg5we8+lkzN4XxRlgIxgsI40cLE=; b=SiIz+EgDyVjpF0AC
	FlvOSbq9aNS1XnVLTFUTHcfEW8hDhfPDutaknOg0l09KveVXOk8tkGJ98IJQh4gf
	pfoOuPQD+YbkYgVYPZcVOzjGiJkpt5RLrs/SgauEQqem1AqD+HLiB3eccAGdZKDj
	xKc3ZxURike72+VnX8U27MMt1dpf81qklZirM5eoyTiPYsjVJoNVB+0IYvZBL5r0
	jxNGc3d2U6ZaVbRTivMulmvdMo/02jg8WfyBqY920ddo0HfU9J0HTtX6QxDp6Wai
	C6b5lPSOLrvzJS8SKcg7e4LU/5q4ocjMkmCFltmToWpm9eOEn076TwfPNBorhf+3
	fwoQ4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u89wu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 11:18:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso14997631cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 04:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011921; x=1746616721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZFIsCqDMndsS+cxLg5we8+lkzN4XxRlgIxgsI40cLE=;
        b=AotU5w5lwmNlEXBJ5Bn+ewDzmjpWumbUUpXWeAu5O7OPOQ3Jay7QvEHBenjkGVmqkq
         f2SHkMnEP6GkJopxg7P4IILCJEFuysWemi0Gxat2zntoT5rvWdaBZIkY2+9dpEsXo7FT
         q+wm9/LmE3hwQjb/HMY3taNhu7sUKmqYZkTQJZpyRoHGIUCKyB5ixuuCTIVz/OVhlhdh
         Z+WjfZIJYPbc6QXR+Qg/yKqEOWZH09ogQffN5DHkBDtN7utHKx+8pla3Q+yH9wuCXQ86
         sqahpB2/R51JQ+dkTDS9qGJjIOcAJp2XJmlpWuXXUrkJ3pWuVVllQj3rNkMdmOCVcfOF
         Ad+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSvQvJ20QMcqlBfdso2NAECStJ8uP2o+pCXqRlQtMPQytWogTg//AHtod/S4RyMWUzN7Cz9ded+BoAZ6LC@vger.kernel.org
X-Gm-Message-State: AOJu0YyrvvBiL2V1XVhKR51I4clNCEAkbv7UbZ5da3io5mbJYanKEf6D
	9G2tP1+tyVJnWPOWYqaAiZncpFmD/lxG4+G65WW5BPmUMF/3lo/+gUZt5Ypa+rAXWkQQ5PSV0Ra
	pypzG6C9zxHJQpcTijzCwQmFtiOtxQ5kiRASzonm13Gp6GyLWpFA7qXdPp84bNfzT
X-Gm-Gg: ASbGncuM79arOt3ukLHaAsXwVNyVSa2jQQQ8uhIaQVieM0a37DlKPpUxegi6drjJTm1
	p4Lip5rLSb6Gb/4wmbM4UT8S6x6Sk1yxQfdDaQD5eBV+/znaaFdinTVA79JLNhT+SiSDsK66IVg
	GGNMKBom0X3Mpi9nZGVnilWWbYLCqNyOflYJF16qTY4buOECSMPPfW1CXbDbkV0v98l3mfefod6
	7p29J2gv1PQ1UXZGOoPv6GTUNi6vk6KB5SwDGLUmLrENsbeqxtfvIrhkL0Ge5nZE2zASZB8Cu75
	de6Ss79J0xH1BqQtFFmwDkzsZPxILi0zaVpwSpjetFORaNom7/JUcvX4m+WsH5QiHrc=
X-Received: by 2002:a05:622a:1b88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-489e5efee93mr11201591cf.10.1746011920917;
        Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYI8AK0llTsxREeTqIZc4iujbSMfKc70TN9di8lFbZ1oHX31huO3bZUjC9mtgoH3qMOFI7aQ==
X-Received: by 2002:a05:622a:1b88:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-489e5efee93mr11201471cf.10.1746011920593;
        Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa910sm903756866b.113.2025.04.30.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Message-ID: <3e4e628a-740c-4b80-b927-014a635eeeba@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 13:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
References: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68120712 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5xDEUdhm2TPt1CDrq1UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tTqrqU8VHEkHcPMEwatBMRPURHBXhdRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4MCBTYWx0ZWRfXz3wkizb//Ohy v3p1O16MQrMlMF2k+IG1B+Y2mEZltEQxgryOw9SafR3xxCTcGKPDnsS2HWZ3/JheWXvXTvc+6Gq IO4norNsp30PHEZGu0U8CIqg3DumzuuwCF8G00ZG2XXEeKiy4nx7OQLSEH/oetJRIpuC/WB3l/v
 kK4NDLzTZndjoIQldyjQGTUVQIwFZxk/nOybD9qTgIu5ZHrI4PB8Eb1xZ7zpZdo1AfSKk87C5Ir e/h0f6sVS1V13avxyeCn+LuIQDVDO/L+SD584POZy4zNB6neM+VER+9iU7pYtttWS2r//bL6BqW XDcmQaB8NXf1HAs/qPjkevbOwcA7WAr4aDcvYGWO8XRjRJMvzL+hvNMnTwZ+nmoe663WcBIUuTp
 mXAl8sXSgaeafvRIb6006PhSSkUUihxqEFC8AziDra1sLKixnWplldRXVsrWgy64m/nn5fbR
X-Proofpoint-ORIG-GUID: tTqrqU8VHEkHcPMEwatBMRPURHBXhdRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300080

On 4/29/25 10:33 AM, Stephan Gerhold wrote:
> There is a small chance that the GPU is already hot during boot. In that
> case, the call to of_devfreq_cooling_register() will immediately try to
> apply devfreq cooling, as seen in the following crash:
> 
>   Unable to handle kernel paging request at virtual address 0000000000014110
>   pc : a6xx_gpu_busy+0x1c/0x58 [msm]
>   lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
>   Call trace:
>    a6xx_gpu_busy+0x1c/0x58 [msm] (P)
>    devfreq_simple_ondemand_func+0x3c/0x150
>    devfreq_update_target+0x44/0xd8
>    qos_max_notifier_call+0x30/0x84
>    blocking_notifier_call_chain+0x6c/0xa0
>    pm_qos_update_target+0xd0/0x110
>    freq_qos_apply+0x3c/0x74
>    apply_constraint+0x88/0x148
>    __dev_pm_qos_update_request+0x7c/0xcc
>    dev_pm_qos_update_request+0x38/0x5c
>    devfreq_cooling_set_cur_state+0x98/0xf0
>    __thermal_cdev_update+0x64/0xb4
>    thermal_cdev_update+0x4c/0x58
>    step_wise_manage+0x1f0/0x318
>    __thermal_zone_device_update+0x278/0x424
>    __thermal_cooling_device_register+0x2bc/0x308
>    thermal_of_cooling_device_register+0x10/0x1c
>    of_devfreq_cooling_register_power+0x240/0x2bc
>    of_devfreq_cooling_register+0x14/0x20
>    msm_devfreq_init+0xc4/0x1a0 [msm]
>    msm_gpu_init+0x304/0x574 [msm]
>    adreno_gpu_init+0x1c4/0x2e0 [msm]
>    a6xx_gpu_init+0x5c8/0x9c8 [msm]
>    adreno_bind+0x2a8/0x33c [msm]
>    ...
> 
> At this point we haven't initialized the GMU at all yet, so we cannot read
> the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed before
> in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
> 6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), but
> unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
> accordingly. This means the df->suspended flag does not match the actual
> devfreq state after initialization and msm_devfreq_get_dev_status() will
> end up accessing GMU registers, causing the crash.
> 
> Fix this by setting df->suspended correctly during initialization.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

