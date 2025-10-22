Return-Path: <linux-arm-msm+bounces-78419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC99BFE67D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8ACD935502C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3410C30595A;
	Wed, 22 Oct 2025 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EmYvNt9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC622FF660;
	Wed, 22 Oct 2025 22:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171760; cv=none; b=p+cwOqQ2s0rJ0K/H8O2q70d/Kf2y9wH7rJHA8vXD7CQ+kzRqGHPn6PLrqreY+p3q71IlgBJ4PlkXg1Bqkt5Ky5IGhFjEBtCYDpo4MYaKXfqHswAxBUnizennjrzxSgQC8KP259apRw4+E2OiRjCfi6d4z/ofRjxcqni1cfU0SOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171760; c=relaxed/simple;
	bh=uNQhwswo1YvUudEgOpcAJyv+vBTeIG9XZjUwtbOBhgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uoTubkeMmoYc84ir/BEMbTZ5PD/Xh8p8wO3+r04CipW9JnY0QcA/6BWERnzSO3uQ1YM6gjO9GnCSIRVfcLeetiKr7jyhqY+HlB1n31kJ++wbafwsFCYGpo2Vgpu3TgGm2xnfj1rb9H7fbqEoTpbA1PdenETCZxiJfeI3Ol8kOuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EmYvNt9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MKLRmI019068;
	Wed, 22 Oct 2025 22:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4gHHP1JLz6sjv87V8Qo/SoKJ9Chb9A4OcU/5L2+g44o=; b=EmYvNt9gXxNj1GHr
	+i6zaWz4J3W0CdyXfJH8IXXlXlaQ5z9BPN5b407DpP1VJj6FGTAqCnemIhfTjnOe
	IeGYEoT7lyK1vlzSAUe03vyahmMjSDQXDBk/cfZYH647luftDZFAoAB9CQSWI7J7
	GzC7s/VRgRJVRd9d0YirLlq8yYkf0FSdyQxZofR8BRFc6G/pn/4tobRhFkpZppCe
	1yIzHkFNnDUpbkTIYv6GqKs6sRDODuHHvS2bClzHXyKaxYtg40Bex0cMUEELHYU4
	uSE24cwwWsyAX5RZKueuxL+wlmB7HCMO9jCVC27cYYVZWzzm8snZJSYae9L3zM6M
	AFpHVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qg7na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 22:22:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59MMMSFX031593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 22:22:28 GMT
Received: from [10.216.62.87] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 22 Oct
 2025 15:22:25 -0700
Message-ID: <f03e7fa4-f49a-4d4c-8e52-867449c12ace@quicinc.com>
Date: Thu, 23 Oct 2025 03:52:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power
 down(PC=3)
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <bvanassche@acm.org>, <konrad.dybcio@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX4szcw/lVdY0I
 T2L1u/wBfMuJ7q+4w7OztW1woP7RoDfO+tSMesEuuDvl1HWYnT2LfsKv3vEjkhdt2BjjGwhqxOg
 gmlBPwdGiLJ0dtBDhWthKHRslBahM80tA0es0mMvDUZrD8M4wJ7V5dmfOY8CNKQ2DSmr/GLdoxU
 GNPtlfHe5YLyICgFsKt9cnFFr8M66PevvLZHZGKoSN28nCihoa2BEN+dvX0SsPpY9Vq3FU95v2e
 5NsYQRZgMYzq9QOxVdM+MQQNiyjHBZ70fhZ5zaVcu9G0mlam/6ckIKdHXNjRXAJamIHlHB8RFV3
 GlADdGiURbaBQSH1EKRqku2GKzd2/V9/FIUb49j8Ln7UZtVCyhe7s9b2G7e/cK8y6UW+IQRXYNe
 EX15c07rfJ/iTa5HuOEUhXRncWBRLQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f95925 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xZ3OjXKg_-HuRwZWpiwA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: KP754WaCl-oCOoTOaVdiwY1ItV-a86t7
X-Proofpoint-ORIG-GUID: KP754WaCl-oCOoTOaVdiwY1ItV-a86t7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168



On 10/12/2025 11:08 PM, Nitin Rawat wrote:
> According to UFS specifications, the power-off sequence for a UFS
> device includes:
> 
> - Sending an SSU command with Power_Condition=3 and await a
>    response.
> - Asserting RST_N low.
> - Turning off REF_CLK.
> - Turning off VCC.
> - Turning off VCCQ/VCCQ2.
> 
> As part of ufs shutdown , after the SSU command completion, asserting
> hardware reset (HWRST) triggers the device firmware to wake up and
> execute its reset routine. This routine initializes hardware blocks
> and takes a few milliseconds to complete. During this time, the
> ICCQ draws a large current.
> 
> This large ICCQ current may cause issues for the regulator which
> is supplying power to UFS, because the turn off request from UFS
> driver to the regulator framework will be immediately followed by
> low power mode(LPM) request by regulator framework. This is done
> by framework because UFS which is the only client is requesting
> for disable. So if the rail is still in the process of shutting down
> while ICCQ exceeds LPM current thresholds, and LPM mode is activated
> in hardware during this state, it may trigger an overcurrent
> protection (OCP) fault in the regulator.
> 
> To prevent this, a 10ms delay is added after asserting HWRST. This
> allows the reset operation to complete while power rails remain active
> and in high-power mode.
> 
> Currently there is no way for Host to query whether the reset is
> completed or not and hence this the delay is based on experiments
> with Qualcomm UFS controllers across multiple UFS vendors.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 89a3328a7a75..cb54628be466 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -744,8 +744,21 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> 
> 
>   	/* reset the connected UFS device during power down */
> -	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> +	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
>   		ufs_qcom_device_reset_ctrl(hba, true);
> +		/*
> +		 * After sending the SSU command, asserting the rst_n
> +		 * line causes the device firmware to wake up and
> +		 * execute its reset routine.
> +		 *
> +		 * During this process, the device may draw current
> +		 * beyond the permissible limit for low-power mode (LPM).
> +		 * A 10ms delay, based on experimental observations,
> +		 * allows the UFS device to complete its hardware reset
> +		 * before transitioning the power rail to LPM.
> +		 */
> +		usleep_range(10000, 11000);
> +	}
> 
>   	return ufs_qcom_ice_suspend(host);
>   }
> --
> 2.50.1
> 
> 


Gentle reminder for review!!


