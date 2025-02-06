Return-Path: <linux-arm-msm+bounces-47009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC06A2A2B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84C8318841B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AB4225415;
	Thu,  6 Feb 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TEiGrSyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDEB2253F7;
	Thu,  6 Feb 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828479; cv=none; b=CIbK3MY/DCdvZB0L4ftNFElWDx+f7ucjdLRJnafqDM4x3y/DaqWBpC/iQCmAoSX7M0BrKw/vPyKy7HjL3fMvq0Ai0glSbyVxldwxcimyMWJpry7zgarNoHhAp7UGkopE7RWogfR1dP7QowZLockvohFDpiuOlEYPxXSiiBZYph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828479; c=relaxed/simple;
	bh=jNEtue4Rdfq2k3XsQU7lYcTG92C2BIalYExfvoiBO5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ADJ7MhVoQj4D259pzMnNSbMMzNQwoNhEmsEGgeeBEuwaHtzx9orVbt/va+lSQN2fNBlNPSRvbN17QB4yVmJeHIFC9UspgGQSh0XwZYP6ubueeLZcgqYfxvYO3p4JILmxsG+MYBysJuESQQQCAis7CXHbltF8imMuPoZhGpteHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TEiGrSyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5165cmsB019837;
	Thu, 6 Feb 2025 07:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+/ouqh14Et61fv0A42XQijGIjTS/PgaViMyF7lh54I=; b=TEiGrSykt3Us1Lk4
	HGpFCYucYFPHSNMMiD/i9GuzFZCpj6YreBKq5+j8UH3lVMm8C0W5xyx1dTFGCYZ5
	HES2zL4Lk2HyZa4WbmYwgVb9eRY03yaAEpo/earh37Gj1/OERhkKpBfjnbIXi97d
	cSoY98eGlP3AqqBFX2wFoT+D1KHeU2QjC/PW3DS/HUdHRPY79csQC5XJmQzcHCEb
	VYHQ0g3ojgxiA5PI9uYjmSrwbYLtRfo9ADzp4o7gGAmkSTYhRtZRGpwCvckfVj4p
	C2a7m5Z883kPELST9o7Uv4HY7kJsamFb5U/LrINIrSqcSn55Vyuan9aIJ36VdmkH
	RVTubA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mq4689vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:54:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167sNip007048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:54:23 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:54:18 -0800
Message-ID: <92802d17-4ea5-4f26-9bff-d3f3cc49e7ef@quicinc.com>
Date: Thu, 6 Feb 2025 15:54:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 attributes
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Keoseong
 Park" <keosung.park@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-9-quic_ziqichen@quicinc.com>
 <07c3d640-d2d7-4edb-b62e-0926e5e7c7c8@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <07c3d640-d2d7-4edb-b62e-0926e5e7c7c8@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d9Awy-14o2GZDbAyO3IiSn7YgtdtKSqq
X-Proofpoint-ORIG-GUID: d9Awy-14o2GZDbAyO3IiSn7YgtdtKSqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=907
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060064



On 2/6/2025 2:12 AM, Bart Van Assche wrote:
> On 2/3/25 12:11 AM, Ziqi Chen wrote:
> 
> Please change the patch title from "Add missing UFS sysfs attributes" 
> into "Add missing UFS sysfs attribute documentation". This patch does 
> not add any sysfs attributes - it adds missing documentation.
> 
>> +What:        /sys/bus/platform/drivers/ufshcd/*/clkscale_enable
>> +What:        /sys/bus/platform/devices/*.ufs/clkscale_enable
>> +Date:        January 2025
>> +Contact:    Ziqi Chen <quic_ziqichen@quicinc.com>
>> +Description:
>> +        This file shows whether the UFS clock scaling is enabled or not.
>> +        And it can be used to enable/disable the clock scaling by 
>> writing
>> +        1 or 0 to this file.
>> +
>> +        The file is read/write.
>> +
>> +What:        /sys/bus/platform/drivers/ufshcd/*/clkgate_enable
>> +What:        /sys/bus/platform/devices/*.ufs/clkgate_enable
>> +Date:        January 2025
>> +Contact:    Ziqi Chen <quic_ziqichen@quicinc.com>
>> +Description:
>> +        This file shows whether the UFS clock gating is enabled or not.
>> +        And it can be used to enable/disable the clock gating by writing
>> +        1 or 0 to this file.
>> +
>> +        The file is read/write.
>> +
>> +What:        /sys/bus/platform/drivers/ufshcd/*/clkgate_delay_ms
>> +What:        /sys/bus/platform/devices/*.ufs/clkgate_delay_ms
>> +Date:        January 2025
>> +Contact:    Ziqi Chen <quic_ziqichen@quicinc.com>
>> +Description:
>> +        This file shows and sets the number of milliseconds of idle time
>> +        before the UFS driver start to perform clock gating. This can
>                                        ^^^^^
>                                        starts
>> +        prevent the UFS from frequently performing clock gate/ungate.
>                                                                   ^^^^^^^
>                                                           gating/ungating
>> +
>> +        The file is read/write.
> 
> 
> Please change the word "file" into "attribute" to make the sysfs 
> attribute documentation consistent with the sysfs documentation for
> other kernel drivers.
> 
> Thanks,
> 
> Bart.

OK , Thanks Bart~

-Ziqi


