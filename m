Return-Path: <linux-arm-msm+bounces-34408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A399E32A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 11:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386C0283DD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1741E1DE4FB;
	Tue, 15 Oct 2024 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yn4Beh69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D087F7FC;
	Tue, 15 Oct 2024 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986051; cv=none; b=HFzanGkt2HmcqFoKgZSVzgGbOkX3FFN7A4RtOov4LJ3oLQlLoMTaLxac1Udb/OOIyshsYQATYxYKtdHdHcDMbSw5jnNfzDt1fOa8nk/snebEWQi6WlzCah3qmvXeA9UQ4iD6t4NWz8jOj54DWUEe37W3uKyvp4ClwvD85uk9cnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986051; c=relaxed/simple;
	bh=VxH0d8OiCc+yI1zRcswIOsXhZoYIMl9urHl70yfxeao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LEqZn1r4XNO/U6rYzbePQAkMZJUHy/xlMO3MxbrGApGl+lsytLl/j0Pq63EbH4LMOMGlbscsqTNEwWPV6fACAK0a1pFUFLN5I2gLwPv3WECoo84aM/iDdrDoF1PcB/khCMiGIEgSTb/W4wGAXeR/vWBCbYlV9dxXprbGeq7rtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yn4Beh69; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9G5Xa019351;
	Tue, 15 Oct 2024 09:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIzGYTNAP570onZc1Q9SZ0BCayz48+49eB4KT3Q0w+o=; b=Yn4Beh69hIeMH9hG
	TH8cCYS8Go5MVduJ8jKPA4IpQWYZQyyp95fsEjzTXKrab20KG9um2x+dVNyh4fXm
	H8jYpU28rjYazd/xlWVMPix5hAPtdBDAfORLfRxlv3EljAxiJLaYy2l5k1rXaZ+e
	liK1slAA+LgtWem3l7mZcUF3UX+IoqDX0VRHHhypmtt9xcKoAwdD2R7RXeSCBzuO
	DlV/sIQpX1f8dhIICNt+2Fcsu/M85rSL8lYv1lD2MVjHglif477WfbD+cKnTuBu2
	5c6CSXV36a0dJDhwzWamXJbhNacLh+rhZlI4qEIFReKZuinrr8wSXxpaTmg005GQ
	xGsjwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429nm3g306-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 09:53:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F9rwD6001924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 09:53:58 GMT
Received: from [10.239.132.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 02:53:54 -0700
Message-ID: <85a13e7c-b48c-4105-a633-a48ebebe9fdf@quicinc.com>
Date: Tue, 15 Oct 2024 17:53:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for APPS SMMU on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robimarko@gmail.com>, <will@kernel.org>,
        <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>
References: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
 <e0bd108f-1133-473a-a0e5-6efe1b19f50d@kernel.org>
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
In-Reply-To: <e0bd108f-1133-473a-a0e5-6efe1b19f50d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pkVBa3nGe1uQilYiIB6dfxCdyJpfAk4T
X-Proofpoint-ORIG-GUID: pkVBa3nGe1uQilYiIB6dfxCdyJpfAk4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150067



在 10/15/2024 4:20 PM, Krzysztof Kozlowski 写道:
> On 15/10/2024 10:15, Qingqing Zhou wrote:
>> Enable APPS SMMU function on QCS615 platform. APPS SMMU is required
>> for address translation in devices including Ethernet/UFS/USB and
>> so on.
>>
>> Add the SCM node for SMMU probing normally. SMMU driver probe will
>> check qcom_scm ready or not, without SCM node, SMMU driver probe will
>> defer.
>> The dmesg log without SCM node:
>> platform 15000000.iommu: deferred probe pending: arm-smmu: qcom_scm not ready
>>
>> With the SCM node, SMMU can probe normally, but SCM driver still fails
>> to probe because of one SCM bug:
>> qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
>> qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
>> The above SCM bug is fixed by:
>> https://lore.kernel.org/all/20241005140150.4109700-2-quic_kuldsing@quicinc.com/
>> But above patch doesn't impact building of current patch series, this patch
>> series can build successfully without above patch.
>>
>> Dependency:
>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
>>
>> Changes in v2:
>> - Address the comments on bindings from Krzysztof.
> 
> Which comments? Be specific what changed.
Got it, will change into "Add QCS615 into compatibles disallowing clocks in arm,smmu.yaml to address the comments in arm,smmu bindings patch from Krzysztof." in next version. Is it fine?
> 
> Best regards,
> Krzysztof
> 


