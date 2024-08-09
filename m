Return-Path: <linux-arm-msm+bounces-28212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217D94C994
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 07:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFFE7B2338F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 05:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F57416BE27;
	Fri,  9 Aug 2024 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aEky0727"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25E169AE3;
	Fri,  9 Aug 2024 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723180779; cv=none; b=fT817cOAA+oze++HyPi2nE3FwM+9UQXAu6HA9FHKZ9uAuSnmyE/3TYzVaPoPA8mlWqF2NpBgn8Yp9jD4VPz7kn88nmQJ8ZOr2Ks4tgyQ+yTZfoqqzgSMhF/I5CvoNhGJOOAkdWvhGyAZkhmp/W2nFtfFQfCTGxXlAbsHCq6b30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723180779; c=relaxed/simple;
	bh=JCts/cexkaa+AN/hfoehqT3dy9ZUJrAXQH3E4HWFJeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r63JQky/OXvIC9HL0Vak3a8b6emuALZ0/Or6YDT5lbmSnanjYWJlq7h3hfmVLOD4gmpqwrs1OMQ1e/Gii9AY4ZpfO2doIgO5b/xdJKopt29dSxa6D12IptyhSQ/3ALVA7asKcClA/ac0/Z3g+fP4tGKMNxy1vaOjlzmRmLVy0SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aEky0727; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4792K07N019134;
	Fri, 9 Aug 2024 05:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypkmty92BUmAbgOA9LUQTbb+un0zDd4LL3EixrBNJ+g=; b=aEky07276Y69C15q
	0H07DE5Z7D0TeNyhDJSiLv5AtlSnMEbP78IGuoq5WFaL/DE48JJDvmyw0hnPmHQE
	xj/xh3r9l34UltBYww0/XDtdhlYWYbsA7dXVBB8240AUWqpkd7VnrggeXGpHirAW
	/lGhWpejMzGSWV19O2NIaldcahuASusyV3Yc3Z//caBVS32FvRIdvgGBKf6dNWMF
	s62vtud6YAHJMT2zknvG2Kt0+l2zYX6igAEzL+Ou5YoWdpveziRvHjxFFTaqej6F
	kx5rZUqpJo2wUDKeE68gc3DF+jQunwE/3+ShaKef3iH954pBIT3KmINKYG0neoTS
	YHy7fw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vvgm2cj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 05:19:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4795J6Hv026694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 05:19:06 GMT
Received: from [10.216.3.179] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 22:19:02 -0700
Message-ID: <0b3603b7-e09d-2754-90d1-2095efc2fbd5@quicinc.com>
Date: Fri, 9 Aug 2024 10:48:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Fix overflow in BCM vote
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        David Dai <daidavid1@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Taniya Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        "Satya Priya Kakitapalli"
	<quic_skakitap@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>, <stable@vger.kernel.org>
References: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
 <a7607f45e26c79f13b846fd0d8284bcf.sboyd@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <a7607f45e26c79f13b846fd0d8284bcf.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5XbWEaadz3lVo_NuoGYoyrHg_p65ZoGW
X-Proofpoint-GUID: 5XbWEaadz3lVo_NuoGYoyrHg_p65ZoGW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_02,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=915 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090039



On 8/9/2024 1:13 AM, Stephen Boyd wrote:
> Quoting Imran Shaik (2024-08-08 00:05:02)
>> From: Mike Tipton <quic_mdtipton@quicinc.com>
>>
>> Valid frequencies may result in BCM votes that exceed the max HW value.
>> Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
>> truncated, which can result in lower frequencies than desired.
>>
>> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
>> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
>> ---
>>   drivers/clk/qcom/clk-rpmh.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index bb82abeed88f..233ccd365a37 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -263,6 +263,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>>                  cmd_state = 0;
>>          }
>>   
>> +       if (cmd_state > BCM_TCS_CMD_VOTE_MASK)
>> +               cmd_state = BCM_TCS_CMD_VOTE_MASK;
>> +
> 
> This is
> 
> 	cmd_state = min(cmd_state, BCM_TCS_CMD_VOTE_MASK);

Sure, I will update this logic and post another series.

Thanks,
Imran

