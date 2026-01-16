Return-Path: <linux-arm-msm+bounces-89353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C071BD2EB6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66EF3300E027
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1752D320A34;
	Fri, 16 Jan 2026 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tn1m8XTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654252E1758
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555497; cv=none; b=kOd4UAqExbkTNmXx4XboDLQMd796Vc14p4+jN0c8TyqYDHwrmmV/hiHER1SkOFJ1sN8z6v9TmdjvMhORlinyn5A0zTkKg7dQ3U4R14ZSppjQnMPaHFkeO93u0rJCa/MJT33xVeLCzl3Cd05Tps0RTnkQ9CpiuW5ryPoq3m9qo4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555497; c=relaxed/simple;
	bh=F1dBOslSNJdmGhuKyZQUTNwmlqPoJ944FJFaQAUDiz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rne3Fh/m2Udcl6crBRrRLurYIqKqFMCC7lfO9Vq3hnmPMhzeyFhRmURIkbP2Dh2we+kP0Ljp4OzcbUAnZV9impMnIpA/wXB2UdmHqLrDtj9M5AAbchQrRZbN/ClEK7H0fTRZjl/99BEqrvcYVyls85NX7NrLTglEovkjpzfqkEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tn1m8XTq; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38323dd7cb1so1974841fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768555494; x=1769160294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUi1WEtiQf1a2/X/kibJLzk8TGAQoRCMC8REEAl19os=;
        b=Tn1m8XTq+AMhynzbcolJZzo+b1QfjjDewJckwJgTiloPIkQw4tPNehpHKTzgyqLd1B
         ic//+rQAc6if/9FEd0uwiNucsCaMZHitL4RDlEoKWO4yamsJ9udZUTIDBstiS8cmSWJd
         TQIEdcP1PXK2ifB274SoXyLhiK51ImDs2Wbr3K2FGkKgjbeHzbt5L/Ije8NNvJhMzUIL
         FdhTDeG04UbD0k7YxCe5fMfviEx6OV/xIEglWGAdwgIUovTL2TYcmRUFx7LbTDIQTA4f
         nbM/cQRBVbzM3npJQVhRvWLC7dal0OH3BbvixtH9Qc6wdzD3799SJfJ+rmLXoV1J10su
         Ds8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555494; x=1769160294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUi1WEtiQf1a2/X/kibJLzk8TGAQoRCMC8REEAl19os=;
        b=EtpgVFRXzT6XdMYkZavQsFCfAM4x9MbAMkhJJxZh7FUYMzZ51t1Ukkm52XV3Vr0ru0
         FvLoSxs+CmAYnRrB6gD0YwO689YmJhFQ/REc/vS2d4Dni+ohnoIerxUt8eAv9/jau8NC
         YXk5lvWaZS0xFwXDU3pJEtPVAMD4CFR09H03qNdzsdJIqpe9VKbw9tQh428JcajXXrAz
         UFJHNGxkwlJxqrWcchrv/rDzTlkmCmUt1Z/8ZnzugHIuCxRuvK36emw+NVnwm6sSRejv
         q0R575jA24N91eFgV/lyMf9qRpTmbqTaBJvzp1926tYLzsNwK4eOaP6NPYeUzEvCo+xq
         8NUw==
X-Forwarded-Encrypted: i=1; AJvYcCXxmmVC/8qRYLaLvWyUJoKK2SR6i58CC/bxOZdmCA9ZjmCxGObmLNPa3zlVTvIHCmkCaUzYxioFBX/769GD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFab4WUISM8WwccWuAbXesGw8A64as90N7NemEcBT/D7tVNGK5
	aK6n6kjvB9a5kf0QeQNhNf5v8YGfF++mtpBJ/whG1lg5TJZFFS7F0e8kOWItqHtOetQ=
X-Gm-Gg: AY/fxX61a6deCLT2nsWD29chbhvnTx+dihvURUSF2spBRhsCpGwT/5qNknqVp56uM/E
	H7W/PdV73Hwhu1Xpx89RSwppG66XcJ5CBX/eFZ/Skxo9HePauGdt5rAKgM79/jX5fDF/08+yWYq
	iGkZsYX9lmJzJH8QEgKdmwAzXmZh4gLNwi8Lp5j6jUTcTmMQhEp+mk+RwgmWGYBZk2nZFDkgtdJ
	uwO9QvJDhSfc6ipV7wsLUKWqoNAmPGBLF83scoAdW9QFpILC06Zk/IN70J7B0Br3mC/4Dzt2N4Q
	Q6aQ/f9RdhnIyK71n5kWZZsxBuvtkq4I0Z/gHeuBorIOwreTG79U9C4/ozuYLQWcytAMTisDjk3
	gGriwLrV29kghfxp7hFIX911sCbZnNzYa77dOo6YEDX/8y0CJrtfm5F135rzkRB43s8l3Ospy7/
	GgXlwzath/zOts1urPQ06/WbYm0BxUJ0syrgLSEYMQ76Nna8yyUrGG33dHCjhHMlr0Yw==
X-Received: by 2002:a05:651c:41c4:b0:383:53e2:ad29 with SMTP id 38308e7fff4ca-383842f990amr4601421fa.6.1768555492152;
        Fri, 16 Jan 2026 01:24:52 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8fb1sm5639921fa.46.2026.01.16.01.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:24:51 -0800 (PST)
Message-ID: <c3a56645-0399-447c-b7a5-d7af9f567a7d@linaro.org>
Date: Fri, 16 Jan 2026 11:24:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
 <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
 <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 17:54, Bryan O'Donoghue wrote:
> On 15/01/2026 02:58, Vladimir Zapolskiy wrote:
>>>> Writing proper values to registers should be a concern on the driver
>>>> level,
>>>> it sounds improper to push this simple task and responsibility to
>>>> userspace.
>>>
>>> I think we should stick to the same format as is already upstream for
>>> the CSID version of this - which is the same data.
>>>
>>
>> It is not the same and it will not be the same, if the currently presented
>> version is taken. If TPG modes in CSID are continuous, here they are not,
>> so it makes a big difference for userspace, and better it should be
>> removed.
> 
> Not sure I follow you here.
> 
> The set of strings for camss-csid we have now is:
> 
> const char * const csid_testgen_modes[] = {
>           "Disabled",
>           "Incrementing",
>           "Alternating 0x55/0xAA",
>           "All Zeros 0x00",
>           "All Ones 0xFF",
>           "Pseudo-random Data",
>           "User Specified",
>           "Complex pattern",
>           "Color box",
>           "Color bars",
>           NULL
> };
> 
> Wengmeng has
> 
> +const char * const testgen_payload_modes[] = {
> +	"Disabled",
> +	"Incrementing",
> +	"Alternating 0x55/0xAA",
> +	"Reserved",
> +	"Reserved",
> +	"Pseudo-random Data",
> +	"User Specified",
> +	"Reserved",
> +	"Reserved",
> +	"Color bars",
> +	"Reserved"
> +};
> 
> I think the "Reserved" should go away but, other than that we should

That's what I've asked, there is no dispute.

> keep namespace consistency between CSID-TPG and standalone-TPG.
> 

When "consistency" is not defined, it's just a fine sounding buzzword.

CSID TPG has:
* modes, which numbers are continuously incremented,
* the number of TPG modes for a user is expectedly the number of TPG modes.

The displayed v8 of the "standalone TPG" broke both assumptions from above,
so there is no more "consistency" between two TPGs, while I explicitly ask
to preserve the "consistency".

-- 
Best wishes,
Vladimir

