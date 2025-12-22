Return-Path: <linux-arm-msm+bounces-86097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F75CD4AFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 05:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF5DE30062CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90E9239E9A;
	Mon, 22 Dec 2025 04:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkSWUFwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16091E5018
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377183; cv=none; b=aA63ejxz/iAHrm8Mmit4rl9RNlY09SmQKk7IX8BHgGcMXDM2XChGL1DWzkIiqtX3g8TEn0rn66qE+13drJLCasWgbH6chQ4RplLAKX8Q2Kxp+OclBYoVRgDOhrdD3KYxFz37oiXlrTdCHx1SX6oYOlRaY7DlysxBAc0jw8Cvg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377183; c=relaxed/simple;
	bh=4nWRBHw9ZSMjD9CMjPip65K1IqUJb03WwMR/5d1YZ0I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=twI/PnN8ZmaZ7kA3+SpkYtraDZfz2gvXy4LJXb5CEhpgrjJNUkH9PSrKt6rV4UJZBov/lMx2zpOle8JoufgGcMA+gfqFZq7Ocn4E8elb2O9gLYQqZXRvE3LwZJdOc3AO8XNK3jQDIyu5R/B776+f57erAL7WQY3U/5VPIzBxlN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkSWUFwO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632d9326so21276875e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 20:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766377180; x=1766981980; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz9oUIITuh4Qrr7HA9cPf90F5RqSoPjSYBKk+4VvXSU=;
        b=MkSWUFwO7gSg4WO5Ot1ArvvriabzYLEj7AA/5EsXr5g3WgkVIni371ecoT5NwDtcQP
         y1jMnIEDFE44PWLbFky41TAswECCzmba4UGdxa2IOneR0Fxf8LPT9MHflR3SG0iIJgmi
         SMVCfmNrnc1qDW1+GbEzt5PJK/cPtEUfR0vpQ0+vA7Gk7qov5qQzlfbAn5FbiManpJ+O
         WZcKG+c/1uBH5GLwaOZpyyfuy9sUBCaYAwTKEsAf3caz8umuEkQshaG63g7WRRL31/L5
         1FvxuwbAOQmnbs/GFX8lNWr0HNQdukCHMxdBVbOa43Zj2GIDSpRtSf7TVWhrHGYDX+m6
         WhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766377180; x=1766981980;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz9oUIITuh4Qrr7HA9cPf90F5RqSoPjSYBKk+4VvXSU=;
        b=imSCn1gAxHa3uSi9JTkdaEvQ6rmMplMjbnzcEI6rUVqpsmyRsKqLXHyqJ0ewdVoFlm
         gKEYtPBic/ywBhQe3djLX4bIIgRGY1C0dnzUFkKLWyqKm2N/ITLLQtkU4mrCotaAcBng
         /RbiT/oi3xCAN/FkL88FV2K0ZOt2tyrb3mcwaen9IZMCUU6E4ICvVzY+dOiiOtV1anBA
         K6Qr9ozkQfKYsc0ggI0Vyw4by4B5juinLmljUXbwGQoSYBCbqe5yFQjG0X/LChOAeUzH
         oyYgBs4Nr15uWM3J8Pl1jdRnRqjMIXBVO4+LzZ7zI7b+hVeR6DEsXaTBZBXkYUD/cEtk
         Gu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmr0NaIMVYPsOYCxvIQQld9q64Dkn+cClD4u40QF89B1o4xzysJy7DaFjLNle4FWpB5xIIZtUfbt0sKYRW@vger.kernel.org
X-Gm-Message-State: AOJu0YzONQWusDzCsDNyUhLI+JPpK4HrS5NdQ0hDgLRw23jknmWItGwY
	3KPbrX9Vb47K8ioI3cvcM6wb/pv/pDrqWzcVq6NXlWhtydF/7z5t4tz996ovKA0omKvIxPNKfsZ
	VZBge
X-Gm-Gg: AY/fxX4EZjrtSsM3dlvsfkS0wT1SUmLynGIAy6f6wOIwlUOaD4eTeNV8tFP/o9GqYPN
	Z+Un1m59+xmTUA2FNrzgcSzr75tarrAqFyDvRKlG97D7dttJ59MQ8ye15i66dg2zvrKSL3eZ8+2
	qZNqd0i2HSeIVSc8W7jsOopnWoYDJReEgZATLF5uGQwxt+b5F5VYnfcnDWerhsL/mH1MhXNx3AP
	mv0g6f8NgoRUPRbS8VzqyAc/HvdzOxkL3rd5NoMAGogR0/cA/N8lFfvaJs+NabMS4G1lSbyaczW
	xhFhMFd6w7byjLvLvvg2+kYxCxnaCgiTyWeSLujA+JiVZbXOBLWPRzqod2Ej3jz1KhzFjIT/ty4
	4AH8Cox9RQPaXQBItFjtH+x+7MrdgCFi63ejyuCuoC8mGLQZ8DDZqwTb5Wze5tjl3OOCvPxlNl/
	EZiol6g7WLABMTBepN
X-Google-Smtp-Source: AGHT+IEPs3rzyj2eZULxoMlh6zwflu8ouzcedJ8HJLD3dVubtcZiEmMt46CCjFTciufvvhFJMMSvug==
X-Received: by 2002:a05:600c:3487:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47d1955b739mr115149285e9.1.1766377180010;
        Sun, 21 Dec 2025 20:19:40 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7db7:794c:2c30:e530])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm226177055e9.13.2025.12.21.20.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 20:19:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 04:19:38 +0000
Message-Id: <DF4GG97LYALC.1YRQN14DFQJPP@linaro.org>
Cc: <linux-sound@vger.kernel.org>
Subject: Re: [linux-next] (new?) audio issues on Qualcomm sm8550
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <DEVENUXSAUMM.1DMQ7M0ASXSDV@linaro.org>
 <fb7ea0ab-d75a-4716-93dc-08545fdb1677@oss.qualcomm.com>
In-Reply-To: <fb7ea0ab-d75a-4716-93dc-08545fdb1677@oss.qualcomm.com>

On Tue Dec 16, 2025 at 5:48 AM GMT, Srinivas Kandagatla wrote:
> Thanks Alexey for reporting this
>
> On 12/11/25 1:01 PM, Alexey Klimov wrote:
>> Hi all,
>>=20
>> I am reporting new errors here because I soon lose access to some device=
s.
>> Please let me know what is the proper way to report this if this is not =
the right
>> thing to do.
>>=20
>> I've started to see new errors on sm8550-qrd for a while now with recent=
 linux-nexts:
>> (also reproduced with today's next-20251211)
>>=20
>>  qcom-soundwire 6d30000.soundwire: dout-ports (0) mismatch with controll=
er (1)
> I think we discussed this briefly in this thread
> https://www.spinics.net/lists/devicetree/msg837844.html
>
> This is very much the expected behavior. There is a bug in the dt entry
> of 6d30000.soundwire controller, which missed dout port in frame shaping
> data.

Yep, now I am starting to recall. I just thought that it was fixed.
Port mismatch messages is also present on other boards too.
Thanks.

Best regards,
Alexey


