Return-Path: <linux-arm-msm+bounces-28301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E384994E98C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 11:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF53283F59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 09:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6716D324;
	Mon, 12 Aug 2024 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GbqRh4b6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA220323;
	Mon, 12 Aug 2024 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454304; cv=none; b=ODuAlWnd1TgMNXW0DPtCKz5XyUZZssQ+4YNfrqpvRoBCEkQpJ/XarzfpBKfndSMMEH9ta2yn+a2LQSOL3cFBlEwuqeRTIaY541cIotDTdHtOXzYj2KiUmkCPQi9mFYNqfUrUyshA24dkAxuSL7LavwoVfh2ytlbb/RShwFC70hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454304; c=relaxed/simple;
	bh=waG2umAU2bULr6PEMnWoGimBLt6Km0H8zfsaKJVPGYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QHtW8PO14Z9dOwARW0xejWfloX+EF1x5HwwSJ/TgB75hverk4fBU6MW8MVSna+WVa0uUGQDT8sOs8FBVemyX8Ji87raAvFBDL9XmSE578x4ueBDKW+Az0bcEjBvZZ2sDAAIIJzRCBcz41Iw1biSb6MvhV82A/LnK1NhDexh2nCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GbqRh4b6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZnmN019486;
	Mon, 12 Aug 2024 09:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5Lz/MHwLGfnPyX3bPixTLVVYd1Wkht7f3w49V7ey2o=; b=GbqRh4b67lTmVuvR
	lOSzf6amH+LZWU7AfWhKRZdmSRD1fzN2qprcMNboiZepqdM9/5yyMcA1Y8bcOJ1O
	Zhpa1HaJOsIwx6yf6uA6472BiHSh6SPSBQIO5QpKzoN1ubnOaK23guv3CH4MCR/m
	foY1nywVq3Z6whHmxTokskpXtL2zLq1h/FTaNG3qmVZ6RFLeQjrmzojCcXmGZ5Pi
	jedIhmXXYZL9ISgTG/qw7jwLmtDyL4Lj2LkYghklb0ITsfwB9iPs2eT/FLjSn7RX
	HFln6RNuuZ2hIl0RWa4CaAwKI3xO9wFkSuouqfD8SxqiqKJR2yqOvi1ijyNm6StM
	QCp1ew==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18nbfjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 09:18:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C9I66b031122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 09:18:06 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 02:18:03 -0700
Message-ID: <f2b4555e-5c31-45a2-a6d0-da2689748c41@quicinc.com>
Date: Mon, 12 Aug 2024 17:18:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wXsXGHPgfypCwq2EHzgj_n3W7rmOrZb_
X-Proofpoint-ORIG-GUID: wXsXGHPgfypCwq2EHzgj_n3W7rmOrZb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=978 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120069

Gentle reminder for review :)

On 2024/7/30 18:30, Zhenhua Huang wrote:
> TBU driver has no runtime pm support now, adding pm_runtime_enable()
> seems to be useless. Remove it.
> 
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 36c6b36ad4ff..aff2fe1fda13 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
>   
>   static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>   {
> -	struct device *dev = &pdev->dev;
>   	int ret;
>   
>   	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
> @@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> -	if (dev->pm_domain) {
> -		pm_runtime_set_active(dev);
> -		pm_runtime_enable(dev);
> -	}
> -
>   	return 0;
>   }
>   

