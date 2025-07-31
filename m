Return-Path: <linux-arm-msm+bounces-67231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C789B16DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBEC75682CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA5329E0FF;
	Thu, 31 Jul 2025 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YbeDm9A5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8229CB5A;
	Thu, 31 Jul 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951200; cv=none; b=VCGJOc9BdnvwNCOFZwfcOyAacEGJHFmS3c/j5hIJuP6idrbPzz+/cukF/QwpsiY+g1FAV8wi1lRQo+Y0Gy/NFewAsJy4Nsq9/o2GYCXZPiIN7gz0jDN0ycPFrene2itPZdjM5UIFZB/LuqgwhF//GdkEiIbKzO2VjF6KBcFuiec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951200; c=relaxed/simple;
	bh=m4oFzCwRTU+IeC7P815AOMIiU2yNxq4MEVAtFsY4MS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AErqbzPOZd+PXU7DO8m3aWP7ZjFHTAvfMOUEsvowvaqkuitCkovYR2Li+A+IFBeV13AnzjYNWHp2jcugZK/siNU2p4Bwl7UAjWDuu1Van88gT8t1NiBG4sNcttg4lCx0Zt1XdDR6dxK0P7cykeYEqrXT9tZ/0O1wtYuJVk8vSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YbeDm9A5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fRsP015457;
	Thu, 31 Jul 2025 08:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuMP5+kynpASaA1NeHqgCe2jXBmQeSyHylzT5u3l150=; b=YbeDm9A55K5Dax6b
	+fcilLy81+6ccVWaR91nNXLIp3fKTUDFSU8sLiRzZdWCR0Snf1/LMJnjmru5KgyW
	xZwqFfkT5GUaktCQ8T0ZoLmTHow691r7So28kmEdw/63dYMtZTJBBe4/VbDkMKUa
	6RE709OClUIHa90s4TX+uyadwC+xjil1k2Y+hy2kVzaMMQu6k31aPpx/kquHwDYA
	Hrm0pJuvkSYltg4ARwEU2liHZvypClYDhNn/4frq4MNn2AF/vYlJuIcomKmh5VqO
	47mjhdaHer/IJVzZM/0aTNfJ4z24jt/GfnVMxDqOsefdII1pYCk4raQh8jSaUeW4
	avivww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda6wby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 08:39:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56V8dc7u014509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 08:39:38 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 01:39:33 -0700
Message-ID: <e2a04756-0358-401a-b575-0134a8c8de60@quicinc.com>
Date: Thu, 31 Jul 2025 14:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dt-bindings: ufs: qcom: Split SC7280 and similar into
 separate file
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nitin Rawat
	<quic_nitirawa@quicinc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Avri
 Altman" <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
 <df8b3c85-d572-4cee-863b-35fe6a5ed9ff@quicinc.com>
 <6ebe7084-bb00-4fac-b64d-e08e188f3005@kernel.org>
 <20250731-agile-sepia-raccoon-c40caa@kuoka>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250731-agile-sepia-raccoon-c40caa@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vhONY3OKsou7Ix7nRfJmOfUhksUjG82v
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688b2bcb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=VFAJtQSCOEodjgH_CzwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vhONY3OKsou7Ix7nRfJmOfUhksUjG82v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA1OCBTYWx0ZWRfX/osetUbRBdYI
 4g8RtsHQOHjJcFnp6MpueDm6QzLbaq3CWoBu2K94cLmskZmkC3BL7UXdLuiaSf49xrxhXMrXUjo
 yg9mId6ed7I3MbJ2aSFuzCdIJ5VKoBuSVISB/+1ggkK/nhEvyfqikyf37klXsLQ701IhNTOHZQM
 5cNU8vyGxtodj/nWpw+MQ7w9PcxlT5VFGhHawrBkB1eVhV6TB5p+JyOj6nfxU9vGIHMIbZceqcB
 FjCIgn7rGk3OCREKYR5h+35LdQwx0GvAYhhrdayslGKV/zx0yp9qdxnp9UbMrVZ6aMdSxRrAs/Q
 KQYZc/M1A9KFUUIxTp460VoUiRFwbhjahYEVgJDPSFrM2tJu3ByaWxZMEZtvxgqqOyQY2LzvDLA
 RAw0gfA8RFrs/zKMjQmzFTmQ1jSTZ/f4vbwqKjgq2R3JUPZiIXomKid351p1TCe053AFPLc+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310058



On 31-Jul-25 12:25 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 30, 2025 at 04:25:06PM +0200, Krzysztof Kozlowski wrote:
>> On 30/07/2025 15:53, Nitin Rawat wrote:
>>>
>>>
>>> On 7/30/2025 6:05 PM, Krzysztof Kozlowski wrote:
>>>> The binding for Qualcomm SoC UFS controllers grew and it will grow
>>>> further.  It already includes several conditionals, partially for
>>>> difference in handling encryption block (ICE, either as phandle or as IO
>>>> address space) but it will further grow for MCQ.
>>>>
>>>> See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com
>>>>
>>>> The question is whether SM8650 and SM8750 should have their own schemas,
>>>> but based on bindings above I think all devices here have MCQ?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>>
>>> Hi Krzysztof,
>>>
>>> If I understand correctly, you're splitting the YAML files based on MCQ 
>>> (Multi-Circular Queue) support:
>>
>> Not entirely, I don't know which devices support MCQ. I split based on
>> common parts in the binding.
> 
> I found the docs, so I'll send v2 with MCQ also separated.
> 
Hi Krzysztof,

Regarding my patch: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com
I will post the next patchset on the top of your latest(v2) binding patch. 
Please let me know if you have any concern.

Thanks,
Ram.


> Best regards,
> Krzysztof
> 


