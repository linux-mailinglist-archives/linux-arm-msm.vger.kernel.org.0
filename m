Return-Path: <linux-arm-msm+bounces-28971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C89568F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 13:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047BC283FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 11:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F05416848F;
	Mon, 19 Aug 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsuMToZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A7167265
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065545; cv=none; b=hRb9MSYMSd40OT9/iWx2/6QjI0lvLfqs0QPbgVqDNhJQXNYS3SZqyU3SriQn64IhRAFJxfA3R9NixftHBa0VFknerrBxqmq2HVwLNhUM4oOW1cn/36gfPe1NsLbrv7z2Br5H9QgTJYXSAKopJl3JtcsBOfKYqSSSr+8mFMXz8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065545; c=relaxed/simple;
	bh=Wmie4vQi8khalYM7ZEpgB85aomp+ZymWSL1n7Y0jJpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu4W9gqQKBOaPVuEdVrkMHiMJNqy/fdvmi5kw/PWlTOz+MWLqE3NIQ+H/MxjIQvkMA+3lILg9To57hI5VnWto1MPNHqadTlr/okvbJrBF3tigJo12LRKUTb4Sn4m1KrGOvRcVIgi1Ihti+EHEM4O/9jxeS8pYyvbQCYO99R6R6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsuMToZs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so2877144a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724065542; x=1724670342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/RN4zc1ht84kYj1RU0w9c6wanQUgBuvrRTNuKSSkaE=;
        b=jsuMToZsoI7wVex+TiKt7wmaowtVk7838ebfJlNvtvGo8IGw5dbwiIVb5znVUZZFc8
         iRPl5uuCeV62uVBDKaKljvXaAPBbN5Cm7oeVJYmIAW5H5nJAcj2Yb0vQv8XAIzVZuZ8Q
         6/M4kEjn6KH873Azjy+D3Fe7wxg682boTGKY8wEjIvl1lXNfrfEH2WDc24UCwriq816a
         G5U+tEKIs7D+MMRx8OMNcfeGQ3OPyms9rTKG92x1E8kxzIhaLANI+vRQKPYHb4JyRNAh
         3rvpeywdEgRAdLfJHVddD+7bCDjLgxD2tdT25HPdGZW6Yg9xzawErjkjVisMVtEgfFHd
         U6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065542; x=1724670342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/RN4zc1ht84kYj1RU0w9c6wanQUgBuvrRTNuKSSkaE=;
        b=BEz2tisuQNGGyplecXoYbpUJ7ufmQghQVhteGrPm4P0oWhxmYiAG1T78n0cSIBwldR
         BjcZaK2GR+WQh8YqEn8+AxPvH4CCHwDkp2geVBVeUrfacbmYajMQhl+dD7YbfKv0ZbDZ
         0oalxhtHp/n+018JPTpSzEb+1q8eJc1wa3KF/FUJHkMCvI+XNQujvYl+40waBhljJRwN
         KKoSA5RTFNqz4GgPhhNx/Fd7fN3Yt5tnocb7AZyV8S2Mmz5QE3+djYzLTUE1fpR3p8aa
         uy07+hUdxL2njl8oFC3u5OPgGf2lNR7YgEv50Z5gPZI/IsMfJEphH5kgmcM0mqKx30ys
         w84A==
X-Gm-Message-State: AOJu0Yy+pdmlgeEVDCVvageG18MNyfu4sKI4B2ClSQf8/9ILwi8BoLSI
	8vmm3pHYM7CjuJKZpOuTKctWSQk+ReHFYKDMKHp4wYFezAKxYuDwsLJ/EohPkOo=
X-Google-Smtp-Source: AGHT+IHT4bsLbT2dy0r3Y23x2E40yvN/740yv6qZY4TwLwzbeopKnDHxvHh0ETWqYmTl4tCW5nTkdg==
X-Received: by 2002:a05:6402:909:b0:5bb:9afd:8d05 with SMTP id 4fb4d7f45d1cf-5beca8c8457mr6625653a12.24.1724065541733;
        Mon, 19 Aug 2024 04:05:41 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbde48fdsm5376711a12.28.2024.08.19.04.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:05:41 -0700 (PDT)
Message-ID: <eba83b14-e704-464a-b4c4-19322e70d177@linaro.org>
Date: Mon, 19 Aug 2024 12:05:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)

<snip>

> +#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */

OK so one more point here.

The non-lite VFE has I think in the case of sm8550 twenty seven 
different bus clients.

The above code takes a given index - take the example of index 0 meaning 
RDI0 and

1. Determines if is_lite() is true deriving a jump of 0 or 0x17
2. Uses this index as a further offset to functions such as
    VFE_BUS_WM_CFG(n)
3. In no way articulates which bus client is which.

So for a non lite case -> RDI0 is bus client # 23

The code we have for CAMSS just assumes RDI is the only client we are 
programming - which I'm not proposing to change for now, however the 
code is very not obvious in what it is doing here.

This BTW isn't a criticism of what you've done here but, even though I 
have access to the registers in front of me, I had to spend about 30 
minutes looking up and verifying these offsets.

That's not sustainable.

Could you please add a comment which details what each index relates to.

/*
  * Bus client mapping
  *
  * 0 = VID_Y ?
  * 1 = VID_C
  * .. etc
  * .. etc
  * 23 = RDI0
  * 24 = RDI1
  */

I'll try to apply a similar level of index documentation for existing 
upstream submissions so that working out client mappings is less tedious 
and will be requiring these mappings for new VFE silicon enabling code 
upstream.

---
bod

