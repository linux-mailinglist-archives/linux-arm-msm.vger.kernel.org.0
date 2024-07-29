Return-Path: <linux-arm-msm+bounces-27238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C643793F35D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8C8C1C21D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2870D145348;
	Mon, 29 Jul 2024 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ltZDLshd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0653145344;
	Mon, 29 Jul 2024 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250675; cv=none; b=LS/pyuDwq57tNVTFY36n881utBVj327HH+MrZJxNnWmcLnkDmKgrMl52oyAkiHx9IRbRR1NyPEHHLxHWU1M8VSt7mvmpGHExi2RYkjSriZ4HjtV/xDKhVKhLo1DGwa1yUCrRW3iZgN5M2kpCOKrG2usi+hFEaEzO5cpboDwOlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250675; c=relaxed/simple;
	bh=IoXGirG8rFJ+cAL8Qx1QIfbZ4c4yEdOZzq6rXHwas8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ojzaJGblRYTg8VmwOX9lWuJzuX+C68mRfaGZzRQec9FqGCeI0+KEW54oK5zQD5A35Qf8pDY1xUUHx/Oq9+9fJYO2Z8jrgKsUGfDXORFT7pZhhOhufVdtgGilRFk5of73KqvczhfLZRSBHFNc3f3AxVCwL5hN5nLQOXUAjK+JkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ltZDLshd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAHO2R016748;
	Mon, 29 Jul 2024 10:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aHtL8jzTdNbYvDxviLStizGdNixvfs7vF4J/jZ5Hqg=; b=ltZDLshdK9PFy7ZU
	lLt+/QOUcRdDBJ/CMyC6E6YFayLggO2jx2cLVR0TqrnM4Lm96g+j54gq+5wsf8Fg
	zL6YRbVQFAfIEOSPtJYwgtHEHGtmKvpSVPlDrF8H9O95bACBFKrN5lFl62PYk8Ec
	IsmHK+8DEKSevvA6QsD/9ub8o0d1CyGtDJc1jGmPvrlJdYfD+LjOhjmkqcjY3SRA
	O0/8tvaYSKSrSTAfjrpEx4ar3LCnTp92z28I2eF2tnXnypm5mOpMtOlZr5KYTNEe
	7iMX96Nv99TMEVL2bdcC5Yw9RA3cCbaZ4B09NB4okFqpMvMz/x55hKvWVL8ydYhT
	vUTg7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms433yfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:57:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAvnJr010564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:57:49 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:57:45 -0700
Message-ID: <454fc2ec-6679-2d51-2a6a-580838d6ba59@quicinc.com>
Date: Mon, 29 Jul 2024 16:27:42 +0530
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
 <fe44268d-76bb-bdbd-e54e-39a38e4e5a49@quicinc.com>
 <8d31cbfb-f223-4539-b61a-a30a12dfd99c@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <8d31cbfb-f223-4539-b61a-a30a12dfd99c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g_4i_sY0F16XC2BjudF5JpvQL3Slxx_m
X-Proofpoint-ORIG-GUID: g_4i_sY0F16XC2BjudF5JpvQL3Slxx_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=944 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290074


On 7/27/2024 2:01 AM, Bryan O'Donoghue wrote:
> On 26/07/2024 08:01, Satya Priya Kakitapalli (Temp) wrote:
>>
>> On 7/23/2024 2:59 PM, Bryan O'Donoghue wrote:
>>> On 22/07/2024 09:57, Satya Priya Kakitapalli (Temp) wrote:
>>>>> I have no idea. Why does it matter ?
>>>>>
>>>>
>>>> This clock expected to be kept always ON, as per design, or else 
>>>> the GDSC transition form ON to OFF (vice versa) wont work.
>>>
>>> Yes, parking to XO per this patch works for me. So I guess its 
>>> already on and is left in that state by the park.
>>>
>>>> Want to know the clock status after bootup, to understand if the 
>>>> clock got turned off during the late init. May I know exactly what 
>>>> you have tested? Did you test the camera usecases as well?
>>>
>>> Of course.
>>>
>>> The camera works on x13s with this patch. That's what I mean by tested.
>>>
>>
>> It might be working in your case, but it is not the HW design 
>> recommended way to do. The same should not be propagated to other 
>> target's camcc drivers, as I already observed it is not working on 
>> SM8150.
>
> I don't think the argument here really stands up.
>
> We've established that the GDSC clock and PDs will remain on when the 
> clock gets parked right ?
>
> Am I missing something obvious here ?
>

Yes, just parking the RCG at XO, does not ensure the branch clock, i.e, 
the 'cam_cc_gdsc_clk' as always ON. When I compiled the camcc-sm8150 
driver statically, I see that the clock is getting disabled in late_init 
if it is modelled.


Can you confirm if the camcc-sc8280xp driver is compiled statically or 
as a module at your end?


> ---
> bod
>

