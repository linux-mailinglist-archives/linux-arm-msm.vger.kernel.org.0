Return-Path: <linux-arm-msm+bounces-24804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CB91E41A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 17:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7E64B22657
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 15:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB2B16F0EF;
	Mon,  1 Jul 2024 15:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QjaDMQUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA216F0DB;
	Mon,  1 Jul 2024 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846846; cv=none; b=VylQpGiPLOfyRJ6Uxg18EN0MdRDYkMd11V7x9HojHFTiL/JizelWwCkKC5TyFYLq45Eyt2pmX4MwfbcxVWI3dL8p/vf02cQ2RtLaDEP2cGJotVepewhtDbEbvFa3pl3uuyaEPPTB055Lt2EbwvsVZtE4ysz1+Mmvu4fciOujPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846846; c=relaxed/simple;
	bh=wSN2WRLY+Xe+6qxwQjFfYTqSF5/HFUaEB/53b5MDRnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lMPsy9oFZn5rISwm8iQcv2FRA4zE+exTcJBwffl0vWREWHCSGuTArdsnik4gUiD1By/woOn/+C1nfq0eWeK7TT0a9vpIm48HT77WwJHl5959zBh3d5P9ZYRDqLRtGC60pd95eEyy+KSgXNbCP+g7BVYrHKc1fU0QpwZCddO5oGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QjaDMQUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461Avemw008672;
	Mon, 1 Jul 2024 15:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQ3YvqGNbJPrdYR49pZzdv+y394UYEj6P6+/Ln4atVY=; b=QjaDMQUC0kRX/WDa
	7W1OztEyTcA2Q3VuzygoYxKF91++DhW0ybWVOkQhr0+4hEQiswNpI5FNh/rBO8EU
	kQcMFyPTWpZcjibGfJayaQH+s/Zpnpn4QboJ75ZSdYMK64P1qR/Kkm9f1jOK9yXv
	LiV0Ed5uMJzGIx/KdrtRIm7Lal4NL0b63fvKr9UW730QK/JYOWXBr1Z1sF6A4Jy7
	UM72T7AEoNo9QpJUHLmG1asTNTC9xWzUmQZ4mAkHbNa9QaGrXZgIx9hYbeC6CObX
	7U8t9JTAhKFvNsuCIVN9LHHKUc8x6nOx4uS0tsOexYy050XwR5HKYmkFXtlNwMxn
	6q9GRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40297rms7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 15:13:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461FDqWp028369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 15:13:52 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 08:13:51 -0700
Message-ID: <36b8cdab-28d5-451f-8ca3-7c9c8b02b5b2@quicinc.com>
Date: Mon, 1 Jul 2024 09:13:50 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 2/3] bus: mhi: host: Add name for mhi_controller
Content-Language: en-US
To: Slark Xiao <slark_xiao@163.com>, <manivannan.sadhasivam@linaro.org>,
        <loic.poulain@linaro.org>, <ryazanov.s.a@gmail.com>,
        <johannes@sipsolutions.net>
CC: <netdev@vger.kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240701021216.17734-1-slark_xiao@163.com>
 <20240701021216.17734-2-slark_xiao@163.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240701021216.17734-2-slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mLF9_7pyKicC1jyI4l_K8XdkmRK64D3p
X-Proofpoint-GUID: mLF9_7pyKicC1jyI4l_K8XdkmRK64D3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_15,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=951
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010117

On 6/30/2024 8:12 PM, Slark Xiao wrote:
> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)".In order to
> fix this issue, we decide to use the device name of MHI controller
> to do a match in client driver side. Then client driver could set
> a corresponding mux_id value for this MHI product.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> +++ b/include/linux/mhi.h
> @@ -289,6 +289,7 @@ struct mhi_controller_config {
>   };
>   
>   /**
> + * @name: device name of the MHI controller

This needs to be below the next line

>    * struct mhi_controller - Master MHI controller structure
>    * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
>    *            controller (required)
> @@ -367,6 +368,7 @@ struct mhi_controller_config {
>    * they can be populated depending on the usecase.
>    */
>   struct mhi_controller {
> +	const char *name;
>   	struct device *cntrl_dev;
>   	struct mhi_device *mhi_dev;
>   	struct dentry *debugfs_dentry;


