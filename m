Return-Path: <linux-arm-msm+bounces-73951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50AB7FEDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24759627625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21182F1FD6;
	Wed, 17 Sep 2025 14:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XHNI9s2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463192F069C;
	Wed, 17 Sep 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118247; cv=none; b=H94n2SScmAW6s8Qcb8shtRxDjub1wKdfrDEw26elti1lEykQIfTqsz4Kcob9NzS300zvFwB/9F6xO2Y0Ya2K5NxOa7Lt2WbK6f5N3d9NNs2tpIFh2m5kq1h9vsawEzpCE/eGNzxRYQ3rnpEWmXIpS25z/ksPTA1x3vTfyO02Ndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118247; c=relaxed/simple;
	bh=eEd470u7CzAzRCgJ1yE6xvnuciGhUWvl5SHPO0UxlJM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=stMetFOkiNzTC8l6GX2YjYdWqp3ckDbD7rbAuC/ua4aUpMONVVMRyBw9nTxWGj7uBtbQl6UvcU9Qsa35XUR31D7AhEPi974zrhTtEmb9/SnKzLLxpsRTkIa1M3k9wwS7zeexBIBs4/g5vLG2kvYoK6wmHfkUQvVQbErycL7DY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XHNI9s2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDGXWb004305;
	Wed, 17 Sep 2025 14:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePcboJNrvqFfQxXev1JTwCoGIGRzXZjx8+H/6ozCrXs=; b=XHNI9s2rrXVmFpQ6
	hNX0KPGbhSDSh/LX65OinopyKmEvGXpKPyj5KW0+Df5TLwMnb1Q5g4jp0ipqVL5x
	dn1LueEkp4/srP1BZA7Z/veAQD0DXhoQCnqtnchPwvcmWeQeSSor79pCGU9ssWg+
	dDpAeUnbeDUlvB4/o901gshlPgTgol4WpztmCebnlKu0WqS5TMR3zFtO59wjPq0G
	/7MFXDrsWjSJQj6kVhu0f1YK5qw6BWMlfwT/VCpDJHMc83XuUBiuWMlyaY0v6hvn
	1Ezfw02jfMXbY8IhRnz7WluEPfpjTtiS/vpEBwf9B/C2hHOMfVGwD75tBewy/3Sw
	ApnM+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgr51f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEAVRh004849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:31 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 07:10:27 -0700
Message-ID: <44dce42a-8a78-4b09-b5fb-3fff72b4e4b5@quicinc.com>
Date: Wed, 17 Sep 2025 19:39:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <20250902164900.21685-2-quic_rdwivedi@quicinc.com>
 <20250903-sincere-brass-rhino-19f61a@kuoka>
 <2360f9f8-470d-46dc-be9e-660bb1580428@quicinc.com>
 <ea81a84c-738e-4e70-a0d4-e5f6d4b1064f@quicinc.com>
Content-Language: en-US
In-Reply-To: <ea81a84c-738e-4e70-a0d4-e5f6d4b1064f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UeLZDa2kzbteYYyDleiGa16o1xVG4yu-
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cac159 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=2ydiuVImiamWSaWHqPgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UeLZDa2kzbteYYyDleiGa16o1xVG4yu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX3aHwgvLEni0n
 h6sq+86Ub1JTJUVWIkD7Gv6HlrIpxLhtX/3XlJ1ZrgEPOhF8SG2L47flTLBxz6RmwIXn7r7SOms
 DCna4o5uBxyvUDwRaHvFjTYfbPp/RRQ4fMA+g8lRAFmX2y1V0z4VozwNGvorHcOVlrz1nNz2E+r
 H3lZ7xXQSUusp2iWXV3csbip4Qmupo+8Ief00ZcV7HBm0kfGGYD1OVYpT5OAGrsxY3f/0L4VU3D
 3U9JZJoT4TPRIN2k2iKdPlRAAX1aCjCqWPKIia6kJiHSFWl4on8pw4pvo+pwaNVm+KMdgw2yLw/
 plmUr+DX/09zGJKWNqdLK2Db4zhN1itlg/QI3uO9DJs1HWhdPEHNfWY3MUTwMqZILb7RVGdOfbC
 cFo2bFRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128



On 12-Sep-25 9:14 PM, Ram Kumar Dwivedi wrote:
> 
> 
> On 09-Sep-25 8:28 PM, Ram Kumar Dwivedi wrote:
>>
>>
>> On 03-Sep-25 12:14 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 02, 2025 at 10:18:57PM +0530, Ram Kumar Dwivedi wrote:
>>>> Add optional "limit-hs-gear" and "limit-rate" properties to the
>>>> UFS controller common binding. These properties allow limiting
>>>> the maximum HS gear and rate.
>>>>
>>>> This is useful in cases where the customer board may have signal
>>>> integrity, clock configuration or layout issues that prevent reliable
>>>> operation at higher gears. Such limitations are especially critical in
>>>> those platforms, where stability is prioritized over peak performance.
>>>>
>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>> ---
>>>>  .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Hi Krzysztof,
>>
>> Alim has recommended renaming the "limit-rate" property to "limit-gear-rate".
>> Please let me know if you have any concerns.
>>
>> Also, may I retain your "Reviewed-by" tag in the next patchset?
>>
> Hi Krzysztof,
> 
> Just a friendly reminder,
> Would appreciate your feedback when you have time.

Hi Krzysztof,

I am retaining your Reviewed-by tag in the next patchset.

Thanks,
Ram.> 
> Thanks,
> Ram.> Thanks,
>> Ram.> 
>>> Best regards,
>>> Krzysztof
>>>
>>
> 
> 


