Return-Path: <linux-arm-msm+bounces-47351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27895A2E34D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 05:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78C011887A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A5C1586CF;
	Mon, 10 Feb 2025 04:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eSpH/wKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E92F2E;
	Mon, 10 Feb 2025 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163558; cv=none; b=JMyVZKR9cCdxFK7n97rVgCpKIYSpJbpt2N1J4OqHHqVvOnEAb2nS7wJcq0LK/+OU3DPo1bcjL7M28HJ5fMRtBZyH+/H3ImeTEymy4l2tQ4NITvoxbILXT2jtpEWdT1A9/JTF4vWwgalH8uR+Ca0gjiiqtOU4N8Rq0KQJdvDN7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163558; c=relaxed/simple;
	bh=6pT7+dXsklLh1NRZnGillSRXOyCQqbrayjVnpgsbliM=;
	h=Message-ID:Date:MIME-Version:To:CC:References:Subject:From:
	 In-Reply-To:Content-Type; b=bEnRv9BmA1u/9TcsZ7oWou3ke6nClIVaTgyOAYFPAHBzGpgU1CeLnaq08IAt7ARBPryawd12hvE9prIfyBguhHl7skkwIEXIol63dwZPnFQHoAygsK7yGoXd/rBzj2EexOcGc7YmYAR81x2YCeAaKLpZDvbszls9qZMvbVkT+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eSpH/wKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MUw9E014239;
	Mon, 10 Feb 2025 04:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVOD3v3Y0g5LF/Im4pbOfEYj3LcSGcmxUrJET2J/F/4=; b=eSpH/wKC2FyLBjfE
	NsK0qLxuUccCudgQouHqdY8GhessNlA8Zb0EwGA08k9GMRnpOqZzMpvyXBluAuaC
	XK1u4aaL5Gx+H8ey3o4y+O6X1P0et5/fq/c+44w7BnMkEDIVIp5B96+C0MGG9Tq+
	+76XM1segOVGDxC+cAlBzsNwRVuef4zO6IT0GtyEW1tQfz/3ZvNaA6Bj+FjBWUYz
	zgzmvsbc7BgCAUIveNEeW3WMkl/X9sZl+J69JswZh72UInj1a+SdIEXKLO+FWEeP
	q/BK69d/mpu1JIi0eBvnoF7XRRjm6k49/fv11qZz4ylcLIPCVbmZJ64wS4NOIfzA
	/4kylw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0g8u3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 04:59:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51A4x5t6010009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 04:59:05 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Feb 2025
 20:59:01 -0800
Message-ID: <ed3cc71a-426e-4044-86dd-945751e282d5@quicinc.com>
Date: Mon, 10 Feb 2025 10:28:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <quic_pbrahma@quicinc.com>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <iommu@lists.linux.dev>,
        <joro@8bytes.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robh@kernel.org>, <robin.murphy@arm.com>, <will@kernel.org>
References: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5gzjTQFf_GJj_MveMIDpprdBFE0l1iGm
X-Proofpoint-ORIG-GUID: 5gzjTQFf_GJj_MveMIDpprdBFE0l1iGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=727
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100039

Hi

Can someone kindly review this patch?

-- 
Thanks and Regards
Pratyush Brahma


