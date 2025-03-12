Return-Path: <linux-arm-msm+bounces-51088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C82A5D6DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA7B189B3AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D261E9B03;
	Wed, 12 Mar 2025 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yrex1V9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E91E5B89;
	Wed, 12 Mar 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763505; cv=none; b=smvhNcokBgpnL+euOIKP4RRBy/Sw3gA4gXkHgSJVG26bhyg99eSy84BMchubV0fNM+qO2oQ3skJU63bRd59qeCAhg/0C/c2d+P2oXvL3YGbZDa7+lNOry8Rms55SR3OUPxMHyFGwzH20rUfBmobQt8aJQ9aOCN76XgkSrslMmfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763505; c=relaxed/simple;
	bh=cV5x2phB6io5A1hcWRos+71eq2NS/nw+eOi9/yJjQLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VfKR8ZNOzoZ84ecdqZ709MYP35RGIJULLkVrV+6CLH5DjdUsQaZTjgCVTSf6fMi70/8MlZJ4thkA+5SpT+z4/s3uT7tntA0SFDMN7UHArfplBVJeVha922j2euX2Jo+NowPyoa7wPrfY+y0pN39AEWJ7VTrpa3CXCeUoPjXNxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yrex1V9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHrsZ020069;
	Wed, 12 Mar 2025 07:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPXp+P7KdxayDRrDGIguU4QpwVn6HFUUreh4LJiEppw=; b=Yrex1V9PQqzf5Nwk
	hMn/EiHqrLrkhsA4w/hTZ04jCu3nFKQKynMUR3J+JdXCRsg7p8+7pEB1ozFpoEke
	Aa1JndyMCv95ApBI8B7+Rd2SNkoUfl9BY5qEX17gvQjWYZ3EtGzt91CLP+STbHqp
	Sa08Oq/OAJYFh/7OnKw7egsos9o0r1JCBJRCkc823C/uV6Oxsd6DOmE//qyFfIIq
	nQNW2gnfKfRT7q3MIVrZVQOAGQv6B26Q8fEWBBwYmQdg4vVLBHXXLS3XoghS4zV7
	Kv2L3WtFRGwjqTj4y8/1sTMe/NcMqARrhqSJh7Pnl9t9L1WFKNOT/rdmoUW8bNFe
	dNxG/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p1f2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:11:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C7BbIf008513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:11:37 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 00:11:31 -0700
Message-ID: <cd092022-cf6d-421a-a29d-69f7f4f068b6@quicinc.com>
Date: Wed, 12 Mar 2025 12:41:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
 <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
 <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
 <caa00d62-b24d-4db7-9e12-170a10c073e3@linaro.org>
 <b21b5f03-e328-4708-a854-1b3fa9c3dfa3@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <b21b5f03-e328-4708-a854-1b3fa9c3dfa3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HP/DFptv c=1 sm=1 tr=0 ts=67d133aa cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bU-rbE2s8JpbpfxL7skA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: akoicu-BERqGVOUIAtrrDukoc-ibhcGu
X-Proofpoint-GUID: akoicu-BERqGVOUIAtrrDukoc-ibhcGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=850
 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120046



On 3/11/2025 11:41 PM, Bryan O'Donoghue wrote:
> On 11/03/2025 17:55, Vladimir Zapolskiy wrote:
>>
>> I kindly ask to elaborate here.
>>
>> This series does not touch CAMCC at all, and if the series touches CAMCC,
>> then it changes DT ABI, which is objected. Or is it for some reason
>> objected only for SM8550 and not for the other platforms? More information
>> is needed.
> 
> No but it _should_ Vlad, that's the ask.
> 
> Both of these clock controllers will require this same change to be implemented, that's what I'm asking Jagadeesh to do.
> 
> Certainly that's the case for x1e and asking Jagadeesh to also check that for sm8650.
> 

Yes, similar changes are required for camcc on SM8450, SM8550, SM8650 and X1E80100. I will add them in the v3 series.
For X1E80100 camcc, I see changes are already raised in dt-bindings[1] and DT[2] to add multi PD support, so I will just
include the camcc driver change in v3 for X1E80100.

[1]: https://lore.kernel.org/all/20250304143152.1799966-1-vladimir.zapolskiy@linaro.org/
[2]: https://lore.kernel.org/all/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org/

Thanks,
Jagadeesh

> ---
> bod

