Return-Path: <linux-arm-msm+bounces-84031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE093C9A170
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 06:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 062474E2E1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 05:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E4E2F691C;
	Tue,  2 Dec 2025 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1vmKpx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNdpTSNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C02F6562
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764653202; cv=none; b=L2dGfswy0zHPoUGfCAEv0F3Lyy3kq5dxfP8/+EAHAIINjkCjbDZyqqjbef4ty1T9FM4cz5mZG/BOq6ECa58MmdYYh/8GcLzt5Fowt4wilv1uOdJ5sPxhS/slQLxPyp0ACgNrcO06IGnok1gKZ8CYB1KAeQ9PDAt1HUHKjFxG8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764653202; c=relaxed/simple;
	bh=oTC54xyF8rd1shmBm7FfKdLNddDtIdaHGpRC6RXOj00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKiiuPzqwA9hSSDmjBL223rVz7oXXaO8ooDzyclCYy0JN2yGxKeXs959NYZqsCy389ppQxxSQk3rNhwvfCyH9a8/HrFptFZJGCo9vl4CxOQGcZyJytIunHpdNbeU1GZMgW5OBcT7xR13QmlSMAISPvPE8c2inLzJ8KvTMVaiuKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1vmKpx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNdpTSNq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KX9KD1146923
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=; b=T1vmKpx1qt28b7mS
	q1DPM1OTWbvoA0mFF6oGC3Xg/GjbhjTfOhdAOltrK8o2loaxLFhO7ossFlW99Biy
	CEzLwMz1FQ9dWks4nR2+AXt+81641ANw22RQjpLbXxAsBMuDksvcELOebkDLucis
	L/NSFgCdVAs5eA3sBTuIV0Uhlm9NdcBfxMt6JU0UPFXf9KUkcOQ4UpjaYB5QkX/V
	HYcbC5vK0+zunpJXxvJXbwUm1oQHItVDe3ZqVbYEwJRLk+S74E5+drk7m+swgh/J
	lPo19hwtfME66VHZg1GjtrNFk2564U79IXosavvXGoUW5ukFgjUtOPMafAL+eN2L
	2ks14w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5e9a91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 05:26:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso3299975a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 21:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764653198; x=1765257998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
        b=HNdpTSNqxcqaEj/t9vKm43dT5Lrifuo85ngUWEirbdANoGFpGGg1dkj/UQd0MfunSg
         rAtbKMW4PnKCAlUL0p0xVekciBFMNQBAPhGkY0arXZ8eqk5PzE+cErFrGLbhyjkD4eK8
         gNw/bd1cgKmj9yyYG9ge/2vtza4I5Eb2ig1wTyHh3EXJPCDlHvgeo6SnRVeEFT5R0NN7
         Lx+YRsyz61UmWVuv3HWvtcalMKpADUU+TM1t+R3D6mU5G8kIMvXvQIfhKUDzn5rAbT4Y
         WqKojdI9rE38uDPu3aFPC7Xb3K8PSf/B1nQoJ/yhWZNjszeyxgfRKgUOGiyc5oN5Qm6A
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764653198; x=1765257998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXH+FolYz1c3U/F3aqD1ELuv0/0CjC4u/zLs1ktTN6g=;
        b=vzQmmdoLHymLGMp/w9QLAM6MMQszs22wkaH82G3p3T+harMZNAcXbx3QNqFuSsRWCm
         5QVwymzQ39nZf2gq2rQCNbo9eKIafaRU9dslr8US0Jp/Rh87KaZY9Fqai2IFqLzCXy++
         APJi6QIv90561tgyJOWXARKw7m102SZG+V6WuHltG+zKg3IO8CVsZP4TnLSeWkXm8d/u
         fDm916qKQn8pHlrZTBgpx9gy2AZqNdzLy9rbmaT0/GVdchpkLh4hN0ATEewXOUum9/Mp
         1azAmZkAV17JhqJepRerozC5oDkbYt3D54j3YkgMmMZH/VBAtDvHQ/m2xGMFHB1xE1tC
         nHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcarDWsgNZ+e15cQxCHn4jqTfCwsOPiPW07dF9B/k58t0xYa/0DzYm3yzeLNZDaF+mlQDPzuglbHE9nqhm@vger.kernel.org
X-Gm-Message-State: AOJu0YxS1N6awlIywsTJO/mvg05Di304KWEAG5bN5C7vnZTwHXyvXTv4
	awKHUDdft+CglN9h2hi7j6ulG8h68M5Q663mpumj0kCnsI0rdi3e0D0QKDgnBFklvwpyYGUUSHb
	NPKth7iNy0a+8KQzX6bWRCajMDTDmCtZ83qFIimoEdU8xz9iUI9bla8DgA1J9Qw/KC+lb
X-Gm-Gg: ASbGncvtymzmX0UawuFZQR+whGkHlIyrSiuUg+/QWm4lOQQKK9Ezbl6UzrsPe1VsM8J
	VgBfHOp/jMuWv1zBYNm+BL1Qiu5xqj716nzr+9bI1fsMPlR5dPrtOKMw3FtZSVMFXGvxqfNlhwQ
	0Lzd3Dk1+FrmMFSHWUNqN+RRES8mmyFoDNndxlpKBUv1VVoHoVpMS7EstyQLkd/YJ3WoVFwr02E
	QAdcTzl/KOFEEOiOV9tfCjSFfsLU6ADUBDMYhWImhIpL5kt/ddJq0FVFoYU49ctwd4rcnKIX25c
	UfcN7hDMXJmZ4PN3iOptwFmk9LREn9TknefmMxGPtwGOhFOoGQ54TGerqVeJ+jEZNp3/cPsU7IJ
	IKy6eFbZggpS0cl3Z421479ua4tRo077CVl/RzdC6zg==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-363e8d51e4amr1374001637.27.1764653198310;
        Mon, 01 Dec 2025 21:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAWZ7n/BoRt2V1SlXWIuloIGJYsPZ36/Zx7AX6eT+utP2djOCYvtjHBuiLBctSYyTFSDkcpQ==
X-Received: by 2002:a05:6a21:99a2:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-363e8d51e4amr1373981637.27.1764653197778;
        Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be508a1142esm13403683a12.19.2025.12.01.21.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 21:26:37 -0800 (PST)
Message-ID: <8872ac78-38de-4b1d-a0f5-9f171cc9f42c@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:56:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Mayank Rana <mayank.rana@oss.qualcomm.com>,
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rjiz1SHfHg-x6xCepKxV3LGr0Ba-D4gC
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692e788f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gkVCCi9o0YoM2wVKOhMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0MSBTYWx0ZWRfXy6/hiTnLW8XO
 WMHvWoK8Y3TJVqQYqN/m+G4ajxkXhxtxLY1U1jDw5R7whwGAFE72drB7p+WfcTduPeWwvRmO2PH
 E3D3SV+w5Xq3NqoYjcy/CRgszbelP+0vo+cDqXM86iiy3FCZcGVuxcDdmduu71iLI0SFnLpS1uR
 1v737Zf567x5IC2VxdpoRgFhlEQJ+smHph44sQPdR6w5ZMLmQaiYRMtgQlVrUnRplPe4KuC46dk
 LtHbYKhU3G7EzqRaX6RSqkfmwEeX1SxNpfjYjrXuUF6Clbny8IdhnJbiodYp9IW7aio6jCnSh3e
 X8Phk8K1H9uLX4DPdKwDmRfwGFqtqGtB021qQ6Pm8/sCXxxpSF2FASB82HE97CSRSTsxUxAcW2t
 dKCQEj9GCKpAsvE8T6wi4ddGh1dwJw==
X-Proofpoint-ORIG-GUID: rjiz1SHfHg-x6xCepKxV3LGr0Ba-D4gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020041



On 12/2/2025 12:03 AM, Mayank Rana wrote:
> Hi Krishna
>
> On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
>> The current MHI runtime PM design is flawed, as the MHI core attempts to
>> manage power references internally via mhi_queue() and related paths.
>> This is problematic because the controller drivers do not have the
>> knowledge of the client PM status due to the broken PM topology. So when
>> they runtime suspend the controller, the client drivers could no longer
>> function.
>>
>> To address this, in the new design, the client drivers reports their own
>> runtime PM status now and the PM framework makes sure that the parent
>> (controller driver) and other components up in the chain remain active.
>> This leverages the standard parent-child PM relationship.
>>
>> Since MHI creates a mhi_dev device without an associated driver, we
>> explicitly enable runtime PM on it and mark it with
>> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
>> exist for this device. This is only needed for MHI controller, since
>> the controller driver uses the bus device just like PCI device.
>>
>> Also Update the MHI core to explicitly manage runtime PM references in
>> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
>> does not enter suspend while a client device is active.
> Why does this needed here ?
> Isn't it MHI client driver take care of allowing suspend ?
> Do you think we should remove mhi_device_get_sync() and 
> mhi_device_put() API interfaces as well ? And let controller/client 
> driver takes care of calling get/sync directly ?
These API's not only  do runtime_get & put but as also do wake_get & 
wake_put which make sure endpoint also doesn't go M1 state.
>
> How are you handling cases for M0 and M3 suspend ?
> Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
> (pm_runtime_put) ?
M3 are controlled by the controller driver, they usually do it as part 
of their runtime suspend
and M0 as part of runtime resume.
once the mhi driver gives pm_runtime_put() then only controller can go 
keep MHI in M3.
So we can't tie MHI states pm_runtime_get/put.

- Krishna Chaitanya.
>
> Regards,
> Mayank
>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/internal.h |  6 +++---
>>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>>   3 files changed, 15 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/internal.h 
>> b/drivers/bus/mhi/host/internal.h
>> index 
>> 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 
>> 100644
>> --- a/drivers/bus/mhi/host/internal.h
>> +++ b/drivers/bus/mhi/host/internal.h
>> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct 
>> mhi_controller *mhi_cntrl)
>>   static inline void mhi_trigger_resume(struct mhi_controller 
>> *mhi_cntrl)
>>   {
>>       pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>> +    pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
>> + pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     /* Register access methods */
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index 
>> 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 
>> 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller 
>> *mhi_cntrl)
>>           if (ret)
>>               put_device(&mhi_dev->dev);
>>       }
>> + pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
>> + devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>>   }
>>     irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct 
>> mhi_controller *mhi_cntrl,
>>               /* notify client */
>>               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>   -            if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +            if (mhi_chan->dir == DMA_TO_DEVICE)
>>                   atomic_dec(&mhi_cntrl->pending_pkts);
>> -                /* Release the reference got from mhi_queue() */
>> - pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -                pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -            }
>>                 /*
>>                * Recycle the buffer if buffer is pre-allocated,
>> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>         read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>>   -    /* Packet is queued, take a usage ref to exit M3 if necessary
>> -     * for host->device buffer, balanced put is done on buffer 
>> completion
>> -     * for device->host buffer, balanced put is after ringing the DB
>> -     */
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>> -
>>       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>       mhi_cntrl->wake_toggle(mhi_cntrl);
>>   @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device 
>> *mhi_dev, struct mhi_buf_info *buf_info,
>>       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>   -    if (dir == DMA_FROM_DEVICE) {
>> -        pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -        pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -    }
>> -
>>       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>         return ret;
>> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>       ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>>       if (ret)
>>           return ret;
>> -    pm_runtime_get(mhi_cntrl->cntrl_dev);
>>         reinit_completion(&mhi_chan->completion);
>>       ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
>> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct 
>> mhi_controller *mhi_cntrl,
>>         trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, 
>> TPS("Updated"));
>>   exit_channel_update:
>> -    pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -    pm_runtime_put(mhi_cntrl->cntrl_dev);
>>       mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct 
>> mhi_controller *mhi_cntrl,
>>       while (tre_ring->rp != tre_ring->wp) {
>>           struct mhi_buf_info *buf_info = buf_ring->rp;
>>   -        if (mhi_chan->dir == DMA_TO_DEVICE) {
>> +        if (mhi_chan->dir == DMA_TO_DEVICE)
>>               atomic_dec(&mhi_cntrl->pending_pkts);
>> -            /* Release the reference got from mhi_queue() */
>> -            pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
>> -            pm_runtime_put(mhi_cntrl->cntrl_dev);
>> -        }
>>             if (!buf_info->pre_mapped)
>>               mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 
>> b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 
>> 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct 
>> mhi_controller *mhi_cntrl)
>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>           ret = -EIO;
>> +        read_unlock_bh(&mhi_cntrl->pm_lock);
>>           goto error_mission_mode;
>>       }
>>   @@ -459,11 +460,9 @@ static int 
>> mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>>        */
>>       mhi_create_devices(mhi_cntrl);
>>   -    read_lock_bh(&mhi_cntrl->pm_lock);
>>     error_mission_mode:
>> -    mhi_cntrl->wake_put(mhi_cntrl, false);
>> -    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    mhi_device_put(mhi_cntrl->mhi_dev);
>>         return ret;
>>   }
>> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct 
>> mhi_controller *mhi_cntrl)
>>           read_unlock_bh(&mhi_cntrl->pm_lock);
>>           return -EIO;
>>       }
>> +    read_unlock_bh(&mhi_cntrl->pm_lock);
>> +
>> +    pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
>> +    read_lock_bh(&mhi_cntrl->pm_lock);
>>       mhi_cntrl->wake_get(mhi_cntrl, true);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>>         ret = wait_event_timeout(mhi_cntrl->state_event,
>> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller 
>> *mhi_cntrl)
>>                    msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>         if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>> -        read_lock_bh(&mhi_cntrl->pm_lock);
>> -        mhi_cntrl->wake_put(mhi_cntrl, false);
>> -        read_unlock_bh(&mhi_cntrl->pm_lock);
>> +        mhi_device_put(mhi_cntrl->mhi_dev);
>>           return -EIO;
>>       }
>>   @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device 
>> *mhi_dev)
>>         mhi_dev->dev_wake--;
>>       read_lock_bh(&mhi_cntrl->pm_lock);
>> -    if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> -        mhi_trigger_resume(mhi_cntrl);
>>         mhi_cntrl->wake_put(mhi_cntrl, false);
>>       read_unlock_bh(&mhi_cntrl->pm_lock);
>> +    pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_device_put);
>>
>


