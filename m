Return-Path: <linux-arm-msm+bounces-22170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F28901DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF6B284971
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9B06F31C;
	Mon, 10 Jun 2024 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jvO2oxUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9C6BFA3;
	Mon, 10 Jun 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010688; cv=none; b=UqeD1LFuTFZUe9LSz0v149pD6HkQj/SZAJM/ufmuLR8nrI6KRoVLyc7SM7D7HQ5+w6dgnRpmIh4mPiIIQhFi7nPr/5rX5PRyj5GIF8DmspnVyXwrmbLYpbpG+KL4LZ3vMKbx5PcS1N3FgsiBQWPX+7WHyEjok4xesNi4XDWYE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010688; c=relaxed/simple;
	bh=D/Gcb1B8fvZR2zECPo5B/rSdAUZ5z5I70y+oVklSThQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pY5RsPTkG4fOWbf91J+z/ZVv7qRVwgNf+2byXw4WS54cfc3YK54JPo2URhhSATw3YQqXccreZ4kxnavCRwUOkIzss1ZuBLREP9tKswTrmLiZmtnXNs1odvXtM8sNUCVN2IBay4pUiyY2Vgkl94njchiiU20BFDG9diO7SG+EWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jvO2oxUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A13VeR007867;
	Mon, 10 Jun 2024 09:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9V6+BaPaIAdOb/MkGxf2k4bgZHUJEGIsn4BcxDdi2Ok=; b=jvO2oxUycvrNKLZo
	8JlVzAN6F1/is3RtLMPk3w3Tj9fdro4qRK3097ly1C8jcTkt7yJGrGsCLMzR720F
	F23IrWkTviIu913i3gGVhXPp4H6pPHMT/isLNq/R03RTu0BwPN3+JlsRzne56BiK
	4E5XYFKdlxwunktrBPz/FByZKQeToon7oUwtPA/W9Qv8wNc1qZbYk3uHAVN1qG/o
	LW2OC1ez+Z/oP1hKgZkiZRpnN3CHWrl97OOwq5G1QhvQJtTiYnP1RgK+E4tQDNQq
	BdQm6VF4Ts1Ab4PbflOi2BJNQz1VycuWezYO6uxaF2lX9xhzbEP1PgAzVhUcv75L
	lfn3Mg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymevxb26s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:11:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9BIwZ001307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:11:18 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:11:14 -0700
Message-ID: <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
Date: Mon, 10 Jun 2024 14:41:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IINrU0gt4RHkaDYj4Dv_uQrdY1bV7B0a
X-Proofpoint-GUID: IINrU0gt4RHkaDYj4Dv_uQrdY1bV7B0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=666 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100070



On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
> On 31.05.2024 11:02 AM, Taniya Das wrote:
>> The RCG's clk src has to be parked at XO while disabling as per the
>> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
>> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
>> clk_branch2_aon_ops to keep the clock always ON.
>>
>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Should the same fixes apply to 8350?
> 

Yes Konrad, it is applicable for 8350 as well.

> Konrad

-- 
Thanks & Regards,
Taniya Das.

