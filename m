Return-Path: <linux-arm-msm+bounces-78496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9FC0004E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA151A085DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87849305045;
	Thu, 23 Oct 2025 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRs4eHh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1B7303A26
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209444; cv=none; b=kiQmIFa9iwtg4EGuJJtjUHzmoAQ338qdC4LPE0TKnqdeprQBwLEe7ncV5hTgddK+iCmy8To5YUQWRrobP6xE3BVeknR8LoscXPK1CKc9AzCZu4bHDwlK4OvJFUo/ZaKZoWc5u76HVFpvyAkOzpq1KXjY5ELBY2qBSx2CPwcB0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209444; c=relaxed/simple;
	bh=DcIZ+OIgf1s098RBDgUHrpmIMXeWvsYQYF0MMJfNfE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPxsgcw5NYaPchMRmD61Zf9rccIU+Nt2zDA4EHrpTN9SdQ5K74wAXz797V4uu4XeEkEXNhfkQnSURm6d1whM86QLToLng1sAkxaSnwR8nlYbDF9nhhmgBxG4eR9VXdPGrOcTRRrYEhRej0maulLTP/Y+d7ErWyDYX1hi0Da0ffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRs4eHh4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N78R41026360
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy1YqsOZVuqc53Zk/keuj33ot9pS+RsiO564Vjjfgec=; b=jRs4eHh4WOkXyJqw
	qmZN1s69k86zmAMUY3rZoSqjdgkmVxsDef6Ht200VOszBkfBcy0fZaYEOAxaPU/w
	Slozyp4HwEqVPOQ+FQa0Ejfd1dIVPL8KHpciOBHQmv2RRF/NT1+NPJI55r2dVjfn
	OdDEFAnNLzlIlvNuWYSX6TFzQ8/7/EkGI83LvTwqgrQSrRHvxF20twMj6cY+w5mY
	pauTXXzEeHzqUydeCWnMx+R+2dCPjkm/DHIJQ9xNtLsk7HjaNqxrYmUL5w2bOCeB
	DxFw7BMzf17lkr0WBFk2TX1z9l9HcKLI4y+d2aZ1LtGsUObnQNjFQ3a2a34j9Ujx
	RPxqYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfh28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:50:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28bd8b3fa67so6269715ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209441; x=1761814241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy1YqsOZVuqc53Zk/keuj33ot9pS+RsiO564Vjjfgec=;
        b=ISZN3/959pde0RZ5eh29+9ebGg8eI/wVrrziUY4cK159o/WN79akIGxXZy/uuL2l2f
         yVOmx2KKD11lOnNW4kqzGhktKLTJIy8YZk+Teij9uD1G7cCYnUscBRgLGsH/RWdWX8+U
         kZyCbvEOvyt24I382qziTZdr+QAP6JF/byFwgRuDpzDZbCe9uzmO6ZkDdiK+UVscvkZQ
         87MG+NarhDZ3AqDb0tzEg5NApkVayvFmvUviVHEhGV0L7e7FvAAn5jLoPFuDVzBRccUQ
         TVt7OLiNfooMWouL8+2qQvrpIpSWVGDN3AqOjGnP/oMQ7NHYxWf0kMegHB5QGP7qE8WB
         iA6g==
X-Forwarded-Encrypted: i=1; AJvYcCXAfccDjnjHNv+JSVBofnPbosAgS22laQaZTr5Rk2gouPEp3HOe02dhW4xfwpapu25kU4f6s0Jm8h1ZQdjo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxza7iFTr0t0glEHt/sW6dbLgy/TRlm0OeRq/Gxep7Knny0RpD8
	3yqkKXXg1kVVOuqb4JuFuEyGSCi4iUpEMVP8X/aJYflxOP33XXOgyNIyF21TRU+3jmuFshDX7xm
	hP7p27aqb4rXxfkzJhEKmTXGlFyeVrgVCfmzyZz2T8pigzzFWGSMP3F93OSI1Y4cxDJSK
X-Gm-Gg: ASbGncvNZ7fZ/wEjI0ReAwjrRiFAAXFo5isODeTsPDD5AHN16Mg9euf/B8rPN0qD/8m
	F/2kRkXZ2SbNNQEmn+3PL3KNkkN1N3z+sd+qL8tfbPVpmVkWUvMt71HkMnBqtyPUGXkoWCTjoXt
	fxfmP/A94SxeJw4+NFWN3pAn4/iioOo/VzP7epRjmE11huYI4gxKLl2pK3+mRWoNf5T7l7MbZLE
	MaAv/a0tdCMr4x0in+9X32dLlSFiB9QFaeeVAKCqGYxqAFwifVpr5tQsifZ9P4kGdcmCHDxh7ay
	kyLIV2Bnz12du7nZoZ9jVPyebuwVHwR9YASWUhK73jWVVyScdCfXbBQ7k8UtSqkbYUIHS+ar+2q
	6olUiz4RmqOc6wDWe7iyyY+XWT3hu7mQ=
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr274221965ad.9.1761209440907;
        Thu, 23 Oct 2025 01:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGidsCk6SAkbG2Drko6l/0sE1wrtY1HWZZpy5Z8oS/toxjjM0pNrE2O5NGTnLarM5LV8vXQPw==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr274221655ad.9.1761209440428;
        Thu, 23 Oct 2025 01:50:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f5de1sm16235145ad.87.2025.10.23.01.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:50:39 -0700 (PDT)
Message-ID: <8c75296f-2cd7-b0cb-f7ae-d433d2834bdd@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:20:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/6] media: iris: stop encoding PIPE value into fw_caps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
 <20251019-iris-sc7280-v4-3-ee6dcee6e741@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-3-ee6dcee6e741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VrGuy2vCIF0B-OqQ2iNtjpfzUIS9WCri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX0y/8ApaBVCkX
 TwPyjDudtKL++DU+guV3z6Df+OstFEDM/NKN3L4khiXuG1+lVPK+7QZfrwvpAuzmv8bsfeYOpTD
 v8W9D/a45g7MuLWeow6du1NF4B35cuGZEMnMQ8f+waqqKL8Zz9jlSesdXEn1/PNpDZGIp+Ohm0T
 jdY4sm2/j4S33WeopHKikAMqMdZRrEJIi6vMLzBUz71Oq2GvzyVIKSZH1uRAQRilSjowHBcnkF/
 /eTQlLfpo4R89Be8C6XdRVkrOWTeaTT3oMrenWUsF1m6k/UqHFIZJhoxYfzGxbZ0wysV/Vf7L+n
 iTsN0wsXB7p/1rlByrSYl9ssAofqnG2rX/H7dt/+JU6zprJhwOmq0PnwHIEcffxadB6rNOoOX7C
 4rXQYZYe1033aYwDvLc8HaURsTQSQQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9ec61 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SvJZJoMY8oi3fNviAK8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: VrGuy2vCIF0B-OqQ2iNtjpfzUIS9WCri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031



On 10/19/2025 1:26 PM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  3 +--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  3 +--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  3 +--
>  4 files changed, 16 insertions(+), 9 deletions(-)
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
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..03ce5c259c8491ae6882128795d18569baea6241 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -161,9 +161,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,

Do we still need min here?

Thanks,
Dikshita
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 87517361a1cf4b6fe53b8a1483188670df52c7e7..310c48958018ae724d01c87e7977096cd86e1bfd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -147,9 +147,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,
> -		.max = PIPE_2,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_2,
>  		.hfi_id = HFI_PROP_PIPE,
>  		.set = iris_set_pipe,
>  	},
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..9cb9ddc86ad73daf75383b3253e851394235093d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -21,9 +21,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,
> -		.max = PIPE_4,
> +		/* .max, .min and .value are set via platform data */
>  		.step_or_mask = 1,
> -		.value = PIPE_4,
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>  		.set = iris_set_pipe,
>  	},
> 

