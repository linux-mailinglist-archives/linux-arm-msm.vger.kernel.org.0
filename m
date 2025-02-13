Return-Path: <linux-arm-msm+bounces-47850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C5A337AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37B13A922C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 06:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098AF2066C1;
	Thu, 13 Feb 2025 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nVJeUSJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE214F9D6;
	Thu, 13 Feb 2025 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739426692; cv=none; b=uFhkNVlkLNu38uZrlXjlk1YQ3L53jUajCqjdkcrJMiQ8Q9DCCqifJh/5h0cRwJVObUdKb0ybYHd/MNkEVwbH+I+2mKjWg8CEvObxI/2OfSAPMQqyEFhP/+DL3jNzUPDPnf45lU/JHabD2jCxRjAEOMQhQABb2b2nx6V091gzZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739426692; c=relaxed/simple;
	bh=Mc/fWgBFICTIYrFoaOZlHOc6x2VExb7Lw9deV/gDrS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L24oHvM/FrvevlhrPTb/VnYsqIhwhctwQs5PR+Ob8wMG5YvbjKHZ05H02N4YzM3CrXk4uxeutwQRpfZMnbvfd3TOn7WgJ/EadLVhUecKWs1WJq1ZkqeTI29srOhkteStXN9ZcQJEdTq77eTk5PTAnLGCJET/wYxsJuQd1ujvTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nVJeUSJB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CFBdpx006164;
	Thu, 13 Feb 2025 06:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0eUE1YUUE5RuRFg8px4nxw7Nc34ioOrwxah16w8VIc=; b=nVJeUSJBwyzv1RwB
	e7DC2TrG0zm037OkDMgfszkn4ae8JlYzQzRGaRz7n+XHVJkoyqmpsdKKacn5++lA
	iay2A7l7eXjk4PfI5Hn/GeId4y9nePMnV223KO3tR1tHxmes233Um0BVfdkAjkP2
	8itMFR7UBgA9QgE20L2losO/1RekwdWNyq/UjpptWmD3dl14uGud5BJtCbMM2/0w
	JoNWy5wbkWVjEFYhrM5dWX0ys2AzJZZl4xn/gWQeSIx5qbVmbEsPx0DPI+0GYs34
	tm9OmRu0qXIuXT68cNWPXWswDoopeVB4B42p5BJuXSgIRS3bi40bOn+bqLTdMWtI
	I7YYiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5n1qpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:04:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D64kP6020096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:04:46 GMT
Received: from [10.231.216.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 22:04:43 -0800
Message-ID: <3fa1e2d4-891c-435d-bcf6-f7babff4fecf@quicinc.com>
Date: Thu, 13 Feb 2025 14:04:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] Enable BT for qcs8300-ride
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <9a0f7b20-65a5-4090-b71e-d30d9fad397f@kernel.org>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <9a0f7b20-65a5-4090-b71e-d30d9fad397f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WXfP5KGe3p_yXh90GuiKPlP41LMo7MJo
X-Proofpoint-ORIG-GUID: WXfP5KGe3p_yXh90GuiKPlP41LMo7MJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=907 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130044

Hi Krzysztof,

On 2/11/2025 7:01 PM, Krzysztof Kozlowski wrote:
> On 11/02/2025 11:44, Cheng Jiang wrote:
>> Enable the BT subsystem of the qcs8300 ride board.
>>
>> Cheng Jiang (1):
>>   arm64: dts: qcom: qcs8300-ride: enable BT on qcs8300-ride
>>
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>>
>> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
>> prerequisite-patch-id: 7777ec69b5f2389a2efdb0bda561b067da72abfb
>> prerequisite-patch-id: e6140f9abf38172e77875f126da90bde6e1829cb
>> prerequisite-patch-id: c4e0283b4bce4c4e0566d7783f8ccd7fcaaebd3f
>> prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
>> prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
>> prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
>> prerequisite-patch-id: edd904882daa9ed31340710e36905c82c4552c8e
>> prerequisite-patch-id: 28493e0ec65dc01bd8f8e2e82beea6295944e6e6
>> prerequisite-patch-id: 29da1304862005c0fbe32230b47ce6d270518b04
>> prerequisite-patch-id: a796c820ab0b76a1b56b32480a83dbf5cb1cdab7
> 
> 
> That's a lot of dependencies. Why isn't this just squashed in original
> patchset?
> 
Yes, this is a new platform with many pending changes that have not yet 
been merged. The BT DTS change depends on the PMIC, UART, and PMU. I 
will wait for the other components to be merged before submitting a 
new version. Thank you for your comments.
> 
> Best regards,
> Krzysztof


