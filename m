Return-Path: <linux-arm-msm+bounces-34406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AF99E19A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9088D281BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEDF1D9669;
	Tue, 15 Oct 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lRKtyiZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99BA1CDFDF;
	Tue, 15 Oct 2024 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982262; cv=none; b=EDHyT3HJByErsqzGr5ObaFLxZSx31qf9g9BkYmKiWs8tKCehrq1dMxBG3UMpUku/dZ++5EmfU0MWyQklv53TjZh+MlNtTQm30fsoCMWM0nCfMiYiBiRaJ7ZJqZGw1Znt1axCafyd1VO12HPA6en9ljNHZeKM4V6FDSdGbepbn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982262; c=relaxed/simple;
	bh=rdAWY29XMVbQeeBjoqujS4lUpaFsJZL9mYrWhS/o9Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HYQ/I/MTuXC7lT/imenQkE2OTtYPpsDd0stMDtVCYGse6E8O2RiRhlT/AUXaFBgHaSQQrbTXyh2QQjx52xdgyBKY5pzQknkSIVxaF6eLstwnWXRnQlAD16a+rWl5XK5sXENZhoghIzV7Ttzg9GDMGhdCjvbTnbWEeuWWX5ae+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lRKtyiZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EKjRlc026495;
	Tue, 15 Oct 2024 08:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2KOQofzJxcJDCMGd3KQ95cvXHyGL0mOLePvwey/zWI=; b=lRKtyiZXEuo8Z9sF
	vT7kBj7PfHEMU3CsQb9G03az/dr9s6jgmUCKcrlEEEs5izRPyK8m1c3qWDK6YURz
	IvPvReuF1Mwsq1lG+X8hf0SFA4+hV/cqxJ+i1f+vwoZmVAve6CWoiw/gxOljEgGm
	HxujRiPlS/bDx5Ty5aXIB1MznJ0L9h1MdB96+aTopozPgTzhIKcutaMr5oic5eOD
	GHT1WpnZZcf3TbVe33e/ZTK+PlxSkrwSVrNkKBlxwbspoafVoM8LSj4PLt6cRplF
	v0JFguAzbkaPOauO0jojy2i2yXh5Ir8nPxNhqSIfHjthTpsl0phe42RfvBp3tykL
	DtJ3/w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427h6ty1yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:50:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F8opXv006662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:50:51 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 01:50:48 -0700
Message-ID: <91774528-4cee-4872-bcea-7023c9a961f3@quicinc.com>
Date: Tue, 15 Oct 2024 16:50:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: document QCS615
 SCM
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robimarko@gmail.com>, <will@kernel.org>,
        <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
 <20241015081603.30643-2-quic_qqzhou@quicinc.com>
 <a08e76a7-8e68-4ae6-9b83-67e5d20468b9@kernel.org>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <a08e76a7-8e68-4ae6-9b83-67e5d20468b9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q-YJWgi4b2Gfx8GaxwTvjANrPmdWReDR
X-Proofpoint-ORIG-GUID: Q-YJWgi4b2Gfx8GaxwTvjANrPmdWReDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=917 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150059



在 10/15/2024 4:21 PM, Krzysztof Kozlowski 写道:
> On 15/10/2024 10:16, Qingqing Zhou wrote:
>> Add the compatible for Qualcomm QCS615 SCM.
>>
>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> I give up on this.
> 
> Please reach internally to get proper guidance how to send patches and
> what to do with tags.
Oh, sorry for missing your ack tag, will add in next version. And thanks for your review.
> 
> I am not going to do the work twice.
> 
> Best regards,
> Krzysztof
> 


