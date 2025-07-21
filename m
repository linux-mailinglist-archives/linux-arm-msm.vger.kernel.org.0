Return-Path: <linux-arm-msm+bounces-65835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9BB0BBB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A241175A60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 04:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1FE21A92F;
	Mon, 21 Jul 2025 04:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd+gqMZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD58219A6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 04:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753071508; cv=none; b=ZQjttV3qe1HsDVnE8CDbT2qL2YKT6IGtEyWDDhEqWPv4ex21IRdCihyDgouUCUSlH4FCo8p504sC8pzGQgVYkrfK2exNBlqN+k5mSRu6jyv3uuO/ACqaG7J7E181Me+n+lvGnJ3W9O1ghNg7cgvwODm05KfwvTmkTNTqHJTX71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753071508; c=relaxed/simple;
	bh=zVvUOIlnKKCqQgJ3kE21UViYgXE0z1AIp5kpX5JAwaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9mslsKN0YSwfyQ00tQ7FzNlWfyp+lxAt6YKrwQE9MBQowO5ru1J+meEcTvjf5mnDGN9zxKQ7mV2+eOJ8wtC7ztwMy9RS4RIx0rD5iaxbjy+ScwdVH9FlqGqEnnjEL0WFnZlkLFnOzTmywTHQPqQTa/VdNNko2NTinjuaNGY4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd+gqMZN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L41C8q006465
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 04:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=; b=Pd+gqMZN6VlsReQ2
	ApLJJ3KRx8yfPGzjKNebwJ80Go6FToeUYYa4O3lfQ5S2qmB4E34dhEzTL4M9KXN7
	vU58SaWiWgI4OzuOYPgSrgb4RQf375zxiPkmT2RUyzmLU7FJsSnJTkBQqSIc0xQe
	hH68NESm3siMXM5EMpgKo76pIExrNphUcOUVqi/jQgSj23wvtEG8dmGSi6TaCuPI
	thk+Z/BVtHM2Lw4D3n6mBmBwz1l9IKfKnqGriP6TdGbt06GYnx+uoH91zzfPDYI6
	F/Oi+QNMY1ijMZcOsntm8K2USXBvnjx669FrqrQIPQixelVh80lAKL/3UoieitQL
	j6WMLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q3c88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 04:18:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74cf7913166so401038b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 21:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753071504; x=1753676304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HxS55+QTxxnhovCNlJMVgeCUCIs7adrQbeCrM4+8pY=;
        b=dMi150yqc1H/KfNuge2tfWiRVUG1ZWJO512cYwYqUeGdAfccxFVXH89mW6Zh8edd0z
         U1+m2j44xg8AWhVwb1NYTKXymXJtFsV4g1LATexiqfgY3MCNhH/SOIM6VdWr3zi0VUQI
         XyoCGXf17IJkWdwS3znqy/ey+sqFVSKrv6vicXu6Q+TRxTR88kmmG0hP64uyackJvehn
         UtltXdBi7DUyH7TZFBrFEvpXk2SqzWCnt76IWg17X8Dm1AaOKMxjzm6bHda6SRmbDubT
         KvghsV0LOrkA4D4D0wA5NgHl0CJjhIkSl8rDj2cRmksh71E33dTqHkorZ6d/g/U+aDCY
         pAew==
X-Forwarded-Encrypted: i=1; AJvYcCXFgFCv9nwnAzaD7o085FNyqAfnEF0J0zaLxL8sI1DioSkftOBXG5DyQRaoiLsNa+5As+pZAhqqmZB7/3SN@vger.kernel.org
X-Gm-Message-State: AOJu0YyCW5OD+3J998YNHfuNGvPzwYcIGP6PKYOUU4+64LdDTp+P+F3O
	g21s7MOn/IEZ8UwRYAJpsCQU/uRx/63hX03MjOp1wd+1GwDBlwHXHEbSNY1DFuZ9ZSH679LVGxj
	41RxbUfjwM0QzTxD8xubrH/nCrcZyeb1QYytPmQQj6jcVo+bT/95e8KtS+w4EWS75cjtm
X-Gm-Gg: ASbGnctAWKVEYxM8Ag0FwXOjcL/uJOu1PYOJ+5QFx3Nuu1mrOcGlz7YcZAw4iOD1JGh
	0cKV1mhG0v2ODySI9p1rn6KRzba+Kh1Mw0MBaFDCB1ZhkKdNaStB0G66IqdaxXXXB0r1Kqo6yjE
	ttzJFJ4KVButtbfmSjey257l2Aru6nagpCYzHf3ZqB69d4ft+5Nyg6JfhTD+/DU2wP2SJyMwFkH
	DaV5zCw7+c847LfRPG/pe45WuWUnpuLz9MjzUj50SiBUozjTw0cG5zCPj0B/78LbaCNK0syqdR0
	aPY4yCRT4ppUlmFhrwz2aGU/rm3GDDvH30mTskYoRFpGGbadYV+EqEYhq4N6maGpNjhqJ2tfNtK
	M/aclmP2gMkNR232mb6APwlcCTwWI
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id adf61e73a8af0-237d5c0df9emr13823354637.4.1753071504491;
        Sun, 20 Jul 2025 21:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9E+Jpxuf/n9mwdKcrc+ICdr6n87fGKbL6wE5SUt8XIJ2tugZsZ8TP4nLkT2kWBtaUKyMt+w==
X-Received: by 2002:a05:6a20:9147:b0:1ee:d6da:b645 with SMTP id adf61e73a8af0-237d5c0df9emr13823324637.4.1753071503997;
        Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8ea7bsm4493637a12.21.2025.07.20.21.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 21:18:23 -0700 (PDT)
Message-ID: <a723b6a6-c70a-442f-9785-9f607548664f@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:18:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
        quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
        quic_xiangxuy@quicinc.com
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
 <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
 <d427de7d-76ac-4e5b-b79a-3b7638a8e7fc@oss.qualcomm.com>
 <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <w66xyhu5w7ajpkennvj24cad4j6izvapsp3reyla7iui2jdgkx@d43b6z3qw5tj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDAzNCBTYWx0ZWRfXyqN/RWgUhGXW
 nzCNaNykv/Ac82EISVHqh1hZUdIqA1ofEw35Jsqrk4uEzCww2xbZilj+2WSyuodGE34u7ppAhrT
 4q2eADw1Ru+yLiHTg1rv7Y+bSjzk7nRAthyM3JVrydMnpNN7cE6s5D9ayYE/NvGeXkAOSyyYwOI
 TFiC1CKL2h+JcpvLEfTHpG2L5LkTnehF7LKbQ+xkYnDNML+EqR/sDB0eg+/Yct8MUZUKONObwV3
 D6gywTBiKfcATFcDyAu5pL2YA+CKeyplWZxFzOxY71Nq/c+UYu2AFiiAk0q6JvKBFkfez9npHYJ
 btw6TKZ9E3Z2el1VWAvChw8CKj3DGb9qTBYy2mxzI6Ekl6eJNJ2kecMVH2UP++/V8yGEL8qOwoE
 vSu+7E096aVReNmny280Oe6sJnI7sKUzFkAEhH/frpT+P2Ha7DZvn9Cz8195e9Ar1Zj9BrbL
X-Proofpoint-ORIG-GUID: iQwGNECgrFWmlW7d64SBDpnclFQ4WilP
X-Proofpoint-GUID: iQwGNECgrFWmlW7d64SBDpnclFQ4WilP
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687dbf91 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=q-zp-rPcFIMxVU44S18A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210034


On 7/19/2025 5:43 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 09, 2025 at 05:16:02PM +0800, Xiangxu Yin wrote:
>>
>> On 5/28/2025 4:49 AM, Konrad Dybcio wrote:
>>> On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>>>>
>>>>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>>>>> when the link training #2 first attempt fails. This approach enhances
>>>>>>> compatibility, particularly addressing issues caused by certain hub
>>>>>>> configurations.
>>>>>> Please reference corresponding part of the standard, describing this lowering.
>>>>>>
>>>>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
>>>> Anything in DP 2.1?
>>>>
>> In the DP 2.1 spec, mainly on section '3.6.7.2 8b/10b DP Link Layer LTTPR Link Training Mandates', defined 'LTTPR shall support TPS4'.
>> The other parts seems similar to the 1.4 spec.
>>>>> - All devices shall support TPS1 and TPS2
>>>>> - HDR2-capable devices shall support TPS3
>>>>> - HDR3-capable devices shall support TPS4
>>>>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>>>>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
>>>> Any other driver doing such TPS lowering? Or maybe we should be
>>>> selecting TPS3 for HBR2-only devices?
>> This logic is porting from qualcomm downstream, 
> Hopefully a downstream has some sensible commit message which describes
> the issue and the configuration to reproduce it?

The downstream commit log shows in 2019/08, SM8250 (kernel 4.19) type-c DP meet LT2 failures on Samsung HDR curved monitor, the pattern lowering fix was adopted.
On QCS615, an mDP-to-HDMI adapter cable exhibited similar LT failure pattern, and it's works with this solution.
However, It's rare compatibility case with special device and lowering seems violates protocol standards, maybe not suitable for general deployment.

>> For other device, only found in some older Tx chips like i915（intel_dp_training_pattern) used the maximum hardware-supported patterns, but not lowering.
>>
>> According to the description in DPCD table 2-232 003h, From the DP spec perspective, it appears that all supported cases should preferably adopt TPS4, as it is more robust.
> If other drivers don't perform this kind of lowering, I'd prefer if we
> don't perform it too.
Agree,  I'll remove this patch in an upcoming version soon.
>
>> 'DPRXs should support TPS4 and set this bit, regardless of whether the DPRX supports HBR3 because TPS4 is more conducive to robust link establishment than TPS2 and TPS3.
>> 0 = TPS4 is not supported.
>> 1 = TPS4 is supported (shall be supported for downstream devices with DPCD r1.4, except for eDPRXs).'
>>
>> Although maximum capability of QCS615 is HBR2, but the actual pattern supports TPS4. 
>> From pure design perspective, it would be cleaner to drop this lowering in next patch. 
>>> Bump, this patch looks interesting and I'd like to see it revisited if
>>> it's correct
>>>
>>> Konrad
>>

