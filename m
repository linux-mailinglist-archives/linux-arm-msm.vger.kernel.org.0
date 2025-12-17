Return-Path: <linux-arm-msm+bounces-85486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F46CC75CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B3F430039CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC87F350D49;
	Wed, 17 Dec 2025 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+d58dUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A7350D4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971488; cv=none; b=VAUrehbu0/P+RG3d6YQkVVFfqCFEjXcjRslaIkDTO4EbWgC9mUSsnL4OmQUbOUTFNc0eLp0ya7Ln4rPnluNw1VZt4MVEmbLNg0w+6L1qEtSfzOzkI1vrgw5W4aj2D3yqJcypRRMZq8u2QqgAGkIE5/ReKwEWp52yIUIYIWLe68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971488; c=relaxed/simple;
	bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nYoRQ4NYi+k3gNXEvKNwTquIdZrdIOcJuFMAhRLniVblcwoee1tcMDUTsRC+XlLA8OC6cZXsC0nl3wdOQC2FP0VXT6JiBeC/xpjDuk6eUUbtUZ1n369VG0NoAIZvAto3LH/vtSuy71QktdCLXmxgpMmeV9i5zLEtNYKCjYrmQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+d58dUj; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47755de027eso36954905e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765971485; x=1766576285; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
        b=d+d58dUjx3fplfb9BR7VzEG9exatnCl8buZ5IaFR3+e7cnRsgY2Ho3S+o2XDy6scy1
         cNbJ6rm5mrw3IMVmOXJnIronvvqL4xBYAMPABGFyYY/wIEpnYRBh4CGdpqxmpjtOP94K
         FHg4kf0LsFFplh3h6Ppk/tpX3wGohHbdRqy9jd+RwuHZfvJTYwsb8hpJBihmnQM2dKpD
         Mo6qik0eXc6HgkbTb7DUrTTxidlApMko6FPrs2g/5MDs3rktfFheQ76jUCH8y73/rlbi
         88inoGEMWS0HdogzAeKqr9+dh0DzBEL9EewXDgmmrDU7TBWLpAzZ4T/8+prBNSa9M8m9
         vBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971485; x=1766576285;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fu7sMIYgUSh/v4rkjBNhREAJ1FIhusnRA78rCGY6UUI=;
        b=fPKBi5gGjVXLUcDHAyh6h4ZXMPaNIdKLV98Uxk3fYU+ggXkwD8QZEPWcydWWww9Wvf
         MQvMWYfnRtxQJkMFSilSST01sRzqQxVgdt0QiDAnsTktmieWcpV+njQIDsyzEDSL/cxi
         FfY/54OUl6bvsXL5BkYgciBVh3jM4kNb2nOfwCGBfbCTFf0C1+YRmVRtUnPjdCW3xj1H
         kcW/Btg9KUf1a1/iaFgImczSc6qEDDkXRjAF5UFaNOYpL1vassKc3k5IwUAw1hHf/Kb5
         t6eZENPkasSpXjaVcI4CThJGE5VHEBsJgxJaiLV21t8K5+AaKDroBfc4iQa1BskUxfh2
         ok9w==
X-Forwarded-Encrypted: i=1; AJvYcCUIrhZNJj8Rq/S6fDe16S/Vr6/dwlSsULcatEVtVL/Na7kOXdgB05qk4MawP77/r/32x59hvkM8ErRmxB1L@vger.kernel.org
X-Gm-Message-State: AOJu0YyTr4DVZSzMF67b7q8jqiz6vvUXpY2hlIqixgaNR7Br7HoEN4lW
	I/mEaabhIGutv7XAzKqyMzuCzds64nuUN/y/g+DUhUZK7n7534Z6g4/Z4YEqqT9V7mk=
X-Gm-Gg: AY/fxX6i9GYLMNwpl6XGhjbnZkZm+oSWEn3bb+DJtQs1hWmZAypAz9rxkyY+mkUMblg
	mOqhoGXafuSDBr8Z1OUYFwI2lsINGrURPCjMpcb4zdlHqhCFMA8FaEwVrdVw5h9XX2MZXGgEtl5
	2uG7Mwt2pS6L/g+mrQPMMJUEVZ2C8VVwU/PA25XJbBzaeDuOpVfFJKjJpvNaOVFo6AmhN3kgK16
	iZq89l0RHsOAl2zSmOIsROzaaFklnsdn/c+RrbHPid1HXrGj+fW5Y9wBMr1afMZAMQ/oSSrFwvn
	QTYZpFFdHTcwcY1HPrmTGRKmvGBUbyW6TVQbIHOoIMZWHfT8373ra+QdD4M+t+LrpenyphceZiu
	oa1AqoohTXT7A1CIdAFbYwgiBZKaftT6FDrqgXhObCPEGMg9QGo/mNDYQTO5wKN9bJpETIyLWxa
	q4MnAd8DfDMujgkZ4C
X-Google-Smtp-Source: AGHT+IHnX+LxQmLQiVs+ZpZFsuF5KyxBkwZoY99AYE5aZUalbfeBEMXFDIkjxf7sAdzdTezvtXYJLQ==
X-Received: by 2002:a05:600c:a46:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47a8f8a7d03mr182754515e9.4.1765971484924;
        Wed, 17 Dec 2025 03:38:04 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:95b6:94a5:9a2e:e813])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc14b421sm33633925e9.0.2025.12.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 11:38:03 +0000
Message-Id: <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
In-Reply-To: <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>

On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>
>
> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>> This patch series expands the existing constraints in
>>> the q6dsp-lpass-ports driver to improve compatibility
>>> and flexibility for audio stream configurations.
>>>
>>> The first patch extends the supported sampling rates to cover a wider
>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>> diverse audio hardware and allowing more flexible audio stream setups.
>>>
>>> The second patch adds support for the 32-bit PCM format
>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>> and 24-bit formats, enabling handling of high-resolution
>>> audio streams and improving audio quality for supported hardware.
>>=20
>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>> existing devices? If yes, then how is it gonna play with
>> explicitly setting format/sampling rate to s16le/48k in sndcards drivers=
?
>>
> Support for s16le/48k is already available; these patch will expand the=
=20
> existing constraint so that customers can use a wider range.

Unfortunately, you didn't answer any of my questions or answered
a different one.

Perhaps the main one: is q6dsp-lpass-ports involved in compress offloaded
playback on existing devices?

Thanks,
Alexey


