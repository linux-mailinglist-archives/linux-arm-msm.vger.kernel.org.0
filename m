Return-Path: <linux-arm-msm+bounces-57076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1EAAD6CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E5C3B55E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92BB212B3D;
	Wed,  7 May 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ByL42GEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D71D61BC;
	Wed,  7 May 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601597; cv=none; b=qasHV6IxuSbYuJx0Rg9w2dRRVrFjannp9YqSv4BCjRcu+vxmeIyRahaq0hZSKvByqrYJdoZkQeuz+izCUbclq1+nyR+84zet3LFVDk8yuA24hQcHytYLAerOUodkuzVTUMGuiNZ8FHUUDA2DKCTEFPi8WH9++5rIYaD0HRRCKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601597; c=relaxed/simple;
	bh=0VP44LIsfvXHFLJCB9EqdA30bEZ2cAzjbZQOu7dK0lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TrkqlT+CvayTfZ/05F1zR4zJJqdmOXzN+dokTGr6Nabn91jATgiUVUw4iVBtDWH7pxd5GWD8UQGnLx+rZ3cm5G1vLq+eXC5gt2R/QGFEZ+TI6Wv0X5Sn8G2n5SGj4gP/9nqdiSZGuKjdJjk8v9SuLnkSW7WrUZMVWIcbQv8m/NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ByL42GEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HmDc017086;
	Wed, 7 May 2025 07:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pwAXZ6oFJZA1jpvnUjc3W1LL1+v8v2BsGnfm0cjmKls=; b=ByL42GEnWmN7wdx3
	XQ2hXEjh2B+GshswqW4Cm7AzWGz2A81BC8B+Qtl20bX+xzUG7gXh2S6QXJ9UROWA
	JpCbcPldjza05Ku10axJXfCxGMOtrgzwOxkfg5Tjun3TDX4nHtcxbq7s4oMuygLI
	TjbmhZduyNRNvdpXNpHh1oClWxtQSA8NmtD/Ai6cvBfmQm08tvZYvIO3EBVuWnDT
	Mkc8VkxCmTg3aMo0Re6oE5zvw7zbHJ8A0gZ0nODPEAt5EE4IQ5oevk5JdD+AIC85
	+FGVDAIPnajHQodNaXbnmu4fh6SXkm40a75w/ZFhSeq3g3jPRF9KwIJDiw2EsmHZ
	UE+Qlw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u44thq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:06:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54776PHO007795
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:06:25 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 00:06:22 -0700
Message-ID: <458a0c34-27a6-4aff-a6a7-0788af16359f@quicinc.com>
Date: Wed, 7 May 2025 15:06:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] coresight: Add coresight TGU driver
To: Trilok Soni <quic_tsoni@quicinc.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250423101054.954066-1-quic_songchai@quicinc.com>
 <20250423101054.954066-3-quic_songchai@quicinc.com>
 <37df3ce3-2161-4c42-a658-d36fc4208ee8@quicinc.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <37df3ce3-2161-4c42-a658-d36fc4208ee8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b0672 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=S5aUIBQ7irhDI9zSZmMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -L4_WesosIgaq_09ZI61eil4cBlgvJP0
X-Proofpoint-ORIG-GUID: -L4_WesosIgaq_09ZI61eil4cBlgvJP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2NCBTYWx0ZWRfX8wpPyfIxHx7X
 EyBX2Oiba7KiYOSSMGziwzZYUqNdY9T+kF0bSI5W+XX1BP5q/78QSoRqO1kzw4MmcBZmpJA8lzr
 7fQpnajPoPMUR8waYeWRqGIlOdTsVTAwkoMwvMjgT4GM9VYGbcDo9pN03rXDm59ytRuoLwnaJ4F
 Xd4vCz1DtGEFgFZHtMWhfiIcA7urck+mdgavwl6duKpniZscKFGHjmIVXh6QomjwzW69culeEZ0
 Aon7NmvPsZru/pK0eHrAPT/7l8Ty8FFI5Sng4XbydbnxuCclgCuS6C/n0j4BpWQxA0LRt1ep3bU
 t3jol6yO8w/sJRDP9ZLEobsCjnNqgoaWt0+vrrCIeRPpervgD1wcbgaARN9hT2x4k5C0y/EgM7j
 xbSV0xVuNUAdvITxDTcPrk9uBDdG3zYdBvKvAwt/SyA2oIoK0p/3/rqW2u9IFUBLgcf2ENBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=954
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070064

Thanks for reminder, Trilok.

Will pay attention to it in the next version.

On 4/25/2025 12:32 AM, Trilok Soni wrote:
> On 4/23/2025 3:10 AM, Songwei Chai wrote:
>> +Date:		February 2025
> If you are sending new revision then please update month and kernel version.
>
>> +KernelVersion	6.15
>> +Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>

