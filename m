Return-Path: <linux-arm-msm+bounces-17344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8448A32D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 17:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF8D1F21A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83621487F4;
	Fri, 12 Apr 2024 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GmoyfCnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF91487EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712937035; cv=none; b=iS+Q4d9T30D7l//vQe9vbNED3x2Rh56RUE+tokfdtbLja7HFWfWRUUNlAmWSy9Dqx7i7d1p80KFcFB1o+8nqYEpbhtL99JJ6cFepqs3I6QtvRjee0nNgaMlSo3cgS1leiknR2aXGPX9kzoHERlUgW/2VJLRsF3V1lS/muKpD6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712937035; c=relaxed/simple;
	bh=8BhANIiBingsBK60PzSaaof8dcl0XgznleFEopuoBhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IjFJcGCT7fkdrgQJpg/ubkx5gq7F0IjDQPUxfACVR/kO/e96jbuIwH3es8r5qCYcNqbH1OExsx8hqVlyX5dFUWtyXyouHPeI7qytToMIAMLabbQg3lFyVRZrvZbvyRAyNpH55QpSLAoeRswQhbUL1+04IY18deHGg6K7e7toesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GmoyfCnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C8lJIh002776;
	Fri, 12 Apr 2024 15:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lMjskYvgPTovDqjTRq+3f6cIcGHQ/GhUZfP9BJAKXCA=; b=Gm
	oyfCnDSO0s+9PuDeH9cgXRAEG14csopMRvE2bxqXCyVyZkgkyTE4XeuSbVBaWxBD
	NWbJC23EMsyYYgNPbqJD0RURHWRL68MHtZNclFdzpl/9fSfZ3yIwMBulhG/DLwTG
	c1M8irTBnjlHG7B1pLiFgTFrc8BOtX6YYfr0FZ45wX8wUi+tYFGiQCKyCbmR4Vku
	7AYsE9UnfYP2rCJL1QsZ7LG2NC2OBaoQ+fZf4kboRa/K6W0ywSLelIQSBaOTDLvK
	SUULhkPyfn6Y+lNPol37/VM+31Qfkk5jom8z2NGOx3Vo6+AHwNR/iwI4i4pOMceK
	pdWBatdvMMoc0rRdzytg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xev74sgbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 15:50:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CFoOqx011361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 15:50:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 08:50:24 -0700
Message-ID: <5f585e04-a4ad-e0d3-3bca-c73de5cc2147@quicinc.com>
Date: Fri, 12 Apr 2024 09:50:23 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add Sahara implementation for firmware
 loading
Content-Language: en-US
To: <quic_bjorande@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>
References: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WwcSMLZ_Fj-lqmaUq3K5mZd7XDAebPEF
X-Proofpoint-ORIG-GUID: WwcSMLZ_Fj-lqmaUq3K5mZd7XDAebPEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120115

On 3/21/2024 9:49 PM, Jeffrey Hugo wrote:
> The AIC100 secondary bootloader uses the Sahara protocol for two
> purposes - loading the runtime firmware images from the host, and
> offloading crashdumps to the host. The crashdump functionality is only
> invoked when the AIC100 device encounters a crash and dumps are enabled.
> Also the collection of the dump is optional - the host can reject
> collecting the dump.
> 
> The Sahara protocol contains many features and modes including firmware
> upload, crashdump download, and client commands. For simplicity,
> implement the parts of the protocol needed for loading firmware to the
> device.
> 
> Fundamentally, the Sahara protocol is an embedded file transfer
> protocol. Both sides negotiate a connection through a simple exchange of
> hello messages. After handshaking through a hello message, the device
> either sends a message requesting images, or a message advertising the
> memory dump available for the host. For image transfer, the remote device
> issues a read data request that provides an image (by ID), an offset, and
> a length. The host has an internal mapping of image IDs to filenames. The
> host is expected to access the image and transfer the requested chunk to
> the device. The device can issue additional read requests, or signal that
> it has consumed enough data from this image with an end of image message.
> The host confirms the end of image, and the device can proceed with
> another image by starting over with the hello exchange again.
> 
> Some images may be optional, and only provided as part of a provisioning
> flow. The host is not aware of this information, and thus should report
> an error to the device when an image is not available. The device will
> evaluate if the image is required or not, and take the appropriate
> action.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Pushed to drm-misc-next

-Jeff

