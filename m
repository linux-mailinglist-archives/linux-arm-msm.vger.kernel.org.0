Return-Path: <linux-arm-msm+bounces-84906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB312CB314A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 14:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17C63113C5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 13:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F28B325705;
	Wed, 10 Dec 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZZwMhU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48974304BAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374980; cv=none; b=hZ9YbXfQHDsvOgHUS+DvabzIMbLaQatfNCS8xaiygeiPQov+L8NbshHoiuaCb5xnKnv6gTO82H5A7Z27ObVn6kiIFf5zwQgij+M3C+3jcSQbXDHu0kvuXmFtLtdNvZVm1Pidv7iZWAj7MdFvPpJCK970H74K3OCcZqHlf7bO3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374980; c=relaxed/simple;
	bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=gS62zD6UDNqYUPA0Svqf7xS9Nul2Vl4agbbWUuWxi2MWkIyXwJNFHSnBruq60OxVeuinC6yQx3JUXDKQSQi1/jmqBCVVXRsw3+0dvpW2jtFdSuDHzKQ5ExftYsT6Wq922FW9+n7qXGMyGS0HyBcVV8ZefVowRgdrMNrqd/8DlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZZwMhU9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47118259fd8so57416215e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765374977; x=1765979777; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
        b=qZZwMhU918XbxXFlSwR952cVgS2AwrPW17fPyJxrjSnada3I/Ah5+8XzZQ/+ki1yna
         ABdwu6SyqmPZHuPB7A+mKOGsU4DHMh7SNmRsHrFX0SMEDJZ+PG2LFey5DBLEDmTSita6
         h0/1SomYd+Z+UQQcNcgSgNvkiiKA27WUOIvYlABlgui6stLnccbMKeGg1kHeQg9Rs3rV
         N18K9ZQyL+FOwRiQ9D7I0p8PdeLgdIVdwGG6iy8Anu1AlwJ2ml7e+MEHevm5mLFHPuXU
         Ky7D7PYC/BW+imZTcgE9hJSj9NIz7APXOvADH4y/NFgs7MYU9jyBm8LbBT+kjOrG4hgP
         AN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765374977; x=1765979777;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q23geQWfTcgaAm7efMTvXGe3yEO/c1XdMxHPP35puUw=;
        b=kz5rRu79I/hNOtLYLYo35+WnB9mJW8KkXIB0xQdjcIYiK3q7JbP2MAkrZ89Upeb6iU
         9Ommt2AujsexiAkqvI7fkgQoXwgboiw9z7CfKEBB7NcFBhTEQSNqTYdlrC5KQTAFzIko
         4MIlvCFEwGVbitCxfRiKw5uG5jsDAeykwLXamrFaUfPlqkb/IR41hU64WdBeGoHPDyk5
         ZTe0Oq0RgOi/xinySF7F/G3OM86lvBI1JD86gyiC6R3tQR4ZdT3cpBlG0cX5X/bBw13x
         dBHuvm2dYnZDjUC1adK98C7U6SdAc6EMmvj/ddKMjJcNQRzIOJ9hIzoUYLAW79+KPFjA
         ei4w==
X-Forwarded-Encrypted: i=1; AJvYcCWdAWNeMLGCwQo7y6RVZZ16K/kYxBWI71Pan36FgaKVE5/CoO+gg48qI6QqkMyRS+L8zWWk19FtPC6otA+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyykpsq4yxKURrluqh7wvDEo/nxnoc77+LSp3PQ2Vmba0A/vsk8
	STu/CO8/4PsrkXIxJy+X7Q3wo9NEkF7TCoeKS6AbXOfins8WO+uD5RowmDbLGMpXDpA=
X-Gm-Gg: ASbGncuwgk1CIA+YQ2wX7xN1o13naxSG4HE7IPinmvv1tZ4rX1PIs4Y3MsxKd6LMbvE
	E640wdyGP8tW14+EDHC1nHe3u0Vq2po2sgt5bBpOEz+jDe9iuNzF331xADxN6EB0p24JQM3dCyQ
	nsSJgyzk1g88UCJEOvAkWb3RwZN6YRA7DAL93NtiPj1gTleohEeHWqKzRt7YQfr7IvdMeex7xu+
	HWyq9XaSnMS6q0tCcdERIFGKcVjHlJM1hIIXXGWGB9U8Adnk3BhF1uD+as0CxgEEwugZDzMiGW+
	W7DSwtDol0LsCxdKlNtJe+TatIEeT+ZNfoj/ZAaDFnlLKYbSKqQvJK4DWjVkUTfGwjks+pjtWMA
	v59Tan82m2KUDswx9RONBJhy+lWVkpy0851JdTczSrh7/w131TIXNDZ+uy9Mz0MUxDsni/5SuQW
	waj3y18nC11NY5mYHk
X-Google-Smtp-Source: AGHT+IFV25+Rly4w6oqtxhD9CKdzzsxZBZKqoi/9c3+m9JENsiG1sAcZy5XtO2nwmWYRqiO7lWdOjA==
X-Received: by 2002:a05:600c:64c9:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47a837b9d3emr25425865e9.29.1765374977566;
        Wed, 10 Dec 2025 05:56:17 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6c67:affc:583e:e754])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d4a995sm46908455e9.13.2025.12.10.05.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 05:56:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 13:56:16 +0000
Message-Id: <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
X-Mailer: aerc 0.20.0
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>

On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
> This patch series expands the existing constraints in
> the q6dsp-lpass-ports driver to improve compatibility
> and flexibility for audio stream configurations.=20
>
> The first patch extends the supported sampling rates to cover a wider
> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
> diverse audio hardware and allowing more flexible audio stream setups.
>
> The second patch adds support for the 32-bit PCM format
> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
> and 24-bit formats, enabling handling of high-resolution
> audio streams and improving audio quality for supported hardware.

Is q6dsp-lpass-ports involved in compress offloaded playback on
existing devices? If yes, then how is it gonna play with
explicitly setting format/sampling rate to s16le/48k in sndcards drivers?

[..]

Best regards,
Alexey

