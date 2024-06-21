Return-Path: <linux-arm-msm+bounces-23495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38391197C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0CC1C21C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 04:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4574012C470;
	Fri, 21 Jun 2024 04:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJ8aNvCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BAEBE;
	Fri, 21 Jun 2024 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944455; cv=none; b=jkmeo3CZ3pOCeU2My/K5dAncAXbTT/xQXy7eDhr/QaU3XJVR1R1ADlmN9nvR0Jb5K7FwsrpqYTEUHiGBrlHl4ebagwSbXs5MOI0jkQkT5iL1TEb32iMjcpkohaLNRr391lJsq5WLPTgBKcG7C9GRkBq4h3RccS6iSazqIuSjTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944455; c=relaxed/simple;
	bh=BoS/tIDHw9tMTBj4Fpfa4bXjNsqBWr/XXVzf3vePCa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ojjBYwG61LY2DYOxno72ei/sHezrLSgyNTkgCAFAkOdVrOE9bkeJceKGOf3z45DfZ8vi13E5tB+PXQ8vByle7NMK6MffZhQQgNvlFwPDriby8trPltdJeKYNp8JDM64RGbtZ13A4YE21Tv3FFtaq8FnuBavH+Lnkz0Bz6DBzS7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJ8aNvCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L4P5Le022511;
	Fri, 21 Jun 2024 04:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwjfkBZCfAbe9fUHJY7I6WnMh4SDhfak2gHRLZ/Osmo=; b=mJ8aNvCjGF9Txl9n
	mxUHggwVbb/9iIaLfObQ4EiWxlO8UV4SnGKQ43s/QifCuveGa1WWCLVE4cn/NbDT
	bgfCMk0N1CZOAU9v2qqiVqSE5K0yb/J7zLyVjF4oKSIe++18+jhhA1miT6eiBT3P
	9e0aLnSEJEl+q/dD2YT5vxcCPb8IbR2P3ZqkfrQ6oyg6hDu5Xx19+CcpCB4sKLgl
	8yccEl/OUWqYrF2pR+FlzBT2LGjMuSg70x8taYo8pjNsd8eDA/21x0epKeW8eNwn
	MC7pTox6uKEO+bDiOlBeu7n0g97NG264JSxx6luG8ZRqElrwnAjw3PX9V1cZsxho
	dTu91Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrnyhcbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 04:34:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45L4Y8tf005173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 04:34:08 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 21:34:02 -0700
Message-ID: <053e047b-7594-48bc-ac1b-2368c0c8f1cc@quicinc.com>
Date: Fri, 21 Jun 2024 10:03:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] clk: qcom: Add support for Display clock Controllers
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
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-6-db295a846ee7@quicinc.com>
 <37bbd466-742a-4a23-b3f7-97f8da109608@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <37bbd466-742a-4a23-b3f7-97f8da109608@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sXulWohIsmaG89yWtgjJuRyGmaKO5vRo
X-Proofpoint-ORIG-GUID: sXulWohIsmaG89yWtgjJuRyGmaKO5vRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=913 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406210031



On 6/13/2024 10:16 PM, Konrad Dybcio wrote:
> 
> 
> On 6/12/24 12:47, Taniya Das wrote:
>> Add support for display0 and display1 clock controllers on SA8775P
>> platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Please merge this into one to save on boilerplate, take a look
> at dispcc-sc8280xp.c
> 

I did take a look at the dispcc for SC8280XP before posting the series, 
but it kind of looked tricky to add fixes for a particular dispcc.
Debugging could also be difficult in my opinion.
Though I understand that we are trying to optimize by re-using few 
common structures/probe but from clocks side they are all redefined.
That was the reason to keep them separate.

> Konrad

-- 
Thanks & Regards,
Taniya Das.

