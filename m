Return-Path: <linux-arm-msm+bounces-95905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNi1LGkVq2lzZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:56:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C4226810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E3230305DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 17:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28348411615;
	Fri,  6 Mar 2026 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axgMx0Y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A83AA1B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819815; cv=none; b=GyQZ7tUIbYnWCGTw4SNV9YGDqVaagx0aapEEDNqRKeZpucUYEitJ3QFttFSeXhCIhlIMK1EtcBAOU2yDamyUPZvoHUyrLZ5/9K9ACCAhTrNSJQvKSgIhyucQsbnsAsLgzA/nHBNfIBBmpA2sIVJFmEZEGiunRWI7QmtgYddtxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819815; c=relaxed/simple;
	bh=CjrVcnQzVchi06EUZQAn7mO7PN16zxrfyxUhD4HdI4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7GIClk5lrjKfSSuh8rnxEdZXU710Q+Dz47+THdgnh5prXpbnPbcBuzW6ogpRcfoDSBbhVVFQyjKx3hAOP/MKb9blQBcsYzJYUfva4SNAtnLlmWBpH3AFRzd+QxCLs8BoF2pkRXHqvQ47nz2x+NUclPIbUZI1F3vgfw37uEsIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axgMx0Y+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so114565615e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819812; x=1773424612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18d+owKLsGut3KU1+skCMZJUMBkNZSDjMEjKlVuS/dE=;
        b=axgMx0Y+rKKLIYz2FB0/9lqYJ/KXHSJcEJwUwaPTEjP6/cRFKPJIi/1aANLTuXgvAg
         UeKUW3R8GovLO8b0+/VBTeMsQKxgVXv9QcI2CZr3BCTAAjlGln0Be6hEwNy2RO9uQNdM
         x8imllAFqEniGpPGNHEXZeHh9f6oDiAcj1dl32IwUzq0ZlptxP3qc0LqidD+cpnJ4cBq
         v/ba4BjSs4MRp3TWFys7e/+5htnDHttPQCm9Rk2ZXaPLEfZzAnimvF/TgDupF23wk7h9
         8mW1kU+/2t0HIPfskn12mO+iR5NpT/AguIpW16Z8kQon+zR5mwP64A2nkRM9PVCVDdWz
         TZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819812; x=1773424612;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18d+owKLsGut3KU1+skCMZJUMBkNZSDjMEjKlVuS/dE=;
        b=gfjjZpC3YKQy7gmcV/DlKHgOpzNf18junizMJpLsaM1+tYLTDNFhbLIoK55BuT/UvS
         i/wbkF+KiRms2N9jC7+d9HryxInK6oFMjyIS+O5fojWlS7xfaUdLSS6KO3ThyDGkszlQ
         1Yu5rmYmmx/7PovBzmP70xxftUJMfltG4i9UmILxCb9OgJczqNcbImtaYpUuHzOUg4b8
         iMJ8dZhTHrYSxUivTHcCGf+iXFdx0xQNg22Xj5omxWiSwNNTTqeakg0qhh3W79tCHyxd
         o4IuYPyL3RQ3iQ+WBL4RnmTmC83Gj2rN3NpDoWPFbdaSEf9YAkbEKChr7Fwqvs23QLP+
         JHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyXxYsUE7GrNxBTa0s+Vu6w1fhO1JrSI5t7HJPOa9NPVq5Cone/cZrNdpmhtfAa7fi8NMBd1VjRO2tHx4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/TU8OMBhRJkjCppyXKfZLCWc8TKaSAqQZ1k+eUTzJymS/8UM
	dXA4qkfX3xMlU1ClqqkZWI9or7yOP2ig5HJru4Kgo2prjjDCIFTkxzjiJ/9bZk9QIbA=
X-Gm-Gg: ATEYQzzw0biF5zTTDNtwab9mISSOjmdElY2xtS5n0YH3XSo/4j5wDPk/ZfdrVPbJ5DQ
	JHre1vVu59UWfZjvuh135cIJ6mB53is04P/qML9wGkvYaNrUdLZrkFX4ugNuoB5gLLslAafWAIC
	nPVji3zqzV53hnaAkfX+XMCpst/W8kWO5AqKnYEQNyOYMV6n5gYduYdtrklOSjXPsS5GjU3aIMI
	nKpomRN1YreK9UxWpxoZsgPUOg0JvnPr2jEYACZuhTVd7ESVAmDlmXEc+B7cDa6PR3PKAn0dyZC
	lDYOue8cM5MFQ7bd9brvOiTjFwZP7hYZ0ppyuWn1q3FMRRfkH8hDL0fXt86uOlgvniOd3GvpgPV
	QBaO41haASnJgmj6HtgXQ1r4MXrnXySeRTFBy74Ccek4pMRL3IRJ0HWpjsEYLg4LQHczfQLYBRB
	CTpl3H65VcbA1q7siJmgJ6q3N169ZUfr/pWVE=
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48526918939mr50182265e9.7.1772819812144;
        Fri, 06 Mar 2026 09:56:52 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb277e3sm118076395e9.10.2026.03.06.09.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:56:51 -0800 (PST)
Message-ID: <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
Date: Fri, 6 Mar 2026 17:56:48 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client
 handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C0C4226810
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95905-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 06/03/2026 14:02, Loic Poulain wrote:
> +static inline enum tfe_client  __wm_to_client(u8 wm)
> +{
> +	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
> +		pr_warn("VFE: Invalid WM%u\n", wm);
> +		return TFE_CLI_RDI0;
> +	}
> +
> +	return tfe_wm_client_map[wm];
> +}
> +

I still don't really agree that array out-of-bounds should result in RDI0.

---
bod

