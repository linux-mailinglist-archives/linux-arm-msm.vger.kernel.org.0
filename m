Return-Path: <linux-arm-msm+bounces-77595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7FBE3CD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 879F54F57E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF96133A013;
	Thu, 16 Oct 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rv2Y+nfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E6442C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622614; cv=none; b=ep299rMS9AkOtsoPKQfxWDrKOjL1y5fpU37d+DJl/8DM903EbOyF+t6ixMhPN1uZoqpCjvhKSTs2LSUWiVHvtn9FSbB4LWywwFtMpn0GP62Knu8x9VTMFCxzcbv7uFEu6unpZFf2kZeVckuvA8yhkvl2UxSPtF34XoBiXAyqiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622614; c=relaxed/simple;
	bh=bP4alRLMp8v1Hpu3LoBwktpDq8eSdwqK4/h9cUUAB7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Es5XNPjXD1ajZupzeTdMSZXMv4tfyRCbbMjuJKt6w6/vkN19Wsfk7ODMQg+SKj6/BxUkp1liTBzco1Mxl/YdZp5Lg62OOtPDmuGyrshw1n+bXhx3rE0kNBGID15iDUpxAXpfHk/YO2jDquUziIS7mJtnAAKpwMeRU8aLL146zyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rv2Y+nfj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so3970175e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622611; x=1761227411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=Rv2Y+nfjNBNk5mveSdWcHNW0rzXPFKBacSRTnrmZd3hGe7nU8udyqY9MD5kc4U8RrC
         TOXgYkcXdWBOopUabtYsaf5lDEXL9RqKD/6hP//zYSCFWqGt7kgvcILK819HTd7AgJCg
         mKwXlV9RphlhW21tmkojRkk3JuHfmeIcSTYs6j/fzFzw13uEL84PnyMylS8PKBDYfrG7
         qBs0NncKh4kqRR2b8Dpha/z5HlQebyzDkwcn7dfY+VxmljP9NFObbz6XtEbm8yRbMYiP
         oQIE3ZQBnaa6BO4RmHlVktHJ7txjUx+vZiEfLnn4AelGM9bEkU2PJhySESfy2YN3LsxA
         1gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622611; x=1761227411;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=nupsJFW9ihpa5jPYXJ85JRG/ngICITvHTS5Rj10bf96XDuwocu4YcuVr/ivm72AYsx
         XgtRshm7FwmHFYUJNqAzK9ZxVp70XHjG9Gx3tHTPzVcaBvbV1a+GLU6cwXJBse3GA22W
         UWQhKxCRDDZtES16JdDG66cob20jkjaDWq4nZjtYJA2YuWOGk8AjOFAIkyV71IWfWiiJ
         5j3onRU1ljcw8TuTHVZ7pPr/fxLKNpYc2TROJCrv1UWIYY0w+X2+iUyYxcJordIXDQDG
         e2fm3Hd1PSPUUI2uSoCvSKRPhaQM0KaerLfRvMkQ/ox+MxrOIi/bdRPNoMFDgwR6N1ef
         0LsA==
X-Forwarded-Encrypted: i=1; AJvYcCVrfdlOpWKPTfVND6lNPTxsSCk7wkDgTRQRHZAHTX8htm0wGAxxsEp3ZEcgtK+iqTd0hFE0yN9IqPBgpnbk@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/3E9nKuDdjsPTUfaIlC/edmtXaQmSKinYF52gUif7S0J0mWe
	Wfv90XCVHHHpXSoKSnkc1gkPc6S21EAKCM8qBhuftjt62iHQe7DC2yO6fm7lNiSJ3Q8=
X-Gm-Gg: ASbGncv6xbNkHKVvaWFh3A9qYaWfI3Ur+b7VGNZZRZLcw/4erUpp91czccoCrfdzsXY
	N9r+Su1saUoTzCSXghcrZetNRusKMtAYarmkLiuDtrkSTJ9qkZ/GvW/qJ2I3sPbUxyCRDWBeYkf
	/vW2G7/fKkzxovupAY8rNM1StsZ7Y3Ofek5zBcvmkuzup8p7WMby4Uy9RAoDZ/WbI2QuWXE/sFs
	plBmsQFud9ehM400DhOZgUHFB0K10sOpCv/DCiBAL/vQS2DK7UA3I/0D49lQSCoMem8et30NT/s
	IGNGD9X1544vTknrLof+1twDay6JIdW/6FHir95EiOaE3axI4l1qQO1EnRLTBhcZLp04x/dzg5R
	tlSURGOiC1h3d2P6KXkn+L3agtaWYq3gU7OTv9Yk8uuDACA579WsDryeCVoXhPgGpSYD3T5eO4b
	KsNkr+2sGY+aXf0OazsDEwQ626GviD9l6B8okYZbdGN2ItDQ==
X-Google-Smtp-Source: AGHT+IF9O9+CY3yIGfpHSEcpC2cDiM18bV3XDDECDyPk3t/QicECJpvFVoKsQOEP0AiZOjlLD65hPA==
X-Received: by 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4711790c31emr154255e9.23.1760622610858;
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42704141cdfsm1629287f8f.4.2025.10.16.06.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Message-ID: <f1cc3212-f1b0-497a-9990-8d523a0f9c61@linaro.org>
Date: Thu, 16 Oct 2025 14:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
 <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
 <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2025 13:53, Nihal Kumar Gupta wrote:
>> I'd suggest to add a description of pins with MCLK function in a separate
>> change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
>> and gpio69, so here it's a MCLK1 pin for instance.
> We are currently enabling sensor only on CCI1.  Pins gpio67–gpio69 are used by mclk for cam0–cam2, and gpio74 enables the regulator.
> Since mclk is sensor-specific, it's added in the sensor dtso.
> 
> Would it be appropriate to extend mclk support to all CCI instances, even if some are not actively used?
> 
> @Konrad, @Bryan, Could you please share your thoughts on the above?
> 
> If valid, then cam0_default, cam1_default, cam2_default should be added in SoC dtsi, with references used in sensor dtso.

Anything not muxed should go into the SoC description anything board 
specific - mezzanine specific in this case - should go into your dtso.

A few of the camera pins are non-muxed as I recall.

As regards splitting it up.

There's no use-case for non-muxed pins without the dependent change.

It's almost never the wrong thing to do, to have small, individually 
independent patches though.

---
bod

