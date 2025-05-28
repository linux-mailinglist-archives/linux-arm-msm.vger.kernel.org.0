Return-Path: <linux-arm-msm+bounces-59676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDDAC66FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C783BAE5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236D21423F;
	Wed, 28 May 2025 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kSNlxrnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025D35979;
	Wed, 28 May 2025 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428344; cv=none; b=DEV9iMnKKXRoZk7qW56QNMB4fFThRexbpMnnAKJ9LpNunev9w4zi5ztcE4C7AqGruWOkRTsxyFTWZIi8NKh86Dv2pXRQ7OfvzCWaa3rwwwhOou+ysWU5E91HH5VtT+u0jD57XBNZ0gh2lSyw7JbZfHL1Em5qAyZpYEMpzZOOXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428344; c=relaxed/simple;
	bh=WbWs/tlIGND6mcqk6aVU2k/Acw8Y8mcQZ+hfMzQQ344=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l/TircpKMNaIA/ONt80nAn8lhLfpL0GlJEAz45ze2gXOQz5so0M6O378dS5A4Ai2hXiYJAQ1OZoy3VLJ1aklvgZl7KFYAXcnOEbyal9Rn6Pk47Sz1jMtVZqRYz8cTB54GpKZLvaUfRTpRqK+CNjHbc5b1T4MlzqJODOinPBDh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kSNlxrnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5msL3011831;
	Wed, 28 May 2025 10:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5s5GmI5pDtXZRla9B+b3OjKjzb3+4yCSmqxSPDmf2zI=; b=kSNlxrnxaXB1eqOZ
	zsX74pj5d1SlPXe74vKnv/n0Iu9nWi50o0wur1v4G2CZZF8lqM19+GS1a/r/x45k
	xar00WWzWMTME0Ufp1KG2VYAlgWBGlyYIh33u0ApJAouos4P7fIrHajUetV0fCJM
	cqBc9HYntsU8uD0dq1z/vK5q2vx8DCUtWxppKtqKX1DP8x6/0dbLGSkxJxeqlYz8
	xgqG1pG+weCogoKRmg2YIK/7C0knoyeqm5CQHVtx0ZML56LuEVg1U5GgVdLvQLSM
	VrvgqIQxfXOqQ7XLwafbcynEPFlORPXBGSM814+E3yCtqEJ0Q7pVfQhKvSCoSrw9
	e1oGZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p9xne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 10:32:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54SAWJ3w023266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 10:32:19 GMT
Received: from [10.217.218.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 03:32:17 -0700
Message-ID: <83ffede3-b435-475d-8754-04d9c66616d4@quicinc.com>
Date: Wed, 28 May 2025 16:02:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: pci: Disable runtime PM for QDU100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krishna Chaitanya Chundru
	<krishna.chundru@oss.qualcomm.com>
References: <20250425-vdev_next-20250411_pm_disable-v4-1-d4870a73ebf9@quicinc.com>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <20250425-vdev_next-20250411_pm_disable-v4-1-d4870a73ebf9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fiyv-ymSeSf7rDrP_Rr6aWxGMFmnRiBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5MSBTYWx0ZWRfX98ZZi85DaigV
 GbSQ141mhPSIpfojWg7x2A2cUnujuhZK7NOgLaUCK3QS/lYD/w04u7SHYHo3qkKV/HPSSUbUtQA
 4t9A2lmPWXJJhrId3Hp20h/C6n0QJRjGdD6chBldlHyMtQHA09FdS8hQGeCSgrpFDCjFMjfX4l1
 IiHOshiNXz9AFUAa0bw7QjQZb/pq8DY484sCkgwiuZAoHlTfO3vKHOR5XRwhSWOBH5/Y3HyMK/p
 fsMu4qsUdDp43FKKJtwypa+N0xczgnQW6dqDj5g9wUVI3UsH+UXnkebI+AcaOb3RZbhEFjwS8ZM
 UwPiFOwn3eIeZsuf3hsyeSmqSTOMdob/XCD2bK5Gn6vm6VEQ2fQnNuu8xpmEzga87oe/uIBwn+v
 P7PWHZDvG8EktS+SvsyQXLFeb4og3/KdvNeVgbhWipuXevFxWbfhoUNHHGA89aiHIauiLUOf
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6836e634 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K2TQCGjYwjeuO8Cq6osA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fiyv-ymSeSf7rDrP_Rr6aWxGMFmnRiBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280091

Gentle reminder, please help to review the change.

On 4/25/2025 12:49 PM, Vivek Pernamitta wrote:
> The QDU100 device does not support the MHI M3 state, necessitating the
> disabling of runtime PM for this device. It is essential to disable
> runtime PM if the device does not support M3 state.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v4:
> - updated commit test from LPM to M3
> - updated comments in code
> - Link to v3: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com
> 
> Changes in v3:
> - updated variable to no_m3 from pm_disable
> - Link to v2: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com
> 
> Changes in v2:
> - Updated device from getting runtime suspended by avoid skipping autosuspend.
> - Updated commit message.
> - Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
> ---
>   drivers/bus/mhi/host/pci_generic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa887952098661a488650053a357f883d1559b..49910b502d7c0b912f1dfba2c1ed6daa7b5583ef 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -43,6 +43,7 @@
>    * @mru_default: default MRU size for MBIM network packets
>    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>    *		   of inband wake support (such as sdx24)
> + * @no_m3: M3 is disabled
>    */
>   struct mhi_pci_dev_info {
>   	const struct mhi_controller_config *config;
> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>   	unsigned int dma_data_width;
>   	unsigned int mru_default;
>   	bool sideband_wake;
> +	bool no_m3;
>   };
>   
>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>   	.dma_data_width = 32,
>   	.sideband_wake = false,
> +	.no_m3 = true,
>   };
>   
>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -1270,8 +1273,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	/* start health check */
>   	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>   
> -	/* Only allow runtime-suspend if PME capable (for wakeup) */
> -	if (pci_pme_capable(pdev, PCI_D3hot)) {
> +	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
> +	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
>   		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>   		pm_runtime_use_autosuspend(&pdev->dev);
>   		pm_runtime_mark_last_busy(&pdev->dev);
> 
> ---
> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
> change-id: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
> 
> Best regards,


