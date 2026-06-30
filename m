Return-Path: <linux-arm-msm+bounces-115411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qU26DO62Q2qpfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:30:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C586E42ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:30:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=hwMp78is;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE5C3084EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0741540B392;
	Tue, 30 Jun 2026 12:26:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9473EF652
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822373; cv=none; b=V1ivM3azcAZuyaYr09U9FKPZtJh1oKbG+1ZYyS9ilx71He9gnm8h0axH7eVR5ZSmVgZxjNyb/HY3Lc2QiN++oWcLQ2FsSIChHQHiAlaWh3J7E7xgGhAwOOX0/ZwCcXPsN5AgkHXBLNhJZCLuCzkpOv2ScbXv1l7GEKh4KrD4D4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822373; c=relaxed/simple;
	bh=iNZdEwsKAsDKmuUkLTwjjBV6QowQJ1zKUsUe+DlegcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ow7NS+ADncFFy0u4S6iycT5SfVh/N+4sjf1GzpB9A+iJdgGsQ5s9nhvq7P4Uo6wvSaJKqlhF6ZxRU3DukTgh5IIxoiHENGlrTu/tlhLdVWQ4AdYI0hqo3Mo8cHijz3DZyInDfTf6IL1B5cXa/Ow4v7T/DmmI3nYyqC9PCrxdQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwMp78is; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso7588361a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782822371; x=1783427171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BA2X/zcRsTk5hQYuVduQ2jmFWHnaeTrwS0kSMxtBRhY=;
        b=hwMp78ishpNWIJm342X6Zc/jOIq3cOvUliathnzfnXYRzyLW+VPTHwZBf/+6MS/2w5
         bKFkPoZUXBPfQaz1dxTvAsTzfW51xntvHVxhh0OB5R6O02RkVJDXjdN0DPtBMr+982/x
         LMAd38ZCAhOpqDZqP7kvl70pkVp4H5bMz1e0UL9sE9+vC2iwee8Q1ISzLXpW7WcUyUkA
         id/bA0lmVUEqN12uY/0sPonO+UG+WGEZZQSBXKatmXNJAqUwhTPkm9l+FlCChAvgWdtT
         ulGOb5RFTA36m4Ea4dPbvR9GX2yeRtXWY0aR9ZindtvAT6mOWUrYbhyb3xGErylAh2SU
         ZuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822371; x=1783427171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA2X/zcRsTk5hQYuVduQ2jmFWHnaeTrwS0kSMxtBRhY=;
        b=Mic0JZUOhpuq2u9MzlmHafJxvJGt47VLwY/OrXW1mzGRXFZSnHfcegzp0DkEAIFzz9
         gyMNkL81uR6+SBVLfOcykOm+zwkCoRTyVI6oV8Hw8uFT4+q4Vm8vjFfw2/ElRnRGu0vS
         PH75ZtFT6NHc0SWpYFmEc2uuARe8JEH3JD7LPjRVuoTZIy5eYKjXF2RUUOT5/JXrV7E2
         zdLdD2JXdv4uhKIW0vtGFh4F0YdSMy72gXL/D+KIx5LHEIdwl9MiUsUWkHJzbsYvBQe3
         /lWF8GpDjG0vGnPlcWyiTVM6520NyHnstsHhZ0MhHOBaxjiGFJ0wCfDMxDv3ffdt7E1b
         axTg==
X-Gm-Message-State: AOJu0YxDu0KZYvb/qnrkya5qYdlvOsb2+km1AzLFzgnVHf2IWpmEKORz
	WKKSVTloLStVUUr+VtyHvEuebMXUCAxqjywiHS5SN1LUxUviuLq3d1c2XADxr7dzSa7xHBG7JWS
	fXw0G
X-Gm-Gg: AfdE7clxb6E9go4+jhA6+RTGd9GV2h4JonT64HZT0Qlg1OPu+cUBWm2TafkFWyvMB1M
	7rh3KDJt0JWmol2ATd6Wv3hATxGKp+cGTNjWVd+/zWTTzPZGZ5kJfInRC+NdRSFkk+JTqUritQs
	UwFqf2DM/XfqLXOlTpKN5zUSO2VB0QrIr1BwV1juXB7N3ui+YIcE2QOh4Rcg6lgT9meg2ai6DM8
	Tb+MKCCUdhmv/2bxaSENvxoZqvmumSsGeD062rAtxP1ALu7qc/2ZSH1MRQY8gND1/rbxwYDQZl6
	lmi8DI4N1qENIE6lUxMUluJ7s18GuArdhTtfmLujeP6M52O/jFUyQZfQoG8RDjGxB/BWkPsu3pY
	8ZDc0Vg7ba3I89FGDWZC3LemEivy21jCd99ShtM0LjmYtQYEfWQ5qOsUvFvaJF+ekyDWwXtlFvp
	PXbBmr0biBxHFL6Cjl5r/jtaBWjw==
X-Received: by 2002:a17:906:308c:b0:c12:86a3:d18c with SMTP id a640c23a62f3a-c12874224c2mr101140266b.59.1782822370707;
        Tue, 30 Jun 2026 05:26:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.103.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm115825166b.31.2026.06.30.05.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:26:08 -0700 (PDT)
Message-ID: <124ee5ab-f065-42b0-b8f1-3a61fd3dec59@linaro.org>
Date: Tue, 30 Jun 2026 13:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: avoid uninit values in
 dev_dbg() error paths
To: Vasiliy Kovalev <kovalev@altlinux.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20260630120114.185169-1-kovalev@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260630120114.185169-1-kovalev@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115411-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kovalev@altlinux.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,altlinux.org:email,linuxtesting.org:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83C586E42ED

On 30/06/2026 13:01, Vasiliy Kovalev wrote:
> Several functions take a 'goto done' shortcut on regmap_read() (or
> switch default) failure before assigning locals that the trailing
> dev_dbg() then formats.
> 
> Initialize the affected locals at declaration.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6..c8379cdcb6da 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -366,7 +366,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
>   	unsigned int misc, val;
> -	bool attached;
> +	bool attached = false;
>   	int ret = 0;
>   
>   	ret = regmap_read(pmic_typec_port->regmap,
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int mode = 0, currsrc = 0;
> +	unsigned int misc = 0;
>   	unsigned long flags;
>   	int ret;
>   
> @@ -535,7 +535,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int orientation, misc, mask, value;
> +	unsigned int orientation = 0, misc = 0, value = 0;
> +	unsigned int mask;
>   	unsigned long flags;
>   	int ret;
>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

