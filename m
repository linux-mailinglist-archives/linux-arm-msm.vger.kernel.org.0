Return-Path: <linux-arm-msm+bounces-38608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA079D477E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BB01F22DC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EC514EC55;
	Thu, 21 Nov 2024 06:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S1jOWJSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F7142E6F;
	Thu, 21 Nov 2024 06:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170330; cv=none; b=pMNLYKTHc77fMXtqc3Rb4fxEmZc2LlJyS9E0bzeQeBq2u/yZ0G1uFWlIC7LLfviUJw7elf7ojWrR3rw4SQ+nFuf/lz+SIhZrQtGj4g0eNOKdDTpqZV9jHiQ5P0X/dz8JsWh8Hrj6cmqedbgojzzQEcruX+JU4SX/IjvCZZSmarw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170330; c=relaxed/simple;
	bh=h0fvZ0SzRRBolM1p0jrM6SKS3Jdp9g0BgyVObobA/qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jyKzChA1CCtpUYbboJ5036y7FbWt4hGPCQKzA0+pAUEAnUdTXjKsva0VwibQWJnnSfUG+dhh61oh7zN+cYMU10O+AlCiiBHOycMEgQCVuVusIAh2BabnE6+OXhKNxbHNx+jwyEHqnPGiQ9ylS+7tDca4VqU+VodUn+3igGNtQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S1jOWJSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJujd9006031;
	Thu, 21 Nov 2024 06:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/He31/zSuIoyM8liQVZXh3lBwnQ1JwgncJP/XBmnxnw=; b=S1jOWJSUfRnEDpiX
	HQbFPUjGKpSNiueu9HlBsBGaNdRMzprLobNY7dETrbl2IIO8xvuDOyOgMr56CqJW
	6kpNezhrcsSUiU8YDeOFGFSiF3UMLJ3W7WWYa/krbptPn6A6UW9A6mpq4+qmFAkv
	L+Jh7k31YexVJ1i6CHxowfqo3lXCB7YATh/4sZBu/a9F3vDc04YmdIXEK+ZhK9Kq
	8zxaVJwLa+pcNX2S99qnQ0zViVKgLPykaRya8970sHjlu/cAWKSFkZYAykFdzy8E
	norixYzTAAlOz1WIYAr1uRZwhoo4yUcYClqzAER4XXnUfgSJHSr7sFdiat1Gkm44
	7tEp8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t23mqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:25:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6PKp7002520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:25:20 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:24:24 -0800
Message-ID: <6e1fa7cc-c80b-40c1-aee5-d2e954ae1513@quicinc.com>
Date: Thu, 21 Nov 2024 11:54:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
 <2024111841-egotistic-unranked-ad4a@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024111841-egotistic-unranked-ad4a@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 64uoepTuLKebVLXedNi06VAfJtK8lZNg
X-Proofpoint-ORIG-GUID: 64uoepTuLKebVLXedNi06VAfJtK8lZNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210047



On 11/18/2024 7:28 PM, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:10:44PM +0530, Ekansh Gupta wrote:
>> Rename the main fastrpc source file to accomodate new files to be
>> compiled in the same kernel object.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc/Makefile                      | 1 +
>>  drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} | 0
>>  2 files changed, 1 insertion(+)
>>  rename drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} (100%)
>>
>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>> index 77fd2b763b6b..020d30789a80 100644
>> --- a/drivers/misc/fastrpc/Makefile
>> +++ b/drivers/misc/fastrpc/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>> +fastrpc-objs	:= fastrpc_main.o
>> \ No newline at end of file
>> diff --git a/drivers/misc/fastrpc/fastrpc.c b/drivers/misc/fastrpc/fastrpc_main.c
>> similarity index 100%
>> rename from drivers/misc/fastrpc/fastrpc.c
>> rename to drivers/misc/fastrpc/fastrpc_main.c
> Why not just "main.c"?  You are in your own subdir, no need for the
> fastrpc_* prefix anymore, right?
Ack. I will update the names in next patchset. Thanks.

--ekansh
> thanks,
>
> greg "naming is hard" k-h


