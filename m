Return-Path: <linux-arm-msm+bounces-41487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA39ECDA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A009F281AAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1543B226186;
	Wed, 11 Dec 2024 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CxUd0+aw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A686381AA;
	Wed, 11 Dec 2024 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733924969; cv=none; b=FRAviQ9n6WYLlOvrSQQo8DxUZ34ICgh4PDW9duMUL89gcEyTjFblNX5MWS4xkbbcl7qUenJ4xZQufGQvmUhkGXZcmsJNFn6LcXh0kvYHdRZlKYVRoxl3eoCAr/t1HwL81nPWYt9X8HI30XLyWrhDyt1UJ2SBcqhUJ4mltNi20Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733924969; c=relaxed/simple;
	bh=aDNIZMP4Heu/UaUPCpgZF8IeN6hBHJZJawOZYsJ1D7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IbRqZuF46H2z0n+hAH54mXLX3lAtP/h9hHQro3oD1IOYdhav1akY1JghNKyqgua4rjmh9ajOGM9sQQeaZ4cg7RvcmDJq+L2N5YWmvUuPgMv62Ggq+SaRZ3bB8t+XAD3k5YRw2Z1E1OEvqLGlzhrj+yGJKz1uwvmCSiSSmXYm3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CxUd0+aw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB9LixT006671;
	Wed, 11 Dec 2024 13:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsQPQmTi0QLjK8xZhCLBK2/HVzraYQl8VNA8bbxeub4=; b=CxUd0+awTeDdiwNw
	UqW5V6ruzcESm+m+PQro1wxJKOqxwXq+/M1pTnP+o/4Lkxx4iqwmj6JfR97zjCrL
	fokyyu7vMlHbWMJUUXn1qcsSofcXMSUu3Iaf9gbr3ZjxVkVO2sXyVY0c5xIMTm4/
	SZNvjF61BojjhloWfKwMVIudmMIDOKJ1HiSZs6J7PRRl8SaxCKt0oqH/KDnpnFAu
	cpx5I6iY0c+EO+jeWGiqM0WQus6Xkyozvh59AhoCzoCBoU1vhMoHBnQTaqbFkpwv
	tqTzza0H1H/dxGHFxGdCWqyX+HnhB+YKAW4Bjh1ssBVw/ZVta9ykhAPOHr0LTba1
	/4NWaA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg628hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:49:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBDnFf4029542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 13:49:15 GMT
Received: from [10.50.13.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 05:49:12 -0800
Message-ID: <ec650bc7-5348-479c-9977-3efc7fc03a37@quicinc.com>
Date: Wed, 11 Dec 2024 19:18:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com>
Content-Language: en-US
From: Rajendra Nayak <quic_rjendra@quicinc.com>
In-Reply-To: <20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CyPnjXuDKNtwBZy7dtB3JAvf8xJAbMpA
X-Proofpoint-ORIG-GUID: CyPnjXuDKNtwBZy7dtB3JAvf8xJAbMpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110100


On 12/7/2024 7:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Do so in accordance with the internal recommendations.
> 
> Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Reviewed-by: Rajendra Nayak <quic_rjendra@quicinc.com>

>   drivers/soc/qcom/llcc-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 32c3bc887cefb87c296e3ba67a730c87fa2fa346..1560db00a01248197e5c2936e785a5ea77f74ad8 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -3004,6 +3004,7 @@ static const struct llcc_slice_config x1e80100_data[] = {
>   		.fixed_size = true,
>   		.bonus_ways = 0xfff,
>   		.cache_mode = 0,
> +		.activate_on_init = true,
>   	}, {
>   		.usecase_id = LLCC_CAMEXP0,
>   		.slice_id = 4,
> 
> ---
> base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
> change-id: 20241207-topic-llcc_x1e_wrcache-647070e2d130
> 
> Best regards,

