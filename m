Return-Path: <linux-arm-msm+bounces-23922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021F914870
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083E42858E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692CD137C2E;
	Mon, 24 Jun 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N4K718ta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4154137758;
	Mon, 24 Jun 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228132; cv=none; b=TubEWkYDcjTyn7OSU5bWnLMVcQIF7HPozI10qji/Q7KbTl9/WaOJXX4WN8wmW/EdJ0mcIxfS2Th5dIWMLQisTQ1CAwdKFjNDJwTQorOKPP9ZxsALwFFbYmb7z0UMravDxE1ujhf0JNouWv1qnQKDgCNhiw4b2/fBkzyc56XQ5rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228132; c=relaxed/simple;
	bh=LGFzxEq9GIYT5eEJul9AB2CmTR+3zd4Vz6DgOmBbQ50=;
	h=From:Subject:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OR/XQdT9rfw/kBHoUoWgCp8E8b/EUzu94ZK932LMfEBI7msCQCVmnZ6n2b+vUoV9ivWAos1sjLm6r6wcb6cxSj00uABRJ7HfFUbI/f2aG6wtBjqD0N5WI8MA3eJ8OlR3a17x2zhiFnEYdOTsRvgOsj2OOF2loD3BhU2/ObiY3ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N4K718ta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8Yc4u001514;
	Mon, 24 Jun 2024 11:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJNdQbK2gK2RYTmxVTnJNWU0R/RM083z0YR2Im8uMmk=; b=N4K718ta5j+Fgfv9
	4u5OthO9IW7ObNFfXx/0ETptMm8EmkzGQ/ioe9LIG+9RMbvjMpmc1bpUS2tLJ5Rt
	JiZzMmI/hkhPdkP/ZVfPqZf0pc00MwmSBu4DQHbIH4XHyEJPYVKaQ+EuFBf82VdI
	WTx5IDcFBgE0RHsF/yj5CTJrbrx4UlpL2Bq+reTHxLlr+DOMsjTUTr8rxTai3Eqy
	ZPSb34ekR8baSwN7pm2p8dtwp4cMp2h2PMdU0tYOQQHo8sDSnNv7XqJD8iMnymGW
	BJ2uvGUcMiZ0kOeYPR7xlgwHviqU0Fkzv57ktOLk5AYaxbVHMr6TtaCdzGA8YuFe
	82EXZg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaeunag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:22:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OBM5Z5011086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 11:22:05 GMT
Received: from [10.214.66.219] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 04:22:02 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdx75: update reserved memory
 regions for mpss
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
 <20240618131342.103995-4-quic_nainmeht@quicinc.com>
 <e5b7a888-8ca3-463a-a2de-cf719e58d7a0@linaro.org>
Message-ID: <c186bd2e-a132-fbe6-2212-dcdb93a6c14a@quicinc.com>
Date: Mon, 24 Jun 2024 16:51:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e5b7a888-8ca3-463a-a2de-cf719e58d7a0@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KnjzrKftx_rUhhBC1-H2QVbmA3ABuHvV
X-Proofpoint-GUID: KnjzrKftx_rUhhBC1-H2QVbmA3ABuHvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406240091



On 6/18/2024 7:08 PM, Konrad Dybcio wrote:
> 
> 
> On 6/18/24 15:13, Naina Mehta wrote:
>> Rename qdss@88800000 memory region as qlink_logging memory region
>> and add qdss_mem memory region at address of 0x88500000.
>> Split mpss_dsmharq_mem region into 2 separate regions and
>> reduce the size of mpssadsp_mem region.
>>
>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>> ---
> 
> Alright, we're getting somewhere. The commit message should however 
> motivate
> why such changes are necessary. For all we know, the splitting in two is
> currently done for no reason, as qdss_mem and qlink_logging_mem are 
> contiguous
> - does the firmware have some expectations about them being separate?
> 

Since different DSM region size is required for different modem 
firmware, mpss_dsmharq_mem region being split into 2 separate regions.
This would provide the flexibility to remove the region which is
not required for a particular platform.
qlink_logging is being added at the memory region at the address of
0x88800000 as the region is being used by modem firmware.

Regards,
Naina

> Konrad

