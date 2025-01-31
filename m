Return-Path: <linux-arm-msm+bounces-46613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E0A2419B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 18:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF457A3A91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6304C1EC00C;
	Fri, 31 Jan 2025 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jOBW4E26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCB1E883E;
	Fri, 31 Jan 2025 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343576; cv=none; b=MSZebGednS159izJtTxQvGAVkflFZ4xF/EC076GQAi70jASIwy69BuYoleX9ejJ7wKatMJSBipUhb/4rKCI4q7ql5hDcYU0RcnXBcrUTPf89eJR9T2eUi504d2Nc/l3Fz1Ed35Q+s8MEKEdzhqp+9n/CCcL6NdJMi1Vag9/2YwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343576; c=relaxed/simple;
	bh=9l7/VyfLwKaVjbVfDHcPJN6zspXBl7TLDVAcybwMI6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GH+moEHxGEDRPTyJ+G7IfFxNPszQ6WMhNEbXm0Xw2c2DoXZ+5EvZfNBV6huK53sMwvnH8s1ZhW1xSjdIOWTkwoUKP/LzIkpK/sH8VnDRn4DVyW6Gx+lYL04CnyfC6Z/M2saYMxND46VrojOK6ZA3pGCmP7NwAVseRwpbsMICUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jOBW4E26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGvTs3012737;
	Fri, 31 Jan 2025 17:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xa33Uki9JwMISfJXTyskf/bagu1pRj2S+WNwAyM6Xko=; b=jOBW4E26VYbjCjmj
	pPZypvt0yvvFM5XzKHE99/dSDc26BET2mBUjeXG3o/tJDBZUW2hvKTtlmUIdojzD
	CtgMR+rjI6vyuX1EyCZsV+9hweNBYvyLvxY1AZ7VXY/mP2Jq5eAOwonEzzKlIdeE
	0HwEeoJgjDEN5POosEM971T72jBXIPk6MD8YzWRZtFLfMwR8U6qIDSn3jc5oXWaB
	f+tAgAJto5a47bzXNcBVc7DCj/+CHrbzvpvk//asvJvCAomDwqjAHYTEvH+ziYTM
	hHJoRidV40TxtQPPOumP99PyVi0VvxGUopAE0tphBlwAGjMvpwUL1OOqAbDPVCwO
	FnLhIQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44h2gd81dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 17:12:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VHCibE009199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 17:12:44 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 09:12:43 -0800
Message-ID: <9fd4a356-6a4f-714e-2b14-dafd20d703ab@quicinc.com>
Date: Fri, 31 Jan 2025 10:12:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/7] accel/qaic: Initial AIC200 support
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QEKdxOym9gRQgj4N-A2AajIVjFvGOhF4
X-Proofpoint-GUID: QEKdxOym9gRQgj4N-A2AajIVjFvGOhF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310131

On 1/17/2025 10:09 AM, Jeffrey Hugo wrote:
> Initial support to the driver to boot up AIC200. AIC200 uses BHIe
> without BHI, which is something that the MHI bus has not supported until
> now. While the MHI changes are listed first to facilitate cross-tree
> merging, they are not needed until the last change in the series.
> 
> Also, AIC200 is a different product from AIC100 with MSI-X, different
> BARs, and different MHI configuration so we finally need some
> infrastructure in the driver to be able to handle product differences.
> This is expected to evolve more over time.
> 
> v2:
> -Remove inline on mhi_fw_load_error_dump() and shorten stack variable
> lines
> -Simplify kcalloc from mhi_alloc_bhi_buffer()
> -Inline mhi_firmware_copy_bhi() and drop the function
> -Fix spelling of MHI/BHIe in commit text of patch 2
> -Drop MHI_FW_LOAD_UNKNOWN
> -Simplify mhi_fw_load_type_get()
> -Rename mhi_send_image_bhi() to mhi_load_image_bhi()
> -Rename mhi_send_image_bhie() to mhi_load_image_bhie()
> -Adjust the order of mhi_cntrl init in qaic_mhi_register_controller()
> 
> Jeffrey Hugo (2):
>    accel/qaic: Add config structs for supported cards
>    accel/qaic: Add AIC200 support
> 
> Matthew Leung (2):
>    bus: mhi: host: Refactor BHI/BHIe based firmware loading
>    bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL
> 
> Youssef Samir (3):
>    accel/qaic: Allocate an exact number of MSIs
>    accel/qaic: Add support for MSI-X
>    accel/qaic: Mask out SR-IOV PCI resources
> 
>   drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
>   drivers/accel/qaic/mhi_controller.h |   2 +-
>   drivers/accel/qaic/qaic.h           |  14 +-
>   drivers/accel/qaic/qaic_drv.c       |  97 +++++---
>   drivers/accel/qaic/qaic_timesync.c  |   2 +-
>   drivers/accel/qaic/sahara.c         |  39 ++-
>   drivers/bus/mhi/host/boot.c         | 203 ++++++++++++----
>   drivers/bus/mhi/host/init.c         |   2 +-
>   drivers/bus/mhi/host/internal.h     |   7 +
>   9 files changed, 620 insertions(+), 106 deletions(-)

Pushed to drm-misc-next


