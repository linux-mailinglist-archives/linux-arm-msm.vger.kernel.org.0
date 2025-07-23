Return-Path: <linux-arm-msm+bounces-66196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995FB0ECD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B97A1AA1D3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EB427978C;
	Wed, 23 Jul 2025 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PzdOodBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4792741A6;
	Wed, 23 Jul 2025 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258133; cv=none; b=eB9f5I7K06fCdEDHueVSjlUhh2jZzWntfiIXHAYtV96RTk1M0eAQ6xZE/ZHxoAjt0zEBys0kx5sMno9mKZzI+CToJwAFg/vjuHuM0JIg0qkGKhHnS5N35cQ2ldisB1VGZvCBQe/Z0fzNpiST7Soqr07/e6a30i6/su8J2Ya5uLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258133; c=relaxed/simple;
	bh=uIrIJBC5if6SzQ8kmRBqlwc/KyASC0mESfeCwS1ZE+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VRRUM5qEqVJUXuC4tNv5pqtpVXV8fjPzCxWQLqoepEEH/FdhMXGDqypGH4cPRDI2ig94B31POYE4h6kEc3OFDbITyfAhHI9c/THCMceAmTNXLPSaE9dopv2EHgxy8kFnVLiUdn3Xb3DIID0sIMWTEHVlKoYZphlsnA5+KrwSEUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PzdOodBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMO3D1008040;
	Wed, 23 Jul 2025 08:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3nMYD1XXIFWSmuyHRXLZhm8LWBOqexU+biFS5SvlsU=; b=PzdOodBUhv7UgUkx
	TjT/ZVnGPthQPiY2kdWTNwvsoR988jYlFO/eoueoSbVn6EoJvflZYh6LZWtIrBrK
	0YeFtVyk361nufyPZc7GP5P8an6amGpMzMBprQnAH3cEZkY1CvE5o5/sLmVOKrWF
	HpMSxibyALZgeOZqD8RUaBbIP2Uxn7QJHjw8dsjPGDr8ItIZBBIQTfWaoz/euGWO
	bwD4OR7a8yEknFx4sO/j4iY6WC79HX+qxrhsy/fJVRHxk6re+F6nJmXo6rVCUXoB
	fO4fkmXFbGR1nD5xcyC/45jCPYtRw01AX/wlyRyi0Oz5vr+9r6SGZbb9Ux9mUXzQ
	z6zgyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qcc0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 08:08:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N88kLS013404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 08:08:47 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 01:08:44 -0700
Message-ID: <aa18a24f-a16a-46a1-a66c-732999acb63e@quicinc.com>
Date: Wed, 23 Jul 2025 16:08:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
 <ad436d4f-dff2-4063-9b9b-e1218f6dc3c7@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <ad436d4f-dff2-4063-9b9b-e1218f6dc3c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA2OCBTYWx0ZWRfX98BYl+ateetq
 R5MM4HLSFNZeZ+4mGrtei+CQLOgGUd1SjHHAhZ+fXu9t4QHta1WoyVbZOaCsvBiqp2H41IVBtA6
 7i1py8JgN5DZujIUznhpECVZziKFBwbiTFLxOPzE1a+sr++3EuKAHo3gaBIl2EyKdBwGbDqS9Ia
 Z5G34x4AxF111ZuDzxw0PyO6bpyv/wComNwcPoLodSIdwXNOcLGxFR4r8uh0jvu9hotDLRU9fIN
 Mwfo801GWuCo9Vz3mxqTbV81ux9ZWGyCrXWtgruK+Cb3y1A1EYTYhEWCutzAAI535L8A/jQJo3E
 WTB8EDEsFUjCNfd/ZZ0jp7emYoCMmKmaRC8BS4wuLcxsrB+4YNLfjk8fScPXwVmSUKUFZMGXBpf
 93L2u2bC/hdHQcARpwMs453Yg0v2OB984sZ7JcpxB+ykbtyAz10G+AG+VYcA4c1MxqD4mPvF
X-Proofpoint-ORIG-GUID: Ole1vipZ-uEpGLQpVV74pVea1aUrRcOS
X-Proofpoint-GUID: Ole1vipZ-uEpGLQpVV74pVea1aUrRcOS
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68809890 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=uN0tYdcQDJVYxVpoBKkA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=744 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230068



On 2025/7/23 14:26, Krzysztof Kozlowski wrote:
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> 
> On 23/07/2025 08:14, Yongxing Mou wrote:
>> Enable DisplayPort support on all three USB-C ports of the
>> hamoa-iot-evk platform.
>>
>> Unlike most X1E-based boards, this platform uses FSUSB42 USB
>> switches for the USB0 Type-C port, while USB1 and USB2 rely on
>> Parade PS8830 retimers for Alt Mode switching.
>>
>> Support for the PS8830 retimers was already included in the
>> initial DTS, so this change adds support for the FSUSB42 switches.
>>
>> Due to limitations in the USB/DP combo PHY driver, DisplayPort
>> functionality is limited to 2 lanes instead of the maximum 4,
>> consistent with other X1E-based platforms.
>>
>> The platform also supports embedded DisplayPort (eDP) by default.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This change made top of initial DTS:
>> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
>>   1 file changed, 156 insertions(+)
> 
> Just squash it there. Why are you posting knowingly incomplete DTS just
> to fix it later?
> 
> Best regards,
> Krzysztof
Hi, sorry, I'm just want to enable display based initial DTS. Should 
this patch merge into the initial DTS?


