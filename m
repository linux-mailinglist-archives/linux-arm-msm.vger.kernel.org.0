Return-Path: <linux-arm-msm+bounces-24371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CF9199C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0805E1C21620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A4F1940AA;
	Wed, 26 Jun 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iAYB+ZPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBD190664;
	Wed, 26 Jun 2024 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437180; cv=none; b=la3h48qXfjv3+LEwZ0oXv0gKcyWtq8AZIqTu9TmbSaVF7sD8vngaU6egWC9FNFA5vtoeVKDqs9qGiRgIv5c+xu+dGquefiZGDacX0Iy6A7KUC208F6sz2t59zXQCC1Q0ylAvVzLUex2a4xFmrxIUc5tIz8gHieuULfGucADTj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437180; c=relaxed/simple;
	bh=ZG8saBM3N6xqGW6UUfKcaCbxiiH22Itzsev61ppamho=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QV5mgo7DEAH3fiJ6g0XHrnwdNm8PuQSMIxhnpFwDUMk8PPLuluxXkhIcwqy1d+YiacwE5g7pnllDQfHdlL+56o/Sq+GZrzyqAIdeCKum43p6X9UankZU4eeFLhMo1TDL635o25ewSSSr6d370zyEZMfWJsaN6wQckUL6Ty32F3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iAYB+ZPn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfJ3Y029729;
	Wed, 26 Jun 2024 21:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H988TLB0FgUwXdImduaNcVTht03R/pl3hhgY2y7lIJg=; b=iAYB+ZPnWZf9dxiB
	o3HuZ7hezeGaAG6/ZYhTNFPp2hTicddJ21rmoSwGEMvMUdG6b7S7yNx+po0J+EBF
	7ysXQXFQIgUDEUeLiJ9moXj4XfmFyjfUxWMqhomLxv+Up+e5HGpSCj6klkz0djYu
	gdSsUvT7BkVHnMHQtLCpEg3jsoiY4u56s0nfzMNiuY7VOqh9iWOrjbqk0nZRzlkg
	dsnb18KKVl7J85AKdCV+KSafsE5WPWrgJgOvAOUWBwbIvmB8LYhlKoj4vywcSSxB
	16hXedyHn5c1wFwbwzX0DpxcrF0KalXfa19JPtQ5usLj/pSi8++zcGb/Z9RP4mQG
	XpcdSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c46abwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:26:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QLQDZK017222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:26:13 GMT
Received: from [10.110.61.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 14:26:13 -0700
Message-ID: <30fd5a0f-d71e-4bcb-ac33-0a6f9bef2029@quicinc.com>
Date: Wed, 26 Jun 2024 14:26:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: select AUXILIARY_BUS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>
CC: Mark Brown <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
 <20240626-qcom-pd-mapper-fix-deps-v1-2-644678dc4663@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-2-644678dc4663@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UoAwZbdPGUb23luEnqwisg1kQkdxDNqs
X-Proofpoint-GUID: UoAwZbdPGUb23luEnqwisg1kQkdxDNqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=759 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260157



On 6/26/2024 12:12 PM, Dmitry Baryshkov wrote:
> The QCOM_PD_MAPPER implementation made Qualcomm remoteproc drivers use
> auxiliary bus for the pd-mapper subdevice. Add necessary dependency.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/remoteproc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48845dc8fa85..dda2ada215b7 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -166,6 +166,7 @@ config QCOM_PIL_INFO
>   
>   config QCOM_RPROC_COMMON
>   	tristate
> +	select AUXILIARY_BUS
>   
>   config QCOM_Q6V5_COMMON
>   	tristate
> 


Reviewed-by: Chris Lew <quic_clew@quicinc.com>

