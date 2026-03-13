Return-Path: <linux-arm-msm+bounces-97457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENBvD2gAtGnCfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:17:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C142282D3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27F70300A598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D462339185F;
	Fri, 13 Mar 2026 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2zuPGlI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CA1FF7C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404258; cv=none; b=pv560WIoElbpJxcdOSOeoTS4xXN+/pgeAE9InQavDoRz0v4aCrYvzhgoA5XTItJjKSDCfYfRVV/SCkSuXmwfNN/6vOtyxqy1Tvnp3HjMlJZvzpCYhXxybMMrH0rvRk4gOstcqiYrbWfisSrBD+IHiKFJt3m3aHFsb4L2C5aU9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404258; c=relaxed/simple;
	bh=dH/LRUSNBatrGwHvEX3Iy06egEiIiZiFcoxmr7F53lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IU9FdC1dZC90skuQnU3CUX9RdqsUnwIP0jSRHrm3OKsuhcBzteTiPZqYb71jxki1rVGjQ1eUgTUYzgNlz3NQAqL5fKit5kv0ssQRZ3c9QsEpve5M5OaqMniD84s2bwLptjvBWUPi5iO1REIcO11JXMsJcP5M2NI7FsdD4NdrpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2zuPGlI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9734adc503so361027466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773404256; x=1774009056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3s5B4wCXYFxF46H+9RZgBJPAFEqIaUF6//FgPVVAHcY=;
        b=S2zuPGlIvMArgiJbiTh839YX2dUIZitVPKFFfae4E4KrnUwsEU5zfTDpwC7/yPuxne
         46IoNzj5dgBt//MxZK9J5PVdo97x0hOe90mChE0M1AXFizXkWrPyzt0tQWFUnWdFNnJW
         2twpsABjZgr2XSOC2ytpD4qsYfhhiZnqXehNVc4QteLvDl2UiC71FbcHrpCGGIiYQbIe
         YUNjD+leYjMZYO709jzCqiIxC7jDcuIlLG3XaMvCjRAD07ikJ7lHwOJJ6lkzmoiWkG9t
         s4pE9n+q0NQztZiDV14T5oMHac52F2clHH/12FfXusd/ECoD63K2IuInIVl4/SZuXqEF
         OZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404256; x=1774009056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s5B4wCXYFxF46H+9RZgBJPAFEqIaUF6//FgPVVAHcY=;
        b=OgvesDd4s6m0f1qMtqKTdh64uBi5/0gi/4dLjrlRynhARsb0U4o5NOCKWAEfnoCwVz
         q8+7+LC2ZfMiZw1qILoTDG1AhyVOp3TwPxlwESXSeVcsffw3mES0dU/Uqv9fWD6v5SXu
         wXd/ahqaKruGAydRCANnouf5ICf/+we4klkFt6gbuu9pKOhf/ur6hplegcU52L7cCDKu
         dpNZx43m/GtD7PcuMylg9woZ5pu5hi7zYxgcHftWoEYd0o0b/MmYMYSnEirmhBhYzdUO
         KEgeN7tOWXGpLo5SG7C1CuKWOFsXjh0XoidkrYC27FaY5Rif6N7TVl35WcRUj5nAsR4v
         4ASw==
X-Gm-Message-State: AOJu0Yymcdm3OVW6d99JhLnP+EBIePx48qtlOctGVaTkxPA1voAuS9sL
	ZwJSZ+GkgyiwmYfMMBFjjVptidaPdH/T2Olc5lmie0jIdV4Wz9Dw5KA9SVgBuSYpRFa2zCu972n
	9lVa+2Rs=
X-Gm-Gg: ATEYQzwCh5cU+lEEJN7IVOrLIA5jlOtUwaHLA695UUSduo5RrfSRdUIeVlmrpB/FpsL
	FCH9z+MZZ4s97MAraQ/LMZyJPuRvcdOrUjWaWu9sXcl38Bg9hTxIIkif57ctw/6hkdzJkQqcnYm
	CNolYkeN6NLRQGwmwq+WBTYstzex4t1riDB6rxxavrUSqtDeGRFqCDPsVPpQ0CTEBjaEQ+QXyaf
	NtIueMmLPGVb5KEctjm689cL41ufp8t3qggDxzB21/AiOLuz3MgFKUrqaev1aUDRe7KtjRkI4FA
	LfV+yLvskF7dNRbz6wEncaipm0zg2BLJgXvOJPGNVPQIoLKIphzFzanr2H2J7Onhx+9AO94CrFr
	qWa3Ykw85EBymBhueKUJKfW8iQQFUzyE1fQQYP1GmM4sZzg70IwYobokdHF6y/YK254Kzg/Vhoe
	zWxYg17/F6tNFET2BgtndevH4sfpSZJjLn190=
X-Received: by 2002:a17:907:174a:b0:b96:7e03:166c with SMTP id a640c23a62f3a-b97651b4282mr160852266b.53.1773404255612;
        Fri, 13 Mar 2026 05:17:35 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97756e59c4sm23182566b.35.2026.03.13.05.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:17:35 -0700 (PDT)
Message-ID: <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Date: Fri, 13 Mar 2026 12:17:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97457-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C142282D3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:29, Anvesh Jain P wrote:
> + * Read Response:
> + * ----------------------------------------------------------------------
> + * | Offset	| Name		| Description				|
> + * ----------------------------------------------------------------------
> + * | 0x00	| Byte count	| Number of bytes in response		|
> + * |		|		| (exluding byte count)			|

Great to see this documented in the code.

Please run checkpatch and take heed of what it says.

0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch has no 
obvious style problems and is ready for submission.
0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:184: 
exluding ==> excluding, exuding
0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:224: 
exluding ==> excluding, exuding
total: 0 errors, 0 warnings, 0 checks, 28 lines checked

---
bod

