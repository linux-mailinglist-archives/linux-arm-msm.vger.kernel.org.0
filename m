Return-Path: <linux-arm-msm+bounces-49141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67EA419C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150921730BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91224BBF5;
	Mon, 24 Feb 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UP9qnqsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A024A053;
	Mon, 24 Feb 2025 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390943; cv=none; b=XXmuwselZDPo1El+NEG71SZp7h2uXMoejN2W3WlTJ4Gu3a5xdbHDzhLn2lMAGTgJ7xf15lDqijkgG0nXSfiLB/1rwUD1ACXNjAb5Hs5w4ibY1EIfDj1ZCEcCit2uXuzG7SnMPljOCFBveJIAa5maIEI7u8DETcQ/RYtW42o7fhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390943; c=relaxed/simple;
	bh=UUxTvSFg3ECjp3QCMm9uPPVjICTi6yfkGqXzpqI3leE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZxoK3sdDHW3w0+5I6Tv3A5EeuzXfWQ2IjUS1X2tkVX3ic7Ejn28tnLd39pjJ/IJg/qD67eXQCaUXJ4NTE7iCtjsz1qT1fl2htN3TkwYtl01oaHg73UBN25ocZ0qqCyd/KwVpSjlKC0JrRjxLTDtwfxkbve4Zxr8+4fTu8k6LEys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UP9qnqsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O95emD027634;
	Mon, 24 Feb 2025 09:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUFFMrp3bF+jtWYjyXpR2YG2vX5Agpa5oP9kLDsjn8c=; b=UP9qnqsg6qGcmCMr
	Wm+ROyCCYJiUzFQP0lW5nzVzSniF1KBOsS4dGiEPc8qNzgQ3icH+kxJwQJheqIZq
	yhzOPgUKU28C+liNT2C+dOg3NSj9/Lpj7lT9xor94qJA2NOkOOdKORcWkbZZFB0i
	zImbFcO9BaIvXblf7esPqJ/F61v/4hwEgYlxJUMyrBIK3KScJXqQ5cnjdp9Gqxih
	I8E8cItheqOuIFhHk+KD9hxYJ50g0yLewt3oidGLRmJpRhDIAVSiAGvI8OKCcgHn
	1FzRKO8D5kyh6Orfh8IiMkYo+6GabFKmIH0329bJu+SfjDIs76fcC7i1zkGGe8Dh
	xDNrIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2me1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:55:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9tDrs007351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:55:13 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 01:55:05 -0800
Message-ID: <ddfb3ab1-bb9f-4fa2-9efc-c831febdafc6@quicinc.com>
Date: Mon, 24 Feb 2025 15:25:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <elinor.montmasson@savoirfairelinux.com>,
        <ross.burton@arm.com>, <javier.carrasco@wolfvision.net>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-5-quic_mmanikan@quicinc.com>
 <3bfe9a79-517d-4a27-94da-263dd691ec37@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <3bfe9a79-517d-4a27-94da-263dd691ec37@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6cota9YEDLUM6nxbEAvHa_wUWPqZYlJQ
X-Proofpoint-GUID: 6cota9YEDLUM6nxbEAvHa_wUWPqZYlJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240072



On 2/21/2025 5:19 PM, Konrad Dybcio wrote:
> On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
>> devices.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int nss_cc_ipq9574_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_clk_create(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_clk_add(&pdev->dev, "nsscc");
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Fail to add AHB clock\n");
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
> 
> if /\ suceeds
> 
>> +
>> +	regmap = qcom_cc_map(pdev, &nss_cc_ipq9574_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
> 
> you return here without pm_runtime_put, which doesn't decrease the refcount
> for core to put down the resource
> 
> if (IS_ERR(regmap)) {
> 	pm_runtime_put(&pdev->dev);
> 	return PTR_ERR(regmap);
> }
> 
> instead
> 

Hi Konrad,

Thank you for reviewing the patch.
I will incorporate your suggested change in the next version.

Thanks & Regards,
Manikanta.

