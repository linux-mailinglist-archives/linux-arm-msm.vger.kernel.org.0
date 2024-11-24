Return-Path: <linux-arm-msm+bounces-38955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5F9D6C95
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 04:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C5B0B212C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 03:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1961224FA;
	Sun, 24 Nov 2024 03:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PMC6lhnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3910E3;
	Sun, 24 Nov 2024 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732420079; cv=none; b=UrZrLF8GsjaqthTT2GLe6etEXfj+gucR8wB2D9yWFFeLVymlQIWlWLZKf2lXhT7P380203JIgcbu8WPpF12xzNnXwhvLxE5X8l6pWDKZTL5ZWIeQONYH0dkCM5NXrj3WZx9TwYihqoUvNVZCl5+orCcSDpsV+43rFkQYrVteuW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732420079; c=relaxed/simple;
	bh=8cPMfw6PoNjW6ddBq16fmKOWIEvysHhn0isqtuVUBmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LUmaNGNvF3ML7FRILMFwRmUVkctMD7YZjis/1Yx9zDvK28UmkMDoiXw7NTPJCOfnj157snt/fSUe3V4NqDjpL0W6MSZ26m1b0+2H0frecLk9BM8xs4+Lobz4OfD4Aplb36T9ggFHorMYrb8Ns3tk8E/13ZHPsHRQT1kx/D9m7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PMC6lhnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AO2Pfip030064;
	Sun, 24 Nov 2024 03:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebVIz2B0tpcSE0N9hw3kbmVkL1bXOlcrVMgCsiihGfY=; b=PMC6lhnV3cln0c8A
	c/22MsyqvyYVv7rDfwCfTK2cIiKqZLSd6JpFMPmr4zexAr6TPUCBP5RcWU/tMxF3
	vItf716UH+mDHeXsNf7vRskfkJbMcN72fxqZwzHiLXo1KDpeNeiPSNczfmeLuL6k
	Qu46ChBmE9e2M9rlKgviD8USHhpepnbd7bj74gKlSj+lyvy7gzanyWmYpd39f/D4
	awNrq0b8JtNQockh1lX7nf7GPif++zoTOsDrmO0fYEjUJ/oMAw+F/+2WVEdzZxRZ
	3WT4VeiQYo4Oc84lKVNOtnAWJJrL41aHBPpc7Ypj3GiGnZ56O4Fijcr6WT9kHZrN
	AyFWnQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mx9nnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 03:47:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AO3lm2F024490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 03:47:48 GMT
Received: from [10.216.25.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 23 Nov
 2024 19:47:43 -0800
Message-ID: <0bdaa2ef-3979-4963-be75-0a5a89728f44@quicinc.com>
Date: Sun, 24 Nov 2024 09:17:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] arm64: dts: qcom: qcs8300: add TRNG node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
 <20241122074346.4084606-3-quic_yrangana@quicinc.com>
 <40c49e6d-dbbd-49cf-b59b-10e10b24da22@kernel.org>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <40c49e6d-dbbd-49cf-b59b-10e10b24da22@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: efob-2Xpg7uH5oB6b4LcLQTXO0nCv3wd
X-Proofpoint-GUID: efob-2Xpg7uH5oB6b4LcLQTXO0nCv3wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=687 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411240029

Hi Krzysztof,

I sincerely apologize for the inconvenience. I added the "Reviewed-by"
tag without fully understanding its implications. I will remove the tag
in the next patch series.

Thanks,
Yuvaraj.

On 11/22/2024 8:30 PM, Krzysztof Kozlowski wrote:
> On 22/11/2024 08:43, Yuvaraj Ranganathan wrote:
>> The qcs8300 SoC has a True Random Number Generator, add the node with
>> the correct compatible set.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
> 
> NAK, stop adding fake tags. It is impossible to receive above tag from
> me written that way.
> 
> Best regards,
> Krzysztof


