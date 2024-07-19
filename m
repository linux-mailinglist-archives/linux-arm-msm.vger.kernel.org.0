Return-Path: <linux-arm-msm+bounces-26611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BD93745C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 09:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98CED1C20A6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 07:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BF94F8BB;
	Fri, 19 Jul 2024 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KWpT0eZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F1446CF;
	Fri, 19 Jul 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721373970; cv=none; b=shl4Iia2hlxe+rc5L88C5nZMelIclV5JqQJr/XIgx3ZNqaiq0A9uUtYXcSi9znFpBhyq8MolTc9rDEh8k7ylCHL1+gsCTEeI30fTNYhuEOqTvsoyW6qBOQYEaKSaf3/ha0uKpnC+CRwwz6VMtQ+EV1QyuBmhD++ZU60xOyAn7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721373970; c=relaxed/simple;
	bh=emon+gRNUzFM8ajmHcWHYkAKRaJySl5s5mTztAd7aN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Irze6egLRyldRbeDCNA8eYA8QDCyrPQDRllIKdxyGx7d42Lop4H6OyEG29XRIaUTc42Jwi6ZMPlN4NlJ1iIju25OAnArliIc6blmNwGIU84Sx28piOAIp1S+BqjDp2WPYUhfB2VL4TvMGCqncLdU3sX6bKrXYCMVd6x0qa5HJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KWpT0eZs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0u8ua026322;
	Fri, 19 Jul 2024 07:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+s6umawHR0DtsJDzkZcZLE1nHXDf83CbME2iVL0zWN0=; b=KWpT0eZsQiHMlPSX
	WuCUXWxUqMFvcEJTYVBzkNhUOa3rGNO9t1Iw27XM/sqTnIU1lqh8uSQ/N1hU1p2s
	vxX+yvHp2FizgFTyzKImyZrhXynDx12cedan6MF+AvRUsqi1ZAD23b6MGnSWeotU
	CSPZOdpK9qoREoC7xVw4fa91IVFXEXbN+m16/QOMAIzpIp6e7KNRaK2bin/sx7a2
	rt6YAO+ATx+M/0WsCB9MS9kVNZ+W8bmONBM5nOm+lLrOBv/UvbgDhyN9ftgOxCDK
	Eha6KoiWR0iyJjykCylIK1HW7gfmE1AmpiFWH1paNXVtglPyiDcPH8vaY/+L/DHW
	j1W5Dw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe1m8n5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:26:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J7Q1Wg031067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:26:01 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 00:25:58 -0700
Message-ID: <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com>
Date: Fri, 19 Jul 2024 12:55:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>
CC: <dmitry.baryshkov@linaro.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
 <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WoHaHl_0HFJo8-KG719vUHu_kpQ82CV9
X-Proofpoint-ORIG-GUID: WoHaHl_0HFJo8-KG719vUHu_kpQ82CV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=663
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190057


On 7/17/2024 4:41 PM, Bryan O'Donoghue wrote:
> On 17/07/2024 12:08, Satya Priya Kakitapalli (Temp) wrote:
>>> How would it break ?
>>>
>>> We park the clock to XO it never gets turned off this way.
>>>
>>
>> Parking the parent at XO doesn't ensure the branch clock is always 
>> on, it can be disabled by consumers or CCF if modelled.
>>
>> If the CCF disables this clock in late init, then the clock stays in 
>> disabled state until it is enabled again explicitly. Hence it is 
>> recommended to not model such always-on clocks.
>
> What is the use-case to keep that clock always-on unless/util someone 
> wants camss ?
>

The clock also has dependency on MMCX rail, this rail anyway will be OFF 
until there is a use-case. So the clock will also be OFF.


> I've tested this patch on sc8280xp and it works just fine.
>

Is the cam_cc_gdsc_clk clock ON after the boot up?


> ---
> bod

