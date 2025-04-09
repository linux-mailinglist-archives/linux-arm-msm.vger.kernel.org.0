Return-Path: <linux-arm-msm+bounces-53629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F5A8237E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 13:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79A4F188823A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBB925D556;
	Wed,  9 Apr 2025 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q0oVOZol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846725C6FB;
	Wed,  9 Apr 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197958; cv=none; b=Pc/5aA93Rdu3gjvfjFmfKik/3VouUsR3BCfE1e0g7YSFUJqqONOuOLdgGMnpKIMz0v3ZSCM+7xfzwP7msftGonmTIzBsIg4HlUC0Q+aJGXUbYzGJj2WWcBdGz6PKXtPizoWQfHrQermpCEFYiH7V2Bg+BxDSn0E7pG2cA9OoKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197958; c=relaxed/simple;
	bh=w6c6I7F4/kq2lo1XICyiL03Xhslm9Ta8M6qRWacDPt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lklghn3t4QRo0Xe7Iuao1C25DUFA0jj/eWJGJGuG/AOtV/yNSANsvpcivEI8C62Hzl9MDT+88tkNkXyRcjGRUMCvH6eqmmrwe+Axlh06eaSuiea1/+nXZV83mjPWs6/VUmqm4pa/e4ftKasRVf3w+OsNOCKICBhxz6zYJ/ESlMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q0oVOZol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398kWmj028991;
	Wed, 9 Apr 2025 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKNuZYUgqfSY2QPjFRQxGDipKqsuAa5YHnQ0M50S7To=; b=Q0oVOZol3drRdodi
	gQJvbyVyF7jQ6lOS5HnkW61hU7HExfC95rsGtwBjLnXlHvUbd9GHViMEFrT3m3Ye
	mtuV1Civ4FfQmDFBWZdLHX/te4cYDUPsJFBq+LgY2fgE6uS58AEBMeQTijlfzg/f
	puSgALW/R8IVTtUshxglJKiPcaKTNunN0seYFlT7euz+84ywS/zuuwozkS6biUEX
	vbrQUlGbbc8arBzNIN2qgoqOCsCsA3WBy/IgcO9HiSF7U1NgJqUVR6M7I909s/p6
	hmNfBg8jg2ODdo6SZAyus0VZN8JtcVKvGPt7+bQdH2ujEgKAqF49ITquRhT+/fwF
	AALKvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmb2b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 11:25:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539BPksH006621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 11:25:46 GMT
Received: from [10.216.8.212] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 04:25:41 -0700
Message-ID: <56f4b9fc-69ba-c867-653b-7ea28ad8ab0b@quicinc.com>
Date: Wed, 9 Apr 2025 16:55:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] bus: mhi: host: don't free bhie tables during power
 off
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung
	<quic_mattleun@quicinc.com>,
        Yan Zhen <yanzhen@vivo.com>, Qiang Yu
	<quic_qianyu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>
CC: Carl Vanderlip <quic_carlv@quicinc.com>,
        Sumit Garg
	<sumit.garg@kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250409082444.582295-1-usama.anjum@collabora.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250409082444.582295-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: knL68Z-Nnzc8sK_UkEfcgiCTyPwikSZn
X-Proofpoint-ORIG-GUID: knL68Z-Nnzc8sK_UkEfcgiCTyPwikSZn
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f6593b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=NlJ2bC5Jul0cl-557kgA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_04,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090067



On 4/9/2025 1:54 PM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation. There is a crash report where at resume time, the memory
> from the dma doesn't get allocated and MHI fails to re-initialize.
> There may be fragmentation of some kind which fails the allocation
> call.
> 
> To fix it, don't free the memory at power down. Use the same allocated
> memory again and again after every resume/hibernation. This patch has
> been tested with resume and hibernation both.
How do you handle the mhi un-register case, in that case all the MHI
memory needs to be freed.
> 
> Here are the crash logs:
> 
> [ 3029.338587] mhi mhi0: Requested to power ON
> [ 3029.338621] mhi mhi0: Power on setup success
> [ 3029.668654] kworker/u33:8: page allocation failure: order:7, mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted 6.11.11-valve10-1-neptune-611-gb69e902b4338 #1ed779c892334112fb968aaa3facf9686b5ff0bd7
> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> [ 3029.668694] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> [ 3029.668717] Call Trace:
> [ 3029.668722]  <TASK>
> [ 3029.668728]  dump_stack_lvl+0x4e/0x70
> [ 3029.668738]  warn_alloc+0x164/0x190
> [ 3029.668747]  ? srso_return_thunk+0x5/0x5f
> [ 3029.668754]  ? __alloc_pages_direct_compact+0xaf/0x360
> [ 3029.668761]  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> [ 3029.668774]  __alloc_pages_noprof+0x321/0x350
> [ 3029.668782]  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> [ 3029.668790]  dma_direct_alloc+0x70/0x270
> [ 3029.668796]  mhi_alloc_bhie_table+0xe8/0x190 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> [ 3029.668814]  mhi_fw_load_handler+0x1bc/0x310 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> [ 3029.668830]  mhi_pm_st_worker+0x5c8/0xaa0 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
> [ 3029.668844]  ? srso_return_thunk+0x5/0x5f
> [ 3029.668853]  process_one_work+0x17e/0x330
> [ 3029.668861]  worker_thread+0x2ce/0x3f0
> [ 3029.668868]  ? __pfx_worker_thread+0x10/0x10
> [ 3029.668873]  kthread+0xd2/0x100
> [ 3029.668879]  ? __pfx_kthread+0x10/0x10
> [ 3029.668885]  ret_from_fork+0x34/0x50
> [ 3029.668892]  ? __pfx_kthread+0x10/0x10
> [ 3029.668898]  ret_from_fork_asm+0x1a/0x30
> [ 3029.668910]  </TASK>
> 
> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   drivers/bus/mhi/host/boot.c | 11 +++++++----
>   drivers/bus/mhi/host/init.c | 15 +++------------
>   2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2..8b3d2b9d239c3 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -323,6 +323,7 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>   				  mhi_buf->buf, mhi_buf->dma_addr);
>   
>   	kfree(image_info->mhi_buf);
> +	image_info->mhi_buf = NULL;
image_info is getting freed in the next line. why do we need this?

- Krishna Chaitanya.
>   	kfree(image_info);
>   }
>   
> @@ -584,10 +585,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 * device transitioning into MHI READY state
>   	 */
>   	if (fw_load_type == MHI_FW_LOAD_FBC) {
> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> -		if (ret) {
> -			release_firmware(firmware);
> -			goto error_fw_load;
> +		if (!mhi_cntrl->fbc_image) {
> +			ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> +			if (ret) {
> +				release_firmware(firmware);
> +				goto error_fw_load;
> +			}
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 13e7a55f54ff4..3c20e4541357e 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1173,8 +1173,9 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   		/*
>   		 * Allocate RDDM table for debugging purpose if specified
>   		 */
> -		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
> -				     mhi_cntrl->rddm_size);
> +		if (!mhi_cntrl->rddm_image)
> +			mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
> +					     mhi_cntrl->rddm_size);
>   		if (mhi_cntrl->rddm_image) {
>   			ret = mhi_rddm_prepare(mhi_cntrl,
>   					       mhi_cntrl->rddm_image);
> @@ -1202,16 +1203,6 @@ EXPORT_SYMBOL_GPL(mhi_prepare_for_power_up);
>   
>   void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   {
> -	if (mhi_cntrl->fbc_image) {
> -		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> -		mhi_cntrl->fbc_image = NULL;
> -	}
> -
> -	if (mhi_cntrl->rddm_image) {
> -		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
> -		mhi_cntrl->rddm_image = NULL;
> -	}
> -
>   	mhi_cntrl->bhi = NULL;
>   	mhi_cntrl->bhie = NULL;
>   

