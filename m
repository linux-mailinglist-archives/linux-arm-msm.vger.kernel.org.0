Return-Path: <linux-arm-msm+bounces-24370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C99199C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E827B24076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77629193084;
	Wed, 26 Jun 2024 21:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XPZd+big"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA416A928;
	Wed, 26 Jun 2024 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437172; cv=none; b=J5vVrNoX+ViCptf85dG2/WWfEvYMQyonr66Hc2a9kantrCwbS3V+XtUnv8XM3o/6N+bMR6ng3HTWHyMqbNkYGvJ5ZgJpMFFfaVyC03eE5lNxs9c7CLAfepWuiDw3cvGB+RZnj7fC7pzUdu9Hx3pogkRFzWMaJd9KZzdv58F3fL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437172; c=relaxed/simple;
	bh=y0QUyde4VscRphK3UjmSaFcQBvSU0PHJa3DLpUQtEI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WWYoPjpl52yAzYFHH5OaC2K2XXeqF+iCuNhlt65a+DlxEDABrd/AWazrz/5/9QQiPBx1ekHi7DdtJZwX/Q38094C0P9MjWIlNiRuUvHa9Z1URwHRZfFCDTTOJSL7RYnFseyqa4KBpZqZneC0FTRLIKJKB2+ncdgycP3gqAUxxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XPZd+big; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfKEu018763;
	Wed, 26 Jun 2024 21:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjxjbUTxad9on4j9CLjzrCNfUV50ltddd/nEBUe6yrA=; b=XPZd+bigEOeKcKLY
	CinjTOiyAkspQ3szgOiHdCLUAAjmxd54q62OeDY2j2Z/K2I0om1QfYlc6HkpJwnJ
	muIJJZS5xWjfKX3kqSiz0pO3rEd0wGvLtEEhkx+hMN++CcDnH/vS/wyspXqKZAMf
	xXFMYfRbfD/lpNnR17mt/p1uB4XJY+fGLvndgBTZrHSE9yghNXMnwG4w/46lx9NU
	jDefMc5RRIyvA7aCBr3H4HS1VscDX1geN0srFb/rju2Pk9ZO6Uc88ZoI3G7HGbOz
	XHoRiFN4URGdaWYMNe0baGBgsbKD2KQtO4S0poUIrTJq1wU282q3MsGEF5pRMYnU
	6A9GkA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90hux0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:26:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QLQ5uQ015806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:26:05 GMT
Received: from [10.110.61.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 14:26:04 -0700
Message-ID: <e30cd263-0340-4d6b-8f29-ae2ba3efaf68@quicinc.com>
Date: Wed, 26 Jun 2024 14:26:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: add missing pd-mapper dependencies
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: Mark Brown <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
 <20240626-qcom-pd-mapper-fix-deps-v1-1-644678dc4663@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-1-644678dc4663@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vo7CLpNXXtRpTZLijcD1KcDHLbGc77Kh
X-Proofpoint-GUID: Vo7CLpNXXtRpTZLijcD1KcDHLbGc77Kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260157



On 6/26/2024 12:12 PM, Dmitry Baryshkov wrote:
> The pd-mapper driver uses auxiliary bus and Qualcomm PDR message format
> data. Add missing dependencies to the driver's Kconfig entry.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 0a2f2bfd7863..432c85bd8ad4 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -75,6 +75,8 @@ config QCOM_OCMEM
>   config QCOM_PD_MAPPER
>   	tristate "Qualcomm Protection Domain Mapper"
>   	select QCOM_QMI_HELPERS
> +	select QCOM_PDR_MSG
> +	select AUXILIARY_BUS
>   	depends on NET && QRTR
>   	default QCOM_RPROC_COMMON
>   	help
> 


Reviewed-by: Chris Lew <quic_clew@quicinc.com>

