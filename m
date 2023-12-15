Return-Path: <linux-arm-msm+bounces-4956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505D814F75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 19:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C6C283B66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17783FB11;
	Fri, 15 Dec 2023 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gokH/sH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764053FB3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 18:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BFBt6Yl018593;
	Fri, 15 Dec 2023 18:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XsI8ZCNujstkaD98GzWqYGVhoudmCf5xMrOfzbb+fLA=; b=go
	kH/sH4/7Hxu4AhZkLr5w9aPYXLzjtNHSRwRsUqmvqJcuOB0M2Qiq9OlGZp7YhuNU
	Dpt5bwYkPCV2z9pvhHo2GmKagsYYeBVgBFSbVAqghvpIbTPkOCVIakty1PaTG4RC
	DAG4dMxC7557i6V8hl11mNrJ+JaZTyJQKVpP2l6bn9ZMEW6NXw9j0C9snQ3f2h+c
	uyrnsYG+5SqALPwEZ05gTXGrIxnjYr73w3OEhvodmT4IXBeRFwpMKaRrfJCVE6wC
	ANeqY/OuS+yxE+0HiVatzXiDDe66Oz+Yv5BAPmK5LEVV/b3TA1GJWxv5/mDGA256
	tJbodbBzXNvAo4HN/47Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0hb01skb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:05:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BFI5RjC026494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:05:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 10:05:26 -0800
Message-ID: <abd1f299-e8b3-a94b-a75a-aea40ab24012@quicinc.com>
Date: Fri, 15 Dec 2023 11:05:26 -0700
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
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QOpa3gLwUqe6L41-vUdHV0Fz7DaJHdKG
X-Proofpoint-GUID: QOpa3gLwUqe6L41-vUdHV0Fz7DaJHdKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150127

On 12/8/2023 9:34 AM, Jeffrey Hugo wrote:
> A set of cleanups to the driver to improve error cases and reduce some
> code duplication.
> 
> Jeffrey Hugo (2):
>    accel/qaic: Fix MHI channel struct field order
>    accel/qaic: Order pci_remove() operations in reverse of probe()
> 
> Pranjal Ramajor Asha Kanojiya (5):
>    accel/qaic: Deprecate ->size field from attach slice IOCTL structure
>    accel/qaic: Remove bo->queued field
>    accel/qaic: Drop the reference to BO in error path of create BO IOCTL
>    accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
>    accel/qaic: Leverage DRM managed APIs to release resources
> 
>   drivers/accel/qaic/mhi_controller.c |   4 +-
>   drivers/accel/qaic/qaic.h           |   3 +-
>   drivers/accel/qaic/qaic_data.c      |  59 ++++++------
>   drivers/accel/qaic/qaic_drv.c       | 140 ++++++++++++++++++----------
>   include/uapi/drm/qaic_accel.h       |  13 +--
>   5 files changed, 119 insertions(+), 100 deletions(-)
> 

1-5 pushed to drm-misc-next

-Jeff

