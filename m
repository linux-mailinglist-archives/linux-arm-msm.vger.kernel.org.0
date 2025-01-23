Return-Path: <linux-arm-msm+bounces-45905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B575CA19F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91E63AD098
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F013F20B7F7;
	Thu, 23 Jan 2025 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HiYwr9QH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637F200BB2;
	Thu, 23 Jan 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737618117; cv=none; b=ickcZVQKBFDZ8rGYM2b6ZNtVvvwq7ecEqfbL36QNfwmXsm9AZleDis70n3c6qUVxIwCMWZAZw66mFArayAJy2IFz/qOdByr3nXmGlYeQxtksAxXSDAqDNxd7+3ybb7Ajvr9afPEXk8U5q0Wtj/npAKkeDutsauVCheop94QRTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737618117; c=relaxed/simple;
	bh=ESehdX/ugf/Y80l2xjJvfsYX7MiFydGZb1uNynPrzSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TlGRjO7RG6gvtkQK0UijZSUutvAMa7xLzappE6Oj3Huk/J98a0V1Fl0FxU3z3RC7BeYiRZkj+YP9u2hnbUPWe7/nZZAehZQG3DfwMwvFbC570kek3o/wa8oWHlALyrewhddEmuZw7yh1Rzizyg44yeeCiCNmvq1bnx7evxORLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HiYwr9QH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5bfUO027683;
	Thu, 23 Jan 2025 07:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRVfB6bo5qelPeEsZlftPiCYQkx7x7VzFnFtEA40J4M=; b=HiYwr9QHI/PCsidt
	jplzta/u78MGjKYGN66cEqRRhF75KRfu1t9cNRAwsX5NycCSmmPlqki6/8g7QL9n
	81ySoK6Fpr1vjirD4ullyd6RyfpKqzZiHyabMd/KAg6DaNDiKvzm1OlrspvFzDHv
	aIsbJUmJxijhJHvCjAIL3aVrd//9NrRA530cHc9eRwAZ/pxq3coOzTG/tDky7QX5
	h32AoqZsm9xcVbQB3qSdlfFOvVgpbiN6FKkAiJMTfZ2h5Pq+V1M2RILUm6XjTYbM
	CPSSr31PYVsbV91xpAMlZaz0dnLoPYXEu76F5tvPUJHTpQ4kt0R4vom7i8V9VU1u
	Ne5tbQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bfss08e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:41:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N7fgw7026506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 07:41:42 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 23:41:39 -0800
Message-ID: <a4884d3d-95eb-4b24-a957-75f58293e909@quicinc.com>
Date: Thu, 23 Jan 2025 15:41:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 addributes
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Keoseong
 Park" <keosung.park@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-9-quic_ziqichen@quicinc.com>
 <115e51ed-14e3-49f0-bd88-73391475df8d@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <115e51ed-14e3-49f0-bd88-73391475df8d@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: axaLG0ftPohdkiszciUhbVAuJndFings
X-Proofpoint-ORIG-GUID: axaLG0ftPohdkiszciUhbVAuJndFings
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230058



On 1/23/2025 2:35 AM, Bart Van Assche wrote:
> On 1/22/25 2:02 AM, Ziqi Chen wrote:
>> +What:        /sys/bus/platform/drivers/ufshcd/*/clkscale_enable
>> +What:        /sys/bus/platform/devices/*.ufs/clkscale_enable
>> +Date:        January 2025
>> +Contact:    Ziqi Chen <quic_ziqichen@quicinc.com>
>> +Description:
>> +        This file shows the status of UFS clock scaling enablement
>> +        and it can be used to enable/disable clock scaling.
>> +
>> +        The file is read write.
> 
> Please improve the grammar of this and other descriptions, e.g. by 
> changing the above description into the following: "Whether or not
> clock scaling is enabled. This attribute is read/write."
> 
> Thanks,
> 
> Bart.

Hi Bart,

Thanks , I will improve it.

-Ziqi

