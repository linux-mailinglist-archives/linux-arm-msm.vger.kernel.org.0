Return-Path: <linux-arm-msm+bounces-54736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39184A9378D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731C23B23F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607B020A5C3;
	Fri, 18 Apr 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FlW3vF+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55D2033A;
	Fri, 18 Apr 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981269; cv=none; b=f5doQqJneYUXKQjsRy5xFLJF+KrvHp5bTk3ty+VVsmPv8XqqAuXR9D8cGQleV3OfrT2Bv22j2X3R7SH4kR2lBT8XihtZG4m3tmf6xkjQsK+l5dIXhPmPy1ZEWGB1n0TRHwMGxXyW4EwTJXxGin6lqY5bdI+kO8SDf1bLXGl1HOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981269; c=relaxed/simple;
	bh=/uYZre4qkYKSHJohff8hCdwS8VH/8ltf2MbR4J+1pzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aQBqJE7t6rI9HxlL0CwrAQBKhzmLE9A4vHMX8fcz5iOzBJTU8E/ykewzMH99rUgicp+BgeT3q4oH2IsvjPWtW4PIS0Nbi84FgKmKaq3tX12ZuGFakzu9iCghfOYYibxClxF5NzT3yeD7fLPTHoSZbDyMn1qSWb25JZt345VueuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FlW3vF+n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2Zodo031946;
	Fri, 18 Apr 2025 13:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcBxXtm1f8aYCr+6mVmNc/jU0+alZPZyythaiyCMuEQ=; b=FlW3vF+n3TDsMq32
	uxI9L/IaV0iGJ/7raV2m+Lo75zipTwht/mjzUvtz9umAov/LY6ijlW5vpM0lq1eN
	jA0RJjR51F2Vm6RYNDjLJveMal9lP8ZDZ4BlYRKyaT2ZrooR6amQStqwO4f+LMMs
	TosEFOSFkz9c3dv3eYlVcws1VeGJXg9p5Onv2JcCjd5k8DwdkXBm5cYNEo6fqcv9
	/I2sWLcDXB1lY+gc1vY5GZkjbRiVuDwb+bFL63OG4xG+DlJyVuNfUH8aYdWF4qWY
	J0WJWRKi68/0pXcFbLbiqgwQQqU4N8uExb7usjJS/8gtDk26P99LTvOsUCC/c5KZ
	808zzQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wt0vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:01:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53ID147Y012637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:01:04 GMT
Received: from [10.216.59.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 06:01:01 -0700
Message-ID: <d567e604-bd24-e6bd-92c8-932e0f18dc1f@quicinc.com>
Date: Fri, 18 Apr 2025 18:30:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] bus: mhi: host: pci: Disable runtime PM for QDU100
Content-Language: en-US
To: Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68024d11 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=quWB0j8F2bd0t1ZcvaEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wHFfYsoc-oY6WRnXjcneXIDUmu12JJvE
X-Proofpoint-GUID: wHFfYsoc-oY6WRnXjcneXIDUmu12JJvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180096



On 4/18/2025 5:20 PM, Vivek Pernamitta wrote:
> The QDU100 device does not support the MHI M3 state, necessitating the
> disabling of runtime PM for this device. It is essential to disable
> runtime PM if the device does not support Low Power Mode (LPM).
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated device from getting runtime suspended by avoid skipping autosuspend.
> - Updated commit message.
> - Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
> ---
>   drivers/bus/mhi/host/pci_generic.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa887952098661a488650053a357f883d1559b..bec1ca17ad69ac89e2ea9142024fef8bded258b6 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -43,6 +43,7 @@
>    * @mru_default: default MRU size for MBIM network packets
>    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>    *		   of inband wake support (such as sdx24)
> + * @pm_disable: disables runtime PM (optional)
>    */
>   struct mhi_pci_dev_info {
>   	const struct mhi_controller_config *config;
> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>   	unsigned int dma_data_width;
>   	unsigned int mru_default;
>   	bool sideband_wake;
> +	bool pm_disable;
>   };
>   
>   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>   	.dma_data_width = 32,
>   	.sideband_wake = false,
> +	.pm_disable = true,
>   };
>   
>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -1270,8 +1273,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	/* start health check */
>   	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>   
> -	/* Only allow runtime-suspend if PME capable (for wakeup) */
> -	if (pci_pme_capable(pdev, PCI_D3hot)) {
> +	/**
> +	 * Disable Runtime PM if device doesn't support MHI M3 state
> +	 * and Allow runtime-suspend if PME capable (for wakeup)
> +	 */
> +	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->pm_disable)) {
>   		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>   		pm_runtime_use_autosuspend(&pdev->dev);
>   		pm_runtime_mark_last_busy(&pdev->dev);
> 
> ---
> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
> change-id: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
> 
> Best regards,

