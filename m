Return-Path: <linux-arm-msm+bounces-80012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1544C2878B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 20:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39D8E4F72BF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 19:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BED03019B7;
	Sat,  1 Nov 2025 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AToLAMHl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjlYMpXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEA2FE074
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762026763; cv=none; b=BV39jpOpCqlzk0JR83YHBYsBwIT9Xot8a9ZhWAoGYfd/QrVMCj9MIf666bl0kztpa3Tn+jUcbNNijCtyT6JYhQ3Q3jP3nG2ZQsBqApJeJVmoDkmdGeqsUGU0iwlNizVDFXY6Nz3pDCl1FbBuaYCHKXQrZCkD0LPWDtl0RVBfd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762026763; c=relaxed/simple;
	bh=+HB/6s5UxGM+U+WqWtzVSXt7+jxb+AAbFIZ1wC20sOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Evrp8/L+7bqxIyA3cz91XPGjSQE885IdR5mQyxUftZEim2mj3cJQhNxbyQ9/6kb6PM2WDuFHqYNqYQ/472CIJ3CqSv+AMAY+5P9vCd3pOl27s3KvypOkQQscfCMMY4dQ05aKUHxFbT7mvXws0yEWwzDdQPe6NzzJk4xsj74z0pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AToLAMHl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjlYMpXr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A1DrK3j1812027
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 19:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKLukRIsvOImA73BYCdmnhSF8FsffGTuqOI2aCg9ONM=; b=AToLAMHluK9WKAlw
	7zR1XeCsFaD1nB+bWG6nEJZImTQOadVdeYvVazuLXKXHuz0MmgQGvMnB3NBDuQ9w
	efnyp2LmkX4g0DAWpd7YbGd6d/zDrki2CDKEOWtdTm8fVZlUZylTCBJwM3HZzCQK
	0ls+WO/3PgWb1yu0ij4W7CL1v9W/YNv+ED/WjeWofTemsksfN/4dFfcpk/6qEeug
	JfLJHQdpqglcyd2r9FqBEj9n0bpqQWOkkR/vu7yzHO4Con48HSgwMftcC2BLjF0e
	Z8Vo7Sp61dR1QPZewFC0ExOQRwbcafijfB204UTo3/Zz0JahUcAJE6uxYH7WvxV3
	gUExTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn1bhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 19:52:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso7614635ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 12:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762026757; x=1762631557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKLukRIsvOImA73BYCdmnhSF8FsffGTuqOI2aCg9ONM=;
        b=LjlYMpXrRMZC5k7IdJasfjV0ahBILG8RMmCBYiDIz+SK6PTZN467qRRqSP3y5OUPxa
         CTMRQtcEG43NVI4XyDBpL3LjBY0w+B9iMghixyXH4NvCtXsl1BtNgrgvIOwmpe5XzxkD
         xCt5DToQ0zct9nijZKUFUG/vMx31hDvrGuXbp/lRLUkgDtyrJ1VPAs9zQBzaQLznyDdL
         SoADEelIrGj4OurXB0O77/bsGso0sTCwGEgdM3ysXb3ii5BsFe4iutxkcS4E+WXL9fT5
         qFdCv90slqZjASkaY+kTelDwaywjirsavNL4EZulkGtJL7a0bsLVpx3SN4m+Jk0EkBNb
         y1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762026757; x=1762631557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKLukRIsvOImA73BYCdmnhSF8FsffGTuqOI2aCg9ONM=;
        b=wO+qyMSQD+mKB8IKye9Gc9QFavETVPH16pzHYYtvWTS4zTmhvDLAtN9cib5/jqsSp/
         wPAW7Z6rnkiie0Z+o6OBQ0GcI2pAp8saKtXybqdOqyoTx0PFynkMj/b2SCdHaFQMjdgF
         2QWpUc7Y59ZVvfp4T5JQuuaQHAkqoZOtvB/II5XZKrbN3V/T3kMtcgfA01yD86EV1gCb
         jLtu9qZXbhPMyLFRkGDj4cD3yOzc3V3NfAmzkxl4lPBSvjibNPW1WSlMTYPDphNMoaTB
         2RNeccD7NnFNQad8nWpfdoUXsEpoU7FynP/PId3A9MV1cWo2DbqrmJvcwsDmVvcG564r
         T15Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAgEDPXwty0ub4zY6MjTnhXQH6X/y9Fb0HI5Q++hrPaQQk5v92/5LqxnyudcijpXI6sNOJ4DZ1mYY000ax@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+bT5VXfFQLeJ2YeiPc5OQjkVzC1BNKDvcRwFyd0RF3a+vDlY
	Z4JsSMnVZu8AZofD8OCaEzfx1MVnfCX08tHXCNJdK0B21Qb2X6sybj/dYxwwLVKiUcUto8sixLR
	uRl562q5E/qtog5gaaCkVso77PRE1kULu0pLPv1Xgwt6RJu9MKpsuf1292WC6EQUg4C0F
X-Gm-Gg: ASbGnctvRhF77IYvglw7voZA1uEMePK4e1daTgbWTWfEitvk/5hAjrWFFnsH4gyEjn5
	oWSO/xg05iRiXbwbZfegrlq2PuSLjmuzp810kJdldKGpDKxsjYQvEvvb9BdImy1lLVEgE8/J/E4
	i9Kr/4VruAp9CDgPbHXf6ieVDARy4xBLFT73PoEhGyOKHhm7/cAA3OGkvgBLYYK8T5gI+6mspbU
	Xl8nvZe6ApOkLFUhAnTBnOkAaVg0dBgBpsY38DrHTnHcuV1jPFa7IvZZcidfXCCgJf2jesbKCkB
	zUQRdU7uK0ab5406A9RGKQCmmho+j05QUz29v1+tx6iuBLb4vM5sAIpX/mJGbrp+l2trdmzI8rM
	LgmMravwahGzTd3Rh804wUMA=
X-Received: by 2002:a17:902:b087:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-2951a43eb4dmr72043415ad.33.1762026757359;
        Sat, 01 Nov 2025 12:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF42xlA99m2hh8bimhLKKhnJHosIww4lXcaBsuqfWJpjtxOAWe6IVRCRJ+fQR9kIOl8h7oauA==
X-Received: by 2002:a17:902:b087:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-2951a43eb4dmr72043205ad.33.1762026756780;
        Sat, 01 Nov 2025 12:52:36 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.233.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2958dd2308fsm1948945ad.30.2025.11.01.12.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 12:52:36 -0700 (PDT)
Message-ID: <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
Date: Sun, 2 Nov 2025 01:22:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: rob.clark@oss.qualcomm.com, Chia-I Wu <olvaffe@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
 <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
 <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69066506 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=rTtKBu4o5onlnI9juXDqsQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=DwizH8CuqJI6_-ZSpXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6sRr0GbWVA2o6FAY9Y5HypimVnEqw0za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDE3MSBTYWx0ZWRfX4kxF/p5BUB4o
 KD4DEBmhAR0feKo+jdAn9IxhmEe9kP9HdOrXGHZYaazKbexrplwsqOdvbfPsGARkJ0Y2tneLe31
 gaMngzJxHzk/nxDcXFedfc6VjGKmoQJZT6XVHK+IDlKA4+aeF4v9zZj5YzEZqiDCmSNJoU0fNtP
 xdyzKn8O9lyKBzBsyVgDHKnAyTup++x4/5JcPbtXWZmRBo8O2KkdbweVDlkchYoqOG3C0HJal+r
 cWvoPtAXb8Lrg14p5fAupAZwOnUi8OkhChVWn1vTvPGvp0MuxrvxR3mCZ9J6FoWmj486PtpiHNB
 W4wyiGyNoQ98eqhlW7SZo24DvTszWVy1GfRjWxWmoZzaXX1yEfKm3TAZCRI6gz4g9NCuzWIki/M
 JNIzAxkskjxhV5eDm6XGUQRIU1or2w==
X-Proofpoint-ORIG-GUID: 6sRr0GbWVA2o6FAY9Y5HypimVnEqw0za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010171

On 11/1/2025 6:27 PM, Rob Clark wrote:
> On Fri, Oct 31, 2025 at 4:43 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>
>> On Mon, Sep 8, 2025 at 1:28 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>> X1-85 gpu.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 ++++++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>  3 files changed, 79 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b27f08a5b1eeb08dced 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>>
>>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>>>
>>> +/* Applicable for X185, A750 */
>>> +static const u32 a750_ifpc_reglist_regs[] = {
>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
>>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
>>> +       REG_A6XX_TPL1_NC_MODE_CNTL,
>>> +       REG_A6XX_SP_NC_MODE_CNTL,
>>> +       REG_A6XX_CP_DBG_ECO_CNTL,
>>> +       REG_A6XX_CP_PROTECT_CNTL,
>>> +       REG_A6XX_CP_PROTECT(0),
>>> +       REG_A6XX_CP_PROTECT(1),
>>> +       REG_A6XX_CP_PROTECT(2),
>>> +       REG_A6XX_CP_PROTECT(3),
>>> +       REG_A6XX_CP_PROTECT(4),
>>> +       REG_A6XX_CP_PROTECT(5),
>>> +       REG_A6XX_CP_PROTECT(6),
>>> +       REG_A6XX_CP_PROTECT(7),
>>> +       REG_A6XX_CP_PROTECT(8),
>>> +       REG_A6XX_CP_PROTECT(9),
>>> +       REG_A6XX_CP_PROTECT(10),
>>> +       REG_A6XX_CP_PROTECT(11),
>>> +       REG_A6XX_CP_PROTECT(12),
>>> +       REG_A6XX_CP_PROTECT(13),
>>> +       REG_A6XX_CP_PROTECT(14),
>>> +       REG_A6XX_CP_PROTECT(15),
>>> +       REG_A6XX_CP_PROTECT(16),
>>> +       REG_A6XX_CP_PROTECT(17),
>>> +       REG_A6XX_CP_PROTECT(18),
>>> +       REG_A6XX_CP_PROTECT(19),
>>> +       REG_A6XX_CP_PROTECT(20),
>>> +       REG_A6XX_CP_PROTECT(21),
>>> +       REG_A6XX_CP_PROTECT(22),
>>> +       REG_A6XX_CP_PROTECT(23),
>>> +       REG_A6XX_CP_PROTECT(24),
>>> +       REG_A6XX_CP_PROTECT(25),
>>> +       REG_A6XX_CP_PROTECT(26),
>>> +       REG_A6XX_CP_PROTECT(27),
>>> +       REG_A6XX_CP_PROTECT(28),
>>> +       REG_A6XX_CP_PROTECT(29),
>>> +       REG_A6XX_CP_PROTECT(30),
>>> +       REG_A6XX_CP_PROTECT(31),
>>> +       REG_A6XX_CP_PROTECT(32),
>>> +       REG_A6XX_CP_PROTECT(33),
>>> +       REG_A6XX_CP_PROTECT(34),
>>> +       REG_A6XX_CP_PROTECT(35),
>>> +       REG_A6XX_CP_PROTECT(36),
>>> +       REG_A6XX_CP_PROTECT(37),
>>> +       REG_A6XX_CP_PROTECT(38),
>>> +       REG_A6XX_CP_PROTECT(39),
>>> +       REG_A6XX_CP_PROTECT(40),
>>> +       REG_A6XX_CP_PROTECT(41),
>>> +       REG_A6XX_CP_PROTECT(42),
>>> +       REG_A6XX_CP_PROTECT(43),
>>> +       REG_A6XX_CP_PROTECT(44),
>>> +       REG_A6XX_CP_PROTECT(45),
>>> +       REG_A6XX_CP_PROTECT(46),
>>> +       REG_A6XX_CP_PROTECT(47),
>>> +};
>>> +
>>> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>> +
>>>  static const struct adreno_info a7xx_gpus[] = {
>>>         {
>>>                 .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>>> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
>>>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>                 .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>>                           ADRENO_QUIRK_HAS_HW_APRIV |
>>> -                         ADRENO_QUIRK_PREEMPTION,
>>> +                         ADRENO_QUIRK_PREEMPTION |
>>> +                         ADRENO_QUIRK_IFPC,
>>>                 .init = a6xx_gpu_init,
>>>                 .a6xx = &(const struct a6xx_info) {
>>>                         .hwcg = a740_hwcg,
>>>                         .protect = &a730_protect,
>>>                         .pwrup_reglist = &a7xx_pwrup_reglist,
>>> +                       .ifpc_reglist = &a750_ifpc_reglist,
>>>                         .gmu_chipid = 0x7050001,
>>>                         .gmu_cgc_mode = 0x00020202,
>>>                 },
>>> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>>                 .a6xx = &(const struct a6xx_info) {
>>>                         .protect = &a730_protect,
>>>                         .pwrup_reglist = &a7xx_pwrup_reglist,
>>> +                       .ifpc_reglist = &a750_ifpc_reglist,
>>>                         .gmu_chipid = 0x7090100,
>>>                         .gmu_cgc_mode = 0x00020202,
>>>                         .bcms = (const struct a6xx_bcm[]) {
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172efdd7255165f3c04a 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>         u32 *dest = (u32 *)&lock->regs[0];
>>>         int i;
>>>
>>> -       reglist = adreno_gpu->info->a6xx->pwrup_reglist;
>>> -
>>>         lock->gpu_req = lock->cpu_req = lock->turn = 0;
>>> -       lock->ifpc_list_len = 0;
>>> -       lock->preemption_list_len = reglist->count;
>>> +
>>> +       reglist = adreno_gpu->info->a6xx->ifpc_reglist;
>> This is NULL on X1-45 and causes
>>
>>   [    8.795603] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000008
> 
> Hmm, this is probably going to happen on all a7xx which don't have
> IFPC from the looks of it.
> 
> We should either check for the IFPC quirk.. or maybe just drop the
> quirk and decide whether IFPC is supported based on ifpc_reglist !=
> NULL?
> 
> (That said, we probably do want to have IFPC enabled for x1-45)

We should add a check for IFPC quirk here. Chia, do you plan to send a fix?

To enable IFPC, we can just add a750_ifpc_reglist_regs[] to
adreno_gpu->info->a6xx->ifpc_reglist and enable the IFPC quirk.

-Akhil.

> 
> BR,
> -R
> 
>>> +       lock->ifpc_list_len = reglist->count;
>>>
>>>         /*
>>>          * For each entry in each of the lists, write the offset and the current
>>> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>                 *dest++ = gpu_read(gpu, reglist->regs[i]);
>>>         }
>>>
>>> +       reglist = adreno_gpu->info->a6xx->pwrup_reglist;
>>> +       lock->preemption_list_len = reglist->count;
>>> +
>>> +       for (i = 0; i < reglist->count; i++) {
>>> +               *dest++ = reglist->regs[i];
>>> +               *dest++ = gpu_read(gpu, reglist->regs[i]);
>>> +       }
>>> +
>>>         /*
>>>          * The overall register list is composed of
>>>          * 1. Static IFPC-only registers
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4269ae7783ed3578e40e 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> @@ -45,6 +45,7 @@ struct a6xx_info {
>>>         const struct adreno_reglist *hwcg;
>>>         const struct adreno_protect *protect;
>>>         const struct adreno_reglist_list *pwrup_reglist;
>>> +       const struct adreno_reglist_list *ifpc_reglist;
>>>         u32 gmu_chipid;
>>>         u32 gmu_cgc_mode;
>>>         u32 prim_fifo_threshold;
>>>
>>> --
>>> 2.50.1
>>>


