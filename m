Return-Path: <linux-arm-msm+bounces-86099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF308CD4B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 05:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2474300A576
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D552FF17A;
	Mon, 22 Dec 2025 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4pxWTDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29211E1A3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377517; cv=none; b=iPVGfrR4m1o4ND+7WJKm40JSzpAqyDeI3/wh4UFOOBmuQl0LyecPQPkJO1QpgYhnQX3+vSgvYIWlOdF1/snenFzTjPvSYR200wDzXRZofZOQeehMnZ7EdtQSl0UeWO5H5cTrnVKITBJApVlgl0EtTAj4QJICh1waI0EMThdTXsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377517; c=relaxed/simple;
	bh=zx+0zrUpNplPzxs7nAKriwd+5omooaKME7WghPYhMn8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X7U7goYRdL1+S1fSQkuvHRUh1rwK/ekL0YZicAKq8jwDk0SopEi8W7hVSyMdI0V4h9R/rWiRTnajSeZYdUSKAnVqvhxhIuaoYO5uU6FlpCYEKOqqAeAcxOt1wvETj9/sPnbdrmF4CQgTOu7NA7eKLPnPqPCCYoP19tpkAc/zTo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4pxWTDw; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477aa218f20so21476545e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 20:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766377514; x=1766982314; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx+0zrUpNplPzxs7nAKriwd+5omooaKME7WghPYhMn8=;
        b=n4pxWTDwr3YFj+V7OStUlZBkWUATtB2BS874+3yKeoORGhQhhdjWGa+OfOAtX9E6ct
         kxLFr2VuLA8cWkD0oDjCTwkzTkYP09Dx5OaaDCKc8inKIutpa6IrHLa/oT0gtu353zVj
         T5zK5E/v/nIcSM/5jtu5NqZlQgXMQBmxmollcD4VrHKBPH7GkCtSRS/YfVwEBOCTM9tB
         dlSDQiOw2yzaHp2jpOQ9tckTgEfEwlExnYuZTleP1tLCiVsob0KWNAdQlNnARt8ZcUwl
         U122PFq4L2fSb01w57PhM1CZ3UwSQ5UwvWK8nReL7nXun4ky1+bYnUAMdfcbDZfCpxZo
         stBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766377514; x=1766982314;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zx+0zrUpNplPzxs7nAKriwd+5omooaKME7WghPYhMn8=;
        b=GjvU9bVRLN4SsxFQD5W0UrWmCNNso/FbG3+6UgbUu3zPOeXlXQ27HtXJ7/t36xfi1l
         Zg94fsdxMBXbLS3sUvzB+mz6xSffnFpypUjdA4T/svAxtgRUXqWPY5ZkpW6KhhkP4ozE
         ST9oh/jUXtjppDQz+jYInbspAc0zRuRCkZSW/Fr32jZ0Mz5O/ka/uCCLX++9CLL6mCH0
         T6FFlHbSuEkGu6ecEc/4nVgiO709SXyzrPhhHUxYCEMPj4rzqWQrwpagghomG1iXyJnO
         H8CMkdqAB4Obm+Vr/NPZ8AFCzKlN4FlkBvPDzR5tnxBV6kJoL0XhSwRvJeCD6FOlAAbb
         F5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXjUG0O1xLlIPIiVC/m34cmqzP0eF+0e7cxWFltL2d/Ca5lLJ6floatyIfQp8vGz92kvOmHHQPqJYVbt5gc@vger.kernel.org
X-Gm-Message-State: AOJu0YzGuv2ZRxvcnUxPbalK/xJ6edZRamxtpSg4mSnAbbvDKogQrFzl
	FC8l5GTKKrhwfj8jZOhCFVVqqb0AjIQNuR7fCoWH6/zzm/anTeNdzV1V1V9mSdh+5bM=
X-Gm-Gg: AY/fxX6wfBOypudOC1jxY6IaSGd2rGXKXXwJrpVKcPZno74K1oFAnhqka+gzCmUfUnw
	HX6nSykkn4X7JA050YEYPXnPBzczuRZnZMvHWrwMCWrnkruwD2kG3Td6UsNSDflyf9q98IYc3Iv
	dGUlb5nJ6G8dO1nOt5w+o9oX+9PxzGWaeVtKt4oUw0F+H2IDjozCbVAXoe/bMZbKxM3PPpy58bq
	y4/jKWc0/NJPUh2BRz/MQrbm0rlGkrzSHIFDdxu1FJnU4BXuFcJLbJcA7BUA6v2R4oduEutPXVq
	EFsEc+oxqG4td+YznfwR+Hr+nHVgNlfFwkE7V2hQC7PleYA42fjfnArwhve66GBBjrLIujQohRQ
	LZXl8QtgCcwrGxgFifHM9qKwH/oXrps/hM5FJZx9VZ0erOKhoTuOAUyn+jyMlt/bL7eDogI18Us
	b3uF3myxIhVyizyDC3
X-Google-Smtp-Source: AGHT+IEFPw6BHurC+yxPzjyCPrPhsx+XJDFA6UxzACnVNeSrnr8kjsZNwCOidsPpjrowChadwhrkMQ==
X-Received: by 2002:a05:600c:4595:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-47d1953ead3mr95117845e9.13.1766377514186;
        Sun, 21 Dec 2025 20:25:14 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7db7:794c:2c30:e530])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cba81sm168582455e9.10.2025.12.21.20.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 20:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 04:25:12 +0000
Message-Id: <DF4GKIYJPDKA.DTLON4U0AZHB@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Ravi
 Hothi" <ravi.hothi@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
X-Mailer: aerc 0.20.0
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
 <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
 <d9e64bd0-7ccf-490c-a6be-d9cc9484475d@oss.qualcomm.com>
In-Reply-To: <d9e64bd0-7ccf-490c-a6be-d9cc9484475d@oss.qualcomm.com>

On Wed Dec 17, 2025 at 12:56 PM GMT, Srinivas Kandagatla wrote:
>
>
> On 12/17/25 11:38 AM, Alexey Klimov wrote:
>> On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>>>
>>>
>>> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>>>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>>>> This patch series expands the existing constraints in
>>>>> the q6dsp-lpass-ports driver to improve compatibility
>>>>> and flexibility for audio stream configurations.
>>>>>
>>>>> The first patch extends the supported sampling rates to cover a wider
>>>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>>>> diverse audio hardware and allowing more flexible audio stream setups=
.
>>>>>
>>>>> The second patch adds support for the 32-bit PCM format
>>>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>>>> and 24-bit formats, enabling handling of high-resolution
>>>>> audio streams and improving audio quality for supported hardware.
>>>>
>>>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>>>> existing devices? If yes, then how is it gonna play with
>>>> explicitly setting format/sampling rate to s16le/48k in sndcards drive=
rs?
>
> be_hw_params_fixup callback in machine drivers can select any format
> that fits the usecase. currently this is hardcoded for s16le samples and
> 48K rate, but its not limited to this. This patch is expanding the
> allowed range in the dais so that machine drivers should be able to
> select other options, ex: for HDMI its better to be at S24LE or S32LE.

Yes. Exactly.
So, should we add kcontrols to machine driver to handle these usecases like
selecting s24le instead of s16le? Or what's the plan?

>>> Support for s16le/48k is already available; these patch will expand the=
=20
>>> existing constraint so that customers can use a wider range.
>>=20
>> Unfortunately, you didn't answer any of my questions or answered
>> a different one.
>>=20
>> Perhaps the main one: is q6dsp-lpass-ports involved in compress offloade=
d
>> playback on existing devices?
>
> lpass-ports are the Backend DAI ports, So yes, they will be involved in
> all the usecases that deal with handling sinks or sources irrespective
> of pcm or compressed content.

Thanks,
Alexey


