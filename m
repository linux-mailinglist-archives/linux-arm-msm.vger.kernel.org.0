Return-Path: <linux-arm-msm+bounces-84123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52223C9CB1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 19:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE8E54E3849
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 18:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D63B2C11E3;
	Tue,  2 Dec 2025 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALp3ckUU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvV7eISY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471A2D192B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701659; cv=none; b=afpOoRbUiflvdyi5zJI+SDKz2fiUh408dlnqZj2u8sXpTa0BecFIY4/9067zOWRCvYgvpNlGtPNSBKTiQCv3FtEkdcypgk7Som6Z8GU53rNYNrVz6TOkwEiVGqN5prUgsLULzu/BB/y/Uhg/rF7O816Y5mgX5t2hv6HoS/A6n4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701659; c=relaxed/simple;
	bh=tsZzClfDjPvLEaasmSK5qthuOZLgGRJLMU3NtNPh4cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTKdvuzR1miGrO2SixkoomllCApjLZe234PMvZsuefiuVDZyBV1Hy9Oyv6StOD/l5ItY2j8RkymeMwedVtxugJXrIQZRRmn2reB5QNzJRAWkhifyEeo6q+s+ZyZdKaBYaUoACK9SC/FrzSkBFRpUKIv/iY4aEQKV8WxeoI/ljhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALp3ckUU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvV7eISY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2GXcRu3714898
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 18:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=; b=ALp3ckUUHlsHUsdj
	Rd1Y+DpvI04kJ61unC51UMChiu0za2yA1ERP2mFmpDlUkoUiv5Vkks9h/CAxDv9Z
	Bb7RoRwwVX+a6QISn3k0Z1JCKio3aOivY+iGtWSAmE08Q3s2ujuWAEHzaP/NQU+2
	dzv8cX+a3SvOBmV8IGTalQwjsryIcQIDYu9TtvWGjOPikNZFGHlFJge2hfayX6lw
	hUyvHmcvErgD8FQTJsufNfgdCcpHiT2M9Wn3zNF/Of4N/1XTOhcZ1ARD/mlkD2ca
	I2NzufK2phGwtwEvWTnN5K5ew29QZwaV79xx/wktR8/AQv1heEN1uoiH7Q3QOY8j
	ao4/hA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3r20edm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 18:54:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2982b47ce35so65238535ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764701655; x=1765306455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=;
        b=EvV7eISYFMd5xJ/aUpVhtPcYPo8SjFf5AqqFdiRRPkukq3HLsO3oqvVWDySsBb+lHs
         RioHJ6APhM+AK2MN6xMivzLL6HnYkPthGgrzMeZp4wXIdoqncLlL5VH08pAZHMexAQrE
         hbS/Qrh8tiFtTGEqGumGskRW3pnkHgcZqa/SzPVSygtuZR1Z+udqjISIQdSDgCXm5gwF
         D8hYtwZJHDEW8tG8dLRqsuauV/Hv7C8pB7GKRCdmD8XzFElYZ+q7bDiQ0W4eDILOXfKM
         9NaBKf3nI+lwmlXYd3Ie4SfHLZNZg6Kxoez977vBvyPZ/GxPJ9eHjzdbSVXTvYG+CTQE
         clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764701655; x=1765306455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNXN76wd6N8myVw7+8PtjIAlo29BoY5GwXZPUkKU7n8=;
        b=AgfNLoJ+aTUGDhKf3BRX5D6RcswHqxxp5rkafyOyKSwHy+BXzES4GldoMl8idvvT8w
         qdEHPvwdzBxV5hGvOpSQlD+8IbDCD1L9NCSPwHP+aqMe7vee+DuBhk+hSJsCo0u4l/BS
         MZ++jAY/exxE/SFuj8/i2yLIHKeZBw3E1FNzeBctuAVjKg2G1AxDZXT4M6gkNW+WWv13
         XLI4Srn7vBLdJmJV6mcv5JNhfe6FBBa3x8o3XWvIYvKwpsG+isDTMGBlLcWukAoyyMJb
         ZJFDuZMO90a++H1CVmScvxxATUwBs2bP7TgZLP84urhDAWQxmcr/WX8LhZcCkx51GFEw
         IB2g==
X-Forwarded-Encrypted: i=1; AJvYcCWuzphpEisZIUlOaRrvTZw994Xg4oUdDLBttdCLbqtblgUN61Wv+NOQH5pV+6+S36yCdMdbjjGUS+IxD6y4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14ZpDJ1saoijHObOSuwjOTT3W/SCImT1WQDN2CjEGiXLl+xiD
	o0XQuHhs1w+alnAgp9TY+VN5gOTQp9XgErNWgi7xpGLybIazoBO5jJlavXPrfsVt6YY3fjpoVqf
	32S+IxMAvHm42VdPUhXwVix7GfYmn8H/tIZ6JNT+WjmkJlmFMp2jl1WEZWs3frPDkkrxF
X-Gm-Gg: ASbGncu6Es+Y0gmCccgdf6ugXvrbkK7hdZHEVEb6WAE9j3R3Gp4uWS0UK7EYgC51Ke5
	zmbdegaoHF2F3BFOXLgQVT9afjIBaODV3Q46GSDh3hwTI0pf0AePNml45EubIe36xe5ATyfCEx+
	s7gGD4aVYnoO4yrYiKdTN6B1aAOgVPU9rhKTvqRlqfjSEzVqg9sLBrQwfQbMeWnvX3IIvV4b8MO
	ZmktVzMiNGgckGoxMkWIeZTmouhe0Y8/Rf5J3R2c8xQ7PzSzNKShpWpedolZuZPhVxsLRVrlyZd
	VDoufSQvb1Q8Zs9qtoGSN1/rMvv66Ez/IgnaNSe6Lib0oPGXkB75YUaMc07RnGoI7S7ST32DTkZ
	jPYP3DlTIf1RGUbGILySIuj+sdup33Nv3vLiSdrB5JOxP61F43kCZG0/X
X-Received: by 2002:a17:902:cf4a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29d65dcf153mr3194945ad.31.1764701654700;
        Tue, 02 Dec 2025 10:54:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ/RzWsFhuxc2+iwjgFwfUTjpK4qX1voFjw3XyGlKEHTYHR3nxGS9zclRDNjBfyGa0y30Nkg==
X-Received: by 2002:a17:902:cf4a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29d65dcf153mr3194655ad.31.1764701654151;
        Tue, 02 Dec 2025 10:54:14 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bd96307ebsm136616815ad.36.2025.12.02.10.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:54:13 -0800 (PST)
Message-ID: <cb5cfffe-dbba-4da2-ac1f-de4a9a31f057@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:54:12 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
 <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
 <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UVKQicEM1yoyVQI0-QrtOqwkF2pDqfJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0OSBTYWx0ZWRfX4/KeYWSQh9WR
 iWl5q+v0Br52lCorkCIZsV4vnLDexodWN7pqM+08KPvwR6TWlCg/ZMTD/VAO3Lkf0Nzjjhciumf
 zFMuJip8zdys2RKVqk6XPII+KEDDxnl+rQVV5NjkJcEuCRId/npEsNYffDZui1KPSsP8Pxm0uFY
 gKvApk31qowYcy1KIEH2p6BzWLjteZ1nSTxDwOIc3qODHX8FoU/AY/jsDKM/gP0BggywXfxRcc/
 lHx3bC6H/9iJTX+Pvpn779CwljqA0duY5oE/hP/5TNkIe7WHhl+lSnO3d6q+2r6TFuabI9nnilr
 8a9NPqesSDR4nHfc1ZZVzvC5ZK84pD29O3OIRAOOjiHuJ+zRWzOIhpM7CTy5KnsGVhKanJXSBPA
 pfp5AuZdytkuQTNdm5jvTweXyPdztA==
X-Proofpoint-GUID: UVKQicEM1yoyVQI0-QrtOqwkF2pDqfJf
X-Authority-Analysis: v=2.4 cv=c+WmgB9l c=1 sm=1 tr=0 ts=692f35d7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PkJSjolnkn3GvNMOFesA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020149



On 12/1/2025 9:26 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 12/2/2025 12:03 AM, Mayank Rana wrote:
>> Hi Krishna
>>
>> On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
>>> The current MHI runtime PM design is flawed, as the MHI core attempts to
>>> manage power references internally via mhi_queue() and related paths.
>>> This is problematic because the controller drivers do not have the
>>> knowledge of the client PM status due to the broken PM topology. So when
>>> they runtime suspend the controller, the client drivers could no longer
>>> function.
>>>
>>> To address this, in the new design, the client drivers reports their own
>>> runtime PM status now and the PM framework makes sure that the parent
>>> (controller driver) and other components up in the chain remain active.
>>> This leverages the standard parent-child PM relationship.
>>>
>>> Since MHI creates a mhi_dev device without an associated driver, we
>>> explicitly enable runtime PM on it and mark it with
>>> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
>>> exist for this device. This is only needed for MHI controller, since
>>> the controller driver uses the bus device just like PCI device.
>>>
>>> Also Update the MHI core to explicitly manage runtime PM references in
>>> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
>>> does not enter suspend while a client device is active.
>> Why does this needed here ?
>> Isn't it MHI client driver take care of allowing suspend ?
>> Do you think we should remove mhi_device_get_sync() and 
>> mhi_device_put() API interfaces as well ? And let controller/client 
>> driver takes care of calling get/sync directly ?
> These API's not only  do runtime_get & put but as also do wake_get & 
> wake_put which make sure endpoint also doesn't go M1 state.
ok here we are doing 2 different devices based pm runtime API usage in 
this core MHI driver.
1. mhi_cntrl->dev
2. mhi_cntrl->mhi_dev->dev

Those are seperate devices, and here we are mixing those usage.
Is it correct or I am seeing differently ?

Regards,
Mayank

>>
>> How are you handling cases for M0 and M3 suspend ?
>> Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
>> (pm_runtime_put) ?
> M3 are controlled by the controller driver, they usually do it as part 
> of their runtime suspend
> and M0 as part of runtime resume.
 > once the mhi driver gives pm_runtime_put() then only controller can go
 > keep MHI in M3.
 > So we can't tie MHI states pm_runtime_get/put.
Ok sounds good.
>>
>> Regards,
>> Mayank
>>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> ---
>>>   drivers/bus/mhi/host/internal.h |  6 +++---
>>>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>>>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>>>   3 files changed, 15 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/ 
>>> internal.h
>>> index 
>>> 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 100644
>>> --- a/drivers/bus/mhi/host/internal.h
>>> +++ b/drivers/bus/mhi/host/internal.h
>>> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct 
>>> mhi_controller *mhi_cntrl)
>>>   static inline void mhi_trigger_resume(struct mhi_controller 
>>> *mhi_cntrl)
>>>   {
>>>       pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> +    pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
>>> + pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
>>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>     /* Register access methods */
>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>> index 
>>> 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 100644
>>> --- a/drivers/bus/mhi/host/main.c
>>> +++ b/drivers/bus/mhi/host/main.c
>>> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller 
>>> *mhi_cntrl)
>>>           if (ret)
>>>               put_device(&mhi_dev->dev);
>>>       }
>>> + pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
>>> + devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>     irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>>> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct 
>>> mhi_controller *mhi_cntrl,
>>>               /* notify client */
>>>               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>>   -            if (mhi_chan->dir == DMA_TO_DEVICE) {
>>> +            if (mhi_chan->dir == DMA_TO_DEVICE)
>>>                   atomic_dec(&mhi_cntrl->pending_pkts);
>>> -                /* Release the reference got from mhi_queue() */
>>> - pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -                pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -            }
>>>                 /*
>>>                * Recycle the buffer if buffer is pre-allocated,
>>> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev, struct mhi_buf_info *buf_info,
>>>         read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>>   -    /* Packet is queued, take a usage ref to exit M3 if necessary
>>> -     * for host->device buffer, balanced put is done on buffer 
>>> completion
>>> -     * for device->host buffer, balanced put is after ringing the DB
>>> -     */
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>> -
>>>       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>>       mhi_cntrl->wake_toggle(mhi_cntrl);
>>>   @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev, struct mhi_buf_info *buf_info,
>>>       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>>           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>>   -    if (dir == DMA_FROM_DEVICE) {
>>> -        pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -        pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -    }
>>> -
>>>       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>>         return ret;
>>> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct 
>>> mhi_controller *mhi_cntrl,
>>>       ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>>>       if (ret)
>>>           return ret;
>>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>>         reinit_completion(&mhi_chan->completion);
>>>       ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
>>> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct 
>>> mhi_controller *mhi_cntrl,
>>>         trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, 
>>> TPS("Updated"));
>>>   exit_channel_update:
>>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>>       mhi_device_put(mhi_cntrl->mhi_dev);
>>>         return ret;
>>> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct 
>>> mhi_controller *mhi_cntrl,
>>>       while (tre_ring->rp != tre_ring->wp) {
>>>           struct mhi_buf_info *buf_info = buf_ring->rp;
>>>   -        if (mhi_chan->dir == DMA_TO_DEVICE) {
>>> +        if (mhi_chan->dir == DMA_TO_DEVICE)
>>>               atomic_dec(&mhi_cntrl->pending_pkts);
>>> -            /* Release the reference got from mhi_queue() */
>>> -            pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>>> -            pm_runtime_put(mhi_cntrl->cntrl_dev);
>>> -        }
>>>             if (!buf_info->pre_mapped)
>>>               mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index 
>>> b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct 
>>> mhi_controller *mhi_cntrl)
>>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>>           ret = -EIO;
>>> +        read_unlock_bh(&mhi_cntrl->pm_lock);
>>>           goto error_mission_mode;
>>>       }
>>>   @@ -459,11 +460,9 @@ static int 
>>> mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>>        */
>>>       mhi_create_devices(mhi_cntrl);
>>>   -    read_lock_bh(&mhi_cntrl->pm_lock);
>>>     error_mission_mode:
>>> -    mhi_cntrl->wake_put(mhi_cntrl, false);
>>> -    read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +    mhi_device_put(mhi_cntrl->mhi_dev);
>>>         return ret;
>>>   }
>>> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct 
>>> mhi_controller *mhi_cntrl)
>>>           read_unlock_bh(&mhi_cntrl->pm_lock);
>>>           return -EIO;
>>>       }
>>> +    read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +
>>> +    pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
>>> +    read_lock_bh(&mhi_cntrl->pm_lock);
>>>       mhi_cntrl->wake_get(mhi_cntrl, true);
>>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>>> -        mhi_trigger_resume(mhi_cntrl);
>>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>>         ret = wait_event_timeout(mhi_cntrl->state_event,
>>> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller 
>>> *mhi_cntrl)
>>>                    msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>>         if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>> -        read_lock_bh(&mhi_cntrl->pm_lock);
>>> -        mhi_cntrl->wake_put(mhi_cntrl, false);
>>> -        read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +        mhi_device_put(mhi_cntrl->mhi_dev);
>>>           return -EIO;
>>>       }
>>>   @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device 
>>> *mhi_dev)
>>>         mhi_dev->dev_wake--;
>>>       read_lock_bh(&mhi_cntrl->pm_lock);
>>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>>> -        mhi_trigger_resume(mhi_cntrl);
>>>         mhi_cntrl->wake_put(mhi_cntrl, false);
>>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>>   }
>>>   EXPORT_SYMBOL_GPL(mhi_device_put);
>>>
>>
> 


