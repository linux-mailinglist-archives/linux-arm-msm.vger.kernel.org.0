Return-Path: <linux-arm-msm+bounces-87519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC9CF46E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3897A3044349
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCD030171E;
	Mon,  5 Jan 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9CHjaOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE9313557
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626596; cv=none; b=Wgaqn4OaqOkhrHQJdvurN96jcSjNks5oFpc1cBuIQXKEWW/UZB2l0P3oNzXa5hqMTn9czwIvQ4LN5Jh7RzjgTtmIrLjMGT3KJSodejxn/8ZBunhKkTDahWg42euU8gjo7bNa72eAh4GZQdEYRlxcl/c7Ho4WunHhxp/48zOhK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626596; c=relaxed/simple;
	bh=rfmM0oHlriEWS2KwQfEnAdbuaeGQ7LHz+vEupFI4Xa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlrIoWTOjPjUM/dVb4Vw+1eRGBaECdF8k+bNDC3XnUpyRnpVRx6kRnIbxNOxhfjHp9x4C2zzboTZVPfUh6cj4e50H4b/sND1DLlLykmT02f8OMW1wYHpu/wwuMuQAAikD03tydkWJDKq8b5AvlFQ48oGYV5uBEpHYCE7XEBozeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9CHjaOV; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ce0ef9d4eeso23203a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767626592; x=1768231392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuBj4V4tanBoMRJVAMOCXf92ggYa0XV5YWXJxw2KNiU=;
        b=e9CHjaOVMPT3x70LJi28DKO7dAYLIl13zrImoj8uElp74aZTVMqZfAqzRMdo+7JO3+
         FBXg41SF6whMPyljzpHeHmRx8GFf783RclSbEL7sg/UV9XXv9BM9SsRLCFOwAZNlPIOM
         M1ouKKwtaz3rnMqqxVSv6ctYjnWEChq67HEN3J6KLbF43oS7sO+KUSWwO/kw4YJLgkdC
         KeYO9OX4ZnGkqbZTXzqngR9TULQ911d4C87DqtU7034PNraDeR9zn45Tkr5p51ao9d62
         hCK98/8GnjErA/j7E+viRZK915DTm+mzV/FhIWQmYZgBV0X95ZO33QMDFGRvbgIt9aN4
         RG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626592; x=1768231392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuBj4V4tanBoMRJVAMOCXf92ggYa0XV5YWXJxw2KNiU=;
        b=fDqSTQiUK6NBCLh0uOIz90kaDXcHdj2DCIoOLcsM6aQF8DkdvxUvSC7t4EX8hY157C
         iD18VossDZ73I3Nazp/Rne9Pu7d8w3FYqZcGMjm2mYo1cyXjTdSR/nh+EUoo79EJQEvp
         y1eupmbyXWqzcgk5fd9NFN1mKLMABej9k7uLxE7wsEFdTlF4afqZ0QDHHDR5jt8rxsw5
         OPu/NaLJ/zVM7sKh8sN8eOiduFloDjAbTW4QOrcKsMOsGqxjpE/rufvj8HY+7z2/lqpx
         J5ssppzbxJ/k3bAK0LmQxUPGGe4XhCG0fqIsL7mQ4pJp+yIyiFE7iq8YyM5FwIStaCYg
         PfAA==
X-Forwarded-Encrypted: i=1; AJvYcCV3QB5d2s1U7qm0bCc39DAe3fqmgA2pSM9PE/8h5y3PUQmeVhRWnvRzBEVycIZeu6IZ+0hL/Cd5zTyBlHh7@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ46hiKs4GZCFiG+M1lfnlgpRVylAl9AFVNglVGLVM/TcfxzEX
	6Dsb9MSjU/kdKihzLvBrtqYPlaobKxYpiOVOOhw+uo14jfr9PjKSsUd+L6tRJg==
X-Gm-Gg: AY/fxX7mwtPgXEmCwORkkhc10lqjk076zoJFnCyfyphsFKv2vUCIQems4WwVQhqpOEv
	CZQCn0hrYS0TQwfUDvhHjcP8QqolvaH3N7YfPPWlwyyEAJEwfTBE6RkexUy5fO3FSlkSW3ex48R
	IrF7UpdjdrT2fR6ZkOjHvUy7OSZDnppc8ofl/pFl3XRpNmJJuVusCu2xTc8hGprDC6d9Tzb+AM/
	XDCTOrqFe219JtCBPk5/ykXA5yVWjjo5fy06rt4FTN5yGRmKBLvKUK4tdw+Mg+gn7CIEATG0olK
	v7h3tdkiw6uBwMJMyLyg0RQGpT1Gp2iEgylZPtS8wtyh5kVPmoPkIAn8E55m9nxnjXHW0PBZCLH
	u/pm0sCPslF/ofFMJgfcJdDRRy7k7lMr4CO00teCxSLwmyJ+dLhIfgrhS/4XlH4GwJPHwZZ0feo
	7TestagynDhGj6A6INozrReKT6k6DHRX8g/0yGaHyCR7JAE1mhqxQF8nz+QUKrjLM80bcIumu3o
	OjkBno/IdHOIjy7sitnMYWLwE+7sFUnYA==
X-Google-Smtp-Source: AGHT+IHC0T34oUBbEa5lhbSB8wM+95jVMHVncLiRRnQsCbvUgDbHbtOBPFwou8Zv2vRl7ztJFMdTPg==
X-Received: by 2002:a05:6830:43a3:b0:756:a322:311 with SMTP id 46e09a7af769-7cc669001a2mr37442477a34.10.1767626591751;
        Mon, 05 Jan 2026 07:23:11 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce45ffb5fesm27703a34.25.2026.01.05.07.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:23:11 -0800 (PST)
Message-ID: <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Date: Mon, 5 Jan 2026 09:23:10 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
 <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 6:37 AM, Konrad Dybcio wrote:
> On 12/23/25 9:35 PM, Alex G. wrote:
>> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>>
>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>> ---
> 
> [...]
> 
>>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>>> *fw_name)
>>>> +{
>>>> +	const struct firmware *extra_fw;
>>>> +	int ret;
>>>> +
>>>> +	dev_info(wcss->dev, "loading additional firmware image %s\n",
>> fw_name);
> 
> Your email client is messing up the reply context - if it happens to
> be Thunderbird, set:
> 
> mailnews.wraplength = 0
> mailnews.send_plaintext_flowed = false
> 
> in the config

Oops.
>>>
>>> I don't think this log line is useful beyond development
>>
>> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be
>> prudent to print the names of any additional firmwares:
>>
>>      remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
>>
>>>> +
>>>> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>>> +	if (ret)
>>>> +		return 0;
>>>
>>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>>> is missing, particularly not to impose any new requirements on existing
>>> setups". But you haven't spelt that out explicitly.
>>
>> I intended to not abort when aux firmware is missing. Maybe the better way to
>> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
>>
>>> You also haven't provided an explanation as to why the firmware should be
>>> loaded. Is it necessary for some functionality? Is it that case on the
>>> newly-supported IPQ9574?
>>
>> I don't have a good answer. I reasoned that since the qcom provides it [1],
>> the M3 firmware would need to be loaded. I haven't done much testing without
>> it.
> 
> Well, could you please try?
> 
> IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
> to be a necessity here as well

I tried this without the M3 firmware, and I don't see a measurable 
difference in normal operation. I only tested AP mode briefly. How can I 
know for sure if the M3 firmware is needed or not?

Alex

