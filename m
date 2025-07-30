Return-Path: <linux-arm-msm+bounces-67196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746AB167A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 22:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD744E3A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCD021CC5D;
	Wed, 30 Jul 2025 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCqu0Mr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D61FBCAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907580; cv=none; b=trQuvtP4pvszrBZjpu61DF52xNB5hwrEh3gw6jZFkk8XSp/3bVnNvVLbx4m/msjjOR9/bwDNVJ92LTwc7dO5Kws32nhNyaKfGYKZdipPCd5pRAYBDYG+cwdaaz5vELB02eViYF9TI1dsgqgsqEx6CKbL35H+4PvDq5+HN/W9TR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907580; c=relaxed/simple;
	bh=uvt9rrj1TfF+mFhxIuv74KF8VgsvkHhZWRdK7kDoaas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1NJAtdSiLDvMImAcu5dgB8SAaH0MmVq/Ywni3QgrRIYfFjrS+PVy0aq8XoHd6uT5n3rjMte9cefkSjMKk24WZy2Sx1aPgXuXqh3hAP21eDERzfFR7C564k2Snb8J07CUVbM8owrQzryGd3zIhALB0dXXBsm/WIkBB/fonNj+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCqu0Mr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbE3B013012
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmZ13PavdbM+7K9N+GS2cQ75CPBXi6rmaEREINxw3kc=; b=gCqu0Mr7cewK04W3
	8Dnm3tg5cqm6HpMyiJMHz0DunSW/tU/aMfDr86ZneUpg3zt6GR/hz2Vq7z5amnVH
	c/PUlxAbLn6EaSNh+lhU+rUbRYkmNjReA5UWvo51OGQOYtB7uxMH6PyKw/GefuZI
	vz9UhPImWFkH+IeV8hNFkdK+qPElZBJMFOJS/tnsbLwcAjBfwrHvjiAhT0+5sXHI
	K0ceugQ/Pq0wjHBlSIryi37xYvZAaF3oqgpkw6uD8DKjlgZg7vSJkjLV9kJF/6uT
	yh9BQVAMVk7y2mqXNEfGLMjy/Q661zl/PlL0z4Ed98hZ/UMAbEDCLWUwWHiR0rg7
	7mpTGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2n5bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 20:32:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33e133f42so6889785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753907575; x=1754512375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmZ13PavdbM+7K9N+GS2cQ75CPBXi6rmaEREINxw3kc=;
        b=v+oSc9os1NXRoCk+ii8/pmatw8vDYv9HHDZkBX55AgDJ+LPo2L/mQ7mhhkU71NGc0U
         MTHG3xcgNhbbZvQ3Zah6tCVHHxuX6bqRunSoSXn7FAnv/PPods3HQQ+DjZF5bpbfWKdM
         nb0oB+KgE0D1RH1WwOvWO5Xkt4kV/JMvOVKmbXiyeo3ptuMjkl5weEhjCaI0JTI3vO/l
         E4t5uBFE2MyfOruRZBqKpLxTBbOoWOSpln1ptdZtBy4m2CHTQwUH6wKOa3CvwDfN8f9n
         8tLvNTIkGzPD9sW7lrG0hwgYbnowB45homqTbQB/3BzcgfcxkWHQndxRzbThcoIsOBpy
         sE4w==
X-Forwarded-Encrypted: i=1; AJvYcCWhomajFUJFWGRiykfqpqVhqeQD18FkjlrT0kQzbGldiHYZq6JGlKwkPOYbZNo/X2dlDIp0LHuEzIz6y6ss@vger.kernel.org
X-Gm-Message-State: AOJu0YzHnFDiiplijw23Yr7Yff9VFYdWor7J/Spzf+hyP8J5Fg+vHziA
	OW31jixPn4Sh79EBjytOZpNfMdScS+hZLNq2F2NIItfL+fRbodQM+hMoDX9znGEQY8eGx9Q+MdK
	7sg78/rjfmkDyl8L1uaVfQXPkWpI8JegcZdmm5YIXSYcXCntvmDOz2oGsWTCAmWWPSJoq
X-Gm-Gg: ASbGnct6TitZXDANj74/1J4k2EGaQ3UHjZbCdaHnyTued+zJznLwF9c4B9Z8gdiFnic
	gihUV8YgIWhf/kNFG5t4GcrybNeJIRbozzkBZ7hrBw2fkQEEM4jqfTbc2wdwPuwPKagg5AKxR8m
	XQQvfHdTgFNL3WYesn6AGPCgm/qVNQl6qwpcPaB1f7GuasgG6ZV88NKWRFa4ax7/AIAHmUrP+UM
	O331xwA/8Z6N6VZr4n/xKpsFCo5YWwj89vhBQO0EGaPF6pi2kAU3Xb9b1whJnSFKN9sYT1gWRA+
	3JLLpvJ6L177i8NRWODed6tEidS0awySonezRlo3BK/O8KdxyGEOmKSr9E0gVwzJ7QxR8hN2A9c
	7GzDFr4TEl6h+Y2iuEA==
X-Received: by 2002:a05:620a:459f:b0:7e4:ca52:8ea1 with SMTP id af79cd13be357-7e66f376042mr320612585a.13.1753907575398;
        Wed, 30 Jul 2025 13:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSLNdW1IN7xY3Gba+7rda4ucNErpcsxk9NFfI63KFRacCoTX/l3Blyf4LmiJlM2wEwGkHBrw==
X-Received: by 2002:a05:620a:459f:b0:7e4:ca52:8ea1 with SMTP id af79cd13be357-7e66f376042mr320611085a.13.1753907574863;
        Wed, 30 Jul 2025 13:32:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff8f4sm48682a12.11.2025.07.30.13.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 13:32:53 -0700 (PDT)
Message-ID: <9efafa16-e6db-4227-9b47-5803f5933a7d@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 22:32:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: aliceryhl@google.com, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, ebiggers@google.com,
        ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org,
        sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn,
        viro@zeniv.linux.org.uk
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com>
 <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
 <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eYi98E6XYTowQdZ7hTao2UT1RQ_IsIOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE1MCBTYWx0ZWRfXz405nb7EQ7ur
 pX+BHo5AcaNmaSIh2mmi+D8wHEhzhez5eFsIzdnTqO1uc6ML952NECJqXNVKg7H/Gx/xEq9Wgnf
 li1I6b9WGg/bTzTBYs87ni7VjiyzasExktaFclkbjv87AybbS3pyKyMB+COblu6IUMK+Z0akj7K
 FG2Av6CT0TaXd+gR6gnFNVeILHlGZH0z5rN/pMdXxLJDHBBWjLud44AT9ZW0KktIWYQgYOhufIa
 UhtJT+kVtoGpTzXmkE6W6waMjPKn3r5AAIfPHAryj5wRuATMLucs6yTPlGpJyujb8rc+GV/35Z0
 mzFu8TRxeyWydF4ZwOO2k3LIYLm0f0ZM8hnD/DdoeLrKBIbdA632yFh1kg0UGo04FmvNBzPhasL
 MsN73cidIL6QeaQNGctqRDa1d9RWbGIzlgIq51ybP9HQp2gPepI/JT3S3MBUEazaCv3NjXGL
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688a8178 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UX9tP_KbSWm2z_bZeVQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eYi98E6XYTowQdZ7hTao2UT1RQ_IsIOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300150

On 7/30/25 5:29 PM, Pengyu Luo wrote:
> On Wed, Jul 30, 2025 at 8:53 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/6/25 5:43 AM, Pengyu Luo wrote:
>>> On Sat, Jun 28, 2025 at 3:48 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 6/17/25 11:29 AM, Pengyu Luo wrote:
>>>>> The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
>>>>> also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providing
>>>>> the unlocked device and early development work. This patch adds an
>>>>> initial device tree to enable basic functionality.
>>>>>
>>>>> Currently supported components include:
>>>>> - Bluetooth & Wi-Fi (board file regeneration required)
>>>>> - Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-glink
>>>>> - Flash LEDs (front and rear)
>>>>> - Hall sensor (lid detection)
>>>>> - Keyboard (via Bluetooth or USB)
>>>>> - NVMe SSD
>>>>> - Power and volume keys
>>>>> - Simple-framebuffer
>>>>> - Sound (playback and capture; top-left DMIC only, top-right works only
>>>>>   on Windows)
>>>>> - Touchscreen and stylus (requires GPI DMA support [1] and stylus support [2])
>>>>> - USB Type-C ports
>>>>>
>>>>> The following components are currently non-functional:
>>>>> - Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames in libcamera;
>>>>>   partial driver can be found on LKML archives)
>>>>> - DSI display (blank screen with `dsi_err_worker: status=4`; primary DSI register
>>>>>   dump included below)
>>>>> - Stylus wireless charger (CPS4035)
>>>>> - UCSI over GLINK
>>>>>
>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com
>>>>> [2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitltlatltl@gmail.com
>>>>>
>>>>> Note: This series does **not** include any confidential material. Those
>>>>> who wish to run Linux on this device should contact Ntmer, as the
>>>>> bootloader is locked via secure boot.
>>>>>
>>>>> Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
>>>>> Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>
>>>>> dsi_ctrl, reg = <0 0x0ae94000 0 0x400>;
>>>>> 0xae94000 20050001 000001f3 0000000b dddd1011
>>>>
>>>> This is not something we want in the commit log
>>>>
>>>
>>> I will remove it. I need help, then I attached it, two of my sc8280xp
>>> devices require dsi to work. Reversing and guessing wasted a lot of
>>> time. I will appreciate it if qcom could support it.
>>
>> There should be nothing interesting compared to what's on SM8350 when it
>> comes to DSI on 8280.
>>
>> I would assume something's wrong with how your panel is being set up.
> 
> Just to mention it. According to some public sources, the Adreno 1095 DPU
> is included in the sm8350, while the Adreno 1199 DPU is included in the
> sc8280xp, they are slightly different. Here is a quick comparison
> 
>                    dpu_version     dsi_version     dsi_phy_version
> Adreno 1095 DPU:     7.0            2.5.0           4.2
> Adreno 1199 DPU:     8.0            2.5.1           4.2

Patchlevel/step versions are usually not supposed to break any software
interfaces, so I'd be *really* surprised if this is the case

DPU is rather different (the one on 8280 is way larger than 8350's), but
ultimately they're built of the same bricks

> 
> The panel setup has been tweaked and tested countless times, I really don't
> think I screwed it up. I had already brought up a lcd video panel with dual
> dsi and dual dsc on the sm8650. On the sc8280xp, I’ve worked with two
> different panels:
> 
> - One LCD video panel with dual DSI and dual DSC
> - One OLED video panel with dual DSI only
> 
> Both fail to display anything and complain about DSI FIFO errors
> (dsi_err_worker: status=4). Someone also encountered a similar issue on
> the SC8180X([1]), another WoA platform.
> 
> Anyway, I had quit. This doesn’t bother me anymore. Just mentioning the
> info for reference.

Sad to see you go.

If you still want to, I saw a fix for a sneaky bug earlier today on
LKML that may actually be related to your issue, given you seem to
have a really high res panel..

https://lore.kernel.org/linux-arm-msm/20250730123938.1038640-1-quic_amakhija@quicinc.com/

Konrad

