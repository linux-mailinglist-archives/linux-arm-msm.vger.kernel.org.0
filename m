Return-Path: <linux-arm-msm+bounces-47690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDDA31DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 06:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 962647A3CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 05:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA3B1E376E;
	Wed, 12 Feb 2025 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dhqhfngn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636138FA3;
	Wed, 12 Feb 2025 05:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337627; cv=none; b=JbsHHvT0c67iIP3PpQJU9HzbXBshg1RrXsZn6x8rE3TEx8I+Vi9ygAp+kVL7HQ9ntzrCS2OnN//kqN8MXBgD0KuGyXSFUX2BFpMtPh7Gr1VMkSPGLBygt9pg/WDfLFH5Z+mpapLMa1qGhu7f4GWw/sez+ZRQd+nHvxTqytJP4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337627; c=relaxed/simple;
	bh=WkKK2vXRCLnP7s87aUFVM2CILD3k86MlklY0Bm20GZg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=dIhyf+QQtAFsiIJSsanNci20ZHYpSJyz+GUumYy70UetXokbPAEe/vNX4xoDXWV2klb0iDyAyZ8Z5m/CI9w07ArlF7+4+4fTFC/MPjIHNvp1qlQd2SY+ecXhuIpyuY0nUWm4e/OlJh13ApIgttHx8jqXb2GidSyzUNtigi46JyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dhqhfngn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BJWurd024321;
	Wed, 12 Feb 2025 05:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO1hZ5QXZ07rHxOlnZYLZWziODF69u3ncZnlC3UFwHU=; b=DhqhfngnfcAUO1K7
	Lc0EfHPYMHI4ae0dn+TULM/GiV8I0A5Lq9GXj7K0PyRcnr3++eshDip0lj9bG3HM
	0gYwtZ+JNq+9u+0A7LVFdoxQlllDBOtfGCwqckDsI53+CPeuFVKn5+0Y7OCmvkRC
	6SNqaS/Mjuy9zJXjo7LFGNDxABK6Po72opAzGrZ4iLPX0cB6lmLeuqca1nuDlxKt
	/aPicavxX/cQH5wEOakLcxETPiDZDBFjbXTbN0tVC8u7hMa4DgLeGkv/dNtklk0m
	tyaiq5CQGG2Y+LwsXNxragusHTFvm6XNNNjeJ9aJPcDzdWRC/p80yqIAb0Wepivw
	v1iNcA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r4b5tuh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 05:20:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C5K6vG027315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 05:20:06 GMT
Received: from [10.216.0.248] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 21:20:01 -0800
Message-ID: <075588ff-77e5-4b01-8c67-8fc30e51b8a9@quicinc.com>
Date: Wed, 12 Feb 2025 10:49:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
 <20250211-b4-branch-gfx-smmu-v5-2-ff0bcb6a3c51@quicinc.com>
 <3158e911-c771-4186-b287-50d2395b8c94@kernel.org>
 <138b1c42-9580-41f4-9079-87740568b79c@quicinc.com>
Content-Language: en-US
In-Reply-To: <138b1c42-9580-41f4-9079-87740568b79c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2gaEzYFD5KsLXdsOPxP8DPtgDHJDbK1n
X-Proofpoint-GUID: 2gaEzYFD5KsLXdsOPxP8DPtgDHJDbK1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120040


On 2/12/2025 10:09 AM, Pratyush Brahma wrote:
>
>
> On 2/11/2025 8:45 PM, Krzysztof Kozlowski wrote:
>> On 11/02/2025 05:45, Pratyush Brahma wrote:
>>> Add the device node for gfx smmu that is required for gpu
>>> specific address translations.
>>>
>>> Signed-off-by: Pratyush Brahma<quic_pbrahma@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 39 insertions(+)
>> As pointed out by Rob, this wasn't ever tested. One more example of work
>> where you have the binding in the same patch but refuse to use it.
No, I had tested these patches against the dt_bindings_check and didn't 
see these errors.
It seems I need to upgrade my dtschema as Rob pointed out, reorder the 
clocks and resend.
However, I guess I need to update the clock list in the bindings file as 
per the order suggested
by Konrad in version 3.
>> NAK
>>
>> Best regards,
>> Krzysztof
> -- 
> Thanks and Regards
> Pratyush Brahma

-- 
Thanks and Regards
Pratyush Brahma


