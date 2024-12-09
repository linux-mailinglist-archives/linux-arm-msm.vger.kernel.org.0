Return-Path: <linux-arm-msm+bounces-40964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC09E8B04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 06:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EA028103C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C85148855;
	Mon,  9 Dec 2024 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b5Nl68Qq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DD46B8;
	Mon,  9 Dec 2024 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722387; cv=none; b=R08/dsfQY9i5tcx/cmLHnzII2xBBqAXaH0QO0FTAb2P1NyOrV+nG+br+51dlaxc7KpnDSNoX8SJ00bk1qJ8a10b1juwpENDWTUqitso7L8Ya9N1CJmu1/63lwIYtQ2Ezkj6DQ4AjD9zMy62HbJkKXxVttYze63urghPZSc/BCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722387; c=relaxed/simple;
	bh=/SvwD8JN0GjX1ctSoHfAgDKtmo+5ri9aKVeRjo7ydPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VnmpOf5/ssiQHpSUNKxzVXyreQdX76PBw5r4hUZ8dnQNYf2qoJPkSzwFH6X+oMgWTLwvDICr6kEpyzjqvhH/2MSa/2er8/PeSvz6d8Bi/zoVaKYqa74GQFSKBlR4jEktKL8WlMhh17NtXNvNZ/q8eFRMuqfAsf2pUl+Ug/RLK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b5Nl68Qq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8Nuj6k009802;
	Mon, 9 Dec 2024 05:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngJhW1SmIzWJgO3nYROv9EoBHGdmYz3ig7vC9fHLuew=; b=b5Nl68Qq1J9tsnxP
	CIBtP+Xmp0lgVGy9Oma3wNCQTIS8PRLeb81vZA5bllP+xE0FPHoeJ3lvFZtS1FA3
	mJVdp9Q4P4sVOvfJRUYsOQVJhoKDioDRFlufamVHDHVy6ZSXvwYZEBs75JLr4nAz
	w6AjccZmeCjCq5Opa6zzQBvt6qrzGrWOOYKj0ztXbX27u3VRIKQ14q2zNoBmGMi+
	HK1qyHaBiQopSnnPzr0D+AS/xc2LjZmzyHvPIoS98JtPPrzQ47Ew6b3m32fYSj9P
	gAXtZ70aN6Q1OVLM1OMDj1yf93Hgx7z+Bdupw7qgDm63nPI5u/ql4XCL/7IZCuuG
	CcKBgA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6bgu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 05:33:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B95X1H1000304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 05:33:01 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 21:32:57 -0800
Message-ID: <61a6b28b-02ca-841a-57a1-1aac12729679@quicinc.com>
Date: Mon, 9 Dec 2024 11:02:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/3] Enable TRNG support
Content-Language: en-US
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
 <11d49831-8d20-45ee-94ae-38248340fa1f@quicinc.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <11d49831-8d20-45ee-94ae-38248340fa1f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k3V5GgNpgUqINNNQKj8IVwmnRMIXzVb7
X-Proofpoint-GUID: k3V5GgNpgUqINNNQKj8IVwmnRMIXzVb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=624 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090043



On 12/6/2024 12:59 PM, Manikanta Mylavarapu wrote:
> 
> 
> On 12/6/2024 12:50 PM, Md Sadre Alam wrote:
>> This patch series enables support for Truly Random Number
>> Generators (TRNG) across various targets, including IPQ95xx,
>> IPQ32xx, and IPQ54xx.
>>
> 
> It should be IPQ53xx, not IPQ32xx.
Thank you for pointing that out. I'll address this in the next revision
> 
> --Manikanta.
> 
>> Md Sadre Alam (3):
>>    arm64: dts: qcom: ipq5424: Add TRNG node
>>    arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
>>    arm64: dts: qcom: ipq5332: Enable TRNG instead of PRNG
>>
>>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 +-
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>
> 

