Return-Path: <linux-arm-msm+bounces-108123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBL4Ao7ICmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:06:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C627568649
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087AA3009149
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B583E00B9;
	Mon, 18 May 2026 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA5NaFXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPBm5xc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2483E00BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091561; cv=none; b=jOWxx066IppXqQ7OTm/QSXOLRehi+B0wijaPrLNY/FrL99qkjIomBbAkhRfPIHz6rwt3oE7zt3jfBFeX8qcnT65vRSCPOH9nsmN0j8qz+I6qG6ai7OlLsKNBt7QGuoRlGs6PU1kh9ygmWF7P0wmQAnccjqtFg5sLY7d+sHRsq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091561; c=relaxed/simple;
	bh=pCCegZQDWYNAJhHrJwOWV8EAV06JnGCYIXBnU2OOKYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Li55+f9hoYfETDJmRo7KzANZEyfmmRApaNdJBx+y1GhE6uCKIOc5muy5hSLIhKTWQeDei+xpPsT+ebjJvO+yofrDfGlEaQNjnh4KsKzpz7P+wC0ESlCaXe0CZ9bIQ5a8B6hUrnTwCnQ3KakQQD89PhtYFLVy9/4vmNgdXxFqlK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA5NaFXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPBm5xc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e8YC2892872
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	le7TwpeIaCt4Dszj2+Eo4xIdzJ64VCiTbnhEt4L1OnA=; b=YA5NaFXT1UdDLSIk
	P3pVvYwWkEdF47yMa2THbxzgoBXfGVHqyz5YYSVMulnzEdWkvsA6WyckBWO1a97P
	MMG2m9P9pLiParKDT0TpgLwvk4tR083ttlkqjVWGvzTpoJipJdGlVJLHOVgsVjsu
	NgQ4DToZ3UZ24/sdE/yWq+Qz26JFv6RSNG36q5n8brUdvyvEvaSKrB3D/lfTMHJo
	ntEdr8Rsyj7n/n0kRhKth1onOvRxkLE0Dn1JKntkI2r/bSEOtQRkmGCvKQZjrlDX
	zRLKLmDnHlqLzUxfG9MJs29hIJ1YcnJKyubBb9iJQBT/GOMmwuFwO+Huz1xZbIaX
	SIonMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk183y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:05:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb98b09d3so7411271cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779091558; x=1779696358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=le7TwpeIaCt4Dszj2+Eo4xIdzJ64VCiTbnhEt4L1OnA=;
        b=fPBm5xc5WPwdo/ZhqAOlPXiZmhelYw7SL745ujbpDI58HYsvmetJUxrxYMg9rznEyC
         Ba24u5543euURoJjsumMXi3jXT6VD1Il8j4eVoFlHjy1ftguBCtOSYmGdNbvssP6uY1z
         7GpJ3HXH6ys9vCqwDBAdh37CObSoLJbW3ay7KZ9lvcTh8F0iBhHLx/wv7i7aZyfEUbvH
         GL6WAv11uCHiSgtuK5VoUlNW84DmYlFpxDZ7cqcpj+IloGgxEyajOO0tH0IqDkAxKKxg
         qWkkeB7nszJaFa8wtQxNDb26kFdt/rjL3U7P6QsNVhS81R52fwG60kxQLq+0TzsUKGtR
         sZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091558; x=1779696358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le7TwpeIaCt4Dszj2+Eo4xIdzJ64VCiTbnhEt4L1OnA=;
        b=RGBAgCOT8JV/Q6qG7PMrKIfTSdcFKkLRnUs/ae7FiZdOM3Y/0/c8NcKB83cz9gD8iL
         POBE1GJaaE9kO/VQjoCdh1ze+OBGszRPZp67cuyZHROym6NOOg63MoOymqu3QSTwX19l
         7GXf//iqbwfb7X55yfSlyoDMCcH7g2kXkf12cnVqllsGcw/BYpY4EuW0FZ719qtvtzgO
         7dDkjzkJPM3p1ngVz0C2BQQpdYvIdXBsZ3lqhczRfFoyPHgjAoGbYoXMDxE9vGNRsq8Q
         V09Hk+RYrdo1vII00tZuUFXaFgvpBLr5aXCCJFIGfhPJZqF+ZNarzs7wcBkW+p/KlAA/
         l2Wg==
X-Gm-Message-State: AOJu0YxXVd2wR3rWlvxve6zrH+DHV52I9kzpCWvzjBs2x48ccS/ShWmt
	T9ep0xuHp15A1m+d3Ody3tbTRAljaqPsPzm6NDILLHJkCHxSJv2tuXX4rHpC855daGlzfhHqE/m
	SdC058lj818lXoJZ3cXugjj10ziAgQY9mufFufJQIrLx5C4Bd+9FyXVflvcdRLmc1j7Lu
X-Gm-Gg: Acq92OGF7RhZeu7vUtWK/6dLzlADym6RMGP0s5WfXTQjufiEpJiGeZKaDy2vRlJIaY6
	xvbvpWGsNZ3DptoxN90rYqR7310NvGQm6Rd9LZ1sgnEDVGO4K9eFVaROMUrQ4RmTpcIv1WHcql1
	Zk2lkfVSW+ZJRJFfS23r3OAzCRB7nsdHoUry/ODfu5ZMrOAJxfWmNhyY0Y5ftq6vYcZKg9xZfZD
	NpF5330bxwAntz8mQp021bQR1fVE7hllLIL0tHvAlXIhJgjIZQfehsxvM3dxkqG3BeROG3Z395W
	RmvsN02wiIBa5ephM7pTDFWZEM/HsZTgEws8frTUv0WTTZz3NbzeYvLDVPQMCfFPOoK7A+s8bh7
	pxuGhUkuSDqe+h2qEMl46He0owkk2xk80xjHdjqC1fhTtDV4z6q0JMYpoN81HJBzyzBXNEW3Mpa
	7gwLo=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr131419951cf.8.1779091558193;
        Mon, 18 May 2026 01:05:58 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr131419781cf.8.1779091557649;
        Mon, 18 May 2026 01:05:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm545007266b.9.2026.05.18.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:05:56 -0700 (PDT)
Message-ID: <159aa418-ed40-479d-a635-a170e0ab06c5@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:05:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add HFI support for CLX feature
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-1-62508bf651ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-1-62508bf651ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YfNLrmBGGpacEGRoiornrCXTXRzg4pDv
X-Proofpoint-ORIG-GUID: YfNLrmBGGpacEGRoiornrCXTXRzg4pDv
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0ac867 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2SAFw1Xh2MQk1rVR-FgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NSBTYWx0ZWRfXxlPtS5QtlapM
 /AS9QCc7E2hpxfJnyRNdv4ePQ4PxZR6pbPkhgR2W2xelKiY09mdDd+3M2B/elBci0csbg+AH0+I
 sqctVIbZMlW8UGiS5x8Ac9UhlLBUsVwJ7CsdovlGH1AVNLQ6y7Ow97uv6KARR3KIRlUGALmZjej
 NE2ygEE1Mz09P6XRs5+NEoUxzGaTIfseVzjBjBmCbsIAQgFrmxZNabU41CgourhXJV/vKJXdHyY
 XkBZhw2yMMMH9xcoqr9NEO39nsCdxlhI25HT0ar2PN5jO4PrY4dokjHVX0HEVR7r3i3pMvolfbd
 +RSZbvB1dC6Hs30v+5jVQgmsKrJUwcPQMUl2p+TWsy4JIkc/VK08k/hIkGXoxjgsV7yHtE8m6W4
 yJrAmzxeXUkjwqvMKiT6k9Yi36Bj3nT/IoAvLQi95CNbCDX35bW92qAmnAG+U/YwFXmwcWpiYjN
 u6VzZpjBMTP4R87zkEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180075
X-Rspamd-Queue-Id: 6C627568649
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 10:07 PM, Akhil P Oommen wrote:
> Add support for Current Limit Extension (CLX) feature found on a few A8x
> GPUs. This feature is required to limit the peak current consumption to
> avoid HW spec violation on GX/MX rails.
> 
> Add the necessary HFI interface support to pass the recommended CLX and
> IFF/PCLX limits tables to the GMU. Per-GPU configuration is consumed
> from the catalog entries.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 15 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 71 +++++++++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eb431e5e00b1..f6a3f1924bb3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -34,6 +34,19 @@ struct cpu_gpu_lock {
>  	uint64_t regs[62];
>  };
>  
> +struct a6xx_limits_tbl {
> +	/** @tbl: List of limits table **/
> +	struct a6xx_hfi_limits_tbl *tbl;
> +	/** @count: Number of entries in the list **/
> +	u32 count;
> +};
> +
> +#define DECLARE_ADRENO_LIMITS_TABLE(name)	\
> +static const struct a6xx_limits_tbl name = {	\
> +	.tbl = name ## _tbl,			\
> +	.count = ARRAY_SIZE(name ## _tbl),	\
> +}
> +
>  /**
>   * struct a6xx_info - a6xx specific information from device table
>   *
> @@ -54,6 +67,8 @@ struct a6xx_info {
>  	u32 gmu_cgc_mode;
>  	u32 prim_fifo_threshold;
>  	const struct a6xx_bcm *bcms;
> +	const struct a6xx_hfi_clx_table_v2_cmd *clx_tbl;
> +	const struct a6xx_limits_tbl *limits_tbl;
>  };
>  
>  struct a6xx_gpu {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 487c2736f2b3..13ae34d0d898 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -886,6 +886,73 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +static int a6xx_hfi_enable_iff_pclx(struct a6xx_gmu *gmu, const struct a6xx_limits_tbl *limits)
> +{
> +	struct a6xx_hfi_table_entry *entry;
> +	struct a6xx_hfi_table *tbl;
> +	size_t entry_size;
> +	size_t size;
> +	int ret;
> +
> +	if (!limits)
> +		return 0;

Is this considered a valid configuation (CLX on without IFF_PCLX data)?
If not, let's throw an error here since it's only called from _enable_clx()

Konrad

