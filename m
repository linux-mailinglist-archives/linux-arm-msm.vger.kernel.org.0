Return-Path: <linux-arm-msm+bounces-34196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E099B715
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 22:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C47C1F20F03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 20:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE00146590;
	Sat, 12 Oct 2024 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pIBmpUgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704A13B7A3;
	Sat, 12 Oct 2024 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728766380; cv=none; b=NbGpJhRTbKkVnUT/cgKVh8YzJFKEKi4ybnJHWkCXBa02s9oS06H/nD7PFhn8LRinfSVMYq/9ToEOPW5oZMR4YrBIRwDqsjwszvRYCH6HwKtPe1HdJ1TU2M/aYTM7Sr2ECsVfwri8VZXatY45rcKAVDFNCbdO4L0ZI9Odpqs5+Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728766380; c=relaxed/simple;
	bh=3qZi2L4OZWH+qYX31NcDLb4RQcLFLp0u4x5GnLfI+uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pc3Vzp+IY/YmSFdcSDL5OmXTEuImMSiF9d7WqjHYIYUGkjdZOhE3QOWRKv1WHWpRKByx0Gofw7jF76D60+lJOYGpl0kpV+jBpLEGcwXpQsKwQzsG+ENOdfkxz6DPkH5j90ryts7l3TnEWoi5wt0dtqWd0hdI98dclZRCEHJFv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pIBmpUgo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49CKjS4x009888;
	Sat, 12 Oct 2024 20:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLC4Qmp9M39/84d5qBmFtHbjZYCNHvT4nGTY44mWu3s=; b=pIBmpUgoN2vgGqqx
	Es8F4cvRaKUthEASPl6M82O4pMyjBex1BLWTHV2MdgHLBkNp+1rj+xVNJZZ1fOVn
	6EN3TkButN7euH2qTr3yRaQFpm0mFixYVaD0LqTy6bsNQVXykFOO/xa3qrLPftVJ
	bu4hYIOwuVZrK5JTUIBZU0w3ARMwe3f3JNk5Osy6p1BJwlQhlYc+g9PS8ElVTYop
	PT9vLZURV7FqzSuw431H//UeUvUxJzL+FJNDg+0IpW4etSkLOE8FiLDZyHObzt8i
	9B58T6/jaK/o2fGc5O9MQFFE9Vr8KUEkwJY8Hwz+duzDdmwQSqohvpcGlAIveGPJ
	yMotBg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427j9ks2gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 20:52:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49CKqfWF009380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 20:52:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 12 Oct
 2024 13:52:40 -0700
Message-ID: <0c1a4666-4c73-d444-1707-9a6fa277bf2f@quicinc.com>
Date: Sat, 12 Oct 2024 14:52:39 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add ipc_router channel
Content-Language: en-US
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <jacek.lawrynowicz@linux.intel.com>
References: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CeNXudrEisbs4zZW50RHfDw0hvfi_VTx
X-Proofpoint-ORIG-GUID: CeNXudrEisbs4zZW50RHfDw0hvfi_VTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=840 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410120154

On 10/4/2024 10:40 AM, Jeffrey Hugo wrote:
> The ipc_router channel allows AF_QIPCRTR clients and services to
> communicate with the AIC100 device. The ipc_router MHI transport layer
> expects the channel to be named exactly "IPCR".
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next.

-Jeff

