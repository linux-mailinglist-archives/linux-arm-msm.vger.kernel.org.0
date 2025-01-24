Return-Path: <linux-arm-msm+bounces-46018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D926BA1AEC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 03:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6DD2188EE28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 02:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905711D417C;
	Fri, 24 Jan 2025 02:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KY3tCcrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717428F5;
	Fri, 24 Jan 2025 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686588; cv=none; b=hZVcTFV05K5DS4zG23yUpgiMzlm2XK+3gbDS3AKoUMNKiwBE8aQ6C9Fc09x1/AUdLu0htvWAoXUEKX9AHM5IEP67zG6WhP16/CK4Sy13OTm527LjGOrx3/I95IcUXFb0OBGrP3hSOmpFPow+PsXPlKcTBxWHhaF9PJXcm44rrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686588; c=relaxed/simple;
	bh=nB/AfzD5Hh3AoVvZWK4R2F2vTUbpdM6jCEz1idNDW6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BDJvN7/SoI1OtoVcjcntji2RLH/6ifkvWQS3KDnCpodLC3EVudbXeX9BbU+uCaXjkmZTYsofMfdG2J45R+GfR6cFQMueWJMMBB54tsrSmht50r7Kofx+Ntb40NAd++pNdZnef1XQ2FEqNMCDYhsxlPaYlZz27lCIvfr1uTJ2SpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KY3tCcrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NNwLZ1026021;
	Fri, 24 Jan 2025 02:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YZhH2WHW+UpHX7eHxeHqDSHWwGuRiKqpPoxJTKdkP4=; b=KY3tCcrX8orumehX
	fHQHNhnnfgwiqLGRzVRXH7ByIbBEzV3wZgo9Itilryjw5zuL/tAeonjtJZ0CrIZv
	btnoXb27vU3otTBXdTp7zFesp/CzabJ0JhH0cmkjDG9IUyoahdTP82qlxMxCnY2+
	K/fmjZv54t3LTS0cDc2PG/LRTdzPUv0zReazkEmJE0hAa8E7H7tRjohO24uEaztj
	9U8uhD1gwz2SXBbZtcJaNXzrt2/NVgikwF+8LVoUAXngFKR2e7p+N/dlJHgZBTfA
	kQZk8Q6U2pv3iwnZFY8i2kOG2raeBf5bduqAXYU3RVtyj1OTQ9KvFFkMu3eAiPM/
	CmRtPA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bywc08g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:41:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O2fmGE011535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:41:48 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 18:41:44 -0800
Message-ID: <929ee551-e7ed-4dbc-9c9a-b2b02585a960@quicinc.com>
Date: Fri, 24 Jan 2025 10:41:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-6-quic_ziqichen@quicinc.com>
 <da2df1b2-5d32-4fcf-8298-6d045b4f7d42@acm.org>
 <bd7f88a8-8e59-464b-ac2d-3c75739076ae@quicinc.com>
 <9337b005-f468-471c-97e1-f4059ed4283d@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <9337b005-f468-471c-97e1-f4059ed4283d@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Bga7IdGTS9SwFCVJPy_vgF8JPQPJNCRp
X-Proofpoint-GUID: Bga7IdGTS9SwFCVJPy_vgF8JPQPJNCRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240018



On 1/24/2025 2:02 AM, Bart Van Assche wrote:
> On 1/22/25 11:41 PM, Ziqi Chen wrote:
>> We use memcpy() here is due to memcpy() can be faster than direct 
>> assignment. We don't worry about safety because they are same struct 
>> "ufs_pa_layer_attr" so that we can ensure the accuracy of number of 
>> bytes and member type.
> 
> The memcpy() call we are discussing is not in the hot path so it doesn't
> have to be hyper-optimized. Making the compiler perform type checking is
> more important in this code path than micro-optimizing the code.
> 
> Additionally, please do not try to be smarter than the compiler. 
> Compilers are able to convert struct assignments into a memcpy() call if
> there are good reasons to assume that the memcpy() call will be faster.
> 
> Given the small size of struct ufs_pa_layer_attr (7 * 4 = 28 bytes),
> memberwise assignment probably is faster than a memcpy() call. The trunk
> version of gcc (ARM64) translates a memberwise assignment of struct 
> ufs_pa_layer_attr into the following four assembler instructions (x0 and
> x1 point to struct ufs_pa_layer_attr instances, q30 and q31 are 128 bit
> registers):
> 
>          ldr     q30, [x1]
>          ldr     q31, [x1, 12]
>          str     q30, [x0]
>          str     q31, [x0, 12]
> 
> Thanks,
> 
> Bart.
> 
Sure , Let me try and test it. If works fine , I will update in next 
version.

-Ziqi

