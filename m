Return-Path: <linux-arm-msm+bounces-67321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51849B17EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 703467ACCEF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2D2221721;
	Fri,  1 Aug 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JVHlinzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAF2206B7;
	Fri,  1 Aug 2025 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039458; cv=none; b=OeFvn8hWlYeVWJk3LA+/F1VsCBrpWRyBCOLpxJOmzDsrtPgcJ4JndHVNNCjR93MzNDjKwDupx+x6P8IFqYY7Ti/HxvcakdC4RgQ70Gw6+8NTTsYJcNfYHNexea8trycxuCSma6c8ueNlfg8pasVqu+eQIelCwq7Wgf3fn1Ev6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039458; c=relaxed/simple;
	bh=KG8SEJsxR35Ub7apl7gSu3Pk2x+IayjrBt13TX3awmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ENrk97TDeUYfcx47Zl0s6DHm+MVHq/rPZE+KCHqs0DdJ8T8Se7pxE16vpnvzLfV4Gsz1beTjjLn1/5XKDDx2EFQUF1FaO2sT9cl9l0VGRmCIvrP65oy/1Zo4qxHiXvxtzpmt1uD6nUzi5PdUkE0obhZSTVsqudO1uM78cWPbefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JVHlinzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5711BiJb003172;
	Fri, 1 Aug 2025 09:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuWECCovdxGS9AcNOSSyDetDCmE65Syhg0owZeeCwSQ=; b=JVHlinzCR03GZStv
	eL/SCtBMK+m0e+a7630reRIL0x8gkqjl5FDBRLonUr2/gWXXYOUQ1n3icZmDBXwM
	96BZWoRy2ZKcCpprhKRv/bX503Yl8tIi+00zEOmSzrgQuTfrZfGp9n1JwgWf1Q8k
	iv28offjDnqX/x5HMsOO2RiA1Kx8zvOvJSLzfe4oG2lYH4aZb8vzAUtPuAKQRwGl
	VX/B/z7wg812+68iDyUYsP+dKoCwlDNmRDJgoQLL2srCPbXnaR510JytEHF6KOm9
	xWRtnBlgQggCULXQ8RNS6U7M7ZBwfuZjRagSTcD040SMyUKrncbLI4AWJoLGF1L3
	gvzUhQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbmb0rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 09:10:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5719AXg3017428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Aug 2025 09:10:33 GMT
Received: from [10.216.46.165] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 1 Aug
 2025 02:10:28 -0700
Message-ID: <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
Date: Fri, 1 Aug 2025 14:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688c848b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=Z5aP1FD7F3mh5Buj_IcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2NiBTYWx0ZWRfXyf4pZ2DMkoRM
 UizINbL8FvZrbk4un0Xxwg/t4cqu9FHLpYIunRTetELgMLNJTCIfqyUdZKAiLkEqqFZsH3KbYvB
 COKdCJJtJW+2MeJkyEmHvo3knaf+FtHi1fRIpoxOFObhuBdDYkPlF/VchoBHKf1TzXH5zXBKTdQ
 gyOLi70jHZr2wfVzGvFddHX4pvi10DZJuHYWlSZfSA3dJjvIoG+RQT/jNBFbInE+pvdPpvC4Z7U
 8rOQ3OpifuhElqgJQCZ1WSvqrPJO9RF6ImMxjPY4U8v+t7zq6fFK2YRJlhOaBfh46ZMdzxIgrlZ
 UCS+fjxqNGN9Kl6YDu+8RqCuBUaQ9ZFs0zXY8OqOu/KX5Wj1YMFteDg4GRenG46CyLwZO0/hlvQ
 j9NSVSebGOl8wQDVZDlykjPNC81UA7lO9IGuBn1EDHu74qVZss5eWia41SSHf2wmC4yHnkfl
X-Proofpoint-ORIG-GUID: VL0XS-Z68SZho4-zG-U2VXj2Beh-pMMO
X-Proofpoint-GUID: VL0XS-Z68SZho4-zG-U2VXj2Beh-pMMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010066



On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
>>> support automotive use cases that require limiting the maximum Tx/Rx HS
>>> gear and rate due to hardware constraints.
>>
>> What hardware constraints? This needs to be clearly documented.
>>
> 
> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
> but keep on responding to other comments. This won't help you to get this series
> merged in any form.
> 
> Please address *all* review comments before posting next iteration.

Hi Mani,

Apologies for the delay in responding. 
I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 

To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.

I’ll ensure this is clearly documented in the next revision.


Thanks,
Ram.

> 
> - Mani
> 


