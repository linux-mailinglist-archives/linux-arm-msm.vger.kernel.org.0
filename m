Return-Path: <linux-arm-msm+bounces-21228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48778D5E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642121F2112F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AF781724;
	Fri, 31 May 2024 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cd12ImHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B0768EA;
	Fri, 31 May 2024 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147854; cv=none; b=DxG0mij8fqUIp/Cowh5lznAYWbJdMZI4BIwM9/j9MwSIh3Oo8LFUzM9SfvhpAfra1FFUMOyWWuqglFFdVgZXxcZWNQkpwjCm7Lrzp0HO5xAjjxA+MtZKdrBbHtR8m9O8NDky9v8OASoj00CFtMd+556gWTgBBHGLPcrECelnTT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147854; c=relaxed/simple;
	bh=KIOXzoDM4zhlJsEhof+5gWYeeom0SgBNEnTzGH448Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P6Mf6Un1puh98yymKkRg0dqx26njeY2YepoaAK1mhz8Vvu76fSlNCQ2i40G5KwVAoRy781iqTK/uTblQS/9UzzjtCFSYnlAMUFEo+Y9jD7Wn6BSugKjXkp+hQh4b1xt16Vt/UgRDYh/5A7kXXh9Edhdu3SWxO72W13ohpT0Atc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cd12ImHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V62a26031687;
	Fri, 31 May 2024 09:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4z6835LnByoH0M/7ANVxcOc0mQVXkQ9QylW6OHCpY7k=; b=cd12ImHT7cn02c5F
	NZqAPcHHYMaPuZmWNhqlqGDAtBtvR1H+6kD4/uHDDT3UcrLwqQ0dOUM2Fgf+R40z
	cbWyGLrQ14s9NoGxhotGR4TWM71RAfpMfly+fXi3wm5JdU6FHoq09BBc6OYd1zFS
	6N5NWM8DVuAI3MtnwPLvWTltFWLsp6nV7zCVJelRxyioGzgQZCFyX1PIUUeUUxFJ
	qpS8V78Y4RcVKJeB12dKy7d7QpKnqHJ3IqWdkM07jQm5vhKtvP2JXX7Dz9wsHdZj
	gYYM+ib6pC5DZHWoWCqZwEdzJJg6kUAqONonPZQctcfTrbzWGCiMueJXRla0BmLo
	LIfubQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf8xa0gsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:30:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9UmrU004678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:30:48 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 02:30:44 -0700
Message-ID: <a671ba20-f000-425f-914f-54a9d65d79c7@quicinc.com>
Date: Fri, 31 May 2024 15:00:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: sc7280: Update the transition delay for
 GDSC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-5-quic_tdas@quicinc.com>
 <3293d565-ceb6-44f1-8a47-d18e9d0083a5@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <3293d565-ceb6-44f1-8a47-d18e9d0083a5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xso3tW-qjhbrnc9PP0KYlUvJQ4qk8f93
X-Proofpoint-ORIG-GUID: Xso3tW-qjhbrnc9PP0KYlUvJQ4qk8f93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=766 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069



On 3/18/2024 1:23 PM, Krzysztof Kozlowski wrote:
> On 18/03/2024 06:35, Taniya Das wrote:
>> Update the GDSC default values of GDSC transition delay to avoid the
>> issues in the GDSC FSM state.
> 
> What issues?
> 
>>

The GDSC FSM will be stuck and the GDSC will not be able to power on/off.

I will update the patch commit text as well.

> 
> Why none of your so called "fixes" are marked as Cc-stable? If they are
> real fixes, they should be.
> 
>> Fixes: fae7617bb142 ("clk: qcom: Add video clock controller driver for SC7280")
>> Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
>> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
>> Fixes: 3e0f01d6c7e7 ("clk: qcom: Add graphics clock controller driver for SC7280")
> 
> No, don't combine separate fixes into one commit.
> 

I will remove the fixes tag in the next patch.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

