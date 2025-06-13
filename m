Return-Path: <linux-arm-msm+bounces-61245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4614AD8FFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F59168E78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4EC157E6B;
	Fri, 13 Jun 2025 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2uBbAya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628F2E406
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826106; cv=none; b=AQAxamv2KA4vxf7gk3DUhfMJoAvqAUAHDNfVueXzeVScmDzsUoTiLn8yDozhOFQLP4P9yDejCrzcGTX2Si0O+ikS4lv4lEh9Aj/1mHGVEjGuDExqe9J7uBnV6UqoD0vewOrb7QGHH4b8rx4pU1NYJX5jMV6IOSxt94lCbkhCDA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826106; c=relaxed/simple;
	bh=LunFnbTFFDzuGfxH/qbk8l6GPWmy4BO3tDou7e+5RyU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OW5so+Ex+S9x9xl2UddU1zK4nsi0Bs6s1+Q84+1kw6TPrj68y+/P7uEB2hEowK6mbqO27l+gOBBKQCgqWoYsd/kwzVcA7oV+PviEX30yod+kJdiG+mowS7ypCDtwV0lVSutigCAcvpu3zi7jwrGe3495hu7W1wlknp2O6DpGqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2uBbAya; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1913675f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826102; x=1750430902; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mOYd+KSN0bGLBIlymGQv2zJrwVUrxAdmR0BhjkZJyc=;
        b=g2uBbAya+Y71MOM4DjUIP+qQMEIJJlos+LZBupBO4QaRK5eY3ZA+LuNZ7y1Hr9C/XR
         WGpWldglY9EYh1GZbQjIgyEX0tDspZCSJq/jMjmY8+zWrejND5z0AWCAS+Ext9K8SK+T
         4KxhATCe5GRhz7cFkBSWuTJv+l/rGx7pAEx8k3m98YQxYRuMw75k7bIK0wZOgwD8oVHP
         CFEc4hkLUF2bPaP5hflUxHH1lm1K+lh26ykPDKTtt4vBFf+iMzxkVBeIUw6Tjlr1C1Vp
         EoyOhHuwXYaXpT6pvKI6LMTJQ0TCCquV4zzhjMsHv/k/Y+VXbJR7o3SkYRdpriYrgWKO
         alCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826102; x=1750430902;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mOYd+KSN0bGLBIlymGQv2zJrwVUrxAdmR0BhjkZJyc=;
        b=M0nck53BQEHSQb7cptYkcTYmQuZ1tWfHhKwwKbMUlrzsJoSVUlXeaa22CYntqLHVQn
         xIl6ENPNX/6tYao2RY5SssQ5qNEzP4MVvpDt6+ms02QxLFQ7yftL/4ZURZrZ5tdxVsi/
         qyDu2DAy90XnuRXPll76HnYQrc6pwUCx99+4OZ5a7OnaMkL/8itX9M0GZN1I3Cc5DPjv
         i8g5HrrsfUKVGxOX9T1CaXwG5p5TengbXbqpAeU7/uERxiXwPw7Bnt6N1tP1fvmv7xm4
         uGrdvrF0YKQ7EWB0VYoqlAJrIJEBvjhoELWaADEjSaSrkLeo3Fx1cDjj05UcCjvHmrS/
         CciA==
X-Forwarded-Encrypted: i=1; AJvYcCUGutTH+n1EUO9Lzw3Pg9iZHs347ydwYPY5qhzTwllEpgonj1+mOuVj56uDcunBSYzF5nA8jM6HfNLTge4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4bey9g3QLp/AfqhyEDh5lyq3YpHTTQbfeAZzKjXo+2U477+G2
	nYlJN3Lht1cOT7ic+Y4L0llG0ukHX1Y2snsQeir6GGmbxMI1MWWZpnFwpNVo3E/NZdQ=
X-Gm-Gg: ASbGncvHeodHuR9IgmQIl6hVVu8zbxlXVMJ0gAI+A4OZxtygsZtR7KhBDRrUfoF25Nw
	Mka0k3Nm892jKUAfE18Mb2yg6epsXITGq64kkAJTO10FG8wZTjLvNkCQZTGkY8nrRfnkEfTH/tx
	blTUzggjQUGuH0fFeC2CTsCRFkq/lODM0SmuyVIWGI+0WJRD5TGUxEzVFtxwCNhIezToOyyEJAn
	mSYb+3sgHgTmJ7PMpree4FgoteFH7wEb5VUJei/A14WncXvRUcx2pLMRmLyuHdW+YK4eAP8Amf5
	bY05TS+ZD+MvTT+46r9bb0xPUoOmoXec6YNs0LrOG545duZnBoEm8PbY5SxbWsjqpKyAe0cFkHN
	AByw=
X-Google-Smtp-Source: AGHT+IG9yKxjbUAlD81jUcQCQqnSyAIGryKoG0zNvJd5LrpgpBsrLCC2LN8O3W8Hm1XE98lIX1UEKA==
X-Received: by 2002:a05:6000:2486:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3a56877f1b5mr3610228f8f.52.1749826102428;
        Fri, 13 Jun 2025 07:48:22 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm56505835e9.2.2025.06.13.07.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:48:21 +0100
Message-Id: <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Ekansh Gupta"
 <ekansh.gupta@oss.qualcomm.com>, <konradybcio@kernel.org>,
 <srini@kernel.org>, <quic_ekangupt@quicinc.com>
Cc: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, "Bharath Kumar (QUIC)"
 <quic_bkumar@quicinc.com>, "Chenna Kesava Raju (QUIC)"
 <quic_chennak@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
X-Mailer: aerc 0.20.0
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>
In-Reply-To: <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>

On Tue May 13, 2025 at 2:09 PM BST, Konrad Dybcio wrote:
> On 5/9/25 5:42 AM, Ekansh Gupta wrote:
>>=20
>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>
>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>
>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 +++++++++++++++++++++++++=
+++
>>>>>>  1 file changed, 70 insertions(+)

[...]

>>>>> IIUC the driver only considers this on the sensor DSP
>>>> Memory region is required for audio protection domain + adsprpdcd as f=
ar as I know.
>>> next-20250508
>>>
>>> rmem_node =3D of_parse_phandle(rdev->of_node, "memory-region", 0);
>>> if (domain_id =3D=3D SDSP_DOMAIN_ID && rmem_node) {
>>> 	// ...
>>> }
>>>
>>> maybe some driver changes are still pending?
>>=20
>> Would like to add some more details here:
>>=20
>> Memory region is required for audio PD for dynamic loading and remote he=
ap memory
>> requirements. Some initial memory(~2MB) is allocated initially when audi=
o daemon
>> is getting attached[1] and this memory is added to audio PD memory pool.
>>=20
>> Additionally, if there is some additional memory requirement from audio =
PD, the
>> PD can request for more memory using remote heap request[2]
>>=20
>> The support for SDSP was added sometime back[3] to support SDSP usecases=
 on some old
>> platform as there were no dedicated context banks for SDSP there. On rec=
ent platforms,
>> context banks are available wherever SDSP is supported.=20
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
tree/drivers/misc/fastrpc.c#n1273
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
tree/drivers/misc/fastrpc.c#n1884
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
commit/drivers/misc/fastrpc.c?id=3Dc3c0363bc72d4d0907a6d446d7424b3f022ce82a
>
> Ok, this was mildly confusing given there's specific "normal" region
> handling, but the DMA allocator takes care of this one

Konrad, Srini, Ekansh,
what's left here -- I guess memory region is needed,=20
so do you want me to test with secure flag as the only required change at t=
his point?

Best regards,
Alexey


