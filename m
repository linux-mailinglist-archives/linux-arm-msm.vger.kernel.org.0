Return-Path: <linux-arm-msm+bounces-90585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCaUN6SPd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:00:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DD8A703
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 979F43006217
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDD33B2BA;
	Mon, 26 Jan 2026 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kn5Hwcnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0091917CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443229; cv=none; b=O0IfC8Cr0Fs//m1J5HZ/+CS/qJ8DlCNrieGomeREZgpz4rZTPow6YvkZB12SzllUeK/4t+nzYSWoTEPyWoNpj4g04PM/f/a1ZfkvquHm4aWba3JIAGZGAVMbz5/DRjc9N2S8f3fTA11/TB4qcbnNiVQRNMyx6bNLm6f1nJmH4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443229; c=relaxed/simple;
	bh=y0xLU910YLgrYE1tqlzNmhLes89yGDIAX41Z+JYkq94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FqPS39dje+gF0AEdQQt4/vpryucn1OBlZQftJTl4hVhWYe0lu5Y/2LEV66kWKzX/RQGtKHWcCfKqG1SeqzX+1db+lqgSYGe5Kz3GP3po7Z2SDw9SMeyH3GBStRYQgIFNaCvCyt++S3orfOQzbS+zAKwlvNS+fS95/st+zx3Hw1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kn5Hwcnb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7193792a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769443226; x=1770048026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnId+vgt8x4+Rf7Zffd5lJwpwT2its5PFuK3z+vPO4Y=;
        b=Kn5Hwcnb6nCorsnTjrzuLLEKdbmP5jWLH9b8lv8Zb+Wgb8EIiFzk+IQ/vBV4qUYbOc
         fEDPE1Weqju6KkNdcxavskxo+bpKXkcv8IIvBL3jX4VZvSYpD12+M+jw0r4UzUlXX6uK
         JEohl9qWyXglJwn3ujENsVj9enk0gz2wxq6L+bkQ6MpD7Vav/+rmGREMwAjBSHuZR2VW
         1k2vm3ZTfVOXPtg8JYgB++FFzwIz8j6349zLRcfIpXr6YZAHgKK7U1qZXhJjxjcriR/l
         eKugzsfoUOxlf+BN3Y18c3laP3VlzVMU0tmRXLCcCv5e/V6EcCxSnRlCH09nTGvfFkii
         sfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443226; x=1770048026;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnId+vgt8x4+Rf7Zffd5lJwpwT2its5PFuK3z+vPO4Y=;
        b=w1d7Nglh45tS74ZTYwS7S84CL40VypS9zqu4F3/wK0lB6ebXAuxVuASHXTH3+IamiR
         ULbgkLkNxF2z0oSNf7wXxcmQ3VryAduQfRgGyIYHOG/Q8tGyooNcMxCci9ikPaSSGuxa
         i+oQvc2x0jeh3vfgnyqkDK9QdH9ZjGSw83zKc5ojIN/LdIqKcIDiXDKAa2YfQQPoelww
         iePvmsymBQzvtQHyUPMmxkIFIJwsy/2+jrEIJ7xwnNdN7oAActfjG9mY1v4s8lsA4Qhj
         S7MSF0Oyd4LA2C4NqMdHC+uKS5dOM8cOGeRGiUjtGA1+aJTSb3eu7YBOh7gLW6R9H3OM
         71gg==
X-Forwarded-Encrypted: i=1; AJvYcCWh8iobAvL6MvcjEhE3c2bneU2WJMo3oRsfUfRJJuRMG4OvtBMagr7OjWidmrvPuGaf+eDFh26GoFJV8s8S@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIP5XhonWF2Hq2eg8f3fkpAZAvvQC2klyksvkkBl7cwJ+vBzz
	W8d+W8mrghz6iT8RNeynxyeYQWYmu9cb6UkszhvzhCJ8wLmPwyJf68q0QUi+ubVEuZ8=
X-Gm-Gg: AZuq6aKdZbO0s1E3Tx4h9hcZR0ypnJFLAjjs8LyeFwQLc1WGYHDPXzg3NMH8cMcp8u6
	ERw4pJJLjwfFdIP0di/KiqqmQDFeDEhprbgyzkMCWF544bl1RPEV0OMurqalNpcvaliww78pAXM
	ZQsvEOJxed0gP1yCmMNqU33AW9LrJi88PUmIisIpyi7arJrSDpXPPUAlh5RSaLOX25O7rHx0KOQ
	pLUA6mVWgsVWYiAhRJn7n+Nn461l9uYPrfH1q45BJQFB9uQlibMR+SDAbQZn8luigbkjkL1/NuG
	nBO9XKNPpMhpVVWS6zovaRdjE/BOYp/k/kkCzeQQJB3fDcPKNXH5bwd7tHf8DQNYWt1EUaPL6Rd
	/FWa7Wj0hWbG3iPYmIsppHlYChoyhZJR8f8Dx/MsDTOyESIUWZjyi6iIgP8m9ZyNm+VxuQrVbyj
	/fYUeF8iwylkEOqvt6bQJ5QYxUtAtwviYKaD1dwUyo26CZMtMQflSPpRRd7/lyq8g=
X-Received: by 2002:a17:906:f58e:b0:b87:6:3727 with SMTP id a640c23a62f3a-b8d2e709662mr388289066b.48.1769443225506;
        Mon, 26 Jan 2026 08:00:25 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbc85sm656093166b.1.2026.01.26.08.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:00:24 -0800 (PST)
Message-ID: <1c9e86e9-0e66-4cce-9a3e-f53e36e155b5@linaro.org>
Date: Mon, 26 Jan 2026 16:00:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: Saikiran B <bjsaikiran@gmail.com>, Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
 <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
 <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
 <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
 <2084a247-053b-41c0-84ef-c56af640aa74@kernel.org>
 <I-1OPz69QKXF-LDqvufQARvv_3TIYaLyZIETdiGvSj_JSYhnJNeqiLERDUH2R0kclFyo6MqMRsaiZaS3RKmdZA==@protonmail.internalid>
 <CAAFDt1ufYyM4_xTy+AZTdXBB0cGNk+nFQHD5+5U7tUMQqZ+o=g@mail.gmail.com>
 <371b38d5-9322-4629-b378-ec62e0924fd4@kernel.org>
 <CAAFDt1u1PxgurdGigY+maPhssWgCrj6srqKwqF9d3oUFzv-yJg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1u1PxgurdGigY+maPhssWgCrj6srqKwqF9d3oUFzv-yJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90585-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,wikipedia.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 627DD8A703
X-Rspamd-Action: no action

On 26/01/2026 15:40, Saikiran B wrote:
> "Failing that we should try a more liberal power_on() Assert Reset ...
> Wait 10ms ... Enable ... Wait 20ms ... Clock ..."
> 
> I have implemented a strict power sequencing in v3 as you and Hans requested:
> 
> - Assert Reset (5ms)
> - Enable Regulators
> - Enable Clock
> - Wait 2ms
> - De-assert Reset
> - Wait 20ms (T2/Boot)

Yes understood, thank you. The ask is to extend the grace times a bit so 
we can be very sure.

power_on():

     Assert Reset (GPIO Low).
     Wait 10ms.
     Enable all regulators (RPMh votes).
     Wait 20ms (Allow PM8010 to ramp and stabilize).
     Start the Clock (MCLK).
     Wait 10ms.
     De-assert Reset (GPIO High).
     Wait 5ms.


> Regarding the root cause (LDO active discharge / pin states): I
> suspect you are right that active_discharge should be enabled by
> firmware but isn't, or the sleep state pinctrls are missing (causing
> back-feeding).

I would be surprised to find that active discharge hasn't been set on 
the relevant LDOs. It is possible but I would also expect then that 
Lenovo followed up because, this would an issue that would also affect 
Windows users then i.e. its up to the firmware to configure the LDOs.

  I will investigate the SPMI registers and sleep
> pinctrls separately as a follow-up, as that affects the platform
> stability beyond just this driver.

Yeah if its not chip power-on sequencing then we are probably feeding 
voltage from elsewhere unbeknownst.

> For this patch series (v3): I have implemented Runtime PM Autosuspend
> (1000ms). This effectively masks the issue for the user (rapid
> open/close works instantly because regulators stay on), while using
> standard kernel infrastructure instead of custom workarounds.
> 
> This approach:
> - Fixes the immediate "camera fails on reload" user bug.
> - Uses the rigorous power sequence you defined.
> - Aligns with other drivers (e.g. ov2680) using autosuspend for
> performance/stability.
> 
> I'm sending the v3 series in a bit with all these changes. I'll
> continue debugging the LDO configuration on the side.

Send away however, instead of working around an issue we don't 
understand, it would be preferable to root-cause it.

Please read:

Documentation/process/submitting-patches.rst

Documentation/process/submitting-patches.rst:Top-posting is strongly 
discouraged in Linux kernel development
Documentation/process/submitting-patches.rst:  A: 
http://en.wikipedia.org/wiki/Top_post
Documentation/process/submitting-patches.rst:  Q: Where do I find info 
about this thing called top-posting?
Documentation/process/submitting-patches.rst:  Q: Why is top-posting 
such a bad thing?
Documentation/process/submitting-patches.rst:  A: Top-posting.

---
bod

