Return-Path: <linux-arm-msm+bounces-41915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9409F06DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0578188B19D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FD71A8F64;
	Fri, 13 Dec 2024 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C7lJ3mYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF5189B8D;
	Fri, 13 Dec 2024 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079596; cv=none; b=ipGjAzNAnzA0e8bYdgycqZ9soqgdLLC0fBudO2HR30EeMRgDNDsTzfzgZfa0KzfWEcijiC/zIjkZvFH//KJvgOWEb3fL8AmRJ84Y4IBue1+Xk+kQj77i9bjNFJHgInNHUEfXZmB3/R/MiS89A4nVOqMu8//1egc8bZ1uGhxdI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079596; c=relaxed/simple;
	bh=47NxR9KCELO8PruWQYNX7KqePgWw1VCn5s2bcIzXSAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bTHx6CgrDgB2j/Am/zTA81vTKyG0anUNuWyfbl1eC1D+ON51QE42vvu/e/MQTA8T87CBQvINI/ByoNKiHfsBakCT83Zm7CIdQqFhFek24toMavMa2DWbruAgX0qyMQ1LmhI6tHLCvWcUV+4G+hrK15LTpYBGd3nR7Xgtoxu2kA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C7lJ3mYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD2fPXD000445;
	Fri, 13 Dec 2024 08:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSnXGtn6GXzdhPngFZLGEkQPgshiY3jX9QtjxirFWMg=; b=C7lJ3mYpJ8G9IT2e
	S5AU+ynYPTzvjwgg1JVgf3XzTeF3eRfqr5R34kkIRjUDZRqacUmxmKU31NrXyC7E
	7x28VyVord0/Vk/+PM60MHbyjM46hRJYctHT5H1cBB2yp18O6J8fhmCLPIGeczRV
	G/eAqMDAF/aIiSIh859+ZmLvA6+jfxgyojsJAkCHCoZkn2SB62vAS9lBJWBUtrAT
	ffVX87xB19uw39XuvkQnyG9WbgWDS3S+4Y/+nsVXzcnGNlJyupP+JqJOp1S2LCtL
	2Ke/YEHa1xgt1uM6wnbzFgoX71ElQjThu60BP050r23tnuOH8Fc8T+8+k/iWegsx
	vcfmsQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes45cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:46:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD8kKiP018048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:46:20 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 00:46:17 -0800
Message-ID: <b2f54530-c2e6-b067-9630-63835560d7f1@quicinc.com>
Date: Fri, 13 Dec 2024 14:16:14 +0530
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I-QI3nZ0eoJAWcZyXrYWZz25StGTP-NT
X-Proofpoint-ORIG-GUID: I-QI3nZ0eoJAWcZyXrYWZz25StGTP-NT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=533 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130059



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
Ok
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

