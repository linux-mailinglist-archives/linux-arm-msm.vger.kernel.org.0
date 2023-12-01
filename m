Return-Path: <linux-arm-msm+bounces-2934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B38011DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 18:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7931F20F65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5584E62A;
	Fri,  1 Dec 2023 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NZAZvB2k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AF8103
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 09:38:36 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1ExJFu025621;
	Fri, 1 Dec 2023 17:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4MZ6zNwMiDRpH0TFLHGJdAebm7H9xbJoxs5Mo5cjlJY=;
 b=NZAZvB2kTd8Rs1gRBAqwJbIRajTHWQ7FNf9l52tPsTWjq+PFKuTJ61buK7VPaoHgC0AM
 nmPj2dBsjoJk785kabrohC6vWnBKezadkGp7vSKKLhxTFXX15mBTngFS+KPaLz3iPDd2
 xyOksefVxaufJCT9sqveF/3wIwYh1GFO/LnGUeoYO1aFqEi7/mcxk9UZYoVEAnMXHcFq
 95En3Fapz6S8lI8YR9LHXdvzdIouy+loyLUzHNqWOU1JDvQnxu0OW6lrLJ9EZQZiOay3
 rS4k/AJKRbh1rPMkOhXnbnV6m+O/jWMdo2rKhFKyGbc4FmRJtU1mOKe5tvIzNOjIYsi4 bg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq79ha18u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 17:38:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1HcT9d008896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 17:38:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 09:38:28 -0800
Message-ID: <6967228b-95ef-b577-b5e2-34ac00ffc07f@quicinc.com>
Date: Fri, 1 Dec 2023 10:38:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] Convert to persistent DRM devices
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20231117174337.20174-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231117174337.20174-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tgZO8BqJwDDJAGgA6UeGCS8qYSBySlaf
X-Proofpoint-GUID: tgZO8BqJwDDJAGgA6UeGCS8qYSBySlaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_15,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=967 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010117

On 11/17/2023 10:43 AM, Jeffrey Hugo wrote:
> The qaic driver currently creates and destroys the DRM devices when the
> qaic device is in an operational state for userspace. This does not match
> what other DRM drivers do, and leads to a few race conditions that need
> to be handled.
> 
> Instead, create the DRM device when the underlying PCIe device is detected
> and destroy the DRM device when the underlying device disappears.
> 
> Use KOBJ_ONLINE/OFFLINE udev events to signal to userspace when the
> underlying device is ready to accept requests, or has entered a reset
> state.
> 
> Carl Vanderlip (2):
>    accel/qaic: Increase number of in_reset states
>    accel/qaic: Expand DRM device lifecycle
> 
>   Documentation/accel/qaic/qaic.rst   |  9 +++++-
>   drivers/accel/qaic/mhi_controller.c |  2 +-
>   drivers/accel/qaic/qaic.h           | 15 +++++++--
>   drivers/accel/qaic/qaic_control.c   |  5 +--
>   drivers/accel/qaic/qaic_data.c      | 16 ++++-----
>   drivers/accel/qaic/qaic_drv.c       | 50 ++++++++++++-----------------
>   6 files changed, 52 insertions(+), 45 deletions(-)
> 

Pushed to drm-misc-next

-Jeff

