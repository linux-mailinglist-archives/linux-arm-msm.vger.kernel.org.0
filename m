Return-Path: <linux-arm-msm+bounces-27199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23A93F15D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DED6A1C21DC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8BF13DDDF;
	Mon, 29 Jul 2024 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZrOVh4hq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6C778B4E;
	Mon, 29 Jul 2024 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245899; cv=none; b=F+YLsrYyYCnzauIpf+bsCNuYT9by4mMT5hqa0t5tiPKDdYeVtF4FXC0dyEnJ0nZAcx2lmRlQB+xYAw6SrWLyq+4gDSacisnDBSO9dBpiTwKrwkR0/XxN27Auzb6LS9PIEmZg1De0CxLMCoBcPfyeY8Va9god6Mi/Z2EKw0eGsT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245899; c=relaxed/simple;
	bh=6sWnXud9P85ib8ufCmqhXtUqgGoURmUP09U905hOr4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=upGAnXFOA1AKAwJcftwNXnuy7nhoY7SRm7ZwIEVC+pCdR/dNFQ+JtNbeGLA6C68IOMh9VTLyfF4HUUAB3kaS1U3CwOLb+bUZHuyJCQLsWqDjm/qPti9OLZdllmVne1OEZlDRTTApuNxwoSSzusfbwes0f66woMFiObHHpv8d5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZrOVh4hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNFngQ030779;
	Mon, 29 Jul 2024 09:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3DuZyTIPM+eAkEnapQy5bueU7+MV+bnyZV02KN0a68=; b=ZrOVh4hqVbIJWyFo
	VZAtWQ6y5ICGxz2ZE/zvks2yptENpNQio8aCFWSx6emuv7Cmmw5c95UDeWmtn0Hm
	tCZR8sgp+FlDT5q/kiXS8Mh25qDEykkHEeOT9KDgg2YxeQRMBL7OOkrryoWQuO1r
	gHdryfYGDV84+AvjoPm20pAMH/5qV1IDwb382P30pzdVVBE7gq1l98FkddoVxCpJ
	7Z4PlrX72wIKZIR1YqGY0imRyUYRr1oIs+hL/qAu7FpceUny9PR+/Nsi7P/rdY0K
	MvGi6ma1VYrezu/cBKyFzPo3ZTpgnn9PA0vvuENd0/gXXKh3Pnsvotgb8qKvoF+W
	y02NOQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrytuna5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:38:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9c73H024169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:38:07 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:38:01 -0700
Message-ID: <108d2cf4-2b17-4ce1-80aa-988e36de533d@quicinc.com>
Date: Mon, 29 Jul 2024 17:37:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings
 for QCS9100
To: Rob Herring <robh@kernel.org>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
 <20240710162745.GA3212156-robh@kernel.org>
 <3b8684f0-c89d-1a76-6bc5-93ced59dc51c@quicinc.com>
 <51302de0-5e4c-4e2a-85a0-e22549baa13c@quicinc.com>
 <20240711200354.GA2482879-robh@kernel.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240711200354.GA2482879-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uy67C5vQlgEaIe1ALIPFJy3iwFF2f_Jm
X-Proofpoint-GUID: Uy67C5vQlgEaIe1ALIPFJy3iwFF2f_Jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290065



On 7/12/2024 4:03 AM, Rob Herring wrote:
> On Thu, Jul 11, 2024 at 06:05:57PM +0800, Aiqun Yu (Maria) wrote:
>>
>>
>> On 7/11/2024 12:45 AM, Trilok Soni wrote:
>>> On 7/10/2024 9:27 AM, Rob Herring wrote:
>>>> On Tue, Jul 09, 2024 at 08:46:19PM +0800, Tengfei Fan wrote:
>>>>> Document the compatible string for USB phy found in Qualcomm QCS9100
>>>>> SoC.
>>>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>>>> move to use SCMI resources and it will have new sa8775p-related device
>>>>> tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
>>>>> non-SCMI based USB phy.
>>>>>
>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>> ---
>>>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>>>> While the QCS9100 platform is still in the early design stage, the
>>>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>>>>
>>>>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>>>>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>>>>> The QCS9100 device tree patches will be pushed after all the device tree
>>>>> bindings and device driver patches are reviewed.
>>>>
>>>> I'm not convinced this is not just pointless churn. Aren't we going to 
>>>> end up with 2 compatible strings for everything? SCMI should just change 
>>>> the providers, but otherwise the consumers are the same. I suppose if 
>>>> clocks are abstracted into power-domains (an abuse IMO) then the 
>>>> bindings change.
>>>>
>>>> Why do we need to support both SCMI and not-SCMI for the same chip?
>>>
>>> IOT SKU of this SOC is using the non-SCMI solution and Auto SKU
>>> of this SOC is using the SCMI based solution due to additional
>>> safety requirements. 
>>
>> More add-on information, IOT SKU which have qcs9100 soc mounted will
>> have firmware releases which support non-scmi solution.
>> And AUTO SKU which mounted with SA8775p will have different firmware
>> releases which support SCMI solution.
> 
> Yes, I understand the difference. My question is why should upstream 
> support that? Normally, I wouldn't notice or care, but the churn of 
> renaming everything makes me notice. Why do the maintainers need to 
> review all these extra changes because QCom couldn't figure out their 
> plans?
> 
> So after you duplicate all the compatible strings, what's next? Changing 
> all the SA8775p bindings which is an ABI break? Presumably, some 
> bindings may not change at all? In that case, you don't need any rename.
> I have no visibility into what's coming next, so please educate me.
> 
> The minimal amount of changes here is you are stuck with the existing 
> identifiers for the non-SCMI SKU. Then you can add a "new SoC" for the 
> SCMI SKU. You might not like the names now, but you picked them and are 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.
> kind of stuck with them.
> 
> Rob

-- 
Thx and BRs,
Aiqun(Maria) Yu

