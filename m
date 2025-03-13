Return-Path: <linux-arm-msm+bounces-51213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB5A5EAAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9FFA7AA8C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 04:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF7014830C;
	Thu, 13 Mar 2025 04:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d2l8OqQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F71386DA;
	Thu, 13 Mar 2025 04:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741840760; cv=none; b=sZPsEbjRO+0Q5lzIXHwiaFB7ZlomJTRqjvpf5vqSeqTSB44ml4NDpLypzjniJgmNq/xB7m2Y6BgIgaPgoBk1/mHkKCess1o6aXzZLBE7N8tD7l2JBSaPlAOkJKsRMx3LrmMJ4h5NvNMA4Cru1Y97zoKdkGMQ6NUgu6lrGoiSyuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741840760; c=relaxed/simple;
	bh=z9ep727b+aMAF57BlPJo44E9lHfDfasKflzSWI84oa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qlonmz+DbVDtBBokw9F7ESoIE10EKr92j6EoTYqIPr5Zhe13UM2A+lSXnWNNNyGX6/BfZkrC3rSKriYodFsS+Q12apLUQkjdyCzVYXpi9S+GAKhuUfFUUR5DUdHzoixwtU2xQe7VIIAxlm/LrY3g/uCUJrJ9fsunZOn1Qrk0G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d2l8OqQk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CNUi3g023453;
	Thu, 13 Mar 2025 04:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9Lauuh5+w82Iu9C7ya5GMLx1u7S2UFe4GKDOw/1BEI=; b=d2l8OqQkGjvdjNd+
	wsbFhIsMNvTLlzk9C+TbnnelHu6Z4hB+qINpYpPF5q4Jfco2TZrV1h5x5FBI3NQz
	FHpZtnd+gUTL2z0uvs8NiusI1wGsycTwMU7rV6paMptvukGdBsJyr+QvS5sUOJgA
	mhgwtrh3j7IHtTcxoFdKpz5t8fv8h9c6ViIK90Af/wY37X1v73gXRd2cUFkLwtsK
	hqQzZZvI24EXdxTVH7cb7Vmes50KRx3JLq5sYeLAjDSzzpnaYnJz6f8HzhuoWvQe
	x682IQaqq0hsbuTf47Btx00Q6/fJQcxartzdX/NNvvbu7GXwWShdzYiI6mv/RCDE
	ymZK0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mmgxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D4dC87017647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 04:39:12 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 21:39:08 -0700
Message-ID: <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
Date: Thu, 13 Mar 2025 10:09:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lVQ-EXJ4i0FXFac6oftd6eyAFODFEnyT
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d26171 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=VK8LaAXJ_v_LNVCfY3cA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lVQ-EXJ4i0FXFac6oftd6eyAFODFEnyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=428 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130034



On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>> domains.
>>>
>>> Are those really required to access the registers of the cammcc? Or is
>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>> only to sm8550 or to other similar clock controllers?
>>
>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>> not on any SM8450 or SM8650 powered board for instance, however it does
>> not exclude an option that the problem has to be fixed for other clock
>> controllers, but it's Qualcomm to confirm any other touched platforms,
> 
> Please work with Taniya to identify used power domains.
> 

CAMCC requires both MMCX and MXC to be functional.

>> for instance x1e80100-camcc has it resolved right at the beginning.
>>
>> To my understanding here 'required-opps' shall also be generalized, so
>> the done copy from x1e80100-camcc was improper, and the latter dt-binding
>> should be fixed.
> 
> Yes
> 

required-opps is not mandatory for MXC as we ensure that MxC would never
hit retention.

https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@quicinc.com


> 
> 


