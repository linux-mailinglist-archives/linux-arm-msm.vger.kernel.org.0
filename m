Return-Path: <linux-arm-msm+bounces-77565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF15BE3021
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDE5F1A63F18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C132E5D32;
	Thu, 16 Oct 2025 11:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XydH7KLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EAF30BBA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760612797; cv=none; b=kRPNCEHdgHWOaHygwWOKFcbn61adiFDApLCBeKdVpesXUuXER6HeqXxymulyBwOBbQh8Il4XK6Lj8OEW8pydWkeLGQAhQe0wyokvN8vOZa6UtDWc/u1OrC4p17tOGabS4jK0/R46FlIqZXa8VIXsxyGRISiPl776+91SwJDkuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760612797; c=relaxed/simple;
	bh=iI6eQ4euIxUTVZlbEdBV/FiJUARLVqwn8IEP/AlBu6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sa+4M+RCn0+IWV2DQq/roBKNw1SYduGkeFeKVNaxLlOIhXeSvnce5PlxdO+tg8zDJHhdbEMuOHQwJfkQIcCzjO/D72Spk9yrurl6ZKIpgYQUKdJYVG7ZirsQO5G001LxPM2gzzkPoN5mVajXm3E3bf1qW/S5wjr1MYP4f0HqzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XydH7KLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G79HEJ004078
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NX/KLfr6t5fxcfNm5GK/I/J8ryOwP+n8K6WCLUYwtQ=; b=XydH7KLNQXS3z9pE
	oNVUd6au1qgh8Z+8G1nxvAex6w2gdkOQtWxRP12mXABHT2Qyf0cDLFSVzoFsgl2P
	R6Tp4q5x2Li3LZlas6FUhGeCNZAiM9oEtShv1GEaRRxHQ6jQwRchPYzsM7CC/0cN
	4u8nDz9UXZ+s3c9Q8IdDGpcVwOofqxNYOht5F2i26300mqEp6IcD4g3CpcQRrNMN
	hMoCkXDuA/lbMSD8tsWwEIfx+cNduJ/wXF9Dpn1LSVXoNy55D8uE2LfOzU/JZpD5
	GJpGscRlsqqUcndUCXdFmVJ/1PGDf2WOqLwykS6OmnyCXrO5Atw/qp3VdEwLywBN
	OG3LyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg7wd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:06:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso9216645ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 04:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760612795; x=1761217595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NX/KLfr6t5fxcfNm5GK/I/J8ryOwP+n8K6WCLUYwtQ=;
        b=wmzdbq06vMQF7wWK7v9LoL6OcYH7HZzAjqerwVfepgbxh2w/iXifiW2w3Zpu7GLu31
         bGpo2JwN5GVaK77iyQQ66BkMF863vKT4ZhPm6Mtf9m7BfTqTE0ojqHqxFKbSxo2qX1a1
         POaNDdOwAwbDwVrh1lSOYyd+NGEU607abuwSov4Zrn3w6QhFaLV71EGWGM02Jg1gvGDn
         iaqSHRtiUTndOsMiLnawDGp2ieVvW/WttyZAFwbU5IOvipeD156fmpFfoWhu2Hv7crfn
         mSMWIjL/PchN/88k9bVtKhMN3u9HnBRK2xhmM+Eug66/QzXwkG5p3T09/Inz32LgT3E7
         RJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVXpTpjWoubyiB98NBRDGgwia59wlGzyWkVSVHInJmQn11E/NneNFRr3dLvMHp9yJiPfFQnAEQ55yPeXrBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25pa3l5a+ExwJNdmQFbkaVr3mHqmM1+yb2odZUb2xuzBJq73o
	SzXBPTiiDixxh+84dN2cLfw8cAEjrQ9YM6reXO2eXGIuGAC0ZclEuns+csUfUUdn5nmb+El+y/v
	F9dLnyEX58JRj28mt/h2mH7v0Cod/KZG1M7wP9usrt6oa3GncSOQ9sHybu9GKGP71eze1
X-Gm-Gg: ASbGncu4pcwoNwgT7t0kWl/WmVajyvJ4n6hc+jbsWfJyY7xCTKF/5k47mezHChRdkmy
	ngTjmZCL5A77W7iTIaWjNwKemwwmLrEkx42JQ5PtO2mX62RPGAcT1xNEhDRkcoreP/866EOyYsV
	JYxDCYtzp7+Oc4Yx3nYUMHhJjc9pBfqVo5rtBjgSqFX6ayT0IZAyshRH3DUDvOZs3Dc8lWtjGDM
	kPqRqxnSoKFJw2W4tu4XX+UzdIppQyA+EtZRTMsSyS/ygMKZ6zji9Vua7JHj3Av8FkSX/qjhUX1
	TLuecPyiAFDyGLN1X3Afx9cykX7v6siFpXqW79lwXysLnURbEHPs85fqVww9y+8tTpA1uIz0Wq2
	T5s9iibuJ+1/uu9YKph3PoortNhYG9jM=
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr345507395ad.22.1760612794642;
        Thu, 16 Oct 2025 04:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/f/UbBVTHNDnGQhsb4+5hS3Sdx511yYCmnD+b86Jeb5QRzKzVrfCSD7m5ae31hSWsHCva3Q==
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr345507005ad.22.1760612794142;
        Thu, 16 Oct 2025 04:06:34 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099b0249asm26376145ad.109.2025.10.16.04.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 04:06:33 -0700 (PDT)
Message-ID: <d2e0935c-4794-e5de-4baf-7ac7c323eca9@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] media: qcom: iris: Add sanity check for stop streaming
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX2PpOxrvd8tbH
 QVOivvE7K6+uzOBXVGOYGU214gnKbqJWZbE7z36Iy0qwNr+B96oIqqomeRd7qkpL8x/kzXa+HlT
 abssh8eXf0Eh7MpmFnzMbsyCorEAhMzBfjoPJahK8aTYyHNXwcAYyuL782l2Ky8vjO2Z3OHxVTE
 L+W87EY4UXqlwVGmNOYK8HqAZb33F1UqUs9yYaM1hCO7GhHp2/BbQTMmx/lsXwfCvc5S07ga2eJ
 c1hHJIheFXSNYv38REEt8h2rxvQ0PDBWz/6EbyVYge08mmjqJ6oGWZcyc0u4u9GzMNt0Uaq7hhR
 y9Ks2AYZKbmPAAnRga6UKMr2vSSYs4viJt6dWYGyXjQ+5nGXZdY9KgMFZQTgNxZvNEOq11hRX/x
 v97o0mOn6aeFPAiDeL/PuqpD8LY5Rg==
X-Proofpoint-GUID: 5ayGBqrEokXdDspMvTbqZhv4yIfSOcsD
X-Proofpoint-ORIG-GUID: 5ayGBqrEokXdDspMvTbqZhv4yIfSOcsD
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68f0d1bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8kNo1vfqJQJ2e38LGaYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025



On 10/16/2025 12:55 PM, Wangao Wang wrote:
> Add sanity check in iris_vb2_stop_streaming. If inst->state is
> already IRIS_INST_ERROR, we should skip the stream_off operation
> because it would still send packets to the firmware.
> 
> In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
> and session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 139b821f7952..c1647fb4f0cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,16 +231,20 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>  		return;
>  
>  	mutex_lock(&inst->lock);
> +	if (inst->state == IRIS_INST_ERROR) {
> +		ret = -EBUSY;

ret is only used to trigger a state change to ERROR in this void API. Since
the instance is already in ERROR state, assigning ret = -EBUSY is redundant
and has no functional impact.

Thanks,
Dikshita
> +		goto error;
> +	}
>  
>  	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>  	    !V4L2_TYPE_IS_CAPTURE(q->type))
> -		goto exit;
> +		goto error;
>  
>  	ret = iris_session_streamoff(inst, q->type);
>  	if (ret)
> -		goto exit;
> +		goto error;
>  
> -exit:
> +error:
>  	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>  	if (ret)
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);

