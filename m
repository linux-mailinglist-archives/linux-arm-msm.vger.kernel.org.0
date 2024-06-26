Return-Path: <linux-arm-msm+bounces-24191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5E9176CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 05:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86FB1C212A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 03:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5455EE97;
	Wed, 26 Jun 2024 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eWzzE6M6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46182AD39;
	Wed, 26 Jun 2024 03:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372666; cv=none; b=tIJDNsx5qkVQZqrBSloWT6JxfLn7WhZuDmakJLHnJijPO4GhOVZnmCIWpQBamY0m1rwGXcoRx2k5LiGPHb0USg2BRop+lRlqhi5j1lGMt2CdZVO2raCJwYfhVfN3QdXxg7u2ZGh152PlvNXNNrKz3UJXSf3KR1D8hHU5hyLv7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372666; c=relaxed/simple;
	bh=6zbvQH3G+ruOCuRpo3Arqc1ag5666BmgxVBvGZhzlXc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaE64nrzneO9dTI9Qg0BMx9YPfe+HGs9i0EAhuQnu4uYw3vgpSdHLkp0EKqMutLmVLBRa9MJx8xqoLPrrlBlGeOKSw3Xa0iwfphwftmleiSIDHPSPB0zTE1ton//xXyVpe3+eOBm/0npZuJHWtOYpEavfw4pkX9ev7cjRXbcWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eWzzE6M6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHUXCk029197;
	Wed, 26 Jun 2024 03:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f57S2Jg0q4U4QCGjqyXkezeP
	W4aooHDMsb3rzUeUJc4=; b=eWzzE6M6FOzus8otdszEo24Tk0b/jD2Nw0kyQ0Pv
	dlw/XWHmDg1zZtq0KMUDDSOv+KrvpJbK+4xXv+CB+lVEvkbFh4HQf8yiL/y1CGUt
	BWT33qoR70xrvixA7RXqN+Ot/Z1paRDYnYFy+M+j7ZKeguE2FMkIQoVvVnmpoYfc
	nbXppHnKdEged8NmxT7McsHxx5FrYu4S1P3Iwfaw3KH3Ge8LKIofsDulIkMAqBsx
	JqurPv+K1ktCFLGXHBt3rQEyv4th102b8RcCCFZOxY+RWW6+2cAlIPTQ0/K+a9os
	x5nwC162194HL6ZseRi06nNeJQufo5CuJkDT5IsWwH/HhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywq078974-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:30:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q3UfS8029137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:30:41 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 20:30:34 -0700
Date: Wed, 26 Jun 2024 11:30:29 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: Re: [PATCH 1/2] Coresight: Set correct cs_mode for TPDM to fix
 disable issue
Message-ID: <ZnuLVTP7XLWy0gDz@jiegan-gv.ap.qualcomm.com>
References: <20240626022537.1887219-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626022537.1887219-1-quic_jiegan@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CYSPRwJ5xcPOjlNChzpzy6eJni_JAhYH
X-Proofpoint-GUID: CYSPRwJ5xcPOjlNChzpzy6eJni_JAhYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260026

On Wed, Jun 26, 2024 at 10:25:36AM +0800, Jie Gan wrote:
> The coresight_disable_source_sysfs function should verify the
> mode of the coresight device before disabling the source.
> 
> However, the mode for the TPDM device is always set to
> CS_MODE_DISABLED, resulting in the check consistently failing.
> As a result, TPDM cannot be properly disabled.
> 
> Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
> Configure CS_MODE_DISABLED during the disablement.
> 
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tpdm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index a9708ab0d488..90a5105f6199 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -449,6 +449,11 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>  		return -EBUSY;
>  	}
>  
> +	if (!coresight_take_mode(csdev, mode)) {
> +		spin_unlock(&drvdata->spinlock);
> +		return -EBUSY;
> +	}
> +
>  	__tpdm_enable(drvdata);
>  	drvdata->enable = true;
>  	spin_unlock(&drvdata->spinlock);
> @@ -506,6 +511,7 @@ static void tpdm_disable(struct coresight_device *csdev,
>  	}
>  
>  	__tpdm_disable(drvdata);
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
>  	drvdata->enable = false;
>  	spin_unlock(&drvdata->spinlock);
>  
> -- 
> 2.34.1
>
Please ignore this patch. This patch should be included by an independent email.
I will correct it and send it later.

Thanks
Jie
>
 

