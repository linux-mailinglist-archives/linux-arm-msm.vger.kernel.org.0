Return-Path: <linux-arm-msm+bounces-30152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 642FE9656F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7DE0B23960
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 05:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4214AD2D;
	Fri, 30 Aug 2024 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WSFF4LfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A14683;
	Fri, 30 Aug 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724996027; cv=none; b=Y5T2gPMf0bLUTgrhfZ7ztUPOgfBQGu/iwqMeC3x/VTRtSdPF64JsErHcH2BZTfezs7wQkhKUZdlPf1ITKlUKSTnqE9dV+4ERP76iODzlf2OtnzbyumrxSwWRVy/zxwxvgEdwvD5Ja/DuRYXlDSInJfQ8/Hm5hYMRKCQxPndiEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724996027; c=relaxed/simple;
	bh=uH/QXZ1ShnBfSigfOU0NfgWvT4LyHWjRNkfITdpUUrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I+dr68dtOZUJcl3s8GTLZenSxNV6qF41sd1PSEYXr1YaoXyUF5k8CEBvz5/HNhkInuTN4ZtByCjS9RsLNFdpmlrWvOE/0fmzadcYb/LPYSPgWMHk9/5/4N+2wQ82qijj6LEDdVFp1WA36HmJKrDYAfSDGk7qoHXaVs6YPn45LYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WSFF4LfP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TLdCnw022454;
	Fri, 30 Aug 2024 05:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lqt0GTMJXrg68exn2tfw4JoLeT0jbP6921l/Km1KjPY=; b=WSFF4LfPQVxLVJ2M
	Wl1QtHXLWcuRDZO/0QGt8i/rhr1honQqMALQJf+ygbCV5387CKDj/LmRIUombW55
	cwdCJvAl/YkK3yG5RuMcr1Et0hYKx9b5hOSahYwB6etJykIMTP2ouoxV9EQnw6H0
	doLW+8XeAF4+Kbm4obRuOD54MgqvYG6L2cocgs/p+SgqOa1nITobfcYbx6Q1UM7u
	splOQisDdYRfl+43TFnzX+o27fZWDx8PHUk9ml4Z7ImE2tXr7DE67rhtkgX7zOMj
	R/q6m3BV6ODVs245z3bzeI7iWHYzQw3StblE+sa3Q6IPnFWIb6IDg7kmrAAmMOMl
	ZbxplQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0qmqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 05:33:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U5XaHA026117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 05:33:36 GMT
Received: from [10.110.47.58] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 22:33:31 -0700
Message-ID: <a995743c-f208-4afc-95da-449fdc7fab2b@quicinc.com>
Date: Fri, 30 Aug 2024 11:03:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
To: Jon Hunter <jonathanh@nvidia.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZRfG_hWHbEHAKf0pXJUfT4ADTnjskJ71
X-Proofpoint-ORIG-GUID: ZRfG_hWHbEHAKf0pXJUfT4ADTnjskJ71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300039

Hi Jon,


On 8/28/2024 7:17 PM, Jon Hunter wrote:
> Hi Satya, Vladimir,
>
> On 13/08/2024 21:01, Vladimir Zapolskiy wrote:
>> On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
>>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>>> operator since comparisons are faster than divisions.
>>>
>>> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for 
>>> Zonda PLL")
>>
>> Apparently the change is not a fix, therefore I believe the Fixes tag
>> shall be removed.
>
>
> From the commit message it is not clear that this is a fix, but I
> believe that it is. With the current -next I am seeing the following
> build error (with GCC 7.3.1) on ARM ...
>
> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
>
> There is also the above smatch warning that was reported.
>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>>> b/drivers/clk/qcom/clk-alpha-pll.c
>>> index 2f620ccb41cb..fd8a82bb3690 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned 
>>> long rate, unsigned long prate, u32
>>>       remainder = do_div(quotient, prate);
>>>       *l = quotient;
>>
>> Since it's not a fix, but a simplification, you may wish to remove
>> an unnecessary 'quotient' local variable:
>>
>> remainder = do_div(rate, prate);
>>
>>> -    if ((remainder * 2) / prate)
>>> +    if ((remainder * 2) >= prate)
>>>           *l = *l + 1;
>>
>> *l = rate + (u32)(remainder * 2 >= prate);
>
>
> The above change does fix this build error for me.
>
> Satya, did you intend this to be a fix? Can we get this into -next?
>

Yes, I have posted a v2 for this last week, but there are few open 
comments on that, I'll address them and post V3 including the build 
error you reported in commit-text.


[v2] 
https://lore.kernel.org/linux-clk/20240814102005.33493-1-quic_skakitap@quicinc.com/


Thanks,

Satya Priya


