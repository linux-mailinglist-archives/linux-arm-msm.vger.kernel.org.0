Return-Path: <linux-arm-msm+bounces-33145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF2990CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 20:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55952281812
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 18:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DC61FF7D8;
	Fri,  4 Oct 2024 18:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PhUUoToC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA01FF7D3;
	Fri,  4 Oct 2024 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066291; cv=none; b=JOb30AG9S4JjNniACtOLaaW50f9uWBwfKPQ0zao+XyjbOW/IMYXB1XTtC9or2s3CriWyr4OIajZI0YPgVTIKSipcq5AcFsJJ3Eaj2jLFm7QKaJXAUfMheW+s4WMZ6WAmqwSOC2W2z5BfJPMBJZR0t7Qi8ki1zIuYLxGFSmwEy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066291; c=relaxed/simple;
	bh=/uyLIjKkeW1+k+CLAi17bdjWQPVQkMSjEal7Yxc0ZI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=liogXyppuxajrbcvLU+S8rW6kZx/p/j4iPDRO0GuRaqqzb3qwC+zeGXIMelY/3u8XDrfRgrBh5Fj2o/360OWldRjkUXgqfIO2gGP5PiMZlyX4bWTIGPkOdYqFAfBAg+3aFVaXhta44iClJyYXL9YBjKE+l5Cv89mAoa+10xHL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PhUUoToC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494A58xn026296;
	Fri, 4 Oct 2024 18:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBWex6u4gz8UD4S4kL8WJfJhp2YY6MPdyOuVv5hzhrk=; b=PhUUoToC/O697ZJE
	f1HI9H75FTni1+GsTvdjq9H1rYkQYHomliM/qCp7ZNYIwmaY2QgsgvOcgrVWKfcG
	Ldm5k/Do18rxkCakDHDuldg5mq6xSlE+Nsse4bpPGTTgV3Cnbjdg+nfqm9th3uyZ
	ZpoYmryueAufJDyJc6qBOMnSXdyV2iMaWYV6p8LeXX/VnmBCtLCzyw+xNXB0ZZ0s
	gbhJjxVAMGtUTeRQx6YAPQpa0llXX6EGKXkAuOB2x54fj91sQTjjQfcZVw66z6BZ
	L9d96YvfYhimvVwqdWbYSgu9CsC/PmR/zYpUHlR21q0tZIfXSmj8sr89GVeTn4cO
	dTCBDQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jjyt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 18:24:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494IOjui001441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 18:24:45 GMT
Received: from [10.110.70.43] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 11:24:45 -0700
Message-ID: <17db9ffe-4e30-4776-a1f1-6da81cc0fcc2@quicinc.com>
Date: Fri, 4 Oct 2024 11:24:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus/mhi: Switch trace_mhi_gen_tre fields to native endian
To: Carl Vanderlip <quic_carlv@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: kernel test robot <lkp@intel.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241004170321.4047492-1-quic_carlv@quicinc.com>
Content-Language: en-US
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <20241004170321.4047492-1-quic_carlv@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: th9RbYqWOVEIVoJ_gKtswMOY_tXK0B7g
X-Proofpoint-ORIG-GUID: th9RbYqWOVEIVoJ_gKtswMOY_tXK0B7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040127



On 10/4/2024 10:03 AM, Carl Vanderlip wrote:
> Each of the __field() macros were triggering sparse warnings similar to:
> trace.h:87:1: sparse: sparse: cast to restricted __le64
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
> 
> Change each little endian type to its similarly sized native integer.
> Convert inputs into native endian.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402071859.8qMhgJEQ-lkp@intel.com/
do you want to add Fixes tag as:
Fixes: ceeb64f41fe6 ("bus: mhi: host: Add tracing support")
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/bus/mhi/host/trace.h | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> index 95613c8ebe06..3e0c41777429 100644
> --- a/drivers/bus/mhi/host/trace.h
> +++ b/drivers/bus/mhi/host/trace.h
> @@ -9,6 +9,7 @@
>   #if !defined(_TRACE_EVENT_MHI_HOST_H) || defined(TRACE_HEADER_MULTI_READ)
>   #define _TRACE_EVENT_MHI_HOST_H
>   
> +#include <linux/byteorder/generic.h>
>   #include <linux/tracepoint.h>
>   #include <linux/trace_seq.h>
>   #include "../common.h"
> @@ -97,18 +98,18 @@ TRACE_EVENT(mhi_gen_tre,
>   		__string(name, mhi_cntrl->mhi_dev->name)
>   		__field(int, ch_num)
>   		__field(void *, wp)
> -		__field(__le64, tre_ptr)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint64_t, tre_ptr)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>   	),
>   
>   	TP_fast_assign(
>   		__assign_str(name);
>   		__entry->ch_num = mhi_chan->chan;
>   		__entry->wp = mhi_tre;
> -		__entry->tre_ptr = mhi_tre->ptr;
> -		__entry->dword0 = mhi_tre->dword[0];
> -		__entry->dword1 = mhi_tre->dword[1];
> +		__entry->tre_ptr = le64_to_cpu(mhi_tre->ptr);
> +		__entry->dword0 = le32_to_cpu(mhi_tre->dword[0]);
> +		__entry->dword1 = le32_to_cpu(mhi_tre->dword[1]);
>   	),
>   
>   	TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
> @@ -176,19 +177,19 @@ DECLARE_EVENT_CLASS(mhi_process_event_ring,
>   
>   	TP_STRUCT__entry(
>   		__string(name, mhi_cntrl->mhi_dev->name)
> -		__field(__le32, dword0)
> -		__field(__le32, dword1)
> +		__field(uint32_t, dword0)
> +		__field(uint32_t, dword1)
>   		__field(int, state)
> -		__field(__le64, ptr)
> +		__field(uint64_t, ptr)
>   		__field(void *, rp)
>   	),
>   
>   	TP_fast_assign(
>   		__assign_str(name);
>   		__entry->rp = rp;
> -		__entry->ptr = rp->ptr;
> -		__entry->dword0 = rp->dword[0];
> -		__entry->dword1 = rp->dword[1];
> +		__entry->ptr = le64_to_cpu(rp->ptr);
> +		__entry->dword0 = le32_to_cpu(rp->dword[0]);
> +		__entry->dword1 = le32_to_cpu(rp->dword[1]);
>   		__entry->state = MHI_TRE_GET_EV_STATE(rp);
>   	),
>   
Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>

Regards,
Mayank

