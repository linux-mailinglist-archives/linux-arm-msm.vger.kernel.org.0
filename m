Return-Path: <linux-arm-msm+bounces-4632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B648124D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 02:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC16C1C20F09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 01:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF907ED;
	Thu, 14 Dec 2023 01:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CUDdPjAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57328F7;
	Wed, 13 Dec 2023 17:56:09 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE1XG8u032654;
	Thu, 14 Dec 2023 01:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pDwCxF94S9D0lgonY0fmhpzWERchJQlMltv0nwy5uFo=; b=CU
	DdPjAULc0hxxfiOiLgDLidTO7qUHgf9hmih8SLRkmgVdugi7gyQZz9sm/1tiWPAK
	PgnOCHg6/pcr5/Vaak/Y1awu5DXR3hw6dskuppP3YG/LyrFYiQxswq2JRAVHnl+R
	LSE0oBy7RDBeXlRojSyCyPg3lDUdcze5GuK90VdCVaQN5iozTzeTO5jWDooO4Z3+
	r2Mg7DBqPiygmd4iw6FLwyOf+fQZvHXrcUe2D2RtZdsm9QMqvXnWcnkqeaOhoLCG
	B8DLJb+S2j1Pie7R+u5xO/E0ukFTkcBdf+IS1HsqdLj/9MnKHeHAj+Jn8Pocoq9O
	yzvPzcZQjT4tmEpFlmTQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyq9t053b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 01:56:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BE1twZg018574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 01:55:58 GMT
Received: from [10.216.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 17:55:54 -0800
Message-ID: <4b73d53e-ee25-4764-a916-973674d83fc9@quicinc.com>
Date: Thu, 14 Dec 2023 07:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: fix USB wakeup interrupts again
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Johan Hovold
	<johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231213173403.29544-1-johan+linaro@kernel.org>
 <e2ce47e8-fe27-4ca0-b295-cf7e12eae1ce@linaro.org>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <e2ce47e8-fe27-4ca0-b295-cf7e12eae1ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G6Qbz1WsjBl2O4jjcCFZmxwy7g5Y1RGW
X-Proofpoint-GUID: G6Qbz1WsjBl2O4jjcCFZmxwy7g5Y1RGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=576 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312140004



On 12/14/2023 12:19 AM, Konrad Dybcio wrote:
> 
> 
> On 12/13/23 18:33, Johan Hovold wrote:
>> The USB DP/DM HS PHY interrupts need to be provided by the PDC interrupt
>> controller in order to be able to wake the system up from low-power
>> states and to be able to detect disconnect events, which requires
>> triggering on falling edges.
>>
>> A recent commit updated the trigger type but failed to change the
>> interrupt provider as required. This leads to the current Linux driver
>> failing to probe instead of printing an error during suspend and USB
>> wakeup not working as intended.
>>
>> While at it, fix also the SS PHY interrupt so that it too can be used to
>> wakeup the system up.
>>
>> Thanks to Konrad for reporting the probe failure on sc8180x and
>> providing the corresponding PDC interrupts and to Krishna for providing
>> the remaining PDC interrupts. The exception is for the second controller
>> on sm8150 whose PDC vectors I inferred from sdm845.
>>
>> Note sdm670 and sm6375 need similar fixes and I believe Bjorn is trying
>> to dig out the corresponding vectors. The SS PHY interrupt on sc8180x
>> should also be fixed.
> sdm670:
> 
> pdc 9 DP
> pdc 8 DM
> pdc 6 usb3
> 
And for second controller of sdm670/sdm845,

pdc 11 DP
pdc 10 DM
pdc 7 SS

Regards,
Krishna,

