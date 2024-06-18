Return-Path: <linux-arm-msm+bounces-22961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F101590C2C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 06:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4E3282B7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 04:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F99219E0;
	Tue, 18 Jun 2024 04:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M/uDZrMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F87717740;
	Tue, 18 Jun 2024 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718684578; cv=none; b=OGB/pOuok7uJOpWFFEzn1/R72Wf4+IOxfQY+Xi3K5AYlgEDOf6ty09IAsd/DaVq64oAR8+cMC83pVFq7Yt7sockjMJ5Kbi3oSyfhiqSS/s0OC9JTxExI7G/ZHgkQBZFoxtPr3NJZbUwOzRH/hxJ0qQiofOtj7rRYz1U5OFcFyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718684578; c=relaxed/simple;
	bh=erkvCeFOfQN4JsBvaoJDZj+vB0ZmSysocnhcbzs6PDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C/Bf6o2bzWWO5Gssq66QO50Po+GjiqzeUR1ORdfFXzr5F5RysWKWTIXhsCl/aeGTuYrocoHhCyKJj4Db9JOilIJib1Nr3aHdP1E1OoHlVDtzMo9HZGoqmBXGTNu3aCZFa4KahDdWgFuwe8ctXOrmJZIg9oiNAPzs/AGU3SPOXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M/uDZrMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HLgm5t029690;
	Tue, 18 Jun 2024 04:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRkwMV1QcwS5Z1PoZVpiKVG2+6ZPODYeSvMXuepKnhs=; b=M/uDZrMw5G+1Xv68
	AhAiQkD9tIgOFmPcdrBslSD3KQU7IvtWCENmTzqODBtgQOkDnt5HHb3VXi0+2hFV
	9QK6HGXsQqtKN/1GYDz4y5SvaxayygMwoZOWxmJCC7W8/Sk9A0gDLfjYN5bjNbdV
	jgWrOgijJZw2zrqD2uPHhwJkAd/xZv9SUbhe6b5SQWkjZScJ2njrbrSXkHPqTX+S
	QyOWU1oTKVCxHV5rQz/W5qJJKpXu9Mv9zxbyMCxeWXmTM8ybM9IYmyA4+Vd8uPWv
	fEjms1Fgmw+83mDgpjhlW4N17Lhaby3TuMOcmoKa8l5zh0OyzK80r7NlpGtKi6oV
	N6RHXg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytwa2gjbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 04:22:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I4MnOM027474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 04:22:49 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 21:22:46 -0700
Message-ID: <d7fc5318-bd01-46de-b691-8e40387f6b53@quicinc.com>
Date: Tue, 18 Jun 2024 09:52:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Increase user PD initmem size
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, stable <stable@kernel.org>
References: <20240617085051.28534-1-quic_ekangupt@quicinc.com>
 <2024061755-snare-french-de38@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024061755-snare-french-de38@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EcvuNWwjBhdqQyMmpoPRZTe9UH_oU2Il
X-Proofpoint-ORIG-GUID: EcvuNWwjBhdqQyMmpoPRZTe9UH_oU2Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=906 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180030



On 6/17/2024 2:44 PM, Greg KH wrote:
> On Mon, Jun 17, 2024 at 02:20:50PM +0530, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. For unsigned PD
>> offloading, current memory size is not sufficient which would
>> result in PD initialization failures. Increase initial memory size
>> to 5MB.
>>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 5204fda51da3..11a230af0b10 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -38,7 +38,7 @@
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)
> That is still an arbritrary number, why not make it dynamic and properly
> sized to what the hardware needs?  Otherwise you will need to change
> this again in the future, AND you are wasting memory that doesn't need
> this, right?
Thanks for reviewing the change, Greg.

The size is actually passed by user based on requirement which is then checked against this
INIT_FILELEN_MAX. Till now this was hasn't caused any problems but after introducing
unsigned PD, the size requirement got increased which is resulting in failures.

As for memory wastage, any additional memory passed during DSP PD init is used as the
PD heap in DSP, so the memory is not wasted. I'll add this information to the commit message.

--Ekansh
> thanks,
>
> greg k-h


