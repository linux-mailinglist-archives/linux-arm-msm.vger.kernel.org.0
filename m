Return-Path: <linux-arm-msm+bounces-90559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK0fCQhid2n8eQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:46:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 868AC886D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D71030022B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857CF33290D;
	Mon, 26 Jan 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlZJipkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC178F2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431299; cv=none; b=V5XlOGMNSqXkjR/32rNZ9FLV93I9up0jjeVQptlgbp7z4us/IbYam9xEC5nkyWEyviGCTPv/1laobEZ9azsh5WdIezuZ0ZgJPIxW0xufxYLoZudAKFXbFGE8llNlcwsZ7pUd6fVsUka10XIieW2dnX647y2iO7khOK1l4zYLmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431299; c=relaxed/simple;
	bh=TtDt5bqLhmfPeg66JCoa1PxY2VKZg9bpDjYbry2EG2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ureZZQ4L3dolIoOk7K3HpB1BRCzmpEtKzMSA22Yf6AlalHv7YWzQqV0nF0m8AtB3WYkcz3oMzoM9+4Tv18Bf59lI92q/3wfQ/YHj+MrxTNZ6KCaMVAKa+G0NcoIK01k6+NGHmMz9qVMZRsa4ICesbYOFCPAkrH95w9+3eYkp+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlZJipkJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4598887f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769431296; x=1770036096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGkVRtj39ec/cXScWV7OP3CGW3GGq8UKBj+5Z3odKBc=;
        b=SlZJipkJOIN7WVWSGD5fHuWFZAifuaOysuN5g773D6hG1DU0cya6ZfxrgcMLAdEOdR
         OGDR04S7AcXVMtInN52FwLQCOYC5Q3Fd//qb94eMQqhuM1MFm+hsKP1t5FhYbS61dnp0
         onsEkNyK3GXBsg8RyD5gK18856sKU5OCqctTVFb4hX0gyVAU6na8F6tERNgN93+Q96vc
         T0UNWBAs5ZozIa/9dkuewGDyGtPXRjg/b82zsaNLeaA3Ilnuhb3qtnsp4F8hl3lTr2Ut
         hcbm2dCPh1OHMgFhhK71WdJhNHFadMAxL2Yv5fyjlWrCXySRRC7jeWv13rz8Zn7dD+u8
         BtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769431296; x=1770036096;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGkVRtj39ec/cXScWV7OP3CGW3GGq8UKBj+5Z3odKBc=;
        b=YsB4kjqhEncPOfYBzcRwTYW0iRwPLHxryLKL+dpGFyQF+hUa+9FzYRYjQaxQJsUHwo
         tzCIfCqYwI2FvpyJ8aIk+sKWQ2uRMVAwN3JrbqSYTP3mzqkOluj8f2b3XRm6dN9jUZDr
         zJXrQKZ8RJ1DyRhDj4LhAvoYpdiyCRMnvespAb7ZosgYZwqbH8nyhpojZ0Eb6g4XaIrB
         KudpbttfOhCRgKunI35h+zg4AYqXVf4LE466lhwFADobEed3oDXSe8hTiBto+RSDahnZ
         jyY3iAjZ5en53CaoUZ8YtJLvhr34Ec8Xdn32UXJdLYPU/Eb58aPLeOhAG49/Jj9DnQiK
         v9lA==
X-Forwarded-Encrypted: i=1; AJvYcCW7FWy3A6H1BPa1lvtBGGtzc8hV1afSSIGVptT1IzNyohZ8/XXKs4AGBsehw7jgsoVHS/kLiDZkhykyOGg8@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrQtIX0xILVs8Hu3Sg06avzAZOJTt7CCjgVRULcjnU6BrCP6I
	RCBZvB5QKhmjS1AaqGiKB5VYFDFJvqfsUM78OZXsmls4b5DxFpt7NcRmJ6iOTgVvN4g=
X-Gm-Gg: AZuq6aJ6eEe6UCvNsglb7aMcGcNyNkRrEPz34lay4X4Bk6kdpmyq1vdI12VOVj9h05r
	c+X7O3A9gECNamlYiZalu0241DXOX7ObqP/uTlN458Z8LH/bNnVk/lUA7bYmwxe9hDpWjbz1GHU
	WCmxYcRocdQgiFGdhavYCwuv+ZicoTLXszD/bI6Sl68uANihG1gR4Uxot2r38llIUA0rbyKSYNO
	O3WdEt8JrTjQMjbBcVzZyk/ZYlPWrdDCegbIsYFINf+djs6KEXHbbAigrwNv8W7ofdtCagVAW5I
	STQyxgjDBlUWrqzOxaaFAj0bGet2WAk8KFbgNe89YZQBMxU+zTF0GPJ19gxXfr9Nctnj9J5ERhh
	VIQHcd0psPnSwfFfLLs6n4AC91KyUWpOBPCbWKE3X2Nq7Dlpy0Ho+rX3B9hweHJbwyFTBXfGhZ/
	vd6CF6nqez7LtYB/LV2orUwi6myFNbW7UTjdullvzSvKIIva3IDs31
X-Received: by 2002:a5d:5349:0:b0:435:a600:2601 with SMTP id ffacd0b85a97d-435ca1201f2mr5525322f8f.16.1769431296323;
        Mon, 26 Jan 2026 04:41:36 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm29593878f8f.5.2026.01.26.04.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 04:41:35 -0800 (PST)
Message-ID: <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
Date: Mon, 26 Jan 2026 12:41:34 +0000
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
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org,
 hansg@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
 <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
 <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90559-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 868AC886D8
X-Rspamd-Action: no action

On 26/01/2026 12:24, Saikiran B wrote:
> Yes, I implemented your suggested sequence in power_on():
> 
> Assert XSHUTDOWN (Reset GPIO = 1)

+5 milliseconds

> Enable Regulators
> Enable Clock
> Wait 2ms+
> Release XSHUTDOWN (Reset GPIO = 0)
> 
> Even with this sequence, the brownout prevents detection if the
> off-time was ~2.3s (I got this 2.3s number by conducting extensive
> stress tests on the platform starting from 50ms to 3s. At 2.3s the
> success rate was 100%. Anything below 2.3s, the sensor entered a
> brownout state atleast once.)
> 
> Thanks & Regards,
> Saikiran

?

---
bod

