Return-Path: <linux-arm-msm+bounces-27067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1793CE63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 09:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1391F21E83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 07:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7F21741E8;
	Fri, 26 Jul 2024 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BSR16UfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F74023D2;
	Fri, 26 Jul 2024 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721977296; cv=none; b=OCLHp2zfCRnX2d5eYXDhjs96Hd8hht0oeKp9OWbaWY4A64D+pC87sJzuDDVZezSuiVQ/NaiHiNRP88ah4T2vz5YnEboLjL68RhFAFpUZO8KrvpjKV2S1ZaVfSTSWnUT2c/i5CXYZ2CaZCH+sd8KuZwLZ7qe/iJ546/FTvIbARXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721977296; c=relaxed/simple;
	bh=BpykowJ9h4lhejSBCRQ5ewjt4CV375wwZQYHRzmFWM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gqbi6LqiylpFTPRibLjMpz9A4AEthBVCXO8VST/n8YLXmp8m5vo0GjyJZov3GYeE+HiDz8mRFg2VOsJfjWMHmIAlEk3Fw34JbHXXSb1WCIMR8MwW83vbXP9K2UGlhn8URWNb7EUegA67i5JUirTgGPsLNuBBxB0MKlxxw88JaN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BSR16UfT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q15ifB018586;
	Fri, 26 Jul 2024 07:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3zvec5pWB4rOB8Rd2yXXfGVchNT6ea4/aUuH8APNBI=; b=BSR16UfTDhZs4nTj
	OA6uZWOgJ4yag78zdXwy4YRwK8pIee8sgEahe53VqUKzMfCdnSusLHVCFnRrS5YN
	jbhZstejMisRbgvCajsjdQxOUz5HGmeYDtkITSZlUiTY2aR3ld3pdQySUFA4aqlk
	P4DiJoECDCQkxBbWy7elUcAm9Y7nIma9Dn5qsslWBelcujaAugM3aW4o4VEPoKWF
	o+PtW2nVR6MliJdIUmD7U/bG6/B0ONl1srXFAjFLEL02E0VIDUr+gagEToK/JivV
	CLMViQzvwRsIi4bTq/2/YDbk7F1caLf652ia+237MpkoHL6zogpj29vsU8AO3yM+
	Io1O2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1u5gmht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 07:01:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q71OAr003454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 07:01:24 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 00:01:21 -0700
Message-ID: <fe44268d-76bb-bdbd-e54e-39a38e4e5a49@quicinc.com>
Date: Fri, 26 Jul 2024 12:31:16 +0530
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
 <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com>
 <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
 <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com>
 <a0ac4c3b-3c46-4c89-9947-d91ba06309f4@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <a0ac4c3b-3c46-4c89-9947-d91ba06309f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MJgTtgTg9D62WMhxtZohgcFV0K8Ibioy
X-Proofpoint-GUID: MJgTtgTg9D62WMhxtZohgcFV0K8Ibioy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_04,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=885 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260046


On 7/23/2024 2:59 PM, Bryan O'Donoghue wrote:
> On 22/07/2024 09:57, Satya Priya Kakitapalli (Temp) wrote:
>>> I have no idea. Why does it matter ?
>>>
>>
>> This clock expected to be kept always ON, as per design, or else the 
>> GDSC transition form ON to OFF (vice versa) wont work.
>
> Yes, parking to XO per this patch works for me. So I guess its already 
> on and is left in that state by the park.
>
>> Want to know the clock status after bootup, to understand if the 
>> clock got turned off during the late init. May I know exactly what 
>> you have tested? Did you test the camera usecases as well?
>
> Of course.
>
> The camera works on x13s with this patch. That's what I mean by tested.
>

It might be working in your case, but it is not the HW design 
recommended way to do. The same should not be propagated to other 
target's camcc drivers, as I already observed it is not working on SM8150.


> ---
> bod

