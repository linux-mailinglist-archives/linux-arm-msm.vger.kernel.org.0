Return-Path: <linux-arm-msm+bounces-107864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJKOMKQPB2qbrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:20:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D957F54F5A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C72730BF654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DBA47DD54;
	Fri, 15 May 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="o2hkzp9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85C47D923
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845304; cv=none; b=FeJ4ytzVP1neKOFVElhnNOsvNd2ajKQCgUm34vuETBaqFNJAzsxSv7lv7eWtRBpMZWvIdNxA1IBuJb0F0jTH+5XmqPHCg5Mn47AA+cxLx+W/ZznVuYr+Ujo8iAR8+dw3WugAqfRog5i0Q9r51+m6rm8k9vR6B/aL5s+6qdSLYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845304; c=relaxed/simple;
	bh=CTwiBTXgKo7K6y0K1Dx2UdK0JxC3dCcCpJUx4YVxSM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKi8PXVVWqk4UJLwjpbnT1D8P4PyBD1NBaL7yBobWHnsE8wSWbxAiPWrD2fUpdvx4L2x039OMnymkX6pZQ04hYPEyNST6xAw6ih/zoKUEH6u2i7vJ1t19kOrDsBROk4wC47vDsqEhvpv7Jn/6c2HgJ8QAx3vFaQuXPEBCCXx/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=o2hkzp9L; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso15558817a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778845301; x=1779450101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0YuC8NLk0JJSjHe3iGG0tkbsopOL75mgPP59FgiTls=;
        b=o2hkzp9LAx5y+kXSG+qoaGv+0i7ZgiLkzhAo/CibsDYs8RQ4yq0jkysaY1lOxLzEqF
         ccaXDINSjEbYfWdn7P4o/2NKTRkmPULCB0qG4mUSW5F227Jt9KJP/Z57nbFlHf2MaEZP
         ptTBeMTRU003ORlt7aIVLddhZKE6AyfOlb/OJ0TcSIDsQdKq5s7Q+Fuin3C8JRr4O53h
         feefA6yVTyH9GimKO5mMwuhhL3AMD5xfY7qtU58onbNEfNl/J+DTAPGbijWvowl4JReq
         hvIcgf66rOiEjUkHgGY5C5Y24HRXPSS5ja+WPRBIiIvcIkd+wuVXZDYJof4Ubbhs2j4l
         e0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845301; x=1779450101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0YuC8NLk0JJSjHe3iGG0tkbsopOL75mgPP59FgiTls=;
        b=cxKTUxoKzjtENDsE3057q+D+HXTpXOPWBWYa6kcsPiIm4ttTjegO3cWNG2dgTGZ76L
         jmV/ZwH9omf6E+7TgBaGfZk0+YGNxZBoXDt3+2eynCgRdyqiH84PCp8ZaX+DOz/XJmNp
         BNZMyf6Bb7tJ7Mfc5zeogsgdweDm8r/6DwfEL0SRPAchxmeQd4ZSOhQobyQItBhbmSGM
         qqjz7gO4TBwz20B50E3YpvYOPFRRVi44Ap7C+U5P96ojG29TSeaJUbt2s7bICBVtYy99
         RaxHbwgk4RK22yXKSCwDPUWAAHj7jlnlybG/zizNHHFWbYCfkeu4+9PeXqpADvXasxpg
         p/qw==
X-Forwarded-Encrypted: i=1; AFNElJ8OCGspzU3ziwQAlKkj1luVaZ3Mda6phP1XMDbtjFF5nbToXfsCiryHcv6giVCC8rkGanZHqdi+M34lqSMH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lRVqRrQ9zfHq982LYErCxEk+WTNS0Ca1nZWMCXMxkENiUx6v
	s1d4P6M+iYc3qlDmQ2DNDeRwq0RSusyt1wQ080z15UTlViX8E73gACLUy2iKTWAICmM=
X-Gm-Gg: Acq92OHBUED/VXgkafoeKmYlsv5e6MEX3mW1EBpBoINA1stqiA+LACPjeQzqzJ690o/
	tEJKLXfF46gA996mKqGXK+nvrzEPrjTTVaesDjK3H0NsQAoTApQuVAXYlwQmkWMfdhlbTmQL2Cj
	oyFxmk6kMKWj0K8EzDEXFdbovDFSyy6ZkN+LQutzq0zuxCocVU+cQJzFZ8B+MbanMtlz1nDZroX
	Csmci6QgLrr3ueqH6ZUzBmkWG+rxIR+2/cYXz7a+QHXxotN0LBSMYS7zAs0eeSMpnWAlD7n+6ig
	ZaWzngtjxem49zRs5soMCfBL4BXU+HOWDCogcr8TRreug2eiYNgliqYAFwsPniRi4fbfBuoitvi
	rQgZFzzkgWz9f/s/VsFD1IGOTAHItq9+dqkCdeelKAvNjgYpJC+oqhWki0b1EjG/JMqPPC/zIRQ
	r5JK3S6AGaAcRvuoIZ/3/L1+KxOvtmEgd8LyTJwRoUGcoY+kkdfvpBbbOTPRd4F0H+aaSYEw==
X-Received: by 2002:a17:907:c291:b0:bd5:7a3:a58b with SMTP id a640c23a62f3a-bd517994249mr190506866b.46.1778845300966;
        Fri, 15 May 2026 04:41:40 -0700 (PDT)
Received: from [192.168.1.105] (164-6-132-5.ftth.glasoperator.nl. [5.132.6.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31494sm215043366b.20.2026.05.15.04.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:41:40 -0700 (PDT)
Message-ID: <21308d1e-712b-4d3b-b083-251c8d755470@fairphone.com>
Date: Fri, 15 May 2026 13:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] Input: gpio-keys - add regulator to gpio_keys
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
 <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
 <af3oqSshbXrUYMnz@sirena.co.uk>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <af3oqSshbXrUYMnz@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D957F54F5A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fairphone.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107864-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Action: no action

On 5/8/26 15:44, Mark Brown wrote:
> On Fri, May 08, 2026 at 02:53:15PM +0200, Griffin Kroah-Hartman wrote:
> 
>> +		if (fwnode_property_present(child, "vdd-supply")) {
>> +			button->regulator = devm_fwnode_regulator_get_optional(dev, child, "vdd");
>> +			if (IS_ERR(button->regulator)) {
> 
> As well as the issue I mentioned on a prior thread with this assigning a
> non-physical "vdd" name to the single supply that these components can
> have (which has had issues in the past

Our Hall Effect sensor IC does have a named "vdd" pin, but we are 
totally open to changing this to power-supply or whatever best follows 
the standard.

> painful) the fact that this is fwnode means that this opens up support
> for using this with ACPI which is very problematic given that ACPI has a
> strong model of how regulators should work which is that they should not
> be OS visible at all. 

Would it be more appropriate to drop the devm_fwnode_regulator_get() and 
replace it with a type-casted devm_of_regulator_get()?

> That probably needs more addressing in the prior regulator patch, that 
> needs a bit more motivation and discussion about the issues with trying
> to do a regulator interface firmware neutrally.
Thank you for your response and feedback!

