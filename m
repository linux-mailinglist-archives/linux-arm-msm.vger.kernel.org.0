Return-Path: <linux-arm-msm+bounces-29486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3295EF20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F720289900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3B414A62F;
	Mon, 26 Aug 2024 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kJgLQf/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432B148850;
	Mon, 26 Aug 2024 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669773; cv=none; b=S0flcdb8SE1zvTrcOPGQ/wcNkcs44/OP/XuqzGUIUmaVdZVqjiKb+Prw2l9dRdPlzpIgxG1HPi0LiXDDSSWeg2OZ4N9QBv7IE6ORk0Uh459Me/qw+GsvJJhI+0v6aGGV4ZS6qJH4N4Lv8G6YYLuhD8EX712ezbo4KEDNyxKr92s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669773; c=relaxed/simple;
	bh=h0okMoCbXS5G9Kqj2IS1qU9Pgw/i9nHgkscgkpkZ0F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G5nOTwFHDeOpIV/APAlDnW3okIHrFLWc397jOCFAuOtdpeOYkXVaj9c4guje4FToosi+rWTMbLAcfpIP3L4Jau3oOO/K2zmqSnWIjvQ1cqzQYfsBnj/XogslGBfoKYniThlmyzTJxjtgfNsIf/khgvkuFcJDrqoL+EczoPKDpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kJgLQf/k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MPkX027697;
	Mon, 26 Aug 2024 10:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cExeb/xRDZzvLYRCG7hFO8bedIkSs2tygzFZBcSjb1E=; b=kJgLQf/kyzMOp7u6
	NomQ9RlGRhr1CQwIGA8C4XfqcBF07hx/G4q+5NKRe3B1baR72RNnkfKNqN2pXV5x
	uP0qlPc2VqLM7TpgjoxQxy3DbfKKR1yka8RvPIwKfWIOdSKPEQ2YlLi8jUQ7euAu
	/WiwJtSyEsQ3z8wOSVjH+siy3UnMizFw1adKQOEpvSXQq2lYZAJ58FJq4owWwGqj
	HvvBDEAkpncjg8tNDzpxuoa4y52kgXNjO1Pa3oRd4XmBKFRE2te271uA0G8Qq12n
	JOw+v0fWc13+Tx39YVYtujuqJCh1sjhIPDDTY/mJRIaUkxkduB6mtt/AJpboGVCH
	3m+3xA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980ude9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 10:56:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47QAu05I008536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 10:56:00 GMT
Received: from [10.216.20.198] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 03:55:54 -0700
Message-ID: <01c5178e-58fe-4c45-a82e-d0b6b6789645@quicinc.com>
Date: Mon, 26 Aug 2024 16:25:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for Global Clock Controller
 on QCS8300
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
 <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
 <bf5b7607-a8fc-49e3-8cf7-8ef4b30ba542@lunn.ch>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <bf5b7607-a8fc-49e3-8cf7-8ef4b30ba542@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dNdOVxGqU4QtIeyHhXJdRACzKHnDQ08X
X-Proofpoint-ORIG-GUID: dNdOVxGqU4QtIeyHhXJdRACzKHnDQ08X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_08,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260085



On 8/23/2024 1:29 AM, Andrew Lunn wrote:
>> +static int gcc_qcs8300_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +				       ARRAY_SIZE(gcc_dfs_clocks));
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Keep some clocks always enabled */
> 
> Sorry, but you need to explain why. Why cannot the camera driver
> enable these clocks when it loads? Why cannot the display driver
> enable these clocks when it loads.
> 

These clocks are recommended to be kept always ON as per the HW design 
and also exposing clock structures and marking them critical in the 
kernel would lead to redundant code. Based on previous discussions with 
clock maintainers, it is recommended to keep such clocks enabled at 
probe and not model them. This approach is consistently followed for all 
other targets as well.

Thanks,
Imran

> 	Andrew

