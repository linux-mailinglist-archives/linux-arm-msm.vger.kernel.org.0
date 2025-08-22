Return-Path: <linux-arm-msm+bounces-70284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA2B31289
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C430A1BA3351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66872ECD3E;
	Fri, 22 Aug 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGLmcP9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79B279334
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853522; cv=none; b=gtyDo9Ocg0td51Cpfc4ziAVRSRDF2JB9qTfmgQDU7jJfXRreSwEJkIEVnBbgnMe/nGG+6p1pd91HJJbkInAkMaI8t94HBJQWUMe6+qsnmdIq6A+WnZUixOf5UtcV/tvfLpZNQ5XPJ98N7DHrCQ1okR1+abGrxk+IymVMQ2EvkZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853522; c=relaxed/simple;
	bh=DLY5vD2G1U8kuKjZ8Y13igWoq/avK0swelon1k2VJEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9vzEZKwFVKqzJhevy7ij8k+d6XdhIyLcef3ujTsuDLmT6YOERLr5tq8NL1OLAKQdV0DjIyixqsDTvO6qeBXJKYeWfrwwM9cquJZtBeivw+Hpl4tFMnWhQnP7BVdfHeYoMPJxJj0Cm9rgGcz6Z5ZJVtU+nVYtv0jQ3QbEM1MEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGLmcP9n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHnd005806
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=; b=ZGLmcP9nYIXNfPDT
	gU9FtFbEBKZSTsVW8aLigBY5uEQ/hnFdyNcvyHFUZD9fPKNDnHTRCJBlN8/Qt7UC
	vBgrKPcz0yA2adVkAsptuqijCFbVEc8H9ejj31wnFtreBmRb6oCLnNZ3NGVJfbmP
	8GlXXefuEt80YiooSQ0riLJyEJ2oSppWw4XNysM51MQSLPJ6xKkw0JDyZ0cyHUh/
	K1p3uKUyoZCwLheemmfi0z/PcE5UNZynhwHqy+njDzVy+o9yURLG/LQXcMmJ8ouV
	nWcXj/CFMTBlFX8adGal7WHiD83vbzUXo/jA3NBQJOG/2FDu0ZOIZgdWiWBZb9am
	M/mYpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290k9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:05:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9f5bdf78so3219996d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755853517; x=1756458317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=we5kOYIR9rQ9t3N19Qt3EpeOAg+A9dfHS8z2hNw9bB4=;
        b=QyKNHYDLeZUjzCHWHqUOagxiKFOnF5L1DIkYGKy3ii6vrkGXrKi19a6eLshSqUMIW1
         lig1D45zxIPcfhvmUVVmoftY+8+eDQwqGnpFtl56gvb3MihLEaeTNq/myjESnbmgePTM
         /FqGk2TDBm7aC9s5xj/E9z4CN8ZzqGGeHfmlCky5xeteNjLkVen8mYNTvkxjdOHIBt8y
         wKB0OHUsHSFCESoCQ0Hi+HK+thRaeo7yhV2jDzII6GnsPxBalE2iSantc2pZhcjKmmjp
         TmtRI7HF2mGQ5qnUU1Bohj4a8vNfWY3mrgo91YNo65mbdh0I7odFT4QCL1TNXYZNZxGn
         Wd7A==
X-Forwarded-Encrypted: i=1; AJvYcCXjP6kDPhkkRStF7ujoyEc+zgpIoD3ZszYkmvryEk7nS4YcBoaVid9yS72qMF3EqQ30hfRY5Txjnlx2KSFn@vger.kernel.org
X-Gm-Message-State: AOJu0YxE430LVl/4USog7oOaLRPpxlrxvn+w7zcSE5cOiXt228uCHLF5
	abjXOAkA6rvCv96i01UuzM+2g1WuzWmkDmmyGg5EW8xxF49D/2TIxoZcKncXntIGcDy46xen1aR
	vTqFGE8U01WY9NWkUWLLVj1YlyMm9x4Ad1vFuQRKhv0pY2NCBbxamOm1tVvtAKGDTsgCX
X-Gm-Gg: ASbGncv2yiaYJnKg4k+aQ/o5BtgbRmhkNR8CkdPsXZR4jlEt3S8GO1ZtKLbOg1va9Gd
	HxAuueAo6dKssfocUsXsTs4AEiEsvr1Bz0inqDeP1Tq/QfphsEKJUQciXEkRfBpA6AaRpygU/iu
	4ncfpr1Slv8loE7VJzDr0HDGN/sTF3oN3eLFOT4jw8kakCVNDZWxnXzdR3W/eJ95f7DcS+W4kV7
	YQwKR0Xng5vy8oS4Zdgea8NJNJetvMfrxHmBi+44fLs5+eMRmG6ilzLTszFNCwCvo5JT1lbdAwM
	KD3/pMnYewpSCJrR8MqJleg7MDv0wfaj++6u827vvI8/gfU0aAJTo3UcBwxpdB0V5hyBcvB3BFH
	rvzX8PAtIzWOIHSrsJA==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id 6a1803df08f44-70d9723e3d8mr27746656d6.62.1755853516644;
        Fri, 22 Aug 2025 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxMWfBZW68IB/KZovde+NRVxhgZvhNidsma5/daN4tO/i9zHYH0AJAj9sHGZxcIBJB4AMYUw==
X-Received: by 2002:ad4:596b:0:b0:70d:6de2:1b32 with SMTP id 6a1803df08f44-70d9723e3d8mr27746106d6.62.1755853515855;
        Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi. [84.253.220.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a48b46bsm32794951fa.36.2025.08.22.02.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 02:05:15 -0700 (PDT)
Message-ID: <d4e1f836-afbb-4cc7-a5fd-fa961e3203ec@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 12:05:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
 <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
 <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8922ae6e-9be6-49f7-ac84-d4a1dd60421b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a832cd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=G97a9vFw7kLByEIGoT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: J-uCtMdZcPekpqFFhWZCT5ZKGhpGz016
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzuzBt5C0TqWU
 CxvU0+Dj468hBUL0OX2i5vrDdo49Ix8a2GuGC46R7tdyhpUFcbOw8NP3Mr1UcX34byiZG5BJJ+S
 0L4XJtgaoWfq0ww1AC0mW6wGPTgsWl83ovBWd7apE+zQeUO+3rwdXPyM7o1hXUGN2AOTZyH5PWq
 Zu82hw1doUKjBv/4DcLbakz5DOzRFuh67muVQQdavRXJ2ra3fetSATH3EDmKATIqzpIbgyVfHc2
 2/Ek+OFbgEuUfOo3nWoL13HaA9Btuf/VjkLARWyi40f9vCu6vLzab17T+X0KA6YIBDTIWjhWobB
 CwEEf7j/LVhr7qtwSXpQI181YPxksxc0ckP7FiJM5Q4AuF4FXbytbjYUharTwvXxrAkxVRGYV81
 JqISLNE5Sz3LLtHzascsPUdhdjYU2Q==
X-Proofpoint-ORIG-GUID: J-uCtMdZcPekpqFFhWZCT5ZKGhpGz016
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 22/08/2025 09:59, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:47 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
>>> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
>>> including register offsets, init tables, and callback hooks. Also
>>> update qmp_usbc struct to track DP-related resources and state.
>>> This enables support for USB/DP switchable Type-C PHYs that operate
>>> in either mode.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>>>   1 file changed, 55 insertions(+), 18 deletions(-)
>>>
>>>   
>>> +	struct regmap *tcsr_map;
>>> +	u32 vls_clamp_reg;
>>> +	u32 dp_phy_mode_reg;
>>> +
>>>   	struct mutex phy_mutex;
>>>   
>>> +	struct phy *usb_phy;
>> Should be a part of the previous patch.
> 
> 
> Ok, will move usb_phy rename to patch 'Rename USB-specific ops',
> 
> then shall I need drop the |Reviewed-by| tag in that patch since it will change?

Depends on the amount of changes.

-- 
With best wishes
Dmitry

