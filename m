Return-Path: <linux-arm-msm+bounces-25612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD692B609
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820A32814AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88D8157486;
	Tue,  9 Jul 2024 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g/51zbrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45872157466;
	Tue,  9 Jul 2024 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522616; cv=none; b=jQFrduEpNIlmiXhpqo1lIPPIXZ93PeqyuNcfYAafrGcuuCuslDxuq+agD+71KUJPk3OaO3Hh+SuSB3h7+yFdyDV+ClSUPo9DrpQYXN8rqQBqJHP2YL7i0isxnghDZpiBTEtScSbPM7ZYTK+6XMoLAJIiWCqR5IWRrjNyqT2Y6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522616; c=relaxed/simple;
	bh=84F1L1sHzWlLsLS7ya9AqFpPG7XUdqgHj/9UGtgoTMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b73sH1+6BSeHn/QmLnC2Aykhg7vypAxjBEIBegb72A9yqSa6gUal4+6MyLmFkFuXDIo/Rvw3yaBphZUVAjpwEWqOK/+w/pW+UJrhw1pX7b8Uv5c5ECmGF7Rv7q5PnPTYfCdy0J9j7o116Xc1F7vxB7W2QFWDhDYZHfeH9PLWymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g/51zbrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AnSJG004577;
	Tue, 9 Jul 2024 10:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHwmQdirbf7RLBWn75SXhPKkKCFB1DZbgj07ksairGA=; b=g/51zbrScIQZQTQE
	o+y+lNZcAkxc4AIbGxiIlUmGiptHNI/0TszYkdmV2KIUmjfJiUEr3eNz4hWreL3I
	LT0C0f69HIfvXK3R1m+TiVsSihHyveHDA5ktWjPF3pxusjKC1FBynKPepLe6AQJy
	I5/NOD9mmKR9753aUutSMsDoytp3ROglS/LTD1Qlr9U5NevJRdf9R2mBFBIYlHrJ
	G2jeeZ+WLWMJNkg9lKq4/jayF+fJUbO4nVA9G9bj5+yVV8vEtEX8hbXq8RXAyLbk
	b9dYejy3tA7heuzkeMS8GZDGUBq0GxLKP3KBC/IJ9jsQq8XrYPiDJctOzhG+j5kB
	Pbq1Sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa6656m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 10:56:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469AuXvB029013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 10:56:33 GMT
Received: from [10.216.26.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 03:56:27 -0700
Message-ID: <60d64abc-a43b-2bdb-812f-8e1198274702@quicinc.com>
Date: Tue, 9 Jul 2024 16:26:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/6] clk: qcom: clk-alpha-pll: Update set_rate for
 Zonda PLL
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-2-4baf54ec7333@quicinc.com>
 <eb71f14d-bf27-4f23-870e-7dfa01e44e80@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <eb71f14d-bf27-4f23-870e-7dfa01e44e80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l1P5Rx6oLNtvbmNnY38HR_q6B_My_C7G
X-Proofpoint-ORIG-GUID: l1P5Rx6oLNtvbmNnY38HR_q6B_My_C7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090075


On 7/6/2024 7:09 PM, Konrad Dybcio wrote:
> On 2.07.2024 5:50 PM, Satya Priya Kakitapalli wrote:
>> The Zonda PLL has a 16 bit signed alpha and in the cases where the alpha
>> value is greater than 0.5, the L value needs to be adjusted accordingly.
>> Thus update the logic for the same.
>>
>> Also, fix zonda set_rate failure when PLL is disabled. Currently,
>> clk_zonda_pll_set_rate polls for the PLL to lock even if the PLL is
>> disabled. However, if the PLL is disabled then LOCK_DET will never
>> assert and we'll return an error. There is no reason to poll LOCK_DET
>> if the PLL is already disabled, so skip polling in this case.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
> [...]
>
>> @@ -2077,9 +2089,15 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> +	if (a & BIT(15))
>> +		zonda_pll_adjust_l_val(rate, prate, &l);
> A random check for a seemingly random, undocumented bit only confuses the reader


Sure, I'll define a macro for this.


Thanks.


