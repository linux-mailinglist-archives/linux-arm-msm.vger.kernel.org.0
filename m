Return-Path: <linux-arm-msm+bounces-32297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C1984715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 15:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8626A1C20916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6101EEF9;
	Tue, 24 Sep 2024 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XN50r3EV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E20A1DDEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186065; cv=none; b=B39jfRxIF8K/tvhTRzb5N+cupsImmVy2BTWoXXzgXFVWsPsKQuAJPxwEJoCVAClDS3tEKy+0HY3YABkgzCDBZt3Awk2rqJZH6Mi3tdiZ9BEbnNr3gyeIXqA7F7DgolOTtIjC1VHeEjnUg4SAkx5vW6OjBkL/nqnHFdFg3ttrLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186065; c=relaxed/simple;
	bh=Uik3tLPA8CxTBxH5Sv63RHsseeHylxGpLCuYL8MYbYM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UML70/NLQFMs+BQHQkg6yP1qQ6Pyvx0pUL/iKMar4/U8liwzx8XMycLD7/k+Xs3cOyZ6Zj+NYOopshwAr5YT9GVjtRYyyAGqBW4CPYqyH3rqkUG8phNf/YzSedqPaWI0X0OaZrCFo+xZ6s1rU7qrwe+lKT7VwOyL7XG3yDwXAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XN50r3EV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O92igf018544;
	Tue, 24 Sep 2024 13:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9GoeqtGn2m9pNQ0TGCTatQDi
	5Ho4CspWl5q1xvScipw=; b=XN50r3EV9pBtbVlTk50VnMRa8c8rMyHN5aVPkG3m
	Xtyy8fgB2XcN/X5zecsEEwYKZiY9xsN68XoAZqo6Y6HJGG7F2gK4Q4oyp04VM/CB
	dpu4cGEsj6OUQ1Us/lvV8GmnyzNsV8FCSL6zFx/8SPigdLa22JsuR36h2gx801QU
	syNrLA562XChvHXJL3jyS4P91s0dleVd4KLCfzFzYGavHUC4qvgaaUawGIlowdbS
	md+Q9j+9o6/vDwuzm+zBIbKWvJBv6vYBRxE7u3UMNCruOd/ht7ULhh0n2d7LQuBK
	LyUxQMNDbXP6+axBDTEzpvPdw4tneew1KLfG5YiUYMchYA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuerqt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 13:54:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ODsAJC022741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 13:54:10 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 06:54:10 -0700
Date: Tue, 24 Sep 2024 06:54:08 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: John Schulz <john.schulz1@protonmail.com>
CC: <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to
 family check.
Message-ID: <ZvLEgIKbmTpqFLk+@hu-bjorande-lv.qualcomm.com>
References: <20240921204237.8006-1-john.schulz1@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240921204237.8006-1-john.schulz1@protonmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S_imHIORAfuFcyZEoscntduzVywVB5CH
X-Proofpoint-ORIG-GUID: S_imHIORAfuFcyZEoscntduzVywVB5CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=979 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240099

On Sat, Sep 21, 2024 at 08:42:54PM +0000, John Schulz wrote:
> Switches the is_x185 check to is_x1xx_family to accommodate more devices.
> Note that I got the X1-45 GPU ID from Windows which may not be correct.
> 

I assume from your patch that you have a X1-45 that you want to support
and you think there will be more of these and therefor you think it's
better to move to some form of family check.

It would be preferred if you clearly state the problem you're trying to
solve, to avoid current and future reviewers of the code from having to
assume/deduce the reasoning behind a patch.

E.g. why do you prefer adding is_family() instead of just adding
is_x145()?

Please also read:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Regards,
Bjorn

> Signed-off-by: John Schulz <john.schulz1@protonmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06cab2c6fd66..f04aeacae3c2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
>  
>  
> +#include "adreno_gpu.h"
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
>  #include "msm_gpu_trace.h"
> @@ -1026,7 +1027,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
>  	/* Set weights for bicubic filtering */
> -	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>  		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>  			0x3fe05ff4);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 58d7e7915c57..ec36fc915433 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -526,9 +526,15 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
>  	return gpu->info->chip_ids[0] == 0x43051401;
>  }
>  
> -static inline int adreno_is_x185(struct adreno_gpu *gpu)
> -{
> -	return gpu->info->chip_ids[0] == 0x43050c01;
> +static inline int adreno_is_x1xx_family(struct adreno_gpu *gpu)
> +{
> +	switch (gpu->info->chip_ids[0]) {
> +	case 0x1fc31043; // X1-45
> +	case 0x43050c01; // X1-85
> +		return 1;
> +	default:
> +		return 0;
> +	}
>  }
>  
>  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> -- 
> 2.46.1
> 
> 

