Return-Path: <linux-arm-msm+bounces-44490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4097AA06A49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 02:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49D03A6FDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 01:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4DA747F;
	Thu,  9 Jan 2025 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M4Fe6lJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC279F5;
	Thu,  9 Jan 2025 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386175; cv=none; b=hc45ZZTj0doTgaJaUGYhFK+ApQWy5l7bYbTRzDtzpj32ZoR/EmRGV5tSrose8N7cnVADOM8QLs1kJryagWrXbtKk3PzQxL5WJYALT36rzoAnaUSZi4H6aLPsUX7kwlD5hA9aCDrVFYq+WkSQC8EhZ/ReLOsEDNi7EoT/Rixt818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386175; c=relaxed/simple;
	bh=BLi7qrl59SMfU7L5FTyymoZUeP/TcONsV4T6JppBAYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UttSyyYRZnt6MBVbtIf/1AQew4OE+esvOKwTuqZO0tCHA1uqzgQVxJkszBGOBLHqeaIXxaVbt9QxGz35A/Se+lYbTGOc5vGGXBcyUmQTCCkDFC+Umd/pBrHXOczlNz4alTdg3O6oud5nQVVmv51JTUvitTjPJ7k8zaRo9zksZX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M4Fe6lJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HMtXc015511;
	Thu, 9 Jan 2025 01:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mQq7rTWgdcVVRdlVYIwdtr3gJb6UdcYIoBL+JdYm/g=; b=M4Fe6lJDEFXjiVyP
	PkSN/BQGGNzfPaqLq199xuRLz2hsbBGY4OSIUKK6B3f1PbyewJy9p6YZ0YWx3bQj
	lRrAr035n6gmgtxX8kU79G8fCHHEQbImGjh0UL2WD8iIKRi+SDHrMf+Ua4JLrRCb
	iNLdvnd+i3a+FmbCpyDMHhNqdFeEV9PHDnb1m/3od1xEiElRfKNf/ptu1zuA17/i
	2rC+sJeGm7KVUICIfqZm3av9ew5YACZolXzLeIshxABnHzNCMcNzEafrFdlSXdmJ
	/8Ia2wzWBfP2VlxaDpkFifTXjCrWtiYmQfDBWvkMHR88KfcWkNxvSTb0KL9NYqCI
	lyfrmw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wq50yny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 01:29:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5091TQW1012349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 01:29:26 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 17:29:25 -0800
Message-ID: <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
Date: Wed, 8 Jan 2025 17:29:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZobGOj06gTjbqaZVquUVblrZ4EmkK_fu
X-Proofpoint-ORIG-GUID: ZobGOj06gTjbqaZVquUVblrZ4EmkK_fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090009



On 12/18/2024 11:49 PM, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.
> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Current code resets number of mixer on failure of pair's peer test and
> retry on another pair. If two pairs are needed, the failure on the test
> of 2nd pair results clearing to the 1st pair. This patch only clear the
> bit for the 2nd pair allocation before retry on another pair.

Hi Jun,

I think the commit message wording is a bit unclear. Maybe something 
like "Reset the current lm_count to an even number instead of completely 
clearing it. This prevents all pairs from being cleared in cases where 
multiple LM pairs are needed"

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index cde3c5616f9bc..a8b01b78c02c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>   		if (!rm->mixer_blks[i])
>   			continue;
>   
> -		lm_count = 0;
> +		/*
> +		 * Clear the last bit to drop the previous primary mixer if
> +		 * fail to find its peer.

Same here can we reword it to something like "Reset lm_count to an even 
index. This will drop the previous primary mixer if ..."

> +		 */
> +		lm_count &= 0xfe;

Nit: Can we directly clear the first bit instead of doing an 8-bit bitmask?

Thanks,

Jessica Zhang

>   		lm_idx[lm_count] = i;
>   
>   		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 


