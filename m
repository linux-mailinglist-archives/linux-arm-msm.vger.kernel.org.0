Return-Path: <linux-arm-msm+bounces-2250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0857FB7E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 128D31C20E33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603534E61E;
	Tue, 28 Nov 2023 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aX8lSSVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9EDD53;
	Tue, 28 Nov 2023 02:33:10 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS5cLmx030603;
	Tue, 28 Nov 2023 10:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tUIonUHh0NVX+sJd3d2rgPNx2Scj+OX6wN3VlhkdTYk=;
 b=aX8lSSVKZZR6teGAznGrWZtjVkfHBKhqqUphd+hbSdEqOchQdzO1svWu3VboiJmRNMnB
 yx1eI2r1HYduIQ/JGdGhOn8mWGwPtp7nxyxv9+l1b4zSidoXySqqy1dpLuy83S0YfMgD
 QttdBjiJ+QT03T3aantzRKOrYFdhEpY5moy2hR5Xfn8infAe82O/iBBhulJ/UWOlWA8i
 n8RsUSns5WBaITd86hUyL3tZVCuwxCliFosV+ZLoyvTOMYbU+5SH2lFSTpsOuIOIOMsG
 zQ45C5L3G7jMBzUCun8stqAWDeVvp0MMOWI3afIwF60/K+g7IXbacIgyUI96DjJ/elpr BA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un02h1xc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 10:33:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASAX2aM017390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 10:33:02 GMT
Received: from [10.216.9.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 02:32:56 -0800
Message-ID: <18965bb9-7afa-4892-8b71-981ba29d2cd4@quicinc.com>
Date: Tue, 28 Nov 2023 16:02:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
 <ZWCpGdJRexnk98IN@hovoldconsulting.com>
 <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>
 <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5JcXaZYvs-01ZIgzCotYzzgV5wXle1C8
X-Proofpoint-ORIG-GUID: 5JcXaZYvs-01ZIgzCotYzzgV5wXle1C8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_08,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=660 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280083

>>>>> Now if the HS interrupt is truly unusable, I guess we can consider
>>>>> dropping it throughout and the above becomes just three permutations
>>>>> instead, which can even be expressed along the lines of:
>>>>
>>>> Infact, I wanted to do this but since you mentioned before that if HW
>>>> has it, we must describe it, I kept it in. But since this functionality
>>>> is confirmed to be mutually exclusive of qusb2/{dp/dm}, I am aligned to
>>>> skip it in bindings and drop it in DT.
>>>
>>> As I mentioned elsewhere, it depends on whether it can be used at all.
>>> Not simply whether there is some other mechanism that can be used in its
>>> stead. Such a decision should be left up to the implementation.
>>>
>>> That's why I said "truly unusable" above. It's still not clear to me
>>> whether that is the case or not.
>>
>> I looked at the code of  4.4, 4.14/ 4.19/ 5.4/ 5.10/ 5.15/ 6.1 and none
>> of them implement the hs_phy_irq.
> 
> But again, that is completely irrelevant. As I've said numerous times
> now, this is about what the hardware is capable of, not which
> functionality a particular OS chooses to use.
>    >> My opinion would be to keep the power_event irq as mandatory and not to
>> include the hs_phy_irq.
> 
> Ok, but you still need to explain why dropping hs_phy_irq is correct.
> 
> Until there's a clear answer to that, it seems we need to include it.

Sure, I agree with you. It should describe what hardware is capable of, 
not what we choose to add in driver code. In that sense we can add the 
hs_phy_irq to all targets.

In my next revision, I can do the following:

	- anyOf:
	  - items:
	    - const: qusb2_phy
	  - items:
	    - const: dp_hs_phy_irq
	    - const: dm_hs_phy_irq
	- const: hs_phy_irq
	- const: pwr_event
	- const: ss_phy_irq	(optional)

A modified version of your suggestion should help cover all cases and 
describe all DT's perfectly.

Let me know your thoughts on this.

Regards,
Krishna,

