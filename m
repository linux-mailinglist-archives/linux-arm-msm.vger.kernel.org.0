Return-Path: <linux-arm-msm+bounces-52521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0AA7160A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 12:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE76A7A1DA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 11:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729FE1DBB37;
	Wed, 26 Mar 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j354QDOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C211C84BE;
	Wed, 26 Mar 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742989664; cv=none; b=SCV5JwWfeKbpG1n7Ne1vibKdh8jAMgWOLn7rYgtg/mrk4cOzneA6RJYb3+TEm0ryVXPleg6TABaEZXWdJ9zJvsVytRgn+QibHpD3uddnX/4onWJ//uU/RsIuh8M5P6fPSQzPww6qX2mU3cnfFZwi8Lrv/J1LiLDseqOTGRbwNMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742989664; c=relaxed/simple;
	bh=yXnOq9vvX2myssUlHThAdK9+azKlcpRfbusLFgvFH/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EaSoYen7zNLd2GRlxAvUQXIlW4mm4fR2vvgK5XJaEiYBZHl/3q1UynFpXTgqSz3+bcMuoq3KQPqvZ4RN2X0Hx55M1XEWMVVzloa2ZIPGXCJp1CGWSanYmxK/Zfo3627ASl702uxbTyA2vjFau4pNUCY8ENp4xM5Ss7lReOAuias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j354QDOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q739Rc006151;
	Wed, 26 Mar 2025 11:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5EUL/sSDolc5synG2E/Iw45NhUC4E1HoerhiqfKyE0=; b=j354QDOgIdTylBTT
	1mUi2OMzS5My513DseIfZlPcBjOElGUvenk1M6Z7OabK3duA3vA6Cb/D9hG6zI7R
	uk4w5Fv85LxB7Rx0s2vI3ZqZ6G00JD9NyTZFxHgTQhFXs5vaQmfVJ/0wzPcubYoa
	8U2FC2bZFRzNmbjqDwQ6hnZ9LLTry202tHZWuFqSIEDaHsOVHpYopv5yfPdGqUvZ
	2HpDY3SyAltr+lz4158apIVEc798kI5yGkGtojGun05gZCBq8OVVjvem/qwqcrAT
	jLUQueBZSUmZMtXnFi5Olu2DObHAm+rWChK1VKnTsI4Dh3Mc7/EKpaxDsAotCyFG
	PWaWjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj16xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 11:47:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52QBlSjx006881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 11:47:28 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 04:47:23 -0700
Message-ID: <5dac9f3e-731f-482f-98ff-10b521231001@quicinc.com>
Date: Wed, 26 Mar 2025 17:16:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8550: camcc: Manage MMCX and MXC
To: Taniya Das <quic_tdas@quicinc.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <da67d3a1-e3df-4d01-a052-8c906172c51c@quicinc.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <da67d3a1-e3df-4d01-a052-8c906172c51c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N_Ts1wu_nczpSKeK2RMGqAXcBjU7RF8H
X-Proofpoint-ORIG-GUID: N_Ts1wu_nczpSKeK2RMGqAXcBjU7RF8H
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e3e952 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=IJleAqfMLjfyVNOtvW4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260072



On 3/13/2025 5:08 PM, Taniya Das wrote:
> 
> 
> On 3/4/2025 4:25 AM, Vladimir Zapolskiy wrote:
>> It was discovered that on SM8550 platform Camera Clock controller shall
>> manage MMCX and MXC power domains, otherwise MMIO access to CCI or CAMSS
>> breaks the execution, the problem has been discussed with Jagadeesh at
>> https://lore.kernel.org/all/a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com/
>>
>> Since 'power-domains' property becomes generalized, Rob asked to remove
>> its description, which is done in the first patch of the series, see
>> https://lore.kernel.org/all/20240927224833.GA159707-robh@kernel.org/
>>
>> Vladimir Zapolskiy (2):
>>   dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
>>   arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
>>
> 
> Hi Vladimir, as we are preparing to submit the code for multi-power
> domain support for the clock controller in our series
> (https://lore.kernel.org/all/20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com),
> there has been a request to incorporate the CAMCC-related changes as
> well. If you are okay with us including this series changes(maintaining
> your authorship) in our series, then we can integrate them and address
> any comments in our next submission.
> 

Hi Vladimir,

I will be including your above 2 patches in the next version of my series[1] which adds
MXC PD support for SM8450, SM8650 camcc DT nodes since my series is dependent on above
bindings change. Doing so will fix the bot warnings reported[2] in this series as well
and I will fix if there are still any more warnings left and post.

[1] https://lore.kernel.org/all/cd092022-cf6d-421a-a29d-69f7f4f068b6@quicinc.com/
[2] https://lore.kernel.org/all/174105227313.195955.8409784191665720030.robh@kernel.org/

Thanks,
Jagadeesh

>>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
>>  arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 ++-
>>  2 files changed, 3 insertions(+), 4 deletions(-)
>>
> 
> 

