Return-Path: <linux-arm-msm+bounces-85806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08286CCF3C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05E95300CE05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F782E8DEA;
	Fri, 19 Dec 2025 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBvM2Wno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROSvi3ed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1042DAFDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138209; cv=none; b=V+ehJrbL3q6odJuwGfQw13cSPSuIU9mNPiPxNdVcazms6YnbtXB4hWBmvg9QmLgMdsY7flXmhJlV3jNfqNmbuuP/PtAJLEZMYxNLQgmV3n8Jn1+GgDu+J3KKCDmmd0BQ1ubpVvjdYa5orGKFc3pqE4I1t20pStcvvYxS/JNPoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138209; c=relaxed/simple;
	bh=Ch5vWbJXT0wvLq1bmYQqIQOK+E4BgmbMDjNOWeVfoyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAfnDwnMkbI7MzpDJu3+rHs8TWVOv/VqjOXlXQjP/zgRqaUGFFtfydrKgjEcjUOYDu8PfiIm8ahdxOMK4mNerh6Q3aKLOm/xoVo69p6LmJyf87HSuPx7R6AnGpWGL87IMe6nvBs7S2KmwNmQxs6zt/cEWHTgN1/IBbgUYQwRAOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBvM2Wno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROSvi3ed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4bxmh4153900
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=; b=mBvM2WnoXkzYN/kC
	SJGG65cEd1jX1y37nhMNwPXoYap3kWJQ87NpviuiG/9EpW6RY1R2+65CQo0TacQK
	sg5g261EgUkzpSZNRyIQ5Tbq94grrpgA54RJf6dw7RiPrt9VvtizQFAgaUOcEl8M
	GWgnCmPqSj0yr1tNRU87wP08XWkpyiLLJXDEohVRQEIe6jqZ3UEAy9xpKoaXIU/+
	ForMEEIzdxlOZtKRPSjpS3PmCX2Ly5oARuhQGWCswtUnUjrxx7VjBJaXw4Eu3pbN
	YXSBkcSKxsz957JQmEVhedqMLHHF9ABw3MrRhNod1hp64Yv1Ut2wd6spRjrh8MHF
	YF2vfA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct7t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:56:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so36267456d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138205; x=1766743005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
        b=ROSvi3edJ4rykkUf2LoBD8lxPwHxuuyJnPQWqhRybjnPwdDRS0gQsjo16EezmIyT/2
         G+ZcaOnh38Q+2AOih1lnsaeLEmPIY1/Cf1SyhTSTYhZEdUV+MCc2FOlSntRjea13jvjS
         Y4TEu1TylR9gD/0OHPSS4+n4yGHdMq7CfwN7KiPLlB6f82/u1pzgJC4K4CVFyjyOZjF4
         FPvkc8Brrt5WYjQEdiYqvnUCr/rdo2VoTLMSRKaVd4mmUoI507gAY666/Wn+4+JKOfD0
         Us4dhQh8Jd65ewW03qYupwFP2qOFd74UeyIE7JoKgpyuJb0qcr6N7EsKEkjmqtASaEEf
         35jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138205; x=1766743005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2n+SE5qOjIgQy6DMMGVLWGLkjFAmY3VbtNAYsRbVQs=;
        b=caeokRttcWfcvrrGCglK6Pc51aD5G7J806O4UUtrLFHZ5P04FDqQjPVPMJkF74UHrj
         pCUkEQFlOKgfhpmSY/Y2KUOxSqEEw6wUdbj+HPtMPzYToORbN4PY68CoqU6bgZx4fpI/
         0KeU1IM6a2yis8ZcRXytHu1sf2WqHbKEqLONCU6CWHAzPDWqBV4rsXI1ui9zcRBPlyyd
         nhUqlw66lqydldguviaVB24Ut4pQM06u8DBcHwvy49Ix6E1gzBAgZd3Cnu4dJ8ZH/QQZ
         YRauEt1vElnLuHVg7kKjwJxZnOHtTYJDh/8YCLGzEbTF/JUA8VQPzxugAlXsQKaUqyGv
         o7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHBv5vRWJS1I1APRS526Sgn7k9Q2GBqiyeQri6rLkbCX/4+T1hT3/HRSn2MtIBxNRQO/fqrHCLhfBPTApd@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcNj//CxF3ai0d9vUwkXJ0y0fY9CYLsBuhaCI/r2f90Oia/zD
	b7SaYFKtP4q27aJoLLiiKCfUB2DOID0G/BQIkNFG3/2PYxqaFjHDnUJx/uWlyzlbWBQ981auHfM
	0PMWoFDFWlhE0Tvi3NjOhPw4UOlTSfmcdZauD9xy+sJzZoRZ6028mgul+mjvlR5a3GbLg
X-Gm-Gg: AY/fxX6EtQmoIh3MGbr5nYYSbOm+6zDURaPZTTc1yjSSvj8dedr41TUHMfl+TuhK9ou
	sS+Lz4dQz5b57zhSTYkQhcNH4uIW8JAyaA9Zk+huF3B5pXAh9T6pNswS3ewOQQB0Cr9fz0SgeYJ
	DAsQS36kOREWNS5n0ahvuIcgQpMiRdfTZ18sW+bAamLPg4AV9++ue1/OgKNhYogx7NDfE6RTbFX
	OhBG4rqugTrrlG8tBjhXshTH3pQwIqT6Tz5j0BaBFHhwNUA0FAHNKXRf8riKilQ/1/Ds78HTt1i
	EiXykLWeQpvxZ3MjVTLCIHnaQe23mWPbj1GpquFWcX//xffKmCN/Rf7lbc1aS92eo5L5/hk0oeM
	RtX8bmEImeGM7R60oNdnPDd2iSqnUUU0cS009Ki8u6TeyspuuamnoRaU5otkwJ457zxQY
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id 6a1803df08f44-88d833b580bmr40114746d6.45.1766138205418;
        Fri, 19 Dec 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmL/9SGkWyvSpj/ayO4oxzYHHhXmjwsfj/l32rWMsHt4VSUg1NRyyPchBsCrruiDNCaZinHA==
X-Received: by 2002:a05:6214:1c4a:b0:880:4ed1:ce32 with SMTP id 6a1803df08f44-88d833b580bmr40114456d6.45.1766138204950;
        Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi. [82.128.196.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186f957asm542852e87.28.2025.12.19.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:56:44 -0800 (PST)
Message-ID: <a0acccc3-00d9-4235-9b4a-f4498b2896ac@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
 <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
 <20251219-honest-slim-crab-02e932@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251219-honest-slim-crab-02e932@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vYY80o7NIquZiYjzxgrPRMME49Y0x0Ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MSBTYWx0ZWRfXwOQ9AP00+4cR
 2+EcOTovMaBrwTtl/BxjpmF2myOTCha1RnrBVlmz4ak2hFvYChCF6C8S1rl/1V9z6uR5Fr5ESZ3
 XEQxDmjS989jiuhrwLmlnyHXbqCJo3Xr45xKu66TQwTldzDc/dK3jW14B23Za5f3RponJRsC3+c
 YI8ahQ97mmyCswNU21wHAcqPuKYLKJtqVgEju1UCPyG14sKqDfnPvF+7PcerWx76arU+ulAXg7x
 9XSBLLojlN4lTbj1Y2tI5SC6QR/gLGrJwcJZrLAbCRQIcv53LZc0mee4cfrz41E/QNNd/lVVcdA
 EhfIbyOK8WR3u4LocJLJiD0khvdv9mn55rAL6F4/lv1ep+e8x71idd95ldOI4o68vVFfqxk7eX8
 A38CSd3ho2K1JbYRRcAk4fVQuOxWClpbUikTYBIFSruVPPraX+NKbnNlnOjmJQpohVlUtkS/W2I
 uQir7IjtQO+Q5wlA5pg==
X-Proofpoint-ORIG-GUID: vYY80o7NIquZiYjzxgrPRMME49Y0x0Ds
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=6945215e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wWkPZpA8QBIs0yCpxSwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190081

On 19/12/2025 11:54, Maxime Ripard wrote:
> On Sat, Dec 06, 2025 at 01:28:14PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
>>> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
>>>>> So it's not really impossible, you just need some hardware and a day's
>>>>> worth of work.
>>>>>
>>>>> There's no reason these should get a pass, it's breaking the spec for no
>>>>> reason.
>>>>>
>>>>>>> For SPD, It's really not clear to me why atomic_check should do that in
>>>>>>> the first place. Your initial concern was about exposing infoframes in
>>>>>>> debugfs that wouldn't be used by the driver.
>>>>>>>
>>>>>>> If the driver doesn't register a debugfs file for SPD, and ignores
>>>>>>> whatever is in the atomic state, what's should we force drivers to do
>>>>>>> that?
>>>>>>
>>>>>> I really don't think that drivers should mess up with debugfs on their
>>>>>> own. Making atomic_check() disable the unsupported InfoFrames makes the
>>>>>> picture perfect: the DRM no longer tries to program them to the
>>>>>> hardware, DebugFS files stay empty, so the whole state becomes
>>>>>> consistent.
>>>>>
>>>>> In the "bridge has no access to infoframes" case, there's really no
>>>>> infoframe. An empty file is "the infoframe can be there but isn't used",
>>>>> not "we don't have access to it and can't report them". Only drivers
>>>>> have those infos.
>>>>>
>>>>> If we do split up write_infoframe into multiple functions though, I
>>>>> guess we could create the debugfs file only if the function pointer is
>>>>> set, which removes drivers' involvement if you don't like that.
>>>>
>>>> I'm fine with not using HDMI connector framework for lt9611uxc.
>>>> Likewise, I think, it's fine to have empty files for the infoframes
>>>> which are not being sent over the wire for any reason (hw not supporting
>>>> it is one of the reasons).
>>>
>>> I can't think of any other example in the kernel where an empty file
>>> means that the driver doesn't support something.
>>
>> Okay. So we need to sort out implementing the split write_infoframes in
>> drm_bridge_connector. Any suggestions there? I'm asking, because I don't
>> want to end up exploding it.
> 
> I guess it's only really a problem if we want to make it const, but we
> don't have to? We could just as well allocate the structure directly at
> probe with a drmm helper and fill it as we need to.


Yes, I wanted to keep it const, as we usually do for all function 
tables. I will use drmm_alloc for it.


-- 
With best wishes
Dmitry

