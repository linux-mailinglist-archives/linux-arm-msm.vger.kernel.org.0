Return-Path: <linux-arm-msm+bounces-31672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2197782C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 07:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C40171C244A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 05:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB37140E34;
	Fri, 13 Sep 2024 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mEBcp+nO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8604A07;
	Fri, 13 Sep 2024 05:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726204013; cv=none; b=RxaWm94pK87X0h5U6gMjjvRqo+eS9NmULMY38QRfqRNC0Rr8EI2PCt+Cqf0Iq0tCfruJ+Q8lk+rsdgEOj0eRnK1Qad9OsMfhXCFn3v2jS7VS73WsWDupEiETMQUsoBSa0bG2FxDzAOx/i2Lj1iSCNBf2YoHEGGPBSzmUYo8m3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726204013; c=relaxed/simple;
	bh=Yv5d02AbC5yO2ylVpLbcNexj+posTgPQ89CC6Iz8dZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jDF+zIQ5e4Euwa56ZB2gEAgxmTe6spmnh+7gOrjOdUpkdZOHmJN6ZOzDhhM6/WeSmu7A3V8lKrTDvqbhxFjrcPMaWU/lwMvwaphB4/cp2ISO7RAjd0r/yBl/2HW1HmzV4dlhrTeVnspQm5d9dLckQlW6BawaauJlyUiHpGneJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mEBcp+nO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBAgg020744;
	Fri, 13 Sep 2024 05:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+ed2j4GQqH3sFf9xemtoShElHgqG76jmJb94OjJE1M=; b=mEBcp+nOs8YLrwoI
	rDo0IjF1SsWzoEi1qCRqYWYjx3rkqAWVwzzvVp5hWLkmp1bnF8kXAeQ2b4FWGckf
	OO/AWHAtch/afDm7ctVi2ooXaVmkQ5Ja13OQWbqdZrkV8+wWB2LAZva1awKkDb/G
	VUFUVE/qrjCkRA03k+cycpogRVybHlo0DkGpQ2LCo8wa80N17DCpUhZEO7dN/xgP
	+3RMj9ObiPwHPvahSmsuUR23age0d+i0g8K/lWOGda0Sc1Kr3+t2TljJpI49Gcpw
	ROFP8e0+gctRfaizN+iLftpO3BqJwfSLh+QwzCL3RVm0M05bBNuWb3sm3/DeU6If
	kUKc+g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pfg7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:06:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D56k1H029077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:06:46 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 22:05:57 -0700
Message-ID: <52d2ee37-5a83-4ca2-902c-8e48b63b93b3@quicinc.com>
Date: Fri, 13 Sep 2024 10:35:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] dt-bindings: clock: qcom: Add SA8775P display
 clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-5-77d53c3c0cef@quicinc.com>
 <5kaz5wcvxhjtny5yy5i2e63ylzpor74lknvtvdkgpygxkf7yim@m6p5zof755lp>
 <65d129b5-088e-4cdb-a2fa-62448cfd2ad6@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <65d129b5-088e-4cdb-a2fa-62448cfd2ad6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j2JIvFyRi6B0Wo2HGlT5JKe__rWwp-5u
X-Proofpoint-GUID: j2JIvFyRi6B0Wo2HGlT5JKe__rWwp-5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130034



On 9/6/2024 5:54 PM, Krzysztof Kozlowski wrote:
> On 18/08/2024 20:02, Krzysztof Kozlowski wrote:
>> On Fri, Aug 16, 2024 at 12:01:47PM +0530, Taniya Das wrote:
>>> Add device tree bindings for the display clock controllers
>>> on Qualcomm SA8775P platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,sa8775p-dispcc.yaml        | 79 ++++++++++++++++++++
>>>   include/dt-bindings/clock/qcom,sa8775p-dispcc.h    | 87 ++++++++++++++++++++++
>>>   2 files changed, 166 insertions(+)
>>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Un-reviewed.
> 
> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
> point of view and insists on new approach of dropping sa8775p. Therefore
> this change does not make much sense in the new approach.
> 

Krzysztof could you please re-review the patches again? As I understand 
that Qualcomm will support both SA8775p and QCS9100 in Kernel. There’s 
no plan to drop SA8775p support. These two SoCs will keep compatible.

> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

