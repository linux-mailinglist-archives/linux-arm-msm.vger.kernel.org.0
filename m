Return-Path: <linux-arm-msm+bounces-94415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOGfKnVaoWl2sQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:48:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4391B4A9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C2CB3030FD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B94D39E6D9;
	Fri, 27 Feb 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZctkDXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50A1E3DE5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182131; cv=none; b=CQMQiHbwvFcTR2rOWPnrvkY0mhX24kZykNEau6qWxmY8ouCdwGXdzazYh2vdgkZoMnUM99HcivPMPjtOQWB5dD8VBq/6I5dIHpKxVOOr9CJ2XecG+woRF1Z4FTltYNOedBVRriTWm+EDd6AEe8haglICBjfIyTU3SSQxj3KYijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182131; c=relaxed/simple;
	bh=+C2AViCGBu6JCnL7njP0l/RXkEu3njPw7S4z03Ac/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yvy9YrsoMjOWC+QO+e0lfi3MJEMPmgYRRegX33fVUGmnUVtiD96gADkFv2FL0BfANTHyZOmU9h3Kz/p36x0Ki89ySCT/EYzw7I5NP0QR12WBobWLTqouviZcd8EpVSYVGpaTEdSGDM+99GsGrVJu/ikM7sOG1mJTvVcyxma9ZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZctkDXb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4398dd671daso1906028f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182128; x=1772786928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=tZctkDXbiUHo/OXhkW0WyGZX6gNs/L+qk6jXa5ayADuO3XIbWqKLLDwIka8/hqiXyO
         2wgsUKCB/lBPi1KnUKbaH71LDryBTX9+By11Vrq0VQYlOdm6eInYntouyTskl/ykQCTw
         3JPcktBGQu5sTCD6EMRVPAcPzTUkNF7CPFPpYqne4XGgQgnhDc0pNp1NBj8oN77Hxco6
         B/gUhpVnQtx8qKkxt28Awrz2hW7fHq6oS1nsFxHq6uVUBvChWBNXT+pK1E8mTbwWl80v
         LwGRqCelU4h24IBRvRMvim13Bmgd4tamO5YgHQdmTgR8VUJnOFOwu+ywGim1cOmAGSHB
         zTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182128; x=1772786928;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=pfYrjPHbQCW/JxljmEDaFuIIpg9W/9wbyLAdvXPwSYiB3l7Z/JRfOT0XvjcqH1MPgR
         RmQxjZ/d0z3MzcUpYGDDGakIESvz5xmx06g74NC4hxmyWjm0xiDtasVrAECkyLfHJbcD
         R77yUdqnT0jtDwhC/GW0cK8V/bRrTSBZ3MuPM16X+0VrfTFTrhikfnPh6ZNZx0B3g/9G
         xrEX1pXpTd+qkafp7Bs7qck/enJslVOb++MPJkPN6tEzgNbliP6845L8rdUrYJpdxgm1
         2/hBWZcMVJXCle6zXf7+oKvkkaWWhY0rHkv6ldzewKdDKDZQhByEHajd8IUzfISSoUOy
         f7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwulPSkGIRkMANZ1k/UQh7OH6waW4e+FoXvjk6Kla7T9a/C3h8M2jDjyWWXXuWA3InNETdP0nkuKDNPVnn@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJ6UsmIYGzFZ8DV+JZHMjb0aYUO66mLCe1YXof9tvfNzUAC3W
	sbhARsSbOfefK4FxP6iT+3xROwpveg2qfXMtKGYIBpj6zXMwhM82PGa3yKEfgatwY0o=
X-Gm-Gg: ATEYQzwr9BauFkQrKPx3r80dMkmKVKlDAPTpnxyK186WHeLnZxccnkuCZJ1gLqZlkB9
	kFpeWOAklOyN5qVZwRU+CodSQcl6nx1POLUhZZWTK37dycS0figzpOGd7XJwG8ijtKZjpwHQ9zC
	6rxO0Qyio0fIEybhXThhYhP09shEUcGij7ngcWRRG/4mlxoJeBZGlCeR0/th+HHQxwn/Jc6RUmr
	X3NNDduML2X1ddvQ/fY5sYzMrOE737ULEgxAzJAAXX5j120xpUgEGPzQXwXfIwlJpRRSII7grc5
	EZOZJ0YuYm2HCTv3uyi6zMZWTeMTuPnoCkURjzLTBSMEkSlMFa7WdEQ5uHcUxqO63vynz24JNu8
	y28v+vlMK5Lz6lwHNdZDgXIKfL8MgEh/wsWHZGfOB3/RnpvDeM0IpYPX23E7KP/4wlIk1s0WMGI
	AovEacpYTKfHe2h2NiAJvVGtBDwsCTcTId46SQfBVJfu/4YpjHj4oK9q0Dbkigbu4y
X-Received: by 2002:a5d:4527:0:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-4399de4a684mr2333826f8f.47.1772182128271;
        Fri, 27 Feb 2026 00:48:48 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b40esm4856509f8f.36.2026.02.27.00.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:48:47 -0800 (PST)
Message-ID: <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
Date: Fri, 27 Feb 2026 08:48:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-94415-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DE4391B4A9C
X-Rspamd-Action: no action

On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
>> Well, is there a way to support both then ?
> I would just not touch x1e80100, but if you want then probably binding
> should stay backwards compatible, where you keep all properties intact
> and only add csiphy nodes.
> 

I really want to stop adding new stuff with the legacy way that has 
broken power-rails, even if that means x1e has a bit Frankenstein binding.

>> Right now I have csiphy and their registers listed in the camss block.
>>
>> I could add phys = <> as optional in the schema. Is there any reason to
>> stop adding adjacent csiphy nodes ?
> I think no.

Great so, that's what I'll do.

---
bod

