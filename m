Return-Path: <linux-arm-msm+bounces-5620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C781A6C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 19:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28D21F23049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 18:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D27482D8;
	Wed, 20 Dec 2023 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BDlDAWJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222503D82
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BKGefco012314;
	Wed, 20 Dec 2023 18:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=siDIjhBhjK1EFkzj03nZCp6uVGmOWfPoDhtkNvfxlUw=; b=BD
	lDAWJTUoLLYDavpFjWH96TvWLd9WksYw2E4Xp9Hes+WbgfMDdhSJxMYCmaWeFM2v
	5HTnQW5vCzyvLRQGj6atsIJr9m5JnU0+VsbzOoqcrhy+DERr9xc9baptvO5+abwA
	ZmouQMnkh0c6CN6TvcYFbSoUqjHH7Ki1TM70KUiMMbceYo/BV6n3JDIOJNSopMEM
	MQoBf4cwpT6sAjntZkpPHyXfXAw36g5efGywCa0gpzzS3JN3HHuUQzlkKIXlYdVk
	oxLuOHmWxPlo6WMQFpO7eCuJHRBA4KxVkAq0iz0BqrD6WLhbPINfdl5AnJB1ySJs
	WTKHTv9/9b4zcMcFDZ2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v3v339m8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 18:20:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BKIKAcR016810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 18:20:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 10:20:09 -0800
Message-ID: <e9d0891d-0ea3-5de6-71b3-949c3744a904@quicinc.com>
Date: Wed, 20 Dec 2023 11:20:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/7] qaic cleanups for 6.8
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <abd1f299-e8b3-a94b-a75a-aea40ab24012@quicinc.com>
In-Reply-To: <abd1f299-e8b3-a94b-a75a-aea40ab24012@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gLlx1idCx8KfBFXToYUOSnxH3bSEHGom
X-Proofpoint-GUID: gLlx1idCx8KfBFXToYUOSnxH3bSEHGom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312200129

On 12/15/2023 11:05 AM, Jeffrey Hugo wrote:
> On 12/8/2023 9:34 AM, Jeffrey Hugo wrote:
>> A set of cleanups to the driver to improve error cases and reduce some
>> code duplication.
>>
>> Jeffrey Hugo (2):
>>    accel/qaic: Fix MHI channel struct field order
>>    accel/qaic: Order pci_remove() operations in reverse of probe()
>>
>> Pranjal Ramajor Asha Kanojiya (5):
>>    accel/qaic: Deprecate ->size field from attach slice IOCTL structure
>>    accel/qaic: Remove bo->queued field
>>    accel/qaic: Drop the reference to BO in error path of create BO IOCTL
>>    accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
>>    accel/qaic: Leverage DRM managed APIs to release resources
>>
>>   drivers/accel/qaic/mhi_controller.c |   4 +-
>>   drivers/accel/qaic/qaic.h           |   3 +-
>>   drivers/accel/qaic/qaic_data.c      |  59 ++++++------
>>   drivers/accel/qaic/qaic_drv.c       | 140 ++++++++++++++++++----------
>>   include/uapi/drm/qaic_accel.h       |  13 +--
>>   5 files changed, 119 insertions(+), 100 deletions(-)
>>
> 
> 1-5 pushed to drm-misc-next
> 
> -Jeff

6 and 7 pushed to drm-misc-next

-Jeff

