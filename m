Return-Path: <linux-arm-msm+bounces-34394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6625A99DF01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 09:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50D8DB23E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 07:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9E718BB9B;
	Tue, 15 Oct 2024 07:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gHO0Krzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D41714B4;
	Tue, 15 Oct 2024 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975785; cv=none; b=MZ1UbJKpyoOg38pKAFhw8q9TjFUQvpv9QTklWu9ffM27edMbhF3POgPjZso7cbDB3wBf9o371dmI53TqKhdaTWjtUBhfioMf4yMNOoZYb+lvOWTRV5+bPLq5Jr3toqBf5CljxCn/Rxkki3/Mn0l9eCKdB9WNmXGgO8VagATVhcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975785; c=relaxed/simple;
	bh=6ak+FbFcheSC/07hSqggboSBc44x/jnUTK0Zu6i2J9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=csdDzaRr+hilwMXJA+U+ocenVyMpwwjbYzDEfPEpwPx5VaDAqedn/YZTburoobI341uGNm+l0Uu8/FUe3285gnCPq7RALFKh6iygzWyE1nmQLXdAmR7+kHsQ7wT5f/OhE+ALo1GNGEuO6cvoe8Yb3ead00D0M5fqXwzyZTqoGDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gHO0Krzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F0nqXK028943;
	Tue, 15 Oct 2024 07:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNxcovHaCZr4YyZwbkPjdIHNQ44b3u3Z8IXuc9mgySg=; b=gHO0KrzvEjmG+I38
	XvZ3iZIgIEfDAGnxjJ9THEildcaXiNRUlTLyVIepkEyRPRZZB/BhJ6aTkmlh+dKc
	lkXIZZhlBCyJh6JrIoUlQMeI0v3ED9EBc85hCtalLswsLq213f0gGeUC1V5ZGeqP
	fd9maBH5bwIn6Wl/dXbXaXVWSf7dIlIypsimDAK7XSsmFT73qFBihmy/hD0Ujvfb
	NMsxq9yox3t9yLuwgpkFA0b82hY5sbL6PfYsI735xRObr0+oNQ13HDtn6y5CVNTw
	9hS+4UCrYCX2c7s0YnnWEFhSmcT50V2IzUa/tCVlRAWyj8NakRNGgtnCRBg5Gj1q
	9Im+FA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4292evjdhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:02:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F72io5000952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:02:44 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 00:02:36 -0700
Message-ID: <2a2b1373-6cb4-4813-8736-dd7b12c90c0a@quicinc.com>
Date: Tue, 15 Oct 2024 12:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <simona@ffwll.ch>, <abel.vesa@linaro.org>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
        <quic_bjorande@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
 <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sX5TkqqPVxeTca0Ty3eh-82zg5gY4O8X
X-Proofpoint-ORIG-GUID: sX5TkqqPVxeTca0Ty3eh-82zg5gY4O8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150047


On 10/6/2024 8:30 PM, Dmitry Baryshkov wrote:
> On Fri, 4 Oct 2024 at 12:30, Soutrik Mukhopadhyay
> <quic_mukhopad@quicinc.com> wrote:
>> This series adds support for the DisplayPort controller
>> and eDP PHY v5 found on the Qualcomm SA8775P platform.
>>
>> ---
>> v2: Fixed review comments from Dmitry and Bjorn
>>          - Made aux_cfg array as const.
>>          - Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
>>
>> v3: Fixed review comments from Dmitry, Konrad and Bjorn
>>          - Used a for loop to write the dp_phy_aux_cfg registers.
>>          - Pre-defined the aux_cfg size to prevent any magic numbers.
>>          - Added all the necessary DPTX controllers for this platform.
>>
>> v4: Fixed review comments from Dmitry and Krzysztof
>>          - Updated commit message.
> For which patches? How?


We have removed the "reviewed by" and kept only the "acked by" for patch 
1. We have updated

the commit message of patch 5 , to mention specifically about the 
validation of 'only' MDSS0 DPTX0 and

DPTX1.


>
>> ---
>>
>> Soutrik Mukhopadhyay (5):
>>    dt-bindings: phy: Add eDP PHY compatible for sa8775p
>>    phy: qcom: edp: Introduce aux_cfg array for version specific aux
>>      settings
>>    phy: qcom: edp: Add support for eDP PHY on SA8775P
>>    dt-bindings: display: msm: dp-controller: document SA8775P compatible
>>    drm/msm/dp: Add DisplayPort controller for SA8775P
>>
>>   .../bindings/display/msm/dp-controller.yaml   |  1 +
>>   .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
>>   drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
>>   drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
>>   4 files changed, 61 insertions(+), 24 deletions(-)
>>
>> --
>> 2.17.1
>>
>

