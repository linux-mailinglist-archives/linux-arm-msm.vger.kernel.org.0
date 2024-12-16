Return-Path: <linux-arm-msm+bounces-42289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBB9F28DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 04:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4481625E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 03:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA21B21B2;
	Mon, 16 Dec 2024 03:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e6aWAK9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF54193430;
	Mon, 16 Dec 2024 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734320550; cv=none; b=kvu70GG9HuBdfMKdPgDR8J4dTs6k2y//8UQpsba3dhIo5uIHSzwRDyLFFcx5Y/Kd8gIuNp06C85s77nkaaTNVVLVYRTJZq4DxApOARbt18F7VWd4JGuYr94pS30/Y9YqeV55h4yoNOLaVz6F0JaedTgn39Ua0SQnhTssWhlSMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734320550; c=relaxed/simple;
	bh=nFuG6scnyMHQswIbaMN0aKqSTylx/CY+CA6lEyzoM9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uQJf+EhsSY2tG1EdFcByx3GOWAv57NzNxtCDJTfH7sgdnBgdWkZUOf1Y1MIU/vRny/9pModaexXfWIPIhBSqAC+22WMUgN9A6Eic5n+CJ/y4yCZMm2q1Qq6iYviC5MfxsNG5HcwMQV9F7rxoErpFo+yhHX9AYJL2GbB7IjT8N5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e6aWAK9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFMT7vk002691;
	Mon, 16 Dec 2024 03:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCaLT3sKVr6UGgRpz40kXETRD7zd+2O0DmTLi8OqN+E=; b=e6aWAK9otuonC9yl
	dboWOJyash9yRR/xrAhu3k9lZUO9g2FwbhSxvWyaacM58asz1z5iTT/9BEdueZd7
	57AjGaveEYaZzLU1jQbV9p81tnQAzh3T6I5Y4EYzDRS8X0FLmrd0twM6bmSQkic4
	r/hECmZxw8rWiV+qwfR6Ybf/AP5WufD/Yfh5l7EEpygu5HFVnSo1N+Lofkj6brZS
	YVxTO1SoHmuHscEeTEVjQZJvyhHoVrcocjPa0DdlVSP9HVNG/AkDiK6Gy5wM1Ubp
	0guXMEWew0biLuDNAYjNB+tVN20Yrohf/2Un/9Ta8gWulMjTsRf2un6CjlsDSM7O
	h6RYjg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43huwa9asy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 03:42:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG3gNgO017358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 03:42:23 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 19:42:20 -0800
Message-ID: <d3d9dd62-e0cb-4c12-91d1-17ae52688654@quicinc.com>
Date: Mon, 16 Dec 2024 11:42:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove unused and undocumented
 properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)"
	<robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241115193435.3618831-1-robh@kernel.org>
 <68c079b0-defe-4cb0-9f6f-ce9e3645e2ba@oss.qualcomm.com>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <68c079b0-defe-4cb0-9f6f-ce9e3645e2ba@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CGnYMDlvXcMlcsTM8pfoOpLK-TXqlLQ8
X-Proofpoint-GUID: CGnYMDlvXcMlcsTM8pfoOpLK-TXqlLQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160028

On 11/16/2024 3:36 AM, Konrad Dybcio wrote:
> On 15.11.2024 8:34 PM, Rob Herring (Arm) wrote:
>> Remove properties which are both unused in the kernel and undocumented.
>> Most likely they are leftovers from downstream.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> Funny, the sideinteraction compatible is undocumented and the touchscreen
> driver is not upstream

Does the compatible also need to be fixed to "focaltech,ft8719"? Refer
to the info from [1].

Confirmed, the compatible "focaltech,fts8719" is not even in any merged
bindings or drivers. Instead, "focaltech,ft8719" is in the current
driver and bindings.

By the way, I am curious about how Rob finds the unused properties.
Could you share some steps?

[1]https://lore.kernel.org/all/Zk4tLPn277Azd4XZ@google.com/

-- 
Thx and BRs,
Aiqun(Maria) Yu

