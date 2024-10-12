Return-Path: <linux-arm-msm+bounces-34197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC299B717
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 22:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A266C1C20C8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 20:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790AA1B978;
	Sat, 12 Oct 2024 20:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F3Xn0SWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1C13B7A3;
	Sat, 12 Oct 2024 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728766401; cv=none; b=SHKBz14mdIbfd52tTipnnCDPwH1ydG1NEHNehgpdgaetr4OsdlQCgm/qAPb0rgJVPfKqw07MNSzmjk7yDvNAhbzC3ds5TKagan3Gg8rLiX0PhZliL+dAd3lTib2dLbgGjX9rmpeOAvqw+P0oyXpHVmJk819lh5kqL/WyqG0L7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728766401; c=relaxed/simple;
	bh=zBxobd5LLSlnAdoVZMxtRME7h4GnwIRkEKBGptqLNDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lb8KsE8GbAoSE2mybLQZ4IlYeCXZQphznjhaNlO0rkCGwlGa7dqrJgN6MLNiWBe8MqoKFmnikZwULLqBxqrMJhBooMtLZlIKFwz3MxWUIkUV2+ffgpy1ozfyjAS/Sx5/IS3kzeozxW0p0m4/m5vgWWRKwIvZXchdJCoWblrhr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F3Xn0SWY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49CJ9ncr020657;
	Sat, 12 Oct 2024 20:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AICTJk+7mIOyoEmeNvNhXwYTHsln5zxvxxZkLhoi4I=; b=F3Xn0SWYhmQXuM/v
	DI/PN6rSByEpIxU4TTuBvZuHZXMkWQAPtMLj9lgHbUAYXuRKfb8/zWEqVo+krpMm
	LY9eg+8BzZOLQTdl/h8SPtXVcuzS7YWm1cBujYUFKQ9Q5gyoUD+s5Sf0K8ablcWY
	5bLD+ORDGuwGaA1FAGgPHufmObhLYV9dmKH9mSuH/uAFeDX4cSr7fN5VqZqqiWZc
	XqhwxGufdi9wbxR81wzK4s6gKFxIymHxKQFkTYNs8ZgI0bPsz/Ay2tvXzcbbvLUa
	0pYH2KVb+vSJpin83tMsDsrgOcpp5svDGrO1HQCBuDo7IzEExKHQq/GiXpL5bQed
	/VdABw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hg714dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 20:53:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49CKr0OK016100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 20:53:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 12 Oct
 2024 13:53:00 -0700
Message-ID: <9ab3a98c-d3f8-a76e-ff3e-ffdbf26160b5@quicinc.com>
Date: Sat, 12 Oct 2024 14:52:59 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add AIC080 support
Content-Language: en-US
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <jacek.lawrynowicz@linux.intel.com>,
        Troy Hanson <quic_thanson@quicinc.com>
References: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PNVKUsRvt3y-HoQGExS3e929xDQXsx6Y
X-Proofpoint-GUID: PNVKUsRvt3y-HoQGExS3e929xDQXsx6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=823
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410120154

On 10/4/2024 1:52 PM, Jeffrey Hugo wrote:
> Add basic support for the new AIC080 product. The PCIe Device ID is
> 0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
>  From the qaic perspective, it is the same as AIC100.
> 
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next.

-Jeff

