Return-Path: <linux-arm-msm+bounces-34862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A658B9A3618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DBAE1F2612D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AAD18BC36;
	Fri, 18 Oct 2024 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C5R1NrOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B118B48C;
	Fri, 18 Oct 2024 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234175; cv=none; b=Aqa4IEfRf28MjIMtrD8rGfJrvkSOfs212T5KUmMS3wxyNA0bHNP5t+h49jUhTJY2SySopkMmK6vu4f/tRunlNFDgnqGLV1mYgsGASw3dBicCg8IGOSTuprqaeBHu+ZjlT7ZOmPp55qlH0nNIv4tcMP4/XRfyWl0uonIT/Fpi2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234175; c=relaxed/simple;
	bh=x0H227Ts+V6wTCSVl8eAnekQvGQaATqswEEH6n0VPj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e7oNWAYLV2F4vGP3NrSUEYHncdjaePv0mFbyHWJ13WozcBhWlrE4UPjwjjuXu7I6ZN2zw9b9+JKKBtvnDBbjcKQCgjWeTfWi7VjFRmp/9dQTCZzwWOT/36LJpar/DD9Aza6wD7fNufRAVGrholtbpK9GC0bj+LGm2u+/XrQPfiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C5R1NrOM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5EBTc029142;
	Fri, 18 Oct 2024 06:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wCeAl+tW9by8V+ur2kNwc+Vyx1uIWmG2Gm8pWR/mDA=; b=C5R1NrOM4pGWr73G
	8EklbBxgE7AxvruvBem7Bj9g0twCZaDdGEZWhgTU4GK9uaaiWELWssyyXvo+t0Si
	KW4MhqqKtOrbKGveiIZLM/tWWZUlRmciRnoMjMLikj2dvOELxHiK6mTKhix4py/7
	ur79yuCB2xoRfQcdTIRCbUZAkiYCMJCzJ3Q0ep5aF0+hFvC0pOk7pcFl1674piT9
	JAX8QCifsmVqdz0yK4jLhHBB1bqnX47owtm62fkStEGfXpsfZ8hppFFgTsvteV1V
	WaiAF2lKOYGqtNUq9US0N6ToMiYiSgdsG8+Lck1UAcmlDh/nuqqG5CtHTTAolsJm
	jbxlfw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbq882t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:49:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I6nLpE025087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:49:21 GMT
Received: from [10.253.38.177] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 23:49:15 -0700
Message-ID: <05870487-2119-474c-9b28-1d785980780e@quicinc.com>
Date: Fri, 18 Oct 2024 14:49:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-2-27817fbe3505@quicinc.com>
 <77ad972276c165acc3d0e9d72df1a021.sboyd@kernel.org>
 <daa8998b-a008-42cf-a941-00218683cce2@quicinc.com>
 <6bb3565e576062c781e29e414483daec.sboyd@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <6bb3565e576062c781e29e414483daec.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JnUKqvMB8hANP69pFRNrwrNSa0iNqTkC
X-Proofpoint-GUID: JnUKqvMB8hANP69pFRNrwrNSa0iNqTkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=909 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180041



On 10/18/2024 1:40 AM, Stephen Boyd wrote:
> Quoting Jie Luo (2024-10-17 08:35:43)
>> On 10/17/2024 5:37 AM, Stephen Boyd wrote:
>>> Quoting Luo Jie (2024-10-15 07:16:52)
>>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>>> index 30eb8236c9d8..3def659fc5cb 100644
>>>> --- a/drivers/clk/qcom/Kconfig
>>>> +++ b/drivers/clk/qcom/Kconfig
>>>> @@ -190,6 +190,16 @@ config IPQ_APSS_6018
>>>>             Say Y if you want to support CPU frequency scaling on
>>>>             ipq based devices.
>>>>    
>>>> +config IPQ_CMN_PLL
>>>> +       tristate "IPQ CMN PLL Clock Controller"
>>>> +       depends on IPQ_GCC_9574
>>> What is the build dependency?
>> Will remove this dependency. There is no build dependency on
>> IPQ_GCC_9574, but only a functional dependency on the SoC's GCC block
>> since the CMNPLL consumes AHB/SYS clocks from the GCC.
> Ok. It can probably be a select or imply statement then.

Thanks for suggestions. I will enhance the help text to imply the GCC
dependency.

