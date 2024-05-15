Return-Path: <linux-arm-msm+bounces-19898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6F8C6E6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 00:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C71C7B2350B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 22:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8DD25757;
	Wed, 15 May 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eWPB7Yb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7515B567;
	Wed, 15 May 2024 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715810916; cv=none; b=TY+3UAg7q+0gAURy41IeB1wHNnAeBnhue6djYebmjFX6RjRMtAv2zFfSJgpU58a+PE2taJqJsDDFXUd/K0MDq8RWt47KrPPmH3EKGpqp259MDroiD3m2rWYTfxqEIz5tjFYnmd70a8v2zmWwgLXwdBcFPd25+Qk38ocBqe7pKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715810916; c=relaxed/simple;
	bh=reyrihCEmP5oDQtaaGfo+uK/S445YIOEX6bQCHb6Zt4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khK93ruZgBW7XHhk8u47ZxZZvgj9SWdbLBEFGeQ0xv9aKyAvlgQXkbIp7xuWFPjf9sDtkWgJAQ8Ij+OEzoaXuLRsZgK0+JkwFHGePsDR9mK2l00TmExej5vbqAfIridAP5bMbhu82hRl53UO4N9llqnBd/VnNe7R7RUr7L+Y+7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eWPB7Yb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FJfARq023988;
	Wed, 15 May 2024 22:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=5VLaD51GYdbhF5lxLvgNA
	EgcaB1ZksCKGZMXU9Is8Bw=; b=eWPB7Yb/Wc6Bd+SZNegfeV2dD3ZPpMERmP/nv
	1aCI+bqusfvBJw0O8ClzJaQgNS/dMrz/1ezba8EGCJs9Ikt+ptwDOLmeBdf5u+2d
	gxTNlcRCmBXNY26IWFJ1FVgCShyIdziU9hNEWb9L3hBjdkLrA3bcNpyR6oqJmhEo
	okcFtfu0IwIfPGMTmnImhG3pDV/q6Uv2nDNQ2Hq81DkhY9adBswknHBGAdgghxdF
	pgVX4gnh/iQ+HrTscJs20fVwheLBAdBBFy5/SUc+AodUkzXqbf0rmvpNe0oZt5gw
	CrdXV1617gSU+Hzpo4tVqlq5QyhtF+A2UM7rwd1Uxos7L02Ig==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ft3qbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 22:08:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FM8U2e021891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 22:08:30 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 15:08:27 -0700
Date: Wed, 15 May 2024 15:08:26 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH] firmware: qcom-scm: Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL
Message-ID: <20240515150719472-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240514180046.543763-1-quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240514180046.543763-1-quic_uchalich@quicinc.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LxlzQSzqxW_fyJ6E5_Gr7vRIv7rAAWcG
X-Proofpoint-GUID: LxlzQSzqxW_fyJ6E5_Gr7vRIv7rAAWcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150158

On Tue, May 14, 2024 at 11:00:46AM -0700, Unnathi Chalicheemala wrote:
> This flag was never supported by firmware, so remove it.
> 
> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  drivers/firmware/qcom/qcom_scm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 68f4df7e6c3c..d511ede6f172 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -114,7 +114,6 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
>  };
>  
>  #define QCOM_SMC_WAITQ_FLAG_WAKE_ONE	BIT(0)
> -#define QCOM_SMC_WAITQ_FLAG_WAKE_ALL	BIT(1)
>  
>  #define QCOM_DLOAD_MASK		GENMASK(5, 4)
>  #define QCOM_DLOAD_NODUMP	0
> @@ -1793,9 +1792,8 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
>  			goto out;
>  		}
>  
> -		if (flags != QCOM_SMC_WAITQ_FLAG_WAKE_ONE &&
> -		    flags != QCOM_SMC_WAITQ_FLAG_WAKE_ALL) {
> -			dev_err(scm->dev, "Invalid flags found for wq_ctx: %u\n", flags);
> +		if (flags != QCOM_SMC_WAITQ_FLAG_WAKE_ONE) {
> +			dev_err(scm->dev, "Invalid flags received for wq_ctx: %u\n", flags);
>  			goto out;
>  		}
>  
> -- 
> 2.34.1
> 

