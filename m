Return-Path: <linux-arm-msm+bounces-26021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6992F86C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A5C2822B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 09:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E5814600B;
	Fri, 12 Jul 2024 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fCOkTbFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C359285C56;
	Fri, 12 Jul 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720778052; cv=none; b=nfmYrVgsgb9rTKos0dOFcLhu6g1hPyn7Qt+ej5xABT+qMY6785WqHRKUK2Un8BT+3ROHZK4sMimcmIk1uObHw9ECx11/drtIl+SSNjyoEmdzhSR7aiFn+Oi0uzct/rxeXS/IZIz+klabaW4VrVd2kwhWpvPZYiykJKv0YTmeOfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720778052; c=relaxed/simple;
	bh=b3voC8Ctcmzj4uEXko9Jl3hforzL0gCHEfN36YevP64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pqm6f1D+fE1F0uPaRga34omzDTPqaBiiSyjESVYVr2GVi+Lgn/7JTH1/FV0xNG1OOp9bdIykMTGzhautcYnB4PQ3t0UTrBz6dcH35EnBEJXcPGoX6bMst3/2MB3zlQ/aaSUAh5E2YTjaa0Z2n6qXUUxv6GO4r1SeJaquLYNu0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fCOkTbFv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C4o5w7007121;
	Fri, 12 Jul 2024 09:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyG+VMy0n5Bz1EkMi28tUQbe5dFveOBhGDzeafZvohU=; b=fCOkTbFvk38hHWx4
	ERfr8v/SrPvuxF2zyq/WmSldiqWydKXgH/XQc3tYRhE7RzZGOeRvzHZhlKaz8Q8l
	500uFW7qYDZnor01XS/8mUbymv0w+0d8gaARoqjdX58kOdFDHeHIU+JUpOVY1P1C
	HaGAk+8sHMfc1FzApRDq8Np0wk5LwHkwOTCcvfP47iR4mo71i3mWkET1hmkdSALl
	C0OKAe6/mhsyWyN9CdyCgufKSJOobpkyDz50AP/j+DPJg34dHAcwEuNXGkbIZwnD
	ZvKgyC79ZFTnUdG6QQL7/+81/VttzNGTe3yvrYRZlHI50aaNNVj78xz+gR25vNym
	lusIgQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdrytw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 09:54:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46C9s3k8011098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 09:54:03 GMT
Received: from [10.216.11.166] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 02:53:58 -0700
Message-ID: <9c3de930-47b7-45a9-bf7e-6e506ea2accc@quicinc.com>
Date: Fri, 12 Jul 2024 15:23:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
 <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
 <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
Content-Language: en-US
From: Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BQ2C8t1wXptcE0kpNuLPQNXziP4J8OXE
X-Proofpoint-ORIG-GUID: BQ2C8t1wXptcE0kpNuLPQNXziP4J8OXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407120070



On 7/11/2024 3:25 PM, Konrad Dybcio wrote:
> On 3.07.2024 11:16 AM, Ajit Pandey wrote:
>>
>>
>> On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 6/11/24 15:37, Ajit Pandey wrote:
>>>> Add device node for camera, display and graphics clock controller on
>>>> Qualcomm SM4450 platform.
>>>>
>>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>>> ---
>>>
>>> None of these nodes reference a power domain (which would usually be
>>> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
>>>
>>> The current upstream implementation only allows one power domain to be
>>> scaled, but that's better than none (see other DTs for recent SoCs).
>>>
>>> Konrad
>>
>> SM4450 doesn't support MMCX and CX/MX domains will remain active so
>> power-domains property is actually not required for SM4450 clock nodes.
> 
> It's not only about them being active.. some PLLs require e.g. MX to be
> at a certain level, or the system will be unstable
> 
> Konrad

With active I mean CX/MX rails will be default running at minimum level 
required for clock controllers. Adding power-domains property for CX/MX 
rails is like a redundant code as that will also scale such rails at 
default specified minimum level only. Also we hadn't added such property 
for other targets DT nodes to scale up CX/MX at minimum level.
-- 
Thanks, and Regards
Ajit

