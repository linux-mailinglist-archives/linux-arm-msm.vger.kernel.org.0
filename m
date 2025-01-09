Return-Path: <linux-arm-msm+bounces-44515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1822A06DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 06:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B38D316697D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909D3214234;
	Thu,  9 Jan 2025 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QGfyAuYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A049143888;
	Thu,  9 Jan 2025 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736401185; cv=none; b=TZ5+OHnVvx4RSH0VQHUCU4KCbU8FPExWRr68ZGPAUtl8xhA+Wg5Pj/pinobYQz39VO824G7Gh4mxGfgGrOjKMEQTFwJc/REU+jxKmE4x8/szIQyR/xz6yqm/9XBmdxpNkcqHQCjIqw+QArBxHfL7Y9mdd0e7u9FG5mSp3nrGHXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736401185; c=relaxed/simple;
	bh=xNt1Ip9b1++XntoZsN1YD3z7R8JxU+4EW2+cm3A8JlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cfIv0E8SJ0QjZAQYqhIS8IXvbsNP5q9WRAx5KfEHDKIZkL/kAEO/Cvykao4lcl37A1Aq47eTRdTIjnOTqIp8IOZ27Gfmfc4JMau1xE9/JtcAU3s333Rc9JWG597nxoZysPnXMBRDsS5idEnqPBBf5zcYVTkzHX0ORc++5ersais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QGfyAuYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094FGBF011340;
	Thu, 9 Jan 2025 05:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tC7wm0qBqt/SrnVSlnVAMWJ2oHS/zXi2gjPRCZhcYE0=; b=QGfyAuYrgn5HJvSA
	0+pHuLm/rDgg0Vr2lVrj7xO6JSzHS/0w+4ktM08olZu8xGJk+8T6vxUaKIc7hVLm
	j1LuecVtCvUSIMs/jyHB+HMcfyTa22AFaE1BT85+Cf1volYhELlCoh41uQTcpcYh
	8oNa9fBdx2yyABjlHcjf8xk8eEpfsyUOR1C+HQNWaHebt3aQP3fv3MHjeqxXiTnt
	HcBPQRT1xSUbgKvU/a+iQnQqPQhOhzTdko+PbrXKztKhctlSjlqbyeYwkz2XbOj0
	WTyOUlpZLBXyAOYdzqgys4Wh2KjqBVzLEoicoeYWIY7kv4djrvXchzLDX58+tO/Y
	Wr2MYg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44278t84s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:39:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095dawB031354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 05:39:36 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:39:33 -0800
Message-ID: <ed96e4b5-a0a0-4c0e-b2ef-e06ea9d3718a@quicinc.com>
Date: Thu, 9 Jan 2025 11:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
 <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: exxCF7-NoqYzu8Fr-chk_ZpEMAr5ZhTp
X-Proofpoint-ORIG-GUID: exxCF7-NoqYzu8Fr-chk_ZpEMAr5ZhTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090044




On 12/18/2024 4:42 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 18, 2024 at 03:54:28PM +0530, Ekansh Gupta wrote:
>> For registered  buffers, fastrpc driver sends the buffer information
>> to remote subsystem. There is a problem with current implementation
>> where the page address is being sent with an offset leading to
>> improper buffer address on DSP. This is leads to functional failures
>> as DSP expects base address in page information and extracts offset
>> information from remote arguments. Mask the offset and pass the base
>> page address to DSP.
>>
>> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")
> This was committed in 2019. Are you saying that the driver has been
> broken since that time? If so, what is the impact? Because I've
> definitely been running fastrpc workload after that moment.
>
> Also, is there any reason for neglecting checkpatch warning?
Hi Dmitry,

This issue is observed is a corner case when some buffer which is registered with fastrpc
framework is passed with some offset by user and then the DSP implementation tried to
read the data. As DSP expects base address and takes care of offsetting with remote
arguments, passing an offsetted address will result in some unexpected data read in DSP.

All generic usecases usually pass the buffer as it is hence is problem is not usually observed. If
someone tries to pass offsetted buffer and then tries to compare data at HLOS and DSP end,
then the ambiguity will be observed.

Apologies for delay in response as I was traveling with very limited internet access.

--ekansh
>
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 48d08eeb2d20..cfa1546c9e3f 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  			mmap_read_lock(current->mm);
>>  			vma = find_vma(current->mm, ctx->args[i].ptr);
>>  			if (vma)
>> -				pages[i].addr += ctx->args[i].ptr -
>> +				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
>>  						 vma->vm_start;
>>  			mmap_read_unlock(current->mm);
>>  
>> -- 
>> 2.34.1
>>


