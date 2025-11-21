Return-Path: <linux-arm-msm+bounces-82824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA0C78D2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE4784F0C81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DF034D3A4;
	Fri, 21 Nov 2025 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1C9tBvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118134D3AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724485; cv=none; b=nwaCDzeEkDiSk+XmgQjZZ34ZtL73voJJTOhmfigy2B+ngNDz9wuOQbLU2l05JC2qnKdp8RPFLXDz0LhFtteaQ722CnabKb92B/DAqmZPkRyDsQ4xG5jn93StT24Nw/WNgjQoEU8Zg02S5JqVfplCyhA18WQGFU31PZENUkp8f8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724485; c=relaxed/simple;
	bh=6k4OylsmN4qVHT1GrAf8kQxewQyget+SmApZA+xjQNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AiLQHfVpf/gfS8LRj5NV0LpaM5tX/nhXu4TiW0/HBPTGSH16PdGC+0OOd9xrLJFjkOvjSDU7mgaVdrXKFLEE1zzBVdPRiPsoUMRAMfDNqaDlPIJlcnju4w+KuofICZwXcLaLuB2MmIduIBKqTSaiaknVpZlpFXAKH6RJGLcQlrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z1C9tBvC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1008954f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763724480; x=1764329280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPTNdD/V1t/7tPVXOMB+qcETjJ0avA8VN0ZMOhNtAlM=;
        b=Z1C9tBvC/zrfwWehK/+lLNZqE1x7vSx+c6088HTpVjp0cOCzvZS6plPH6u0HvDXb5/
         oynsg+ARZgqiR/VMbrB8EfF3pqVsKRBoGJzBrLI8/Rz0LC7Bj6Fa7gu/w6mCRbZYODK8
         DjvTVPSXUTuOCgGXf505rqw5p03zyBvSiuY5WEEED4A1wV9/6SL17aTLClECUtGBdPeU
         ANL0gCaqA6PljCbFAd0SAZfvXEM+nZkKNtwGrpkJp5tEcSjOuukTfQ4LtwWyTgHibhCY
         CGbdxc5rr0fGyyScBhfMHD7zJRUsp+NtSZB2ekCidf1n+IQT72rd3uaI7Csw1JSCZL/F
         Sbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724480; x=1764329280;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPTNdD/V1t/7tPVXOMB+qcETjJ0avA8VN0ZMOhNtAlM=;
        b=poI+0JiFtYy1+bexUFTT2eFBW81ODkdpByYeSNIkuMD5J2GjxJxX4SJuxr7fegpgm5
         FlVv3ja8MJYOsg1Zi4Oa0mm/asQU2XpKJzt+pWjDdsn065t2Zf/HdCyhOr5kEaI1vXnZ
         AHqMk5n23Tf4jH9IGfb3G5DZNCjOrBTupASyoek5KpsLK+7TZ8PtvTAm9G+QA315CUby
         IYyHyl0x18+lL0Fi8R7tqzBJ2DPU5pA0CvlDhZ4/xYPg5/1z5pQ39vl80RY4GqvpBlS7
         sTZpr33LE1ai6N0oHKjNLPQpAXcQV7DBu7/pF8jdF7WM5eir15nkaN/ThibX7N6ElFL9
         s2AQ==
X-Gm-Message-State: AOJu0YxFCh3CgtlOGkyIQjOoxYAtmDnAsyQxVtBe4pJCl/b+9AlndJVz
	ws9DuwFJ7rJwXZiMkmBEX3suwkH6JoqFuGuiw6uSlOQShJ/Im6wUJdsxyeVNo0lcwy8=
X-Gm-Gg: ASbGncvCmrpBWqTb4dRG9FitW2llGf+ymIzkIzS1Hr83nXyVWk6WBPBEsNlWwMy2mRu
	YOH6l2HJsDAnmI266O5R+JZjIOL0ooJnjy54lAS+zuHprqBP7GbMSkWze5QF40NOjrQ6QQNjfjw
	kLys5KZqa9iSCneXukczmXx3tN9DYqG3l551NptReb/902Adi8b/5VhAgHSopQzDZplAivDhkeS
	D3lUkAtjoV+MGRCW7wIYf9NAHGuo56PUtjGRGkt/QP8rDrS5bkKMjZ5YbGwH8U+LMZ9r16k0rvr
	daQ3DITIvlbP5SucaxfWKo5dZvI5Cdwv0z6Cz+8kjxYj32un/k69EEgBKz9XMGiMefwNWNCoO5m
	/CnP14bK5gcZubk5B8nQh4FiUUarrTVHajcwvvlukg95yPawVCXVWbJGl16f6AfglvQW5d3dgzW
	Pf9/4H04Ah2o0S3nupxisCs9OAdYAog0mTZIr5u75ayDOJEiRXmcZQsOnkt73dTfc=
X-Google-Smtp-Source: AGHT+IF4BgCTrNHH6qecumy4fg4lfB3G2Nlb8SiWNun3lsw+mbCCP9mMa2ihiKy/x9qFTC06IkiiWw==
X-Received: by 2002:a5d:5f82:0:b0:42b:5448:7b34 with SMTP id ffacd0b85a97d-42cc1301cffmr2191246f8f.7.1763724480369;
        Fri, 21 Nov 2025 03:28:00 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5a3sm10702636f8f.6.2025.11.21.03.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:27:59 -0800 (PST)
Message-ID: <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
Date: Fri, 21 Nov 2025 11:27:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/2025 11:01, Mukesh Ojha wrote:
> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> related to Secure PAS remoteproc enablement when Linux is running at EL2
> for Qualcomm SoCs.
> 
> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.
> 
> Qualcomm is working to enable remote processors on the SA8775p SoC with
> a Linux host running at EL2. In doing so, it has encountered several
> challenges related to how the remoteproc framework is handled when Linux
> runs at EL1.
> 
> One of the main challenges arises from differences in how IOMMU
> translation is currently managed on SoCs running the Qualcomm EL2
> hypervisor (QHEE), where IOMMU translation for any device is entirely
> owned by the hypervisor. Additionally, the firmware for remote
> processors does not contain a resource table, which would typically
> include the necessary IOMMU configuration settings.
> 
> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> authenticate and reset remote processors via a single SMC call,
> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> TZ for authentication. Once authentication is complete, the call returns
> to QHEE, which sets up the IOMMU translation scheme for the remote
> processors and subsequently brings them out of reset. The design of the
> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> is not permitted to configure IOMMU translation for remote processors,
> and only a single-stage translation is configured.
> 
> To make the remote processor bring-up (PAS) sequence
> hypervisor-independent, the auth_and_reset SMC call is now handled
> entirely by TZ. However, the issue of IOMMU configuration remains
> unresolved, for example a scenario, when KVM host at EL2 has no
> knowledge of the remote processors’ IOMMU settings.  This is being
> addressed by overlaying the IOMMU properties when the SoC runs a Linux
> host at EL2. SMC call is being provided from the TrustZone firmware to
> retrieve the resource table for a given subsystem.
> 
> There are also remote processors such as those for video, camera, and
> graphics that do not use the remoteproc framework to manage their
> lifecycle. Instead, they rely on the Qualcomm PAS service to
> authenticate their firmware. These processors also need to be brought
> out of reset when Linux is running at EL2. The client drivers for these
> processors use the MDT loader function to load and authenticate
> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> to retrieve the resource table, create a shared memory bridge
> (shmbridge), and map the resources before bringing the processors out of
> reset.
> 
> It is based on next-20251120 and tested on SA8775p which is now called
> Lemans IOT platform and does not addresses DMA problem discussed at
> [1] which is future scope of the series.
> 
> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
>     debug log(12/14) suggestion, and return type change(4/14).
>   - Added R-b tag on 10/14 .
Sorry.

Did we actually come up with a cogent reason to omit the video firmware 
loading here ?

AFAIU it is required for Lemans and Glymur - leaving it out is blocking 
getting video stuff done and storing up trouble.

What exactly is the blockage - is it something you want help with ?

---
bod

