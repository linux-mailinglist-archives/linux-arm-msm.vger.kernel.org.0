Return-Path: <linux-arm-msm+bounces-26892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB593A002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5601C21B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645D41509A8;
	Tue, 23 Jul 2024 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W+YMj2sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64813D8B3;
	Tue, 23 Jul 2024 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734648; cv=none; b=a+SEpWb/1fHejqJv7hGz3GGMjigr/1P6nMFCWCmECWcPVPs8ev7SJGF5PuoR/NDtgT67GXOJ6TUKLgs1mWxxHMJXcM3XB0ynl0AbD3hpTcDxi+QVdU8JdMRxHCssu143WvpsbKkD2Cb5Z+slGaxl/9qA0FKbhb5IDe54uOmaTvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734648; c=relaxed/simple;
	bh=21f6vTa4pMdaybeLwFSTCxfsREuOEw/KDAqXUGIyD9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NkSJXybAe6dyla2YpF2ZS3Irz141FDM2GrPiWdclBN5U1PpTp/IELLOTZ+xRiO3cjFDRqsmQcNvIQ04YCkV+O/LcfqbEQBtyNpCDpzDEH00gOJZf1xQAQk4hKs835KrlXE8nsWIgFsD9y0DsB85ZhDu4RN5rflZF8uWd/0MGARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W+YMj2sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NAXuks027111;
	Tue, 23 Jul 2024 11:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5w51NTxkPijfWjcV+ypUl8aK0UhUtMWK45h0l7YIeU=; b=W+YMj2svoxP8uMej
	PT377oMfKi1G4YOEOp1ParCvUu3SZRVOH8JrrCgVyk7hPRDBADc6rvtsPf/f1pMG
	/8snfawT8QPcg20YhI1nU7P5LrsVhWhnJKAzI0gt6BpavKkQnlyb3wQW4gHE6+wF
	DpkUFDVQWgarnONmv9dVwKVquJ+J9SLqb+lLUfgYQtiL0rUTSODI8wP4Y0XqGw2i
	c+5JJHpUpnBLqGnfADIXsoD+fYjLr6mdc5p1O6pqRqITz6Y0F8AN8WCXm1HM1gGd
	RzVOrtNhY8EKGlaXLGigzHO2RZfB6FWWBHxVtb5MYG6+iLIAHlcGbgLi6arEZupM
	itPqnw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40gurtna39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 11:37:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NBbFPO015688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 11:37:15 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Jul
 2024 04:37:12 -0700
Message-ID: <8dfc5456-861b-e01a-d2d2-1bb9adea1984@quicinc.com>
Date: Tue, 23 Jul 2024 17:07:07 +0530
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
X-Proofpoint-GUID: feZzptoJ232DaBSYKX7Pn_7nbtgtKDDp
X-Proofpoint-ORIG-GUID: feZzptoJ232DaBSYKX7Pn_7nbtgtKDDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230082


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

Parking RCG to XO doesn't keep the branch clock always-on. It just keeps 
the parent RCG at 19.2MHz, branch can still be disabled by clearing 
bit(0). So during late init, the CCF will disable this clock(in 
clk_disable_unused API) if modelled. Hence this clock shouldn't be modelled.


>> Want to know the clock status after bootup, to understand if the 
>> clock got turned off during the late init. May I know exactly what 
>> you have tested? Did you test the camera usecases as well?
>
> Of course.
>
> The camera works on x13s with this patch. That's what I mean by tested.
>
> ---
> bod

