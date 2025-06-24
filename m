Return-Path: <linux-arm-msm+bounces-62148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF1AE5C4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 524A1400A26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 05:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAAC22CBEC;
	Tue, 24 Jun 2025 05:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d5gSWGCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450E21A435;
	Tue, 24 Jun 2025 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744752; cv=none; b=UYFxUokafDdPDB3qL5inymowVJpqwFavtTGiUsLY3rEfsQQMmbYWKnE/cFV2jifRvX5PHp1ZULcjchmc6iJtxGcCvsy0u1wNLHKFFZ/cwhMSrsgFdv4Uw+Lg4NcNxC8yND46RuJ2CAPT4YOjPJmJeMhoIvTT2F9Ms8CKRAATyHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744752; c=relaxed/simple;
	bh=tQ+ZxhLq+WnBTT5fj+ECFv0Kj6JPuQkZSgQX+COKdvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VBWehgmIYuWARWq9LAKLScc+7LxrWI+Y9yXOmQJaFZL3T+0yXzvP7gTnsDc6jcg5o2ulQ9M5z3DkAZJRjm4b87i8WKdDy9k1LVcOO7kp9PxPl5oiCM2lykRh29N9IiIhg1y8y/+BwES7mnbzjV8thOVBS4Lscs2Vh+LSIwRZyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d5gSWGCa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKl361014571;
	Tue, 24 Jun 2025 05:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avD/4RMjlpnVZvRXzcBZ82PYWUxXl/6xOUZ3YTEAuWc=; b=d5gSWGCan3HX8qqd
	xNgxwr19iahsV9TN9pUK9KlQMCZiB7YCVTdZhGm/BbO6ou2Ts7pWcRbzd/lOnidT
	R0RRjOHa3bUymLjLHX3grel0K20zIC1U/EtxoMpjiuHtcvQib71ArXTy1GjSoJwH
	KpvA9mYijBs89+fwt2dlkzwoFXvBry74UhUijjPrFohKe80AQ4GnuSACze1Mw447
	T94iNm3lhHnC4A7/hZAcuuci91+QYX8yh6PmJqs8ADpLWHnX+N9xVeBqOduJa1mc
	jMH5E92Sr25EAMRUzFnnTGwBSxWJjh8LCujbOjMtPJceW0ADc/N0Cmpx/HNrsVQm
	cPSG7g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpu55f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:59:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O5x2NR025411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:59:02 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Jun
 2025 22:58:53 -0700
Message-ID: <9bbd768b-6ee0-4c9a-9835-3a2cda19373b@quicinc.com>
Date: Tue, 24 Jun 2025 13:58:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <srini@kernel.org>,
        <amahesh@qti.qualcomm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
 <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a3ea7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=7Hdw3R14QpBl625ZrCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA0OSBTYWx0ZWRfX1aRlqa5CSTyu
 e3+qHESNjSlsPI3F/JSN0iYBLaJlNzI/RzRblT8vUDbfDjS0quqab3wWMKIvguxSy3qNYg9+wlI
 YxgrUTbqUytrm14d9HqeFj0m2xpwzRjVY9UW3ycdEhfV3ZWHVrsGRfa6VQ9aqopAYTgu/BewCmI
 W3MEQDdBQ2o6+Trvdy/c/WivKAKeMm4yqZCkguywYdCk2EcYNuYl0WUljD4vvgXQdtjwAe+XY5H
 Ir1Ov/011uXYbPvynT/16C/9xat3s58WaX5cZ3LD/baI3mfAzFjONjXWlO04Mrh0vjjMU/X2Zh/
 hxoa5BZmfqljciixmdYuJuSaG1WPohtFUKo3Tw30TWhcbN76yMS/D46tlhVA8vailZ2FZjJ4KFP
 D5xDStm7X6y7pwzg8PUIRGWSKre0aVZ6UwiohCcmIJLYgwx1Us2D0JVnq0wmPnWPwxB2dlIk
X-Proofpoint-ORIG-GUID: kQYKwsbK4sJy37Gmve63qbzXwNufPS-9
X-Proofpoint-GUID: kQYKwsbK4sJy37Gmve63qbzXwNufPS-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240049

在 6/23/2025 6:28 PM, Konrad Dybcio 写道:
> On 6/22/25 3:38 PM, Ling Xu wrote:
>> The fastrpc driver has support for 5 types of remoteprocs. There are
>> some products which support GDSP remoteprocs. Add changes to support
>> GDSP remoteprocs.
> 
> Commit messages saying "add changes to support xyz" often indicate
> the problem or the non-obvious solution is not properly described
> (which is the case here as well)
> 
> [...]
> 

Okay, I will change to
"Add related domain IDS to support GDSP remoteprocs."

>> +static int fastrpc_get_domain_id(const char *domain)
>> +{
>> +	if (strncmp(domain, "adsp", 4) == 0)
> 
> if (!strncmp(...)) is the common syntax, although it's obviously
> not functionally different
> 
>> +		return ADSP_DOMAIN_ID;
>> +	else if (strncmp(domain, "cdsp", 4) == 0)
>> +		return CDSP_DOMAIN_ID;
>> +	else if (strncmp(domain, "mdsp", 4) == 0)
>> +		return MDSP_DOMAIN_ID;
>> +	else if (strncmp(domain, "sdsp", 4) == 0)
>> +		return SDSP_DOMAIN_ID;
>> +	else if (strncmp(domain, "gdsp", 4) == 0)
>> +		return GDSP_DOMAIN_ID;
> 
> FWIW, other places call it G*P*DSP
> 
In fastrpc, we call it GDSP to match dsp side.
because in device,the related path for gdsp images are gdsp and gdsp0.
> [...]
> 
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -18,6 +18,14 @@
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>> +#define ADSP_DOMAIN_ID (0)
>> +#define MDSP_DOMAIN_ID (1)
>> +#define SDSP_DOMAIN_ID (2)
>> +#define CDSP_DOMAIN_ID (3)
>> +#define GDSP_DOMAIN_ID (4)
>> +
>> +#define FASTRPC_DOMAIN_MAX    4
> 
> What are these used for now?
> 
To get proper domain IDs for fastrpc_rpmsg_probe etc.
>>  /**
>>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
>>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
>> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
>>  };
>>  
>>  struct fastrpc_ioctl_capability {
>> -	__u32 domain;
>>  	__u32 attribute_id;
>>  	__u32 capability;   /* dsp capability */
>> -	__u32 reserved[4];
>> +	__u32 reserved[5];
> 
> This is an ABI break, as the data within structs is well, structured

this is suggested by Dmitry, I will have a discussion internally.
> 
> Konrad

-- 
Thx and BRs,
Ling Xu


