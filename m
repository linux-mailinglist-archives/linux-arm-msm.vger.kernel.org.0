Return-Path: <linux-arm-msm+bounces-26458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A889D933BD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CFD1C22C89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A29A433AB;
	Wed, 17 Jul 2024 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QPbSpq2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B13FB83;
	Wed, 17 Jul 2024 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721214530; cv=none; b=T9aoaKT1aenuhT5IRu2LD9N/rnc2q81fxIIZYFQnCzwRsaKTr9Z6bMHFCtyfu9DEEh3MsBDrCxk7xRj1XAGMrKVkj5bYhSakRbvtp6e4ZkTpPZQWPPy1i537asg/B2DFXmK/juFV5lIHR2fgg6SpGr00cs7Tf/91GLBZJSDP7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721214530; c=relaxed/simple;
	bh=I5ched4wENHpHAD6luPQefl8V5ngs+XBJs0SDQGExw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ADgmH7Sb1yUbhpSjsvRWTGiLQ7uRYjlKuzotsEWzGSFFXzY+3CSVWPjmCdA30yEwP3+/9p7ZKHTz6ErCpad24rVOyiLpTs/BPX7b5Wkajr1E6zWo3YDiftOq5UQXygj6Ivr1pQjIXsw54uktfGuvaOT8w4ehAP0BepUFTXou7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QPbSpq2t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H78QOx005470;
	Wed, 17 Jul 2024 11:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Gcz2+gTCHZ2HMufSAZ2uNdMkEEsbN7s70NtFj1vsmA=; b=QPbSpq2t3SxudNZu
	ak4gaQ5nG8NBFQMKAoUnHoI5bY1xyAvZhX8YXrm/UD4bX9Hc/8e2CncxXwP2hV1K
	eUza40BZ/kgay4RYaSWgYIDt2nqnOMo+nkdO1RRCCT4O9lsWQ9/q0MVuAasvQyuc
	bk1i+F8Tb4TxyP1mSEltcP3QjwEwQBGZWGkceKRsls59jVIraqoDXGmgD7HsggXA
	LSAiTy1nvEOWNElcIZRULEU7lVNvePyVcZxuuHXa/noEZfAuDfLUh1PCZhMVxEj2
	CCCdHQxUyvc+4XEag+SxS44aZTNLwNB3qSYAS04q9Ob0CxwHFHJFVFiyVtv91nWp
	t0U9kw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfuj3ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:08:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HB8dsH024283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:08:39 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 04:08:36 -0700
Message-ID: <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
Date: Wed, 17 Jul 2024 16:38:32 +0530
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
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZBp46_3COGzf4gZf0njbrJ_ktu-8zD5Z
X-Proofpoint-ORIG-GUID: ZBp46_3COGzf4gZf0njbrJ_ktu-8zD5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170086


On 7/17/2024 2:19 PM, Bryan O'Donoghue wrote:
> On 17/07/2024 07:32, Satya Priya Kakitapalli (Temp) wrote:
>>
>> On 7/15/2024 8:29 PM, Bryan O'Donoghue wrote:
>>> We have both shared_ops for the Titan Top GDSC and a hard-coded 
>>> always on
>>> whack the register and forget about it in probe().
>>>
>>> @static struct clk_branch camcc_gdsc_clk = {}
>>>
>>> Only one representation of the Top GDSC is required. Use the CCF
>>> representation not the hard-coded register write.
>>>
>>> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo X13s
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   drivers/clk/qcom/camcc-sc8280xp.c | 7 +------
>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c 
>>> b/drivers/clk/qcom/camcc-sc8280xp.c
>>> index 479964f91608..f99cd968459c 100644
>>> --- a/drivers/clk/qcom/camcc-sc8280xp.c
>>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>>> @@ -3031,19 +3031,14 @@ static int camcc_sc8280xp_probe(struct 
>>> platform_device *pdev)
>>>       clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
>>>       clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
>>> -    /* Keep some clocks always-on */
>>> -    qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
>>
>>
>> As I mentioned on [1], this change might break the GDSC 
>> functionality. Hence this shouldn't be removed.
>
> How would it break ?
>
> We park the clock to XO it never gets turned off this way.
>

Parking the parent at XO doesn't ensure the branch clock is always on, 
it can be disabled by consumers or CCF if modelled.

If the CCF disables this clock in late init, then the clock stays in 
disabled state until it is enabled again explicitly. Hence it is 
recommended to not model such always-on clocks.


> ---
> bod

