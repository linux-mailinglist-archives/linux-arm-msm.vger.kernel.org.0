Return-Path: <linux-arm-msm+bounces-21835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC08FDB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 02:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB221C22BB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 00:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E6379F5;
	Thu,  6 Jun 2024 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RU9DytJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD11C2E;
	Thu,  6 Jun 2024 00:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717634400; cv=none; b=f15pxolNJrDcrTRSrNVrtbzyrbLrQjS7hOUnBmSh7EgI6D/JOVz7lGc3ixDqKLXutcsl5GvvIqreL5wMKLqUFux2XxswTBpDKRv9IE+BbrQ6h5df9vCESVicqOe/bf+rx4k//cQRMQFILVcLxCzb3fRBLRU24YD+Wbvjn78Tkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717634400; c=relaxed/simple;
	bh=jnEFQomhwllTm3wRqLrxdLYR1AWUgLLuIccfs13CVLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dh0d0h13y8CVyMQAu9l+WgJhHi6oui0wQPR9Ke/mZ/MiRfZKV8IBL7BVs2GHR8XVCofgRHgam1ciJwO5XZqy4WYvI5pUGq834AOzwrnkpAdaawL39li8pkcZC+PLife7h590P8YMtOefAxXSSBQnGjn2SeZ438B/a+wOXimjzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RU9DytJG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455I31Td014221;
	Thu, 6 Jun 2024 00:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJZyXWEhXzusI6spw8a9iOcG+Dbq5Bn7ZEFhL0OIsII=; b=RU9DytJGT06cm9Dw
	ii8FjKkq8HQ26ZIqQvpQp8/ryjGOsKAI1wl14ITEvZue6EnY6rDqYXTxfk/EWxCx
	5ma2T4Bhv+Owy/q3iJTfFy6h6IqmbbtEiz4s2iAdT62Wq+Yx8WMZNzAsHXBrbEG3
	t6o+CRM3sXi//40dJvlHatjKg7Y1md9iN3idFOA1yIGjcIomnbU2k8kp9oBGcTjz
	VEBVMjii9dlknxbM+2FNxaJuajE+0dXdPCqTVARfAdlnUjIAWxguoN9ZxV5ZfxT1
	bHAfV73/1PF0bUSBG7OAbdnDxG/Muns4NrO94JfQDrje1/9sf4p6nTmQ0SwjXDyq
	Id77Gg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxy8q2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 00:39:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4560dgvO003826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 00:39:42 GMT
Received: from [10.110.119.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 17:39:42 -0700
Message-ID: <b48bb8b1-c76d-43bd-9858-3f0ad5a482be@quicinc.com>
Date: Wed, 5 Jun 2024 17:39:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] soc: qcom: pdr: fix parsing of domains lists
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        "Alexey
 Minnekhanov" <alexeymin@postmarketos.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
 <20240512-qcom-pd-mapper-v8-2-5ecbb276fcc0@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240512-qcom-pd-mapper-v8-2-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ySrjreK-V5IypEx_YQKAVSEeW97W4Cup
X-Proofpoint-GUID: ySrjreK-V5IypEx_YQKAVSEeW97W4Cup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060002



On 5/11/2024 2:56 PM, Dmitry Baryshkov wrote:
> While parsing the domains list, start offsets from 0 rather than from
> domains_read. The domains_read is equal to the total count of the
> domains we have seen, while the domains list in the message starts from
> offset 0.
> 
> Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/pdr_interface.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> index e014dd2d8ab3..d495ee736519 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -422,7 +422,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
>   		if (ret < 0)
>   			goto out;
>   
> -		for (i = domains_read; i < resp->domain_list_len; i++) {
> +		for (i = 0; i < resp->domain_list_len; i++) {
>   			entry = &resp->domain_list[i];
>   
>   			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

