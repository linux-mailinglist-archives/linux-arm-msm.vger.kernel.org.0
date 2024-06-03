Return-Path: <linux-arm-msm+bounces-21433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E48D7B80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32096B213B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 06:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7795022094;
	Mon,  3 Jun 2024 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dR7Z3oP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4F1862;
	Mon,  3 Jun 2024 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717395821; cv=none; b=JZs38JTdWkGAzlp+qnfR7E5nkOCZZkFB1JEa3fXU0r9uEnFQf0hjEUuSUaYsGEEGv8r2InoYPnxfObFVyeFu1XUAl9mPQhfpXgm2jW4W4FlWqqjX4Cn5Jx2y4qVCPJj1urueCME96QGDnPymQymcVNZvXHVcdsaZImwRBZDi38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717395821; c=relaxed/simple;
	bh=DGlE/4+R+Sb1oNzmtY0jIER3mm8hnJVWVnxSeQkaYQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n/MMMHC9J3T8Mfz/NmYJofmiBL0nCpnqEeKT7Y3ONYGTQgHCsWD69ogf/UVFOT5++w5ken52glVG2uCNY2tPD9KJRl28NdZJkeZ42r6QeD/uiISeJeQN7AViY+8HAOckbeaYDx/gO/SDlXNvheIqP8Gmegmr8AaMRHol6zqlr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dR7Z3oP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452MlKoV020615;
	Mon, 3 Jun 2024 06:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNJn4ac5jJpSFOdty/48Yed+nrWk8GDYFHRY+uMSSwk=; b=dR7Z3oP++6RFDzH6
	KhKwzFmO8Z78O+5ppj0h7XdQcwDZKiEsmUG5PcCzX+CFiu+OH/1UuWL7/So8dWG4
	N/CeGOwkGpBwZ3KdLz8o0utEjulyrLlucobd3iG/QA8euXDKlN9r0tVWhCdFE49R
	iWM0Cv4IA41uYsRIGY+I8dnVSZyiM9uKUuV8AZkrcUVtHinRnlrVvpfNtr2wamQi
	ZxNcPVauILMPtpMmGT/3yqrkYa83NmvHt0avCpjgDexnxoQ6WMQ6JkX2qnVx128C
	/bGh2VKTjkXDGnBTjvqaTXE5sUQa+456l9Pdyu78efWdik0qIqI/f2VGvvytXdkc
	d4dgUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wk35k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 06:23:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4536NYNI011597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 06:23:34 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 23:23:31 -0700
Message-ID: <ba110bd9-c042-472e-b761-10ad01f027dc@quicinc.com>
Date: Mon, 3 Jun 2024 11:53:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] misc: fastrpc: Fix memory corruption in DSP
 capabilities
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-4-quic_ekangupt@quicinc.com>
 <6bdd3a9e-2c02-4b65-89ac-918a1157b120@linaro.org>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <6bdd3a9e-2c02-4b65-89ac-918a1157b120@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I3PhUeZsAgpkiQm8y6SiayBBSIXh3BMK
X-Proofpoint-ORIG-GUID: I3PhUeZsAgpkiQm8y6SiayBBSIXh3BMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030052


On 5/31/2024 3:06 PM, Srinivas Kandagatla wrote:
>
>
> On 30/05/2024 11:20, Ekansh Gupta wrote:
>> DSP capabilities request is sending bad size to utilities skel
> What you exactly mean by this?
>
> Curretly driver is sending 1024 bytes of buffer, why is DSP not happy 
> with this size?

Copying the comment sent to Dmitry's queries:
args[0] is expected to carry the information about the total number of attributes to be copied from DSP
and not the information about the size to be copied. Passing the size information leads to a failure
suggesting bad arguments passed to DSP.

>
>> call which is resulting in memory corruption. Pass proper size
> What does proper size mean?

args[1] is not carrying the information for full 256 sized array. It's sending the input argument as the first
index of the array, &dsp_attr_buf[1](resulting in total 255 size req), so sending 256 length will result in
copying of information out of the array which would result in problems

>> to avoid the corruption.
>>
>> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP 
>> capabilities")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>   drivers/misc/fastrpc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 61389795f498..3e1ab58038ed 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1695,6 +1695,7 @@ static int fastrpc_get_info_from_dsp(struct 
>> fastrpc_user *fl, uint32_t *dsp_attr
>>         /* Capability filled in userspace */
>>       dsp_attr_buf[0] = 0;
>> +    dsp_attr_buf_len -= 1;
>
> is DSP expecting 255 *4 bytes instead of 256 *4?
DSP is expecting the information about the number of attributes to be 
updated, i.e., 255.
>
> --srini
>
>>         args[0].ptr = (u64)(uintptr_t)&dsp_attr_buf_len;
>>       args[0].length = sizeof(dsp_attr_buf_len);

