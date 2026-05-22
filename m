Return-Path: <linux-arm-msm+bounces-109158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLLJOqjBD2pwPQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 04:38:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F19475AE13E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 04:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A430300F7A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 02:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2E8285058;
	Fri, 22 May 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUq9B2c9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJztu71l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086E256C61
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417505; cv=none; b=rSh1UdT/fKHfO5dB/gQ4wzrFSrsQuMQ+V4hT/P/M9bC0qtm1WEoIdIN/L1yqPq63v8wu5XY0dl4N0hl8I69SGINFdlwj7m0nzVqUuF4YGjUwAnoAwltf4R9SZ0om7p8M5rR6ElWrsXY/zeI5O6ACJhuy/og47G6s3yrwd2gYFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417505; c=relaxed/simple;
	bh=RYlg9MKeY6HcYqUBNAN+nNHvNwDtmWLaHkd4H6GSBoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgPhNK6uSzCALd08bw+jKydJbzLjfhGhqSC/epFiKXXNLV7FOJqyG2BbJ9EHwiosWmZcLpxPt8XSAzz7nKDbnOumfLkCJ0PF37AQJxDsidgI5RCEeN0Ql1jzpEHOtSB9xfqbvKB1b62fnGJym30en+TmwMc7mgddorXWKLtaqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUq9B2c9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJztu71l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk2Y53673883
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=; b=KUq9B2c9MnKVSHLg
	yZj1x+LT2QUWAugGUd5ChDQqCK/rMT6vmdY55Nou3rBAHF7qZH8+HJhBJGtyOBZL
	3W94QgV6ehGf8xhrkuvl/E8pUq5Aij3r9vDb12sqprHOh1cYehy+YXN29CU/ecCi
	sWJu73//A8VfB868n2oygQl9WpPvjHwbshN3EtA4Q36VE243+h/KLglEOb5hV7XJ
	hrAUdI8f3Gf+18xSUREF0RWRtTSE54Qq/bogVg3HWY4I17hQubjUYyr6pAqoKD2P
	BzjZcZCXKKZeYNtnsRq+ecuCH4HAYuRJN7AeM8iyBD+PKtLrCTzN0g0gfS2PZ41l
	kjO8qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea4dc2g5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:38:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so72551155ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 19:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779417502; x=1780022302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=;
        b=CJztu71lFhogknalWMP+6AZZ6YqW1/L+vinQwL2YQZKMZ9sOlR2vH97wmEVd8Wy1+l
         FxK7mMzaJjMTJYKYb1f+n4KiABZptEp1oKWBhd+mLMGbY9MThrmP3mCGs8zuznZNH/qo
         zTP5lTdJus39h7gmy0FvdKdvBpZ4l8QJdA/c7oUTj3qxn9GnHAVVtn0/C2SscJVG2SUl
         FI8Q/HMUOevBJXvF2e9nIAiD4AHgkKtelq+I7NdhHeIQLNbsvPa1h9HGteFS/IAQmwPR
         WZ9G5rCVWNi3C/m0F7LL8Lfcm2ElQ98lNnC+5ZF26JmZP7gVbgRiwmbdivkT/8X4t60Y
         d01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779417502; x=1780022302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Y8OgnYQdT1QtuisubqSFNUEjWwvf0derGNmFwfw84=;
        b=dd2kdLk8sM6qr45oYmvGHZq/MNGMsRUSE8Nm2eprC+XQjTtRT5BpuXGhuTBYFJZ5kW
         a63cOU2vqgQY4ajXPAK8mUVFWlLz2sk5KwkgzHml+kE5PZmvQlOWAuaY9i6w2aTPzYxp
         aSE0wadBndCvgaHq/AZ5XHU3OEvLHqr7qRmznJcrTz9nLoQHFto2eT3IiZc0zqVHjT10
         3xd2Z2pCaw3utM9AwZvjFeH60+jzKYuEHvUOtT9C8AyuXORgKdBTX7hPE7Dhba9IKsO/
         aRvECZOdLUmVq5BCFgZ1cdCumxpNYdUlg+T9WLXWmfkUdGlfKCE63zHThu+ndIry7VBA
         4PmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+sTRTGm8MnfekWc4yUS3r/jtLcuoDh6Hnp1KP7KdpGmK29OSRYVn8kbmIdWhEScAacABvW9N+birLnTe3@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQOrlhCRulv1f/7rKcVZGNygm9lLPCRWx+GjulowSwL5PRctY
	pr8A6nX2cXajq24JGS2seF7DpSIjblEV5/0nOFVDLB6JempbrglFAjAB3Hc79b2ODjTBhPUOCDu
	xGPVfPpopbKm95TxbHnA/WOGAHACT9KwjzuctnvZC994oQ+R/7kaqYswxXo4RQylQznT7
X-Gm-Gg: Acq92OHyjBa3mLtBMaZOazQQkg7Xk3jNsjox/RTeeulRUFbVAVwWEx/oTVD+C3YRenb
	OuInVFOKc1SqjW2L5lwzH+MrbL7s/8Gk01F/jY43vGPhZtsZ3MRNUX/5GWvSIl/KMzB47qniOh/
	QUVgRvOIk0WyflWtB43fceaQkJTpGxqyefXzc8/J4Rn8KZ9CS0rcXPfuYbUY6HFy8NOI/yG5+WG
	l0XWnu6UwBVktk+CcJLWLB0yrw4GOSZA4SKXlYHAFnCDFsjXuuUcDQKgXfpSbFsfHuLZa+UOuL1
	qiTld5n4GxRJfqTfE7nlKpPkMp0nRcsrNLmhzvRGl+gf9ZRpxyUHlFOC0mFNhhRyehkjLLpT35p
	RCl/65dzOj3qlCbWZPfkbRGQatGcr4vRejwQP9Pnle53NAIIt+QfviRSpsYEjsd5YJ0KzuZFwyx
	bJ5k9/P4CZQjZtyyWE9Ht3Pw==
X-Received: by 2002:a17:902:e548:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2beb0770aebmr16548185ad.29.1779417501913;
        Thu, 21 May 2026 19:38:21 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2bc:ac76:c1d3 with SMTP id d9443c01a7336-2beb0770aebmr16547745ad.29.1779417501383;
        Thu, 21 May 2026 19:38:21 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0e64b89sm6072415ad.8.2026.05.21.19.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 19:38:20 -0700 (PDT)
Message-ID: <daad52c7-c420-437d-8747-61e10437f460@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:38:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a0fc19e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fi1y-F4gZlMYRSbziuEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: FH_lmRIu1Gw0V2hvczW7JwIrF9mhA7Ps
X-Proofpoint-ORIG-GUID: FH_lmRIu1Gw0V2hvczW7JwIrF9mhA7Ps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAyMyBTYWx0ZWRfXzmH0cvC/9Z0Z
 8D3FNK+gYqSbJ9F2f9rYMJmG8TwjiRgYTBAxNohgOgwoKYm/GFimMdRbwe6mJEIui0cZN0w8T+6
 5r3qwy22DJw0YNpJDOWwCHEq/3HPyi+64u1GGoFyA14GoIvRknuLoqMdT6ruO3swjnzFp5rrAIR
 foFO6wj1u+s7/WR7IbksSfz+EYUqO/hw0YEFVXMCMv5YRzoN9sY/s+nsL/mNZt4XXXnWjofC8Iz
 ulOh/fNMeFG7nIk9f24DNXpoV0DVkoOFgqtNDA0j9JL7lX87jh87b1Ole5YIV5TaAt8O0a+e/Dd
 QPzf/oetnGXjG4XX+SURbj9con9zOIsM4+gURN22HLvcJ8qwnzpmwN3wesU8GuZswdaLhC6ouKI
 sUQiIutQQ3lu4kRnMOcYINkup6UaIxo4ijknbqLjXcoFeb04Tzx32gax/5oWRHPbTgJqy9IMX1e
 I/qAx1+OGVb7SwKYtNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109158-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F19475AE13E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/2026 8:16 PM, Yingchao Deng wrote:
> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.
> 
> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
> driver data. Introduce a small mapping layer to translate standard CTI
> register offsets to Qualcomm-specific offsets, allowing the rest of the
> driver to use a common register access path.
> 
> Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
> register is incorrectly initialized to a non-zero value, which can cause
> tools or drivers to assume the component is already claimed. Clear the
> register during probe to reflect the actual unclaimed state.
> 
> No functional change is intended for standard ARM CTI devices.
> 
> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c | 27 +++++++++-
>   drivers/hwtracing/coresight/coresight-cti.h      |  7 ++-
>   drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
>   3 files changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index c5cc2706e241..2dac5eb4ecca 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,6 +21,7 @@
>   
>   #include "coresight-priv.h"
>   #include "coresight-cti.h"
> +#include "qcom-cti.h"
>   
>   /*
>    * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -45,6 +46,9 @@ static DEFINE_MUTEX(ect_mutex);
>   static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
>   				u32 index)
>   {
> +	if (unlikely(rvdata->is_qcom_cti))

typo.
s/rvdata/drvdata

Thanks,
Jie

> +		off = cti_qcom_reg_off(off);
> +
>   	return drvdata->base + off + sizeof(u32) * index;
>   }
>   
> @@ -172,6 +176,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>   				  struct cti_drvdata *drvdata)
>   {
> @@ -702,6 +709,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	struct coresight_desc cti_desc;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct resource *res = &adev->res;
> +	u32 devarch;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);
> +	}
> +
>   	/* initialise CTI driver config values */
>   	ret = cti_set_default_config(dev, drvdata);
>   	if (ret)
> @@ -782,7 +806,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	/* all done - dec pm refcount */
>   	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev,
> +		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 98b8de8a3687..08ea6daf5b3c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -54,10 +54,11 @@ struct fwnode_handle;
>   /*
>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * QCOM CTI supports up to 128 trigger signals per direction.
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.
>    */
> -#define CTIINOUTEN_MAX		32
> +#define CTIINOUTEN_MAX		128
>   
>   /**
>    * Group of related trigger signals
> @@ -168,6 +169,9 @@ struct cti_config {
>    * @spinlock:	Control data access to one at a time.
>    * @config:	Configuration data for this CTI device.
>    * @node:	List entry of this device in the list of CTI devices.
> + * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
> + *		 variant that requires register offset translation
> + *		 via cti_qcom_reg_off().
>    */
>   struct cti_drvdata {
>   	void __iomem *base;
> @@ -176,6 +180,7 @@ struct cti_drvdata {
>   	raw_spinlock_t spinlock;
>   	struct cti_config config;
>   	struct list_head node;
> +	bool is_qcom_cti;
>   };
>   
>   /*
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
> new file mode 100644
> index 000000000000..d3846613a0de
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _CORESIGHT_QCOM_CTI_H
> +#define _CORESIGHT_QCOM_CTI_H
> +
> +#include "coresight-cti.h"
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +/* CTI programming registers */
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
> +
> +static inline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
> +#endif  /* _CORESIGHT_QCOM_CTI_H */
> 


