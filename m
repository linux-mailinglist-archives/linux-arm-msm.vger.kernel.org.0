Return-Path: <linux-arm-msm+bounces-38170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677F9D099D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80D7A1F21778
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC57F14A099;
	Mon, 18 Nov 2024 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZW6uvM6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45062148FE6;
	Mon, 18 Nov 2024 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731911177; cv=none; b=cP+KEfU40j7Qxkd/7B7UFYprJ+ZvzfdBnx2GYRzZEZQMQLtQkH/Lpw1LYIXiYzCq6fI0DkcVSAxkdXJlKFBbK6p7TyU2h3fb6woTKj31x2736nn3vlQf2znMZqHAQpsLQifERJ3DLgXJ1QLGltWr9cy3w+G84SFcMl5r43xU3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731911177; c=relaxed/simple;
	bh=nDqdES7Ff79ezcggCO1Eg8UYHldbpHxKoVKh+vJf6L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TT6Y+FZNwQ/KWQW5tKgpDFI3JcwkjVoe4XNKrWyqZ1SWdnpgaYI9eC+X3D672UZVeBh3YRMvPlDillw4Ebm6ik7cEaqFNyzLUyNXq9XsD7aZ5NozjHUMP/8mIVz+T3bOABMBNpx8jv6CC3fAGYCgezMw0QKWBbCmNhXZyqyUFEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZW6uvM6u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RlvS029968;
	Mon, 18 Nov 2024 06:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtN7HaNLk92Shd3TrhFCwIdNZ4NaCLNwJBs2aJnO8bA=; b=ZW6uvM6ufwj/v0np
	MkdZe3Eu1T0XuUt08LBTubz6LWnaVKRL0D2SjfecudOGQ2C2CPSBOYXJhKl2FLev
	MRrvfJ3oZ6sdHDU+DkGpLL+TTLdUCv9xRTOxHCKyx0vqlD0ZleaHCUqHk/uoT56Q
	ydAmEYK89Zfn3kDDwH2KLuIurqM852gPrF6O28SKKxGphV6A9WymkkXjQlKzeEHB
	5FIKfjPLxJtfrlHlvODfAgrS25VI0axJ36wgNFhAZ3Auc+fGLnRD0/TUc9OHJLs9
	auhxcmOcM9+Ys88Crq19kQumFeFdhnViL1siyw9LqmX0zU9WxghcEzonr6FNgfWq
	pRLcPg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xks6kkcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:25:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6PsKY011914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:25:54 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 22:25:47 -0800
Message-ID: <1a0c1a49-d1fc-4b64-ae11-c4d343458133@quicinc.com>
Date: Mon, 18 Nov 2024 14:25:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
 <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
 <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wWvdmn5f1Rc_thBbYjuCjU4IWId8jPsg
X-Proofpoint-GUID: wWvdmn5f1Rc_thBbYjuCjU4IWId8jPsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180052



On 2024/11/14 21:41, Dmitry Baryshkov wrote:
> On Thu, 14 Nov 2024 at 15:32, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 13.11.2024 12:51 PM, Fange Zhang wrote:
>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>
>>> Add support for DSI 2.3.1 (block used on QCS615).
>>> Add phy configuration for QCS615
>>>
>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>>>   5 files changed, 42 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>>        },
>>>   };
>>>
>>> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
>>> +     { .supply = "vdda", .init_load_uA = 21800 },
>>> +};
>>
>> I believe refgen is also present here and you can reuse dsi_v2_4_regulators
> 
> This was in feedback for v1... And the patch should be further split,
> having DSI and PHY parts separately.

ok will split the patch

- DSI part
drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
- DSI phy part
drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
> 


