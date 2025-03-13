Return-Path: <linux-arm-msm+bounces-51274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B76A5F28D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B7093B592E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A861F1518;
	Thu, 13 Mar 2025 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jF3NW0hy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AA1EF09A;
	Thu, 13 Mar 2025 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865931; cv=none; b=F/y4yFJIA3ZGifjLUQnZ/l3mNeogaK2I6V7dCr2B/nDi8kQdQ0zx+8TPGGt+q8jLPoDA1VSycYOMMoZ2e1rgANtLsbNwQOOLpK244ZI+HM8xq3B9hI5gIXj70bKnyv9vweGlZTQoEH0Rd2q0+6m0VGGJfrnxDKoiQygwYsb12mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865931; c=relaxed/simple;
	bh=6oTKfy/J+J6IzkSpIwcPZtbAX5OC7IG3aP//uqOWEl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UZulMP7cgCLZQhOmyqwNoXQPvjexoMRWE+zNTa1OvpBWW4FUYaJMDDzniu094C4BVEoOrnU/k501ib9hl1x7vWDyy4nmjJNYYowunYkZTYPhpxN77L/AwQSSlv9gjiuEzhYNj3bTE5p02a3nq4uozh9piobfMpx4r59a7brS5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jF3NW0hy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAviKr017140;
	Thu, 13 Mar 2025 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpZHtsTIaIyGZpKJey1xVLdsGwoO7lR4gGew4KcOl3M=; b=jF3NW0hyXF8Gg3b1
	d1TPHFuSyU8xw7GqVG/hFjQVn3Ykjp0zDoMf+4vcIm4/Ya9iVm4DH/H1e5Q86EeJ
	q9TC0pQsiSnf/RlBExwQkSwxTmRuCnYAE11zq/L2h/n+nB0aGqvw7sw8XgJZ5Ami
	KyYnEvQ0JdnzEyu3635+OyUaVWdCLOw86yHRK9UEY+I4BKWHWfd1RY23+FjI/eLJ
	PPI0zfYS+jPSg8Ai1Yd3UpfPRLXCAz2a9x+M5wEHN9+4dTh29AX/66o8jK45INsB
	KlF9TN+btHXWoq0tqzh4jDGBmiHeWvHroHZDUkYhGyFZDtQBbD3PquO2qO+k3Zak
	I69fZQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nwqyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:38:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DBcifs007648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:38:44 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 04:38:40 -0700
Message-ID: <da67d3a1-e3df-4d01-a052-8c906172c51c@quicinc.com>
Date: Thu, 13 Mar 2025 17:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8550: camcc: Manage MMCX and MXC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5qIQE2Tk5-s1TETCF_of3rF44pNV0l16
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d2c3c5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CqDDRk0MYutMoWn3TPMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5qIQE2Tk5-s1TETCF_of3rF44pNV0l16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=947 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092



On 3/4/2025 4:25 AM, Vladimir Zapolskiy wrote:
> It was discovered that on SM8550 platform Camera Clock controller shall
> manage MMCX and MXC power domains, otherwise MMIO access to CCI or CAMSS
> breaks the execution, the problem has been discussed with Jagadeesh at
> https://lore.kernel.org/all/a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com/
> 
> Since 'power-domains' property becomes generalized, Rob asked to remove
> its description, which is done in the first patch of the series, see
> https://lore.kernel.org/all/20240927224833.GA159707-robh@kernel.org/
> 
> Vladimir Zapolskiy (2):
>   dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
>   arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
> 

Hi Vladimir, as we are preparing to submit the code for multi-power
domain support for the clock controller in our series
(https://lore.kernel.org/all/20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com),
there has been a request to incorporate the CAMCC-related changes as
well. If you are okay with us including this series changes(maintaining
your authorship) in our series, then we can integrate them and address
any comments in our next submission.

>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 ++-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 



