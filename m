Return-Path: <linux-arm-msm+bounces-19848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2978C596D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 18:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21367B20F94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 16:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28017EBB3;
	Tue, 14 May 2024 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kZqUIftp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25B144D1D;
	Tue, 14 May 2024 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702971; cv=none; b=GvWX9Ii/QHh6VBbGqHIAocZ4/YujPuJve1LAU3/lOSCE9BBQGXINA8DsQTFiO72fgAEWOoo++jIOFzfEaVuwYS4nUlDRJk6FhbkK1Z8aSrhR1XzJ9wtUKxGkCo0R9Wk4RH9x//QMUj/BM2IP9bvoeswGgX9J1Y1IWIgDftXlKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702971; c=relaxed/simple;
	bh=Y1Mwj8megNCZsWB1w48yTX/5icYS88YG/kK7MZ59bQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZqDynExHnfyEJSujVuuP/XFPQ//7b+TUmrEfdYx/+nSpQuhW6b1/aAVs8MRBuLx7I5tYgX2oMG2BL5gc64GOHmbiGDpR4Uikqj4YY2voXjyKu7xAth/LtuVmJkXFFYnJnkNKNefSTz3FFSJqUgJyUa78wgc9qp/AZ20iT5jDm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kZqUIftp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EBoouE004502;
	Tue, 14 May 2024 16:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=J7JjMDC3S88RacAOt3QR35v88E532gBPPTYjZONTdz0=; b=kZ
	qUIftpXkW/9jevnwh3MltVe5PUe1IM647YDxJrPH7sPxOacCD+wROQwDDj7Xy1Ip
	FDGOrYqmePBNqk33d8YQlqY5pH6Gj/JdibjnoJ27NB1BnCfa8WK20nGJCFctLwfR
	cqXR4DV4Cv8p5GWyj7Tr8v9UPWOu+aNeEIvC68fdA/v7k7wC/d4an7uw0xP7cMeo
	chc35NoQou5ITKoF0OLL+2dJVksB5uilGtJPYgjAAPdYGDmnXa3VpuP3kdJsJzHz
	HKcjebPkowAaWyC9QbRZE9693yvBV9MJIsZjnu7mV9vy3San35QUdrmwYjNwurXM
	CeNGOXDlZ+1eVmAMZViQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47eg8ph7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 16:09:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EG96p4031675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 16:09:06 GMT
Received: from [10.216.38.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 09:09:02 -0700
Message-ID: <7ebbd655-6b70-41a0-a71d-61c3bf17d543@quicinc.com>
Date: Tue, 14 May 2024 21:38:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from
 Stromer pll configs
To: Gabor Juhos <j4g8y7@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Varadarajan Narayanan
	<quic_varada@quicinc.com>,
        Gokul Sriram Palanisamy
	<quic_gokulsri@quicinc.com>
References: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
 <baa81202-f129-4ec2-baca-6ca8b476a37d@linaro.org>
 <21cedacd-f454-4eb8-9b2b-33a14592a6c1@quicinc.com>
 <01889053-bcf2-40cb-86ad-2f2bff56f24b@gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <01889053-bcf2-40cb-86ad-2f2bff56f24b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a1vMOgaOefm7xqfEaiWnv8KihpQvxE7l
X-Proofpoint-ORIG-GUID: a1vMOgaOefm7xqfEaiWnv8KihpQvxE7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_09,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=751 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140112



On 5/14/2024 12:14 AM, Gabor Juhos wrote:
> 2024. 05. 10. 18:25 keltezéssel, Kathiravan Thirumoorthy írta:
>>
>>
>> On 5/10/2024 12:23 AM, Konrad Dybcio wrote:
>>> On 9.05.2024 10:08 AM, Gabor Juhos wrote:
>>>> Since the CONFIG_CTL register is only 32 bits wide in the Stromer
>>>> and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
>>>> IPQ5018 and IPQ5332 configurations are not used so remove those.
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>>> ---
>>>
>>> Hm, it sounds suspicious that we'd have these settings then.. Could somebody from
>>> QC please confirm that everything's alright here?
>>
>>
>> I checked the HW doc and yes in both IPQ5018 and IPQ5332 CONFIG_CTL_U register
>> is not implemented. I see offset of CONFIG_CTL_U register is removed in the
>> change[1] by Gabor.
> 
> Thanks for confirming!
> 
>>
>> Given that, should we also drop the pll_has_64bit_config() if block from
>> clk_stromer_pll_configure function?
> 
> If we can be sure, that there will be no Stromer PLLs which implements that
> register we can drop the check. Also, since the SUPPORTS_FSM_MODE flag is not
> set for any of the Stromer (Plus) Plls supported currently, the related check
> can be dropped as well.
> 
> However I would keep that as is for now. I'm planning to remove the
> clk_stromer_pll_configure() function entirely but that needs a bunch of
> preparatory patches which I'm working on at the moment.
> 


It was Stephen's suggestion[1] to introduce the 
clk_stromer_pll_configure() to avoid touching the 
clk_alpha_pll_configure() which has been used by many PLLs. However if 
we have a valid points to remove this API, then yes.

[1] 
https://lore.kernel.org/linux-arm-msm/fd150fa2b35e1e07808e3d1e67e1def7.sboyd@kernel.org/


>>
>> Nevertheless, for this patch
>>
>> Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> 
> Thank you!
> 
> Regards,
> Gabor

