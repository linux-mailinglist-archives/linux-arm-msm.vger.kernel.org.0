Return-Path: <linux-arm-msm+bounces-64238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F0AFE966
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760DB16DAD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653442D9499;
	Wed,  9 Jul 2025 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JIHtqLsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2151A285;
	Wed,  9 Jul 2025 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065451; cv=none; b=SkD4oW+y5xa54vKSLE/VVeEimbmWJpYqhZG6ATf/qUdgS0xMGEjQrlDxKCh3auqhvtY8ZikKTR6Bdfv0sb3D9j2o9IVaA1jKbHwkWYcy6M0mTqIbAY5k62Zp2caSszqeGZWUIVEPKf2ubMckixXgOF2dkMagxgB0JoVawwY4Gok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065451; c=relaxed/simple;
	bh=1GB3eGj3uZ+JavVNrHayoVCttNq8ZKTq+hTeX3mhPdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WOd82sT5JBWAaXov/QPpoN4qcwoN36WtyFcl6xsGfzD1mH31E1Emn77Fl6wLdop31TqtXs3Uw0bLTGdv7u87IMs2dpKKRjr6XzRyRsph+h+HJOpogSgyJqvo/R+gr7uApxhDKXpzHtAYM8IcrSIH02YmCeqBJrBdMskbOnOJfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JIHtqLsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ColjS030293;
	Wed, 9 Jul 2025 12:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwD9aLoccLoz1HrlSXC+FDGWhKPUL4knxYPjlEyY03M=; b=JIHtqLszNOPAtkxc
	954KLy5q7eRINa87qqHRo2x+E6+rawmhC0qfVLdKnKI4atT1rf2fkCPuV5P3DCLP
	2g4UIB++vLdumVvyCbDugVH9I3lZljEXtUUG+U2jtV/ka+FiFBj/Pk7tYcogizZn
	QThEdCeT2NwmTizVBfMagWJyESlDOYMA8UwjqgUtsNHbIZXhfbZk3XlWLpQq6QDQ
	lDlxmCAo0NPWyPNzrNlPuJW2B8Es4KqfKxaMzXXZ4vCKiKe/xvJeUvkBGPZ2eo2G
	4v48gy9aG0BGuuCWO+BLh5hTl+Pp6+rEgP4bOYO4l0oF81bN5uNKDmRfy7IUaoI7
	30zvzg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg0ygw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 12:50:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 569Colft009341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 12:50:47 GMT
Received: from [10.218.37.122] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 05:50:44 -0700
Message-ID: <21bb1db4-f84b-4d15-876a-cf2635f7fada@quicinc.com>
Date: Wed, 9 Jul 2025 18:20:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
To: <Vivek.Pernamitta@quicinc.com>, Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-5-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-5-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686e65a7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=DqsCIWa9XunOjBexoO8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K6fTHrSlIp23f3ZbwAtS3w-OJ4Bq8rL1
X-Proofpoint-GUID: K6fTHrSlIp23f3ZbwAtS3w-OJ4Bq8rL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExNSBTYWx0ZWRfX+rTD4N8MwL9P
 5BwlYHjoHsjLI9IeF5nFU6P7U8vO45qSceKFYSiHLYC3Gygkh5jswqMM0NiI5xbHVZTd1yy8zWx
 +7OnTDKkwHjNnofBvoBE3P8Q9Y3iL6xbjdfmh7x1fChkka7sB+zWE5GgB80vDM0aJ39ziWX4Tuc
 uVpYajL/GMCikbBy+9cqV2a7Ff05Q1sWn3YAnc+qfviwZLxDKKPo2vqkB1dzvfGIVjkDC6vY9U8
 xD7Mceo0/qgay3NSrNl0N9W4FnME0mD6QH5kMytByxlRtJPdbPC2GMciKdEBKV8IWaCl9w0nVAH
 Y0c3k7oRAfXiO543jl3qi7UXr9Pe1tdb3MzudSeoEqYJn10Qmf8/pI6etBixRsODeQc9JqPv6ih
 Do/QTzWWYg287gQ3BBsk6+U1bX94sVyHj1hZCeHF6iqFEUjVJS+udL8BD3jCdiZnoXurbEXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090115



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In mhi_sync_power_up() host waits for device to enter in to mission mode
> but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
> out for wait_event_timeout() as MHI is in error state and calls
> mhi_power_down which will teardown MHI driver probe.
Add "if MHI is tear downed sys err can't be serviced and mhi can't
be recovered".
> 
> If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
> and queues the next state transition for device to bring in to Mission
> mode, so mhi_sync_power_up() will wait for device to enter in to
s/will wait for/needs to wait for
> mission mode.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>   drivers/bus/mhi/host/internal.h | 2 ++
>   drivers/bus/mhi/host/pm.c       | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 1054e67bb450d2634771d092ed42bbdd63380472..00e46176654d8dc2f28b1535d9ef68233266ff3b 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -170,6 +170,8 @@ enum mhi_pm_state {
>   							MHI_PM_IN_ERROR_STATE(pm_state))
>   #define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
>   							(MHI_PM_M3_ENTER | MHI_PM_M3))
> +#define MHI_PM_IN_BAD_STATE(pm_state)			((pm_state == MHI_PM_FW_DL_ERR) || \
> +							(pm_state >= MHI_PM_SYS_ERR_FAIL))
MHI_PM_IN_UNRECOVERABLE_ERROR ?

- Krishna Chaitanya.
>   
>   #define NR_OF_CMD_RINGS					1
>   #define CMD_EL_PER_RING					128
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 2af34980e14250cada75c981b690bc9581715212..ee50efc57cf713a7cf38a670cb49ab09a83b30ee 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1280,7 +1280,7 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>   		mhi_cntrl->ready_timeout_ms : mhi_cntrl->timeout_ms;
>   	wait_event_timeout(mhi_cntrl->state_event,
>   			   MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
> -			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> +			   MHI_PM_IN_BAD_STATE(mhi_cntrl->pm_state),
>   			   msecs_to_jiffies(timeout_ms));
>   
>   	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
> 

