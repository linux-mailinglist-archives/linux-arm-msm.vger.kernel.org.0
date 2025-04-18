Return-Path: <linux-arm-msm+bounces-54696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04801A931E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 08:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ED4A7AFF76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 06:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A5A263C71;
	Fri, 18 Apr 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EmQBwxrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B336372;
	Fri, 18 Apr 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957553; cv=none; b=Y4iY7l1VJnYLZXRcEqHw3PULFEUIZxBgWyHAeeLLNCwTMMq0JhYSOLSNQnqHfcbYId0M+113ETeOyFg62QChWbmSDGjTD/sFyGVSA2KERfIQ4uR4N/1Z6OEzwltAKpiErwUoQ+B7MI5RiH3MzU/gLaGuoZdLJuA0qsaoqfxgMWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957553; c=relaxed/simple;
	bh=A3JB1+g2ey7eSQvfIGRxvpH1XHUJCO1BsK6h6N5SBic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f7XIpAgQjWYGnfGh4Bc5+vunJmRyd+7Ay5WMQsMnYsVHWYPQeaz2X3/B5NrcAxS1HsErBK16qU2U+czzR7RpluHOWCSenVgPgdSp1IMlXitg2b8SvqgIbBly9hnI0WvIA6elUXSAaDP5IVvdqoSbXApga+bI62BvwNmk5G9VcjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EmQBwxrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2h1Or015566;
	Fri, 18 Apr 2025 06:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxV/amH2PTImDgAg2LbHh7SCSlVoGrVcagrcyiNUoEM=; b=EmQBwxrKqw1RNQy9
	27iPbBwI9EmBV2SmOsJFhVRa5stEl48cSsm1Ff5QaDpE985IM4Zj9J7jTbUwElRq
	kdy75BOJ6MZyt0R3IVZABDBrrJtSrQ59Vymipd1Z5xbWUUH8Egsaopi7mtI1Whpe
	hMrW7nEho8QulESQln5ylsfggHBg5slct26BZZ68inFE85vUsfdfWqOANCHrqIni
	uEwYSvPDcoZt7zDEPETc6kganpO10d3X58Y2XTgOmyizM5RtAyXHTCjYgEkIlDYp
	sY382BX5kGFTRxiEwaI5rJ8lKcXCd3qA8pEoqpPjVTGH2AG9vP1V+YuKcrd96g3p
	Bb5Qwg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1h23n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:25:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6PTuQ003504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:25:29 GMT
Received: from [10.218.37.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 23:25:27 -0700
Message-ID: <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
Date: Fri, 18 Apr 2025 11:55:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Veerabhadrarao
 Badiganti" <quic_vbadigan@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
Content-Language: en-US
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
In-Reply-To: <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6801f06d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=5splDiyMspqWzW5FlnYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -1qtdRK8uES4Md9mDViHDgbe1B1L1ZhI
X-Proofpoint-ORIG-GUID: -1qtdRK8uES4Md9mDViHDgbe1B1L1ZhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180046



On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
>>
>> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
>>> The QDU100 device does not support the MHI M3 state, necessitating the
>>> disabling of runtime PM for this device. Since the PCIe core framework
>>> enables runtime PM by default for all clients, it is essential to disable
>>> runtime PM if the device does not support Low Power Mode (LPM).
>>>
>>> Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
>>> ---
>>>    drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>> index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>> @@ -43,6 +43,7 @@
>>>     * @mru_default: default MRU size for MBIM network packets
>>>     * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>>>     *		   of inband wake support (such as sdx24)
>>> + * @pm_disable: disables runtime PM (optional)
>>>     */
>>>    struct mhi_pci_dev_info {
>>>    	const struct mhi_controller_config *config;
>>> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>>>    	unsigned int dma_data_width;
>>>    	unsigned int mru_default;
>>>    	bool sideband_wake;
>>> +	bool pm_disable;
>>>    };
>>>    #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>>> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>>    	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>>>    	.dma_data_width = 32,
>>>    	.sideband_wake = false,
>>> +	.pm_disable = true,
>>
>> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> 
> Yes!
> 
> But does the device not supporting M3 only or D3Hot also? If the former, then we
> should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
> There is an incentive in allowing D3Hot if the device supports it.
> 
> Also, is there a way we could probe M3 support in the device so that we can
> check it during runtime?
> 
> - Mani
> 
In QDU100 device does not support M3 state, D3_hot will be supported. As 
QDU100 is an accelerator card which needs high-throughout, LPM needs to 
disabled here. So we are trying to disable runtime PM here, without M3 , 
D3_hot will not have effect in QDU100.
Also in MHI we don't have provision to check device M3 capability, so we 
are trying to disable runtime PM here.


