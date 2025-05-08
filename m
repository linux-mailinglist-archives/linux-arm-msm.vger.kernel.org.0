Return-Path: <linux-arm-msm+bounces-57233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D6AAF600
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5FAB4C43A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF42397A4;
	Thu,  8 May 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ifruc59p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102D21D3D1;
	Thu,  8 May 2025 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694259; cv=none; b=KLOiYPWvQDdBbiCKp+JXKFYA+pJgGh7okXmTSRnwAdx38kIR06djrennGk7qDqoJA2RQ1mt3jPJtqbQvYV2LsKIEi/fFgRcOyBN16w5yvkEdWCerHJ1WyNubSVPjx//aWcPJphWzkQIWReWbvaoevAzIJ0rAOZVfBvqGFnOlwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694259; c=relaxed/simple;
	bh=BrbK4f66nQDeHyRVYyxzILu+g+U0/Z110+ceWJXL5EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WFREZc+bCFcnJ+OzQfhQ8ydfag7kvlgAL1TXH1n+t64pK83pDxNPwOA0x0GCT+X+tK4O13BQPuImv/wwS+1vk6UQVak2BJS7Ft7DFIe6ReFy+D8GFvb9khsB0OlqEKciMC6lSU0vtBG/ZU4Ap3qkBdIqEcsr7rStn+aIJH3cJRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ifruc59p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488lTNL019197;
	Thu, 8 May 2025 08:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeuXQKJYzXKrQyimVC6enB/MDQqFsM6oNHE6NFSYQag=; b=ifruc59pxaTBrTqs
	7PorMX71cIKDMN0zY/+25hp7Tqy0hjTAGjvOwFFrxru95VP16WpS4rcAp4A16I6g
	MIVdu7bl6dqJ08RKDWe4yDV8YeIxsU+MNIAmub828/dfcSuyxa2t4GGxdVXvhVGM
	y8M2xAJrUQ3FIqldzHrrYkyqpew/iBhcV9WTIJiN9aX/YWR7xrZ60d2RrIsuRgMD
	JQtN5ElPsojJfJwBCRT6YCZgKaeOtMwtsukSZ50s/ZcPm0lN2SAZe61sb0fTjlQP
	Y5vrPaeeb35An7M5pRjGqS9iEO5+xLbNQN2uJhpiuc7tovDDzJ3iL3v9kZSlZO7D
	5DJoLw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj006j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:50:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5488od4T018031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 08:50:39 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 01:50:33 -0700
Message-ID: <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
Date: Thu, 8 May 2025 16:50:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vkoul@kernel.org>, <kishon@kernel.org>, <sfr@canb.auug.org.au>,
        <linux-phy@lists.infradead.org>, <krishna.chundru@oss.qualcomm.com>,
        <quic_vbadigan@quicinc.com>, <quic_mrana@quicinc.com>,
        <quic_cang@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa
	<abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681c705f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=zitRP-D0AAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=FqpPY7LzFvk08Lq7rO8A:9
 a=QEXdDO2ut3YA:10 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3OCBTYWx0ZWRfX5VIC6QSm1+Yl
 gpHethyLRA9t6AEHjeBfkmh6QyeAucGikMzitV4dr4ywbluCe0pFJLF1lpu83wB4hR9roHXqBND
 b2BY1S0jZVusiIEGAaZ+qdw3My+//W7LF8IHgZ0dZT2XApNbMTwCWuQIhvG03kqxPh3a+Smx7g3
 pkWlb9hYIuOiqsjNPis8A/vP2W2qyOO1ShXfAdbrm4hYqIb8AqXGBhyIlkgR6lxunSocB2/Mrzs
 +8gUQovs+b0IdewuoMpH8Z4trr53+1s8i3sjz2ya/TyAHlU/jr3J9zCL+0ohjN8Aa8lffPl2kOt
 1aijFRth75CUkneb3laB0hhKHHxhczU7zf9wOc11dft+kuqyz9E3lWn3enwjNKr2fptxOYxYyXt
 oK6pnubqiZThDAGQAmU50qLlVF/WdPibCZjTbBWHp+zMKgeqOfSvFp15LH7nHgrUD5S4cBsO
X-Proofpoint-GUID: krx3KZtZkv5IdASRwzeLwYfjIsRBR-T3
X-Proofpoint-ORIG-GUID: krx3KZtZkv5IdASRwzeLwYfjIsRBR-T3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080078


On 5/8/2025 4:20 PM, Johan Hovold wrote:
> On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>> clocks provided by the TCSR device.
> This still looks wrong and you never replied to why these supplies
> shouldn't be handled by the tcsr clock driver that supplies these
> clocks:
>
> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
Sorry, I thought Konrad had convinced you.

If the TCSR driver manages these supplies, would it be possible for tscr
driver to recognize when it needs to turn vdda-qref on or off for a
specific PCIe port?
>
>> Hence, restore the vdda-qref request for the 6th PCIe instance by reverting
>> commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref
>> supplies"). For the 4th PCIe instance (Gen3 x2), add a new driver data
>> entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy of
>> sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
>>
>> Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
>> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
>> Cc: Johan Hovold <johan+linaro@kernel.org>
>> Cc: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Johan

-- 
With best wishes
Qiang Yu


