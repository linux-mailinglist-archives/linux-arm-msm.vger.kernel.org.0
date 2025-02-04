Return-Path: <linux-arm-msm+bounces-46889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F287A278D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 18:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D54017A2C44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F2A2165E0;
	Tue,  4 Feb 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jxeoFJIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663FC2163BD;
	Tue,  4 Feb 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691002; cv=none; b=QBycggCAuL7vexPSZVcNw8vwkzmhHOKlBugdieU453g8CgAPezqwlhgahF3VrFX8HV3SpJk47cX/B8QJLabSi+kbuq5UI394RJvEaKWvEgzAsyMzXGKdU3+qYIQ9ublFNKlWhfnTBI7S7fyqvTdMq3jlkCaX5Zi0eWWyZAa7ZRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691002; c=relaxed/simple;
	bh=aFuf0N4dfewFID13J8FiJNiZDmx7wnCMbmh79IX77VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FoHuRCCycbiLaGq9JHBTTzILfpv8iN9wJISs4ILzKQMeOhkTJp/CLTzCESHyQloTFO2Z/1ohmx+z5kUn8FsLgfRd4hWDeWMq+P0CoZSXBoyWKgqGVQKXA7dPogSbit88RIBMjEaoygQLGTf7D3sbqHE2Rn7s+23Lvg4aYimw6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jxeoFJIm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GuY7A024441;
	Tue, 4 Feb 2025 17:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aV0ABCs36QB8J2BPqLl0w6BMjA2gNarXPJcJysONEd4=; b=jxeoFJImAC6PgVVJ
	uE4u4ke1M4110yAK0C8vdJbzVDUoNAhkUxse7JylUm2FQGDXYP6KFMNcukuwaiNO
	UDDkIh7bpVf4ZRiJXmbKL+louc9kgGrvnEaZAtd1uBMLPzZozphYJEF3Y/otisHQ
	YGKRGFqst85TLipJ/u/9FjH5KOZTzFxIuVqDsPJ+vob21Tlv/hEBGydG+bsDcvpN
	Uxlh/oadF+re/nj4gt2G/ghGYmBbyNympW9XMy3JMxSTCq6ib0PMeInXyMUVcS6C
	3wEnYM7NUnMotAq2/UD+3QO6tESSlBoiRGouiPhiE5m7wXbXHYI/G0d/AovosiNp
	2OraKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kpuy846v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:43:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514HhFII007779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 17:43:15 GMT
Received: from [10.216.62.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 09:43:12 -0800
Message-ID: <15d16afd-8e1a-479f-9573-8845d1408178@quicinc.com>
Date: Tue, 4 Feb 2025 23:13:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support to reconfigure PLL
To: Johan Hovold <johan@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
 <Z6HnOUfsSaKYyYfh@hovoldconsulting.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <Z6HnOUfsSaKYyYfh@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GJUfTs1RZsG_wpLWe2FEwGJM6WGRkzdk
X-Proofpoint-ORIG-GUID: GJUfTs1RZsG_wpLWe2FEwGJM6WGRkzdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040135



On 2/4/2025 3:38 PM, Johan Hovold wrote:
> On Mon, Jan 13, 2025 at 10:57:03PM +0530, Taniya Das wrote:
>> During boot-up, there is a possibility that the PLL configuration might
>> be missed even after invoking pll_configure() from the clock controller
>> probe. This is often due to the PLL being connected to rail or rails
>> that are in an OFF state and current clock controller also cannot vote
>> on multiple rails. As a result, the PLL may be enabled with suboptimal
>> settings, leading to functional issues.
>>
>> The PLL configuration, now part of clk_alpha_pll, can be reused to
>> reconfigure the PLL to a known good state before scaling for frequency.
>> The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
>> in future.
> 
> This sounds like a hack. You already describe the underlying problem (and
> indirectly its solution) in the first paragraph above, namely that the
> video clock controller has not enabled the power domain needed to
> configure the PLL.
> 

This is not a hack, but another alternative way to ensure the PLL is 
configured to the right configuration before being used.

> I believe support for clock controllers that need to enable multiple
> power domains is on its way into 6.15:
> 
> 	https://lore.kernel.org/lkml/20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org/
> 
> Perhaps that's what you need to fix this properly.
> 

Yes, this is just to add a dependency on clock controller to put the 
rail vote, but this series does not fully solve the clock controller's 
PLL requirement problems.

>> The IRIS driver support added
>> https://lore.kernel.org/all/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/
>> observes the pll latch warning during boot up due to the dependency of
>> the PLL not in good state, thus add config support for SM8550 Video
>> clock controller PLLs.
> 
>> Taniya Das (3):
>>        clk: qcom: clk-alpha-pll: Integrate PLL configuration into PLL structure
>>        clk: qcom: clk-alpha-pll: Add support to reconfigure PLL
>>        clk: qcom: videocc-sm8550: Update the pll config for Video PLLs
> 
> Johan

-- 
Thanks & Regards,
Taniya Das.


