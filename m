Return-Path: <linux-arm-msm+bounces-22083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDB900815
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 17:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABACC1F22768
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 15:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904EB1940A5;
	Fri,  7 Jun 2024 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cxsJ/S8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969615748C;
	Fri,  7 Jun 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717772480; cv=none; b=RJLYKOoZDDI4lewJ2WIC0NHHCwex3LiYhUQOPhm7ZlCK2Vpn7QVjvL9nJAkmx9XHKx/HAzW06px/15b0Ax9NqgXJVLqdEAo+HbUC6KKziZqyGENFudFczv1wTdDF9innKJnIbU/OWda+ZQnGEJReAP+BgSPQtG+c78bHqvhqCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717772480; c=relaxed/simple;
	bh=Q9lr0F6vvsDj287dKckyC5d+E36+L4qJZnU9JFJCiWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SrO+lqIxABz77k5j5Ka310V/M77whhNiHbBwFWJdPAI0kn66TTFG+WzVYYk4dMlVnkQkOSeTM0DIquarXw7J9Rm6pQW907J7uCpCy29Jx1aiBhU5Gd9vRh2wzsV92HAX62WqVXE2iKDc6qPKGmtxQsV0ywTLVVUFLH9Anw6xtTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cxsJ/S8z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457DveLM023664;
	Fri, 7 Jun 2024 15:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRazLU1zxZd5fncNEZHH39V//jvuj10tbiGEof211FI=; b=cxsJ/S8z8VhXBn8p
	mRUuJcIWMiwmWXGkN1QwCv8J2jHMWBmBsVTvq440Cf9wWIrUcCBuHAHD9mHOM4pU
	89a3bmjKlTygAW4tInOt54gr3JfL38VMISw7nSODlVrtlqW9m9mwWVPPNcaT+RV/
	K4uk7KxhjecBPktVt8XUxSboAFoYthxaIOFEdZ72vrexdNORMlEu1+2rFCmGBda3
	R1lACSh//Ed5+XTmSMy98DX3YRotK32/fPha8tfDlvXnHqN3Y4pb6nwVb7z234qC
	YqF3mcHI1Qaw9rnlgn6YDrHNEVLmVHp/6fhR9Mcel2bQfMpuvO1IjOoxoEaRCuWn
	lhNA2g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym0sf0qqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 15:01:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457F12M6012420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 15:01:02 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 08:01:01 -0700
Message-ID: <4370ae55-9521-d2da-62b9-42d26b6fbece@quicinc.com>
Date: Fri, 7 Jun 2024 09:01:00 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 1/2] bus: mhi: host: Import link_id item
Content-Language: en-US
To: Slark Xiao <slark_xiao@163.com>, <manivannan.sadhasivam@linaro.org>,
        <loic.poulain@linaro.org>, <quic_qianyu@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240607100114.452979-1-slark_xiao@163.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240607100114.452979-1-slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hvNZKNirWtan41QF6CeLjdWGwNd0doC2
X-Proofpoint-ORIG-GUID: hvNZKNirWtan41QF6CeLjdWGwNd0doC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_08,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070110

$Subject says this is patch 1 of 2, but I don't see a second patch nor a 
cover letter.

On 6/7/2024 4:01 AM, Slark Xiao wrote:
> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)".
> So we add a link id default value for SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 3 +++
>   include/linux/mhi.h                | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0b483c7c76a1..1f9de2730766 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
>   	unsigned int dma_data_width;
>   	unsigned int mru_default;
>   	bool sideband_wake;
> +	unsigned int link_default;
>   };
>   
>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>   	.dma_data_width = 32,
>   	.mru_default = 32768,
>   	.sideband_wake = false,
> +	.link_default = 112,
>   };
>   
>   static const struct mhi_channel_config mhi_mv3x_channels[] = {
> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>   	mhi_cntrl->mru = info->mru_default;
> +	mhi_cntrl->link_id = info->link_default;
>   
>   	if (info->edl_trigger)
>   		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index b573f15762f8..4da10b99c96e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -445,6 +445,7 @@ struct mhi_controller {
>   	bool wake_set;
>   	unsigned long irq_flags;
>   	u32 mru;
> +	u32 link_id;
>   };
>   
>   /**

None of this is actually used.  Dead code is generally not accepted.

-Jeff

