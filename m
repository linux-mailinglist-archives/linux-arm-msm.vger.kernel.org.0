Return-Path: <linux-arm-msm+bounces-27065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B999293CE38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 08:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632C71F20F5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 06:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EF5176222;
	Fri, 26 Jul 2024 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n3l+YBIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F93208DA;
	Fri, 26 Jul 2024 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721975839; cv=none; b=lYQG1Gh78c2mKdURgc6937ntONPEvVo4+U5fn9HYI7hdeOsVLC7r2ZQFo36G6Qet0Dc7oDNoVSPfxPaSYT8xdN3t3cgA4qQhZ4LUdmout15jp4ZHIf8MIp9caeAo9dHf9iTt7wmr7Bh1t5TXhgFx9fKN18guetUcaqTIykW4cV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721975839; c=relaxed/simple;
	bh=V/An2Y/cLtt53TAvP9RGOabckYsak2fL5zYfeS2JV5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RZqYfcRo6LIgkwkuKbSSu6BXr+SzbotCoed9jVgrnE+0i05BMb9JrD6ur47JS0lvCE8oJ1KlOiFjip0TGM0iRr5agmsKSaYYNIA7z/NwO9Rpo/uW0+qeIO4SGysaaX7jWt8Hl8eY1y0OUuXlX/WVrWiYxSvoxZJL/ibXLdsx69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n3l+YBIL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q13OHV011892;
	Fri, 26 Jul 2024 06:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDzEEdHj9cjl1zrl9gf9hPGAKm3gSwRCDeYDZQFiZyE=; b=n3l+YBILc+cBY6qq
	pL3zxdGKqPZu4lViaoyuF9/t8cWlzIh5t7BNC1ciCynDg1OI4S5pi2vaN7TUpqYm
	IvdrvtgxW/LWLzJb3H1CAZ99VYOJYJ2NTzH0CmNyXk5PIZMznY4uUvyuN218SWgf
	yoPAF0O9gXz7mWFi7jJ6/ZgtPF0X5SRqcTsWWY83y8fA0B9qV7gYScHTmgua0nTw
	hRFfNkpaV7Fxq6UmtAbrw3WXUdjjAcFayKUooeiE5aRMklp6hmGSq4SfSvFakTIS
	ZbonuKHtK4SOy1ND0V+2eNBcYhucdxv35WWdu9QRr42g8m/IS7OQpnc9Y4uEgl5z
	f0c/8A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1srgk9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 06:37:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q6b5CS032449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 06:37:05 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 23:37:02 -0700
Message-ID: <677db00b-117f-4732-b3ed-0a6714dab7cb@quicinc.com>
Date: Fri, 26 Jul 2024 12:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Add support for multiple PD from one
 process
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20240720034611.2219308-1-quic_ekangupt@quicinc.com>
 <nggoobovb223pxknzai5luaq6wqrv7ovtawodds4bjiegbxlth@ro5cvoxed24w>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <nggoobovb223pxknzai5luaq6wqrv7ovtawodds4bjiegbxlth@ro5cvoxed24w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yu5Ll9rFh8ZyccaiCQ5XTMPb9t-6f42r
X-Proofpoint-ORIG-GUID: yu5Ll9rFh8ZyccaiCQ5XTMPb9t-6f42r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_04,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407260043



On 7/22/2024 1:48 PM, Dmitry Baryshkov wrote:
> On Sat, Jul 20, 2024 at 09:16:11AM GMT, Ekansh Gupta wrote:
>> Memory intensive applications(which requires more tha 4GB) that wants
>> to offload tasks to DSP might have to split the tasks to multiple
>> user PD to make the resources available.
>>
>> For every call to DSP, fastrpc driver passes the process tgid which
>> works as an identifier for the DSP to enqueue the tasks to specific PD.
>> With current design, if any process opens device node more than once
>> and makes PD initmrequest, same tgid will be passed to DSP which will
>> be considered a bad request and this will result in failure as the same
>> identifier cannot be used for multiple DSP PD.
>>
>> Allocate and pass an effective pgid to DSP which would be allocated
> effective pgid makes me think about the setegid() system call. Can we
> just name them "client ID" (granted that session is already reserved)?
> Or is it really session ID? Can we use the index of the session instead
> and skip the whole IDR allocation?
Thanks for the suggestion, I'm trying out experiments with the index of session as
client ID to avoid idr operations. This sounds much better. I will update the patch
soon.

--Ekansh
>> during device open and will have a lifetime till the device is closed.
>> This will allow the same process to open the device more than once and
>> spawn multiple dynamic PD for ease of processing.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>   - Reformatted commit text.
>>   - Moved from ida to idr.
>>   - Changed dsp_pgid data type.
>>   - Resolved memory leak.
>>
>>  drivers/misc/fastrpc.c | 49 +++++++++++++++++++++++++++++++-----------
>>  1 file changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a7a2bcedb37e..b4a5af2d2dfa 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -105,6 +105,10 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> +#define MAX_DSP_PD	64	/* Maximum 64 PDs are allowed on DSP */
> Why?
>
>> +#define MIN_FRPC_PGID	1000
> Is it some random number or some pre-defined constant? Can we use 0
> instead?
>
>> +#define MAX_FRPC_PGID	(MIN_FRPC_PGID + MAX_DSP_PD)
>> +
>>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>  						"sdsp", "cdsp"};
>>  struct fastrpc_phy_page {
>


