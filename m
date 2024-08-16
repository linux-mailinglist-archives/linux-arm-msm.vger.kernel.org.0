Return-Path: <linux-arm-msm+bounces-28726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1F9540E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555C0281CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ACC78C76;
	Fri, 16 Aug 2024 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P7l7PDDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EBB7641D;
	Fri, 16 Aug 2024 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723785162; cv=none; b=FedUungrc7g8WiAMQFo09T7g7juGfcVJTUFk1zKw1Tk4MDp+K/3LNSUi8FUwVV+JByvrNv094LX95R+sSlX+TdbRnqU/9TJ1+nfUOZ8moH5C38+9xFA0G+aZ/Fbl+KVBby6gOC28o4BfVKJCUoAvthNYaTL5PCwRTKtwLeQGBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723785162; c=relaxed/simple;
	bh=SmZCuuog49yLg7CxDQXLbMf/8zxvQ3bcX1FvPNUQHNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eUS/Fn0eYRvDEhBufCBHqbMAQE2ACAbYumZIvIMhrHdeFgI5AOiBSRG+wkkeDvxbCMkPw5leqBGtFqlkCgN1HCiDbC29VBj2vEHqyG0S0Q77/xGJDeJ38kh9Xf45nZbiDvpP5XGUz+UbQ7NPpqNCTLO/ZlFhuxO2jo71HIrJ3Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P7l7PDDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FJPVkp010240;
	Fri, 16 Aug 2024 05:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fC/+fzCREMjHQ5BCiMs5qQYrgUquyGGzNPjk2kSeIn8=; b=P7l7PDDCfy7BZV66
	20ii0aCDh53kaN0t0BoAcH2iRb93Ct+/t3ae3/AFXMSaU1Lggp2qbl7s6oQ/pode
	jAMQ96B5hysHkVC2aEToUv5XH2LaZnDLgeG85qVB72aJ4V4xEzwkUy01+IBGglj3
	oEzqkmixse8Nk5kBRQxkJyqBd4RSQ5/WICMBVu35XtRoQ6M05MZ8v2X+l1pRhn4w
	is2QwA5CoMa8l/RU/UpOnCsagTpwrUCjtskICanCSJRVzXcWnn2sAU6n0Aovo3BB
	NKQQaEPZ4iUewoUjsCkrVmDcY5ycUpwt3mc4+TlgEEW+fHVa4/tM5vusdopO156D
	j9r9Jg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41082wr6jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:12:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G5CZs4019462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:12:35 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 22:12:30 -0700
Message-ID: <f642cf7e-e243-4378-b080-def0ccc45ce4@quicinc.com>
Date: Fri, 16 Aug 2024 10:42:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] clk: qcom: Add support for Video clock controller
 on SA8775P
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-2-badaf35ed670@quicinc.com>
 <8916840a-e5e1-406c-a1e8-a073ad344d56@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <8916840a-e5e1-406c-a1e8-a073ad344d56@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UnjDuz-FkCoUlJtYJwjVQNwQjViJ6Hd-
X-Proofpoint-GUID: UnjDuz-FkCoUlJtYJwjVQNwQjViJ6Hd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=927 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160035



On 7/16/2024 5:35 PM, Konrad Dybcio wrote:
> On 15.07.2024 10:23 AM, Taniya Das wrote:
>> Add support for Video Clock Controller for SA8775P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +static struct gdsc video_cc_mvs0_gdsc = {
>> +	.gdscr = 0x809c,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0x6,
>> +	.pd = {
>> +		.name = "video_cc_mvs0_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &video_cc_mvs0c_gdsc.pd,
>> +	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | HW_CTRL,
> 
> HW_CTRL_TRIGGER? Not sure why HW_CTRL wasn't removed altogether with
> the hwctrl patchset..
> 
> Konrad

I will submit the next patchset with HW_CTRL_TRIGGER and going forward 
as per our Video software team we will support HW_CTRL_TRIGGER for all 
targets.

-- 
Thanks & Regards,
Taniya Das.

