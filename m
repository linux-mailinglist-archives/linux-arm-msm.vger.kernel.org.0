Return-Path: <linux-arm-msm+bounces-30652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9D96B4C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D981C21951
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 08:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6CF1CEAD0;
	Wed,  4 Sep 2024 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sb5ESuME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79071CE6F1;
	Wed,  4 Sep 2024 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438919; cv=none; b=ew7MJBGLEiFAjW5GnBZCWGi8ezQNYAGaw2gyK61QCX7TjDWbGadFmjn/x63xz47t0laLCJ85fnRn89TkBZjqaObVzbp5DujRnHV/Uat2KbXPDEWt7ny+6gLqevfmQl13+Jn2qf1funNXIq2r0G2Wf6WjLGmsr/2KtntiOCInizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438919; c=relaxed/simple;
	bh=VLQhnrWlVZabts9y/tnJs5x+zQRlZ/tWxB2YKf8VWJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b3lMfLgHIvMsVvPgSf2W56yUjDQlAiJhBKja1NJQv56l/LfAho7KKmmf5DJVFcewSnDG5lkjt8u4Y8/cOpqUapzbbGkEsJykyDoxU3CNOHI8VJ+H9D3ndz805a3W6vllP78pmRJXH+zz5Z8g+1RQTXmhEMAiXHDfw7uXzlWdocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sb5ESuME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483MVCPs032362;
	Wed, 4 Sep 2024 08:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISQM5iildReT2V1zg0Db/St/zyvITY2WJ0fEXiO6sNA=; b=Sb5ESuMEZj69JMAN
	Tp10AHfMC6wYtvIrfuLIsclIvGW2F64lrCw/ml51lfdJBJytFijngW2ymIXxCBV5
	sWzxvm7wP46JqxOl/PM7LvupC0UM9PAUbF3Sij72rECe8U3pthl97zrHcR4AKzdx
	+JABkbcoa3Ya7CHnrcbnL4+dK2hvSTIzDw6gnxwq8pfa2UsRRjKBS+E6M0E6yY/D
	mOZNaccngpBf9C7O9ViQ5yyK0cRJwFmDi/BQTet7ukzcEU42aSQ8hXjcrsAxZhOm
	3cdt9AVPwgCDSsKEZoe36yq5CrEEgWeqHEuX/gjLCGnKWvJa8JQXviX0HWnZGY18
	kaTVhg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe4bey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 08:35:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4848ZC7Q003119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 08:35:12 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 01:35:06 -0700
Message-ID: <729deff2-d5df-4409-b941-af22de408521@quicinc.com>
Date: Wed, 4 Sep 2024 16:35:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
 <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
 <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nKO07I44AFKjSylCJ7uQwi3lZLXjSL9L
X-Proofpoint-ORIG-GUID: nKO07I44AFKjSylCJ7uQwi3lZLXjSL9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_05,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=783 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040065



在 8/28/2024 5:34 PM, Krzysztof Kozlowski 写道:
> On 28/08/2024 11:31, Lijuan Gao wrote:
>>>>>> +/ {
>>>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>> +
>>>>>> +	chosen {
>>>>>> +		bootargs = "console=hvc0";
>>>>>
>>>>> Noooo, last time I agreed on this, you told me later it is different.
>>>>>
>>>> In the early stages, enabling HVC is to more easily verify clock and
>>>> PMIC related functions, as it’s difficult to debug without the console
>>>> log. After the clock and PMIC are ready, we will enable the UART console.
>>>
>>> Working serial is supposed to be part of the early submission.
>>>
>> Okay, I will remove it in the next patch.
> 
> Can you post next version with proper serial device?
> 
> Best regards,
> Krzysztof
> 
Hi Krzysztof,

Can we use the dts without console enabled as the first version? When 
the clock is ready, we will submit new changes to enable the UART console.

-- 
Thx and BRs
Lijuan Gao

