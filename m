Return-Path: <linux-arm-msm+bounces-51215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F392A5EAD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5223189A052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 04:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5741F8BBF;
	Thu, 13 Mar 2025 04:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T5YUWVmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082C1F8BC0;
	Thu, 13 Mar 2025 04:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841667; cv=none; b=rifNXMUKFARu2d4T4piXhVndqNbzu32vMz3lfH4zA2cAbRIowzfc33aDDJSh+bZ2NU/0EIeOFMiDNWaj6p3udLg/46FoKvMSW31X+/5giABcwLDqEnn2zJ4GfdjU1EOx5rLUMx9OZ8pH+aCVcCvtaTHp6kmMzYmGDPtcJXA2IjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841667; c=relaxed/simple;
	bh=haMOG8SvsZFNLA9JjwTaop5b3QV/j0eeMGJwQnR/Nr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LT0yflhsoLiyAGCCQYqz6h5pG9yyEbAcmutfX2vEc5aHIDz+UNgRATQxkvuzVhZjomoDtTb/k3qnsEZhnv2k/Hwe0Vrh60fViutUDzn8JjDPPxrHPyxIrqVlUXfWrHXDUsPzXC9wKmWwPxv/IY2Lhx5/A4lFDHyEwWZMtuTP7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T5YUWVmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKGZqI027310;
	Thu, 13 Mar 2025 04:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+omwS4zOD3krlxWZ9VZc8lxuNjvgcYyMFteMfUbmwg=; b=T5YUWVmzkDd6ZSQt
	XuTBwdyC2WD/YrTLTTKeWjVfHJ3gtNT1fc5dVvuKC9zCXS2iHrQukuxldCkjPsR0
	GS5R46W4v3r/O/VQDVQ7Lps/PHBy7YOyMSmtFGzwFoCg/32dWLfpx+9X9eYtE07D
	KqrjoRrwtFBI6KS5iUsfmwjKoqhzhFDC+XDIVnxV/1D8/AlDlsizzTVA/QEh82s5
	uVsMdTrCeDtPWB8Thn8WISeNZb6SB8E3vUQCiXX0oamXtQRzXGLkhMeUgJnygS//
	aAhDu6surNZg3E1zrIhuQGXK6rZ95kkY4UZOdgjtCZEPIuA8eilStBaOVh2KrVCN
	8wRxOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2pvjc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:54:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D4sNc9008969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:54:23 GMT
Received: from [10.216.49.184] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 21:54:20 -0700
Message-ID: <6a6d8710-304a-d3b4-3721-cfda420019a3@quicinc.com>
Date: Thu, 13 Mar 2025 10:24:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
Content-Language: en-US
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d26500 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8m1hBGtWhn_4BuljV5MA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4xnvpsKBzDPQn7ztB15j76H7lamVbZDi
X-Proofpoint-ORIG-GUID: 4xnvpsKBzDPQn7ztB15j76H7lamVbZDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130036



On 3/6/2025 11:02 PM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
> notification from the device.  The syserr notification queues a work item
> that cannot execute until the pm_mutex is released.
> 
> If we receive a syserr notification at the right time during
> mhi_async_power_up(), we will fail to initialize the device.
> 
> The syserr work item will be pending.  If mhi_async_power_up() detects the
> syserr, it will handle it.  If the device is in PBL, then the PBL state
> transition event will be queued, resulting in a work item after the
> pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
> the syserr work item can run.  It will blindly attempt to reset the MHI
> state machine, which is the recovery action for syserr.  PBL/SBL are not
> interrupt driven and will ignore the MHI Reset unless syserr is actively
> advertised.  This will cause the syserr work item to timeout waiting for
> Reset to be cleared, and will leave the host state in syserr processing.
> The PBL transition work item will then run, and immediately fail because
> syserr processing is not a valid state for PBL transition.
> 
> This leaves the device uninitialized.
> 
> This issue has a fairly unique signature in the kernel log:
> 
> [  909.803598] mhi mhi3: Requested to power ON
> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
> [  909.803945] mhi mhi3: Power on setup success
> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
> [  911.808448] mhi mhi3: Device MHI is not in valid state
> 
> We cannot remove the syserr handling from mhi_async_power_up() because the
> device may be in the syserr state, but we missed the notification as the
> irq was fired before irqs were enabled.  We also can't queue the syserr
> work item from mhi_async_power_up() if syserr is detected because that may
> result in a duplicate work item, and cause the same issue since the
> duplicate item will blindly issue MHI Reset even if syserr is no longer
> active.
> 
> Instead, add a check in the syserr work item to make sure that the device
> is in the syserr state if the device is in the PBL or SBL EEs.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..3dff0f932726 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>   	struct mhi_cmd *mhi_cmd;
>   	struct mhi_event_ctxt *er_ctxt;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	bool reset_device = false;
>   	int ret, i;
>   
>   	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
> @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>   	/* Wake up threads waiting for state transition */
>   	wake_up_all(&mhi_cntrl->state_event);
>   
> -	/* Trigger MHI RESET so that the device will not access host memory */
> +	/*
> +	 * Trigger MHI RESET so that the device will not access host memory.
> +	 * If the device is in PBL or SBL, it will only respond to RESET if
> +	 * the device is in SYSERR state.  SYSERR might already be cleared
> +	 * at this point.
> +	 */
>   	if (MHI_REG_ACCESS_VALID(prev_state)) {
> +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
> +		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
> +
> +		if (cur_statemachine_state == MHI_STATE_SYS_ERR)
> +			reset_device = true;
> +		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
why do we need this check? Above check will be applicable when EE is in
MHI_EE_AMSS also. we can reset mhi only when current state is in SYS_ERR
irrespective of the current ee.

- Krishna Chaitanya.
> +			reset_device = true;
> +	}
> +
> +	if (reset_device) {
>   		u32 in_reset = -1;
>   		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
>   

