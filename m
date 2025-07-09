Return-Path: <linux-arm-msm+bounces-64235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E775FAFE91B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C65901C80363
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52892D6630;
	Wed,  9 Jul 2025 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cDL6Nv6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B228A71D;
	Wed,  9 Jul 2025 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064723; cv=none; b=jjb0qgMRCGL8crseKtGDsL8D8OEWXN8z8XbAv1vCoRaWnMw6W+uHn/gOirEgW0Cz47sXJx0ydsON7qm+LTeepoueTW3e9B+7xlhdqxFgni0Hx9r+4Fd+qM/Ph8glTS+i+1Sw0vfL0xmTyA207TkCHSFF2Tm740MqcabAaj9uxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064723; c=relaxed/simple;
	bh=zyoA+jBdLJJhxdQpK/+pNIOJguP7t0u4kDbqYLLI3hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dHpMSwVgjn53IlpaARRL03DsQ+b5DkzpqFNaMYL2Gs7evMjTIaEFMUAh/w1YrIQfwb/x96y/h1KY8SMLVaKdy22T0eQEfsWMTPMGRhlvdtMrJFdjechWo8Zpugi5VneRTwSZZaJ8AdEdCMAalou2R1rEYKX17vW7+Ilou2/Znig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cDL6Nv6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697nTBH008027;
	Wed, 9 Jul 2025 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUQgfRqG+5ozp//TiRnugXFYZg2/nFlhBnJ9wVrsPjQ=; b=cDL6Nv6BYSL7FNNg
	/gRMbsV2PldpNrPqTUtYj7Ay8dF7Ju/rYfYtyCVXUrL9yd9jXilgFKtELMhRYHgi
	rLG/Edh3mizAAkluFvizeyh0UuYHhKoIVee4BsEaXXRU1WIEiD1dJDO2nL99qTH0
	qdcTpYGzGMWTct5PKvZCRZqhVUWIXnu9IbT01kD119V0Qx9K30xg+o2TaG/YZxnb
	az9dk5Dt2EpsfXsn9uvRnv+pN7BQOCBVWUiWrxzrL1oEQGRpUEJiumUQTNZuPuDM
	FFeYyrgnrxr/zhCvkWp9vZvU+xuh8Yvcy6QOsoQUymMsupGoUl94CRT5Y3RVHzmr
	4NnT+g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg0xgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 12:38:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569CcdVm002960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 12:38:39 GMT
Received: from [10.218.37.122] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 05:38:36 -0700
Message-ID: <d1c3a9cc-13fb-47be-a3fa-3ae5bff516fd@quicinc.com>
Date: Wed, 9 Jul 2025 18:08:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] bus: mhi: host: Add support for separate controller
 configurations for VF and PF
To: <Vivek.Pernamitta@quicinc.com>, Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-2-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-2-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686e62cf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ljfrh_M9o-RCrfJy5NoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: I2yK6pRMihUSnwa4N0_Qane3LY_ltzY-
X-Proofpoint-GUID: I2yK6pRMihUSnwa4N0_Qane3LY_ltzY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExMiBTYWx0ZWRfX5hwdUQkwiexu
 fXJqEOQnU/AWIivmOeQ1f7YeZj+bMIwPVKMN2V8EURiSLHwhvCbn2I5DLYS2L0tPCtNLLZG3tGS
 nhOHDYNg1Arl1vbB+1PVf2e6LYU2D+uhQPcQgFdpdZT8UZeY2oYNWI7scZa+LJU0owJG2pgg55P
 OtQzdihG+Ko89TENyCx7blbkYWDqI63LuTQV1HbCkeavpW+T+oCWfD2ZsgMATIMKxGSW8i+MUKg
 IMs/J+q5T+/REx+8FeyAqbr4G9n3yVEIlM++5/cS35aOux69wxhFW3YWX51pgA0kn/g80dwK+FU
 66v7jGRS0FPBeM5sxQpngIBaIBEd3hc8mfVltRaPv4QiCXmNiYTTsnb0w58lf4CiG+KeuCQ0hx2
 cGKCvwtkmq5RdG2Nk0VNikbz5ytoQERsDdMck3d7DoVPPxqJ5WAcAoR3DLwUjrun3een3QNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090112



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Implement support for separate controller configurations for both
> Virtual Functions (VF) and Physical Functions (PF).
> 
> This enhancement allows for more flexible and efficient management of
> resources. The PF takes on a supervisory role and will have bootup
> information such as SAHARA, DIAG, and NDB (for file system sync data,
> etc.). VFs can handle function-specific data transfers, such as data plane
> or hardware data.
Better cite the spec which points PF takes supervisory role.

With that added.

Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 3e6e2d38935927cf3352c039266cae7cadb4c118..22de02c26ceb946fb618d962ac8882d2db1be6b4 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -34,6 +34,7 @@
>   /**
>    * struct mhi_pci_dev_info - MHI PCI device specific information
>    * @config: MHI controller configuration
> + * @vf_config: MHI controller configuration for Virtual function (optional)
>    * @name: name of the PCI module
>    * @fw: firmware path (if any)
>    * @edl: emergency download mode firmware path (if any)
> @@ -47,6 +48,7 @@
>    */
>   struct mhi_pci_dev_info {
>   	const struct mhi_controller_config *config;
> +	const struct mhi_controller_config *vf_config;
>   	const char *name;
>   	const char *fw;
>   	const char *edl;
> @@ -1242,9 +1244,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		return -ENOMEM;
>   
>   	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> +
> +	if (pdev->is_virtfn && info->vf_config)
> +		mhi_cntrl_config = info->vf_config;
> +	else
> +		mhi_cntrl_config = info->config;
> +
>   	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>   
> -	mhi_cntrl_config = info->config;
>   	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>   
>   	mhi_cntrl->cntrl_dev = &pdev->dev;
> 

