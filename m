Return-Path: <linux-arm-msm+bounces-43114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2012A9FAD3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56FE16444B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E38192D6B;
	Mon, 23 Dec 2024 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+Vunec3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2F376E0;
	Mon, 23 Dec 2024 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734950527; cv=none; b=TgTRT7rC7Vz9yXX7dxkMpxFf0RQp/UPn86RRtyRQnmtc1Pe0YuR+ZSPrmdo3+NjFzQoWkaunK/b5KiqN9eks4I6q/DFC85mKBvb+CHnx4XK2pzfivsGjMSMEdK7UmNr4HbufKQ/ZlLpgn+TYDa3H/ariMEs1m0DwP1SixATBYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734950527; c=relaxed/simple;
	bh=vPdLW/IMCgIatT5YYW/f4eCz3cTxK+P7sHZaxHDHm38=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iCHxTWM8LadrnG4P85TQv6nj1+smOz8AaC+o+SVbQrzD99RiKX67nf6/UYcSqSoxZV8Gbemf/q7TeUuS0gtv6nYtygAB5po1G3NDHjes/oqXnSsbNy9LU823fyBdzk/7BePgd4u/E0feSjmK3hA0z9QFoW3WA3re+nsrdUlumF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+Vunec3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rSO3018255;
	Mon, 23 Dec 2024 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kS8mKYR+usUeESbZBNvjVfCO5/7SjHxf1EIEyRFHnUw=; b=d+Vunec3pAI05dFg
	NWoSaUoIdlgzKyl06I8e2OT9E6w6G3p6JVE3Uv4tOAacbSyTmtb0/jocMi1D21Gu
	4ajxQVvTEMVb2ad6//v1UEfvj8gsilyxuR/eMnAZKmyRyDDtBmQagF3fTXJDCKa6
	JZkL4VJFFDajUxArTM9cRIMINIOt/abo07gGk8OsBmw5ZrtqOw/ToC150mrv2/nt
	Qd4iD2BoCiSOk7u/f6qWOsgLnv5MJv6Yir1CueTcp+XMwzznlJtRo3ujGxDBfDDX
	Gr5WpgfhgHg8Y3VWMftSenQ3vrOIBxWzEhdNRVgHWbzmjS/LKaCG/vrCZYmqj5LD
	3pPEPQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q24590gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:41:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNAfwtd020835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:41:58 GMT
Received: from [10.206.105.210] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 02:41:54 -0800
Message-ID: <7b9694ea-a4fc-43bf-b58b-8c479af18140@quicinc.com>
Date: Mon, 23 Dec 2024 16:11:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in
 error scenarios
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
 <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
Content-Language: en-US
From: Anandu Krishnan E <quic_anane@quicinc.com>
In-Reply-To: <sfkf5wtra5e73a2wiclgrrlyp6urjdl635hxc2ucvv2q7hidzj@lkocd6ibymsg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3rRXZiaE627zetXVs1NHaJAXgY-cNbCh
X-Proofpoint-GUID: 3rRXZiaE627zetXVs1NHaJAXgY-cNbCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=839 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230096



On 12/23/2024 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
>> During fastrpc_rpmsg_probe, if secure device node registration
>> succeeds but non-secure device node registration fails, the secure
>> device node deregister is not called during error cleanup. Add proper
>> exit paths to ensure proper cleanup in case of error.
>>
>> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This triggers checkpatch warning. If it is due to c&p from some internal
> documentation, please fix it too.
Understood. I will fix the checkpatch warning in the next spin.

-Anandu
> 
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 48d08eeb2d20..ff144f0aa337 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  
>>  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>>  		if (err)
>> -			goto fdev_error;
>> +			goto populate_error;
>>  		break;
>>  	default:
>>  		err = -EINVAL;
>> -- 
>> 2.17.1
>>
> 


