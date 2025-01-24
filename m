Return-Path: <linux-arm-msm+bounces-46028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6EA1B024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 06:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E46188D56B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 05:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D57D1D7E31;
	Fri, 24 Jan 2025 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6ucRXJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763A258A;
	Fri, 24 Jan 2025 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737698119; cv=none; b=osRdqh2uYTACT/AFHApikwe1XQLS0FX6Yq0tYQolzB5GFjfHEe/B6s4h+aZsMVhIPWZ87nD1kPaxyqBPFAlxlRTOUf3iM+XdBsOca8j5C66TTznEF3lMYwO5wGyiAXggAATidGiJorozuRxzJwti3fIstXDhx4yuRknrfYTzlK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737698119; c=relaxed/simple;
	bh=POx47aC6wW6J+oA/R0mjtatSQsIm9ZGRPOhlCzWVie4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KW3fsK7ICa/emVuDLsrEyJVsGtBdcSCzP+sgn5OUaZ4VGuPlRv4W85Vr0DE5PXVimH1HormjkbBykrrA0suYJuAmDwFRnWXe9K74+HPFKvLH+h1H5uUZNLJ8iZLNOR62xS+HBWaEY13aDDzZWz/iOW4842uQbqCEpN2fD3mXfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6ucRXJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3FqW7004810;
	Fri, 24 Jan 2025 05:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq8fpTt6CcNxipuPp+zlLdG6yWiS++CuUohVRKckzSg=; b=g6ucRXJTr7Vk5u3u
	nuQzyVlusirkU/3BHOfjv+hvR14OH5+NvWrMGiVdN5pXGlGC4DF5dPpG3Qujv68e
	Ny8BjFKHS/GUs/7SZtjWxe7PTX6HVcF6OHWPIWxpyykpneoyJrYf3UBB0Uyaa+Rg
	QiHsJ24dTWeff6+QECQcaoskC1OBsR8xhRmbSLas7tRVfTj279381TwnQFY8Jt/f
	sVxEymvtt18nkoiDVCUnudN3xOrH2TYm2ce7N2e7cHcnuZUI0bP0e2Kwh2GAlGGm
	9mDIQ4i0KinUJ60/w61QmaD+is9iMMzk99r0mq222V3jsqssgd6OfHgWtPl+cLsJ
	lmBnrw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2t48967-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 05:55:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O5tDuH018970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 05:55:13 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 21:55:09 -0800
Message-ID: <68f01848-fcea-4849-b355-6479bb1f9fc4@quicinc.com>
Date: Fri, 24 Jan 2025 11:25:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq5424: fix software and hardware flow
 control error of UART
To: Varadarajan Narayanan <quic_varada@quicinc.com>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20250123111618.1048461-1-quic_mmanikan@quicinc.com>
 <Z5JEJCJsYDz9b85b@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <Z5JEJCJsYDz9b85b@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hjD4sUGUVmiymUaqOt6XJMdY1C3KQGsd
X-Proofpoint-GUID: hjD4sUGUVmiymUaqOt6XJMdY1C3KQGsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240040



On 1/23/2025 6:59 PM, Varadarajan Narayanan wrote:
> On Thu, Jan 23, 2025 at 04:46:18PM +0530, Manikanta Mylavarapu wrote:
>> The UART’s software and hardware flow control are currently not
>> functioning correctly.
>>
>> For software flow control, the following error is encountered:
>> qcom_geni_serial 1a80000.serial: Couldn't find suitable
>> clock rate for 56000000, 3500000, 2500000, 1152000, 921600, 19200
>>
>> During hardware flow control testing, a “Retry 0: Got ZCAN error” is
>> observed.
>>
>> To address these issues, update the UART frequency table to include all
>> supported frequencies according to the frequency plan.
> 
> Would this need fixes tag?
> 

Yes, it needs fixes tag. I will add it in the next version.
Thank you for pointing this.

Thanks & Regards,
Manikanta.

>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>>  drivers/clk/qcom/gcc-ipq5424.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
>> index d5b218b76e29..37b1a3ff8f4e 100644
>> --- a/drivers/clk/qcom/gcc-ipq5424.c
>> +++ b/drivers/clk/qcom/gcc-ipq5424.c
>> @@ -592,13 +592,19 @@ static struct clk_rcg2 gcc_qupv3_spi1_clk_src = {
>>  };
>>
>>  static const struct freq_tbl ftbl_gcc_qupv3_uart0_clk_src[] = {
>> -	F(960000, P_XO, 10, 2, 5),
>> -	F(4800000, P_XO, 5, 0, 0),
>> -	F(9600000, P_XO, 2, 4, 5),
>> -	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
>> +	F(3686400,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 144, 15625),
>> +	F(7372800,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 288, 15625),
>> +	F(14745600, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 576, 15625),
>>  	F(24000000, P_XO, 1, 0, 0),
>>  	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
>> -	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
>> +	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
>> +	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
>> +	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 500),
>> +	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
>> +	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
>> +	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
>> +	F(58982400, P_GPLL0_OUT_MAIN, 1, 1152, 15625),
>> +	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
>>  	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
>>  	{ }
>>  };
>>
>> --
>> 2.34.1
>>


