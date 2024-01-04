Return-Path: <linux-arm-msm+bounces-6479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B326824576
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 16:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4F51F23D98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 15:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67398249E8;
	Thu,  4 Jan 2024 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pgGa/3xJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADE249E0;
	Thu,  4 Jan 2024 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 404EmNW3031338;
	Thu, 4 Jan 2024 15:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=d3t/AKtV8S2PoPtQjZ+XrZmQLRnPZJO8bd1SUsUW0Q0=; b=pg
	Ga/3xJA8Wiv+yInqVKKn4IT9se0Z5qp4ITaZaROU8TUVkfKg5bcE0p9X1kTnYbHo
	Qc7IKWlBUVs8/kUTTQZn+ga+Yl22CDqypx3NFq1kXnw9Fl422S1bto6OCpD2/ATS
	QJC4YOv/jIVCTqJXfajoVzmZNd76qF0j4iU/2CY10DIX7MGlOMs3DCeV6NFg4Af1
	eNYx+myiYlxzL1FIOa9wkliBv3KkOlfoN+7q3mj1WhrycQIVIcG9YqJ+VzdLz9Ap
	HA5G/cMT0YuhbTMtBP79FMyM3r4lNvlKoJ9VekxIorogp+h77WkuZIZWw32O9IAS
	xSBiF4INGzNYQTpndeVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdx2809b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 15:53:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 404FrnsB017663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jan 2024 15:53:49 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 4 Jan
 2024 07:53:48 -0800
Message-ID: <1dfa480c-d200-ff64-3c96-93a7a5a1a490@quicinc.com>
Date: Thu, 4 Jan 2024 08:53:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <20231208221353.1560177-1-quic_jhugo@quicinc.com>
 <20240104112625.GD3031@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240104112625.GD3031@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6LcukBZnS9sttJLfCTC22VMbrT9Tnogd
X-Proofpoint-ORIG-GUID: 6LcukBZnS9sttJLfCTC22VMbrT9Tnogd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040125

On 1/4/2024 4:26 AM, Manivannan Sadhasivam wrote:
> On Fri, Dec 08, 2023 at 03:13:53PM -0700, Jeffrey Hugo wrote:
>> When processing a SYSERR, if the device does not respond to the MHI_RESET
>> from the host, the host will be stuck in a difficult to recover state.
> 
> Under what scenario this can happen? Is the device not honoring MHI_RESET state
> or crashed completely?

Digging up my notes from this patch, it was originally discovered via 
soc_reset stress testing.

On AIC100 (and I assume other MHI devices because the hardware 
implementation is common), soc_reset is processed entirely in hardware. 
  When the register write hits the endpoint, it causes the soc to reset 
without firmware involvement.

If you stress test soc_reset and hit the timing just right, you can have 
PBL signal syserr (fatal error) for soc_reset N, and then before PBL can 
process the MHI_RESET request from the host, soc_reset N+1 hits the 
endpoint causing the soc to reset, and re-run PBL from the beginning 
which causes PBL to lose all state.  This is how we discovered this 
issue, although the reproduction rate was rather low.

I was able to hack the AMSS EE firmware (QSM) to synthetically reproduce 
the issue as well.  Send a trigger to QSM via an unused MHI register to 
invoke syserr (non-fatal error), and then have QSM ignore the MHI_RESET 
request which would simulate some kind of FW hang.  soc_reset would not 
recover the device.

> 
> - Mani
> 
>> The host will remain in MHI_PM_SYS_ERR_PROCESS and not clean up the host
>> channels.  Clients will not be notified of the SYSERR via the destruction
>> of their channel devices, which means clients may think that the device is
>> still up.  Subsequent SYSERR events such as a device fatal error will not
>> be processed as the state machine cannot transition from PROCESS back to
>> DETECT.  The only way to recover from this is to unload the mhi module
>> (wipe the state machine state) or for the mhi controller to initiate
>> SHUTDOWN.
>>
>> In this failure case, to recover the device, we need a state similar to
>> PROCESS, but can transition to DETECT.  There is not a viable existing
>> state to use.  POR has the needed transitions, but assumes the device is
>> in a good state and could allow the host to attempt to use the device.
>> Allowing PROCESS to transition to DETECT invites the possibility of
>> parallel SYSERR processing which could get the host and device out of
>> sync.
>>
>> Thus, invent a new state - MHI_PM_SYS_ERR_FAIL
>>
>> This essentially a holding state.  It allows us to clean up the host
>> elements that are based on the old state of the device (channels), but
>> does not allow us to directly advance back to an operational state.  It
>> does allow the detection and processing of another SYSERR which may
>> recover the device, or allows the controller to do a clean shutdown.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/init.c     |  1 +
>>   drivers/bus/mhi/host/internal.h |  9 ++++++---
>>   drivers/bus/mhi/host/pm.c       | 20 +++++++++++++++++---
>>   3 files changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index e2c2f510b04f..d3f919277cf9 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -62,6 +62,7 @@ static const char * const mhi_pm_state_str[] = {
>>   	[MHI_PM_STATE_FW_DL_ERR] = "Firmware Download Error",
>>   	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS ERROR Detect",
>>   	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS ERROR Process",
>> +	[MHI_PM_STATE_SYS_ERR_FAIL] = "SYS ERROR Failure",
>>   	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
>>   	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "Linkdown or Error Fatal Detect",
>>   };
>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
>> index 30ac415a3000..4b6deea17bcd 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -88,6 +88,7 @@ enum mhi_pm_state {
>>   	MHI_PM_STATE_FW_DL_ERR,
>>   	MHI_PM_STATE_SYS_ERR_DETECT,
>>   	MHI_PM_STATE_SYS_ERR_PROCESS,
>> +	MHI_PM_STATE_SYS_ERR_FAIL,
>>   	MHI_PM_STATE_SHUTDOWN_PROCESS,
>>   	MHI_PM_STATE_LD_ERR_FATAL_DETECT,
>>   	MHI_PM_STATE_MAX
>> @@ -104,14 +105,16 @@ enum mhi_pm_state {
>>   #define MHI_PM_FW_DL_ERR				BIT(7)
>>   #define MHI_PM_SYS_ERR_DETECT				BIT(8)
>>   #define MHI_PM_SYS_ERR_PROCESS				BIT(9)
>> -#define MHI_PM_SHUTDOWN_PROCESS				BIT(10)
>> +#define MHI_PM_SYS_ERR_FAIL				BIT(10)
>> +#define MHI_PM_SHUTDOWN_PROCESS				BIT(11)
>>   /* link not accessible */
>> -#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(11)
>> +#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(12)
>>   
>>   #define MHI_REG_ACCESS_VALID(pm_state)			((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
>>   						MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
>>   						MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
>> -						MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
>> +						MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |  \
>> +						MHI_PM_FW_DL_ERR)))
>>   #define MHI_PM_IN_ERROR_STATE(pm_state)			(pm_state >= MHI_PM_FW_DL_ERR)
>>   #define MHI_PM_IN_FATAL_STATE(pm_state)			(pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
>>   #define MHI_DB_ACCESS_VALID(mhi_cntrl)			(mhi_cntrl->pm_state & mhi_cntrl->db_access)
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index a2f2feef1476..d0d033ce9984 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -36,7 +36,10 @@
>>    *     M0 <--> M0
>>    *     M0 -> FW_DL_ERR
>>    *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
>> - * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
>> + * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS
>> + *     SYS_ERR_PROCESS -> SYS_ERR_FAIL
>> + *     SYS_ERR_FAIL -> SYS_ERR_DETECT
>> + *     SYS_ERR_PROCESS --> POR
>>    * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
>>    *     SHUTDOWN_PROCESS -> DISABLE
>>    * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
>> @@ -93,7 +96,12 @@ static const struct mhi_pm_transitions dev_state_transitions[] = {
>>   	},
>>   	{
>>   		MHI_PM_SYS_ERR_PROCESS,
>> -		MHI_PM_POR | MHI_PM_SHUTDOWN_PROCESS |
>> +		MHI_PM_POR | MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |
>> +		MHI_PM_LD_ERR_FATAL_DETECT
>> +	},
>> +	{
>> +		MHI_PM_SYS_ERR_FAIL,
>> +		MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>>   		MHI_PM_LD_ERR_FATAL_DETECT
>>   	},
>>   	/* L2 States */
>> @@ -629,7 +637,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>>   					!in_reset, timeout);
>>   		if (!ret || in_reset) {
>>   			dev_err(dev, "Device failed to exit MHI Reset state\n");
>> -			goto exit_sys_error_transition;
>> +			write_lock_irq(&mhi_cntrl->pm_lock);
>> +			cur_state = mhi_tryset_pm_state(mhi_cntrl,
>> +							MHI_PM_SYS_ERR_FAIL);
>> +			write_unlock_irq(&mhi_cntrl->pm_lock);
>> +			/* Shutdown may have occurred, otherwise cleanup now */
>> +			if (cur_state != MHI_PM_SYS_ERR_FAIL)
>> +				goto exit_sys_error_transition;
>>   		}
>>   
>>   		/*
>> -- 
>> 2.34.1
>>
>>
> 


