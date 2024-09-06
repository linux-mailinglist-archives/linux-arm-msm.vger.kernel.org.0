Return-Path: <linux-arm-msm+bounces-31096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8B96F260
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 773F7284323
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954AB1CB12B;
	Fri,  6 Sep 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NF8NI09a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D621C870E;
	Fri,  6 Sep 2024 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620853; cv=none; b=VvS/pSV0kMsKasLdXsT7gAqqxcvggflS9L5nJi99LoNU+X+sbpvZ6fxKeH3slc0DnbGCROqNQZOYcQ5WPihSdaEfZjDtrrQyqf5dUsw31L45+lEaogiLHt5HDrPklvrJAGLFg9xu1pxuUNWk4V5HQ2Xkq+BhpXz2Z1l3foPzycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620853; c=relaxed/simple;
	bh=pKfwTF6c2QaD2+GpcjqyKDyU9aL3RZoYsLTxYFJU9n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RGbNLkOD5RAAQBbQ0BwuRra2FmH5cPCNlqZwDzWtAPZEOm9hZKaUDIm9bgERiCStda6swHwGaOMmikf6av2XPew8CZ0iHZMdGxuIlhuvz7RjQD0q8gD4fC9CXsChX69haA/lcKiWUhaB50pwc5GhG7p5mk01lFYgH05k06sY0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NF8NI09a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868WSZL021614;
	Fri, 6 Sep 2024 11:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hZPgsc0UonS5+Y7zpgIk0QEA80noiDkCUkzS9NO9hI=; b=NF8NI09aXY2Oprpy
	1ngwIqdr2/UkNpUS7EovbtaId631TOeXZMtwg1xrIZ+7uWgmfMe3EZ1i5PWxLdmX
	apvlotxTZDU96KjTR4kn5T0uNF/+7UXKagUOB88xLJYeBErdoz8x649yGJZ+21VT
	blIn1fLQbeuVagVllIei9kwQ7d3otrKCqPbytgHYJ1Xki+gVdUYdMr6GInEsaWje
	az8VxkPdbeKzE+hwD86A/T7bdaSHfUorVcoWTE4FMh+X34W04eB4DNJxu/a3uxpd
	ZZS9pz+Fb2A0pIOtmijr9Gx93Ivs8oRMNeIWQuRIlIE/1UR9CJ6beLH25zTsDyCX
	ZKW7pg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu22dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 11:07:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486B7NSF022570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 11:07:23 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 04:07:18 -0700
Message-ID: <bc9c90c0-0b5a-4459-aeea-606f946a7fe7@quicinc.com>
Date: Fri, 6 Sep 2024 16:37:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CRY9L6z4zJiuVOqJ33iSpxfpCap_aUtg
X-Proofpoint-ORIG-GUID: CRY9L6z4zJiuVOqJ33iSpxfpCap_aUtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060081

Hi Vladimir,


On 8/14/2024 1:31 AM, Vladimir Zapolskiy wrote:
> On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>> operator since comparisons are faster than divisions.
>>
>> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for 
>> Zonda PLL")
>
> Apparently the change is not a fix, therefore I believe the Fixes tag
> shall be removed.
>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
>> b/drivers/clk/qcom/clk-alpha-pll.c
>> index 2f620ccb41cb..fd8a82bb3690 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned 
>> long rate, unsigned long prate, u32
>>       remainder = do_div(quotient, prate);
>>       *l = quotient;
>
> Since it's not a fix, but a simplification, you may wish to remove
> an unnecessary 'quotient' local variable:
>
> remainder = do_div(rate, prate);
>

I tried removing the quotient variable, but it is leading to below build 
errors on arm32 architectures, so I will add the quotient variable back 
on V3,  to make the pointer type compatible for both arm32 and arm64.


error: passing argument 1 of '__div64_32' from incompatible pointer type 
[-Werror=incompatible-pointer-types]
   238 |   __rem = __div64_32(&(n), __base);


expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is 
of type 'long unsigned int *'
    24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)


>>   -    if ((remainder * 2) / prate)
>> +    if ((remainder * 2) >= prate)
>>           *l = *l + 1;
>
> *l = rate + (u32)(remainder * 2 >= prate);
>
> I hope the assignment above is quite clear...
>
>>   }
>
> With the review comments above implemented, feel free to add to v2
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>
> -- 
> Best wishes,
> Vladimir

