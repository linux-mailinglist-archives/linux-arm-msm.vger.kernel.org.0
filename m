Return-Path: <linux-arm-msm+bounces-38405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC69D2F53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 21:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E61BAB25D16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 20:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4C01D2B04;
	Tue, 19 Nov 2024 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VPVzkLUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCCB153835;
	Tue, 19 Nov 2024 20:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732047073; cv=none; b=YeN2pLtlAAavL8V3VzILjs3IxRC72caxJM3p+dVUzfVTI/BOPPEizHzch9M/+pe4Ec/vihwXG4jjaA73p2GFJ1XYQM0gWCjheYbRuPtPJOX1/G01K4S7rR7wGuRssQ5//Du5MFb+O/K8sBOgEPfNR3OCnxcO8foVd1IcQ0UKq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732047073; c=relaxed/simple;
	bh=rSituOJrRNz6zH8xI0pVCVWA9bP2bhYuyASCgbKHarY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xnbt+gaqep09GYHgpzVBHSmRF/sBk0lXyHrJVviTHIpR8R13PFULwMmSMXJEeZGOFE86jnQiR0GvsnVTuYw2t9/ivbfynKCVpJrubfHc3cykYYlrTOuk6u7kgmEWQKmpqwC4f+2F7JSk3qqqo9b3XSYIzl0ILyaSrkRbZPD1D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VPVzkLUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJAYnfu007872;
	Tue, 19 Nov 2024 20:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxPXjPDaTQBw3jBSkf+bpcp8+tu2oQqE7OEE9+eNkAM=; b=VPVzkLUfsd75mVuZ
	Tx5wuPQJwbcmoxe2iepddlQ5Voan2tE5lplUULiX1pQKjUwXR1ceiZa0rL7g8DWd
	Ah20LVZvg0d3VmE+BRZ1vSBBce5dhXUsl1petZ2G+WFfkPHyE0LADcsWpfs6YAXb
	bdQeI8G32wCUVuBb4+UMgoY9nxTEJ3We/HYv2S+cH5E0MXFGsMCfs6gHgB7/EAa/
	1NSEaGTZ/cAM9d+/9hgkA5debY7Zs8aSut44OmwwHj1XgEKGh1BQdvOF9kkrNW8m
	IL7PqYb3oc7qZ+Od03yzgq9MgBmObTnnr99pmfv9/xw5DyDUgim4ijNkn7MbUDYl
	kJDf6g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6usyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 20:11:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJKBA6Z002838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 20:11:10 GMT
Received: from [10.216.16.143] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 12:11:06 -0800
Message-ID: <30fda0e2-f314-49b8-8c1c-bf4fac87050d@quicinc.com>
Date: Wed, 20 Nov 2024 01:41:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs9100: Update memory map for QCS9100
 Ride and QCS9100 Ride Rev3
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson
	<bjorn.andersson@example.com>,
        Konrad Dybcio <konrad.dybcio@example.com>,
        "Rob Herring" <rob.herring@example.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@example.com>,
        Conor Dooley <conor.dooley@example.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_shashim@quicinc.com>
References: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H2nW38eyBv7ErXnkdnqSClquZtx3rPWD
X-Proofpoint-GUID: H2nW38eyBv7ErXnkdnqSClquZtx3rPWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=806
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190150



On 11/19/2024 2:55 PM, Pratyush Brahma wrote:
> This patch series is based on Tengfei Fan's patches [1] which adds support
> for QCS9100 Ride and QCS9100 Ride Rev3 boards.
> 
> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> introduced and the size and base addresses have been updated for
> a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
> and its corresponding scm reference has been removed as it is not required
> for these boards. Incorporate these changes in the updated memory map
> for QCS9100 Ride and QCS9100 Rev3 boards.
> 
> [1] https://lore.kernel.org/all/20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com/
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>

The memory map for qcs9100-ride-r3 and qcs9100-ride is exactly same.
A good churn you are first deleting(based on sa8775p) and then re-adding
for qcs9100-ride*.

I think it's better to move common qcs9100-ride* to a common file ex:
qcs9100-ride.dtsi and keep specifics further to .dts files?

This will ensure common entities are present at same place with no
duplicates.

--

Regards
Kuldeep

