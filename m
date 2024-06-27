Return-Path: <linux-arm-msm+bounces-24429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F791A4FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F451F2141C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B936C14882B;
	Thu, 27 Jun 2024 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b6+UfSJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE837145B34;
	Thu, 27 Jun 2024 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487255; cv=none; b=NLRgUCA/NvwgXl5JYrAvT+WO1GMUdIpT/EZOKWe//CYJkVk6ie6pX8Z4MYCMgi/GvZ/W7dqfBMb1HjSOnysDnRKZLqyMiIk4GGjwzGBkQFe7GvNEdSfr8W+V1Fe/FsOXeaLBf3TFE11JVcD8LkVT0GFBUtvPbGG62zMWJ1A5kVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487255; c=relaxed/simple;
	bh=VMv77DIEOfU4zmR3Xg7R04YcosJV3phhbj458HcSmFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r8qhx6oihc/BrgwtAhNGG5SGwEmy38Ylm1ESFDAq7HTj5x4uUwdXHg1WYvLLWw9IdaCGST4IGZQA/I4fhtW0DpQQk45vd2JgNO71PHk5ClVxKIsehVvJ/gRwQnG/u8frdnhV6mFv+O9UYI90Ph/b2NUEPjSmuoDv6vxlaH3Jwgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b6+UfSJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R2kkJ6018190;
	Thu, 27 Jun 2024 11:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUE7BDXt8xyZYKC7KXK5T2sUjQ7gfHYZIAdwzaUj9cA=; b=b6+UfSJtuTY8IfH3
	DrIeVJlDcbf57ULf2F1gXW9dE/Kj50zSdzGPIX+XY/3/OcPlQBXrq4clvgTJ0+Xv
	MsdMoBOexorm1/qQjey6/NxBLV7ZhuaAEet5zqJ+yyVZg8tjfbopFMlKBFnEfuU7
	4Cql6ZbIa0Z8obZCV2WJpBM6XVvupO9KNt7JZjWKzCtaVAEIP3Z6nlKSCgTFfvVW
	8R2UFZQY7lpA5A3SKwaheVhvRD7mRRdWuy6I4vIyQx8baOvplWVZtJnyDT9zY474
	YSfmSTjh3ppitefEDKXYPCxKXaX8HWnc/vMjEzUh91e2bvOQafo7OAxt1oMlkF27
	3ooOlQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppvbt9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 11:20:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RBKjoQ023843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 11:20:45 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 04:20:42 -0700
Message-ID: <bf5661dd-9d3b-4e7e-868b-600efdf3d65f@quicinc.com>
Date: Thu, 27 Jun 2024 16:50:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
 <2024062715-ultra-muppet-c899@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024062715-ultra-muppet-c899@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uPx-b0PPAW9Wk8l-6xF0vTW-rjI7nYNz
X-Proofpoint-ORIG-GUID: uPx-b0PPAW9Wk8l-6xF0vTW-rjI7nYNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270086



On 6/27/2024 4:48 PM, Greg KH wrote:
> On Thu, Jun 27, 2024 at 04:12:44PM +0530, Ekansh Gupta wrote:
>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
>> to be added for PD notifications and other missing features. Adding
>> and maintaining new files from within fastrpc directory would be easy.
>>
>> Example of feature that is being planned to be introduced in a new C
>> file:
>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes in v2:
>>   - Updated Kconfig.
>> Changes in v3:
>>   - Added newline in kconfig.
>>
>>  MAINTAINERS                          |  2 +-
>>  drivers/misc/Kconfig                 | 13 +------------
>>  drivers/misc/Makefile                |  2 +-
>>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>>  drivers/misc/fastrpc/Makefile        |  2 ++
>>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>>  6 files changed, 21 insertions(+), 14 deletions(-)
>>  create mode 100644 drivers/misc/fastrpc/Kconfig
>>  create mode 100644 drivers/misc/fastrpc/Makefile
>>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> For now, no, sorry, not a new directory for just one .c file.
>
> If you want to add more stuff, wonderful, then do this as the first
> commit of the series when that actually happens.
>
> sorry, but I'm not going to take this now.
Sure, understood. I will bring in the new file/s along with this new directory change.

--Ekansh
> greg k-h


