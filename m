Return-Path: <linux-arm-msm+bounces-81569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD86C56AD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D378D3B899E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E50B2DEA68;
	Thu, 13 Nov 2025 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UA1XHHHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AF1/bz7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C92D63E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026982; cv=none; b=BZHPdHT0vvbl66pWhzMNCxiy+3C+7O4ONtXy4WNRqyYBUP/QSB8HOrNCiMiIFeumvAUhogsNDJ3GKo1mPd3HqO8hROxMv+nW5cK5ecUCGH/Vdy3Nj4wZyAYdOv1ji4lS3nB2nVPEY4CHmsRtgS54pRuYJD3WtNNjsDD8DHFtg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026982; c=relaxed/simple;
	bh=8iAtj5DbgY4AaZ2Ot7jJeIbmNyqP+z+6PwnXeSkuUFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNnfqx5rsEK4FjuGWBOkCZhySClQ0XV0Zw/0fp6nVY9w2IPqWfbJx84MOw0cxnpO/YKQ1TEbIRZ4BrfiEI7vpyRHlpEQBTiW5cZgXXSbDG8SHwvOiz9qmUXB+a0sCqmOkhqMhMmXZ6P/65v4+nBv9qoOYVpGhNsle1e/XsrkBOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UA1XHHHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AF1/bz7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD6hjEC3801856
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=; b=UA1XHHHd06fGc5oj
	UDE+8yWJZUDMpUakkDIBVnZ0jGSLIw1/LrjbR4g9fysnT0ovoqWOW3Ndpc7EpCbb
	HGdAgKMXxXnmD+Cc2QrNEqE+ucptu0uYQ0uHQ1xWmVTsw2TL6sAFykqfnhw2w9T+
	KjDzxSIR32k7vnh1wz1Rlhi5UvNBFaYzkMed/JBioNpx3Tf3bq6XtX3O925XHiML
	7Lm4wL6pT6JfytKQ5RepsV03igwJVXDuZGar3glhxLxtkhNoBYuSFs8VMSF3BTxJ
	yadKRTeBB63jFiY3i/ojJyr1bMOmIm6W8Kvmkf7oRVSYdY8akmubSoVY/UdiKZYN
	L06QZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam8j5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:42:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74694decso1285331cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026979; x=1763631779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
        b=AF1/bz7KYX+tPY0k+53qUauVVUXvzKrBqBBD/wAPTZAPSWIHLTqYVeLoUDJEmXhS6j
         jFGXAKKQ23ojILhsAj4D7hiJgnZvOq0bPQY5yN/Ee+2EZFPohTLyF/VM6iKMCvVotnVL
         jZIozNeYNGa6OrkvIn/F9KWsZ70kwsRfnMB8eLF9HaF7+0nC4AITAeXjWSKj0R88sj9/
         76j+/3KsADwJfLpqwXyXEGAqarMwLvoxRiHNvfxTRnUGUlz2WOGkFRmd1KwqlN4GviNR
         q6TEw0+L56kTLWMo7FZWa/5GcYZZqjiaxFP3XkdVDz/l6Uo7OrMto13Tse8wFfYlufpC
         mWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026979; x=1763631779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
        b=Qxv9u+X+uw8JvphPTq86kW9cjQ7TBkWvfiXDnrRiR8h6Meo6AbJr+Go2FgMWXJFHG5
         ckacA7jayZdRuLZED/I+N7vB403hbf434KQXHqhaId5DP/49R7vaZZs3lQKmyOv91W09
         HigcOpqM4ZNIRViOpX3l74Zl7c1SPTB1xpgFVYm5T0HJ0vJdsRsfwD6o+/7xrLiPWeD3
         NLaEZtR86uiToQaW4rpSb7BIdOyuDnKWFuOajoSQcTcej94JELzxzDkCYv2Jrz2brta3
         XQZUe7yCb/HXQpUpEsL6QFe3vi1n9XHj/W1WS0MGU3X+xTUeUjyCwMKhcFkj6BLdLUxd
         78Ig==
X-Gm-Message-State: AOJu0YxSbeQSKCrlIbo/tSfSDHLC4wo7di8ZczWElCcA8mWFRoPcBqxD
	dHLV59Uifku3AgoKx3SJP5eUeZyTITWzwgZXTodUNv0OK7+krhQZa8MADYsVRxmACqOyne6gTfU
	p9oIKB5tMdEcOUFoP+h6D6EaCA3TwDs32doWJASzzSVdo5ZBz7Ct3WtbnFNjZ3LT7e6G+
X-Gm-Gg: ASbGncsUNK68KnfYxj2O8uHLE7T4jAGA9cYrAWXNA8oToeM/VAwcN2WrfM09+/MAo9y
	vveFtDN+1Ea0hfh5zv4CR40AswKN/qb6/nzy6PW6+H9YOiuQ+cK4GaqZBFzYvxfpsgM3Sdk1zwl
	mHWQA0uRYhZeaPTCAqqAltlRw3JZkZ7viSadEuaMEThQz4Wi83ETzDhVmUHgVpHyL1/2YXX5oCi
	0vzeDMPjg4qpt5JIRNcQcl++yOf6z0HM8b1wRxhPjeJoXMCwjsdSggAWgVNKgpHWDEmx/iQiO2F
	g4P/avbcBi7FrrsotJHdZGCYvuJcRbyd9ZwJsbyxdK1P0zRmBD0z+BKbKISCtTvq+h+VQiJL/fR
	jJ0fLtEUyimVgJqyQ+/OG378R3KJ4wgKaDFa/ZcjPo8PGHBWJpqyhy9TD
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id d75a77b69052e-4ede2845978mr28815881cf.9.1763026978824;
        Thu, 13 Nov 2025 01:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvKWw3IiL7wkrQy/+jmFVdR2o6TRc+eiHUU5enpTNDh4j+/qHBb66cMr9ZJ4pw+AV310uIfA==
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id d75a77b69052e-4ede2845978mr28815661cf.9.1763026978200;
        Thu, 13 Nov 2025 01:42:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac667sm124168766b.58.2025.11.13.01.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:42:57 -0800 (PST)
Message-ID: <fee56a54-5da0-47a4-b8e3-7ec01e2a1559@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] drm/msm/a6xx: Share dependency vote table with
 GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3MCBTYWx0ZWRfX6d4QnPpjP0Nm
 Jrp81cjZyvGLdLboI68KPwyK4kFhWFHrSF13Vuaj5argRKXhJWyK8KpB5gDsyw7cPqG/yub56ea
 8I/NwpWWMHYrOzvjWZt7/MVv2UTLzxBbREUJcxFbr0GoVGZn6B8nMCYvSpDZ3L/qaDkc8+m7UCX
 Mv3mSdMj0Bt8rZlIpq41ItJGSktQHr/HJLU1rAgbJHOMZx6RQebrB+eCTnPulCKQtaYQ9efBA52
 40irhOEVDlABVj94d8Cncp3aiprMtKuLJGlJ/OvLqLvDO6L0baPQEi8h9ZMqKbI2bDa4zkS+TZU
 9+Pvccy/56aPO9wOQcRPMc8ymAmp3NoOjY5+SicMjpxWDdYg8kbNB5VCZzoLlCM6N9sLfsJTRnl
 1d74jzB+r3FXBul6SAMRSsBO1jGCuA==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915a823 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DqcpYa4PS6cT72Y9dlEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hNVnxjLm53DworwY8GHfqQ8sAgocMgxh
X-Proofpoint-GUID: hNVnxjLm53DworwY8GHfqQ8sAgocMgxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130070

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x GMU firmwares expect a separate vote table which describes the
> relationship between the Gx rail and MxA rail (and possibly Cx rail).
> Create this new vote table and implement the new HFI message which
> allows passing vote tables to send this data to GMU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8597d7adf2f7..396da035cbe8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1591,6 +1591,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>  	return 0;
>  }
>  
> +static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
> +		unsigned long *freqs, int freqs_count)

Checkpatch should be grumpy about indentation here

[...]

> +	/* Construct a vote for rest of the corners */
> +	for (int i = 1; i < freqs_count; i++) {
> +		u8 j, index = 0;
> +		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);

nit: reverse-Christmas-tree would be nice here

> +
> +		/* Get the primary index that matches the arc level */
> +		for (j = 0; j < count; j++) {
> +			if (mx[j] >= level) {
> +				index = j;
> +				break;
> +			}
> +		}
> +
> +		if (j == count) {
> +			DRM_DEV_ERROR(dev,
> +				      "Mx Level %u not found in the RPMh list\n",
> +				      level);
> +			DRM_DEV_ERROR(dev, "Available levels:\n");
> +			for (j = 0; j < count; j++)
> +				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
> +
> +			return -EINVAL;
> +		}
> +
> +		/* Construct the vote */
> +		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);

FIELD_PREP() + GENMASK, please

[...]

> +static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
> +{
> +	unsigned int num_gx_votes = 3, num_cx_votes = 2;
> +	struct a6xx_hfi_table_entry *entry;
> +	struct a6xx_hfi_table *tbl;
> +	int ret, i;
> +	u32 size;
> +
> +	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
> +		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
> +		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
> +	tbl = devm_kzalloc(gmu->dev, size, GFP_KERNEL);

devm_ only adds overhead here, there's not even an error-return path,
go with regular kzalloc/kfree

> +	tbl->type = HFI_TABLE_GPU_PERF;
> +
> +	/* First fill GX votes */
> +	entry = &tbl->entry[0];
> +	entry->count = gmu->nr_gpu_freqs;
> +	entry->stride = num_gx_votes;
> +
> +	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base+0] = gmu->gx_arc_votes[i];
> +		entry->data[base+1] = gmu->dep_arc_votes[i];
> +		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;

This is essentially struct perf_gx_level with the ACD field recycled

> +	}
> +
> +	/* Then fill CX votes */
> +	entry = (struct a6xx_hfi_table_entry *)
> +		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
> +
> +	entry->count = gmu->nr_gmu_freqs;
> +	entry->stride = num_cx_votes;
> +
> +	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base] = gmu->cx_arc_votes[i];
> +		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;

And this is struct perf_level

[...]

> +#define HFI_H2F_MSG_TABLE 15
> +
> +struct a6xx_hfi_table_entry {
> +	u32 count;
> +	u32 stride;
> +	u32 data[];
> +};
> +
> +struct a6xx_hfi_table {
> +	u32 header;
> +	u32 version;
> +#define HFI_TABLE_BW_VOTE 0
> +#define HFI_TABLE_GPU_PERF 1

Such defines usually go below the field definition, not above

Konrad
> +	u32 type;
> +	struct a6xx_hfi_table_entry entry[];
> +};
> +
>  #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
>  
>  struct a6xx_hfi_gx_bw_perf_vote_cmd {
> 

