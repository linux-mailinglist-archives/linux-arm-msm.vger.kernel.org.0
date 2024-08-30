Return-Path: <linux-arm-msm+bounces-30151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9C9656ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 07:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76165B22F27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 05:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F5C13BAFA;
	Fri, 30 Aug 2024 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QxVg3yzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328484683;
	Fri, 30 Aug 2024 05:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724996013; cv=none; b=O5D8GFykO1Q05rRmRytdFA+DPMnqhb2T83sNPyRA4mODWYzaT1RgTkJ34SNtX3xcY9wPJIZ2LQeZia4kZOLQZQPvgDb2Q8RmBtinSWMYkKiyfwAbvblPvQLJuL9Uahb3bZ6UxRGCYuAsoC5OPb2T0yljveDxZtZxQizT67fADwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724996013; c=relaxed/simple;
	bh=VNOf6j5ZUBCKi9obJY1Zmq7j7F632V0LClIMJyNM8fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tP7DoqGgPMui/Py/nrRXwGsEu56FW8P6l5G3+vsZKM7ZnaoFxNLWxk5hkliThLTub0ypRGySpHXN3DvCHFNsgw5DIalpg5K2V2gebGdTx1fyVl7YSbuywVm17avcsGY2M2lcRHb7TpEVakPNOc/JdWOG2b+S8lof5oqHv61B16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QxVg3yzd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THtf5x000497;
	Fri, 30 Aug 2024 05:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8nd0IF8HRkM3vKk40PK9L4eUxNnMz2TqBydN7t3/Bs=; b=QxVg3yzd3Plt91IX
	dGxuNsUiDZ/byy1PBFYg9d+Oxf0FLPEy2jnzarvtB9L5lKqEWsYJKQssTlu7+h2+
	/fcDdU6eo7IoFcR6TlX9sA+WOXF+Eaf77bLdeBTXVRs0z4uDAbvfE3jD2LIM7y/D
	bMUUC89TE5QppZz63yQjVIqldZrKtAnYbsBZAwd/5/a6Kif2cKClj0PgQ3G2rBup
	8toF7hbL7Va9YfTvVQit6rSVgEwsibL3D66OaVWdl8HJiIncxJYdVw3B2H81Ri0Q
	r9LRzDbkmo2enskmACdj/N5gITJrbZ37Q065YeMXgNBgcoPKb+OcYPG2VYp1KNv5
	NXOc0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw7jh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 05:33:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U5XMaS001673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 05:33:22 GMT
Received: from [10.110.47.58] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 22:33:17 -0700
Message-ID: <87876873-1aa7-4435-90c1-02bc2e8d7316@quicinc.com>
Date: Fri, 30 Aug 2024 11:03:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "kernel test robot" <lkp@intel.com>,
        Dan Carpenter
	<dan.carpenter@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
References: <20240814102005.33493-1-quic_skakitap@quicinc.com>
 <om5c5wmziw5wywzwp3qirruaaxjughcneupkyzl4hi3jzfuhhg@f5cfsjwabday>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <om5c5wmziw5wywzwp3qirruaaxjughcneupkyzl4hi3jzfuhhg@f5cfsjwabday>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xQdWJM58_CHElqgULBGAaeNaXS5GWREi
X-Proofpoint-GUID: xQdWJM58_CHElqgULBGAaeNaXS5GWREi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408300039


On 8/16/2024 3:00 AM, Bjorn Andersson wrote:
> On Wed, Aug 14, 2024 at 03:50:05PM GMT, Satya Priya Kakitapalli wrote:
>> In zonda_pll_adjust_l_val() replace the divide operator with comparison
>> operator since comparisons are faster than divisions. Also, simplify the
>> logic and remove the unnecessary 'quotient' local variable.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> Changes in V2:
>>   - Simplify the logic and remove unnecessary quotient variable.
>>   - Remove Fixes tag as this is just a simplification.
>>
>>   drivers/clk/qcom/clk-alpha-pll.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 2f620ccb41cb..4ce3347beb39 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2120,14 +2120,11 @@ static void clk_zonda_pll_disable(struct clk_hw *hw)
>>   
>>   static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>>   {
>> -	u64 remainder, quotient;
>> +	u64 remainder;
>>   
>> -	quotient = rate;
>> -	remainder = do_div(quotient, prate);
>> -	*l = quotient;
>> +	remainder = do_div(rate, prate);
> This does not compile on arm32 target.


Could you please confirm if it is because of the do_div? I see the 
do_div() API is used at multiple places in the same driver already.


> Regards,
> Bjorn
>
>>   
>> -	if ((remainder * 2) / prate)
>> -		*l = *l + 1;
>> +	*l = rate + (u32)(remainder * 2 >= prate);
>>   }
>>   
>>   static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>> -- 
>> 2.25.1
>>

