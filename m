Return-Path: <linux-arm-msm+bounces-118687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/lhFuSkVGrTogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:42:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F75748D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=g1N7gdG5;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A803164D0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00823B4417;
	Mon, 13 Jul 2026 08:34:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33B3B2FC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931674; cv=none; b=Qkl2pxFENonxd9InHEanta/XReAP405CiDIi+dbkegjyoo9ETSzFqjhABZfTK24jp3abNP6O9eblyLQqCmwfFRNn21nh8EP8XptMOts9fmGiDMNFME5XNs5NQXMhEasyOKYd4sq8SJVnbXOoXrLrJQz3HTSNPiNUi04aoXT5bY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931674; c=relaxed/simple;
	bh=3jgcZ8o1zrd+LpKWxHjCs1BSQBs4rt/MQMxp0Sktki8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X02mGASpDKQTdxlBXeh/+4xwi+61w26aWPCO8l6Tdr/R2UjjST53P2mP+WhtIo6mHgSwlu3Ev9zHqiNurtjnGziYtUc81FXki1IiyZ7k4xRc0gqknwhPttR4qCBqLabVdMZYC3Iws8Z9jkuB0oXq6oPWFuwaaEU0gu4LHqupKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1N7gdG5; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15f47e6297so343705066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783931665; x=1784536465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA2cjAX9vtTnvbyes1SFxozVo0D/ypmsrdhxlEKadJ0=;
        b=g1N7gdG5TO6piVXwgT+v/2SSwDsDtEZFcAgITK9TccgOMvjyWModQhcnSRt2S3ErsT
         ac+m1sKjhc1gCQhMpyv5p3gKicYVZ8dhFdRzMuZY99m2hqwGWrQCglWllZdBjiJFMsKH
         r3bJZ89RxZ2ySeWytLcVxZKNzRrEcHqk3ad56gdlhuAqwoPzRxvbkc77SZfX79sBJ3zk
         uVG+WrHlaVSGNIMlK6mFseSRJCknlfqbO4PE7QLuNs60ufoVykVYYnbKVcJg5dsSap+M
         cq8gpcs29onVJKXDdjTG5nssyeDIRlPi6C1Lh4/G9lNQSxCNCqRydT0aJ5L6J+fo+fGE
         TSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931665; x=1784536465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA2cjAX9vtTnvbyes1SFxozVo0D/ypmsrdhxlEKadJ0=;
        b=QSBL9SU3EyTW9EGpwSDDIAHIrrfijLWHn9QqU0CPcBO9QCBlHaegpAofBoA92iG5VI
         sgH6soZBaX05MAyPk2dY/kTSM0OQH0Jkk9D87hhKl87nP5udLZyggnFFCfzkZLle4rFc
         c+kHV5R7bpFbkwm8Dot14ZMRJMB/fwc1DRrEtrJbpL+l3KNv7GRTNlOvKh28QloX2EWd
         m9QvSlxAGyV+l2mUjP6qKzMm36pLf7Pg5EHVZDsMG3Kg/rL/06WmdkY8XdFIxFWTWliy
         sBVJ74qvpeEjaXXhkFOa9Mc/2P4Bpu3xbIUyxRRxD/7mWP3hv2Uf4TA8/jva2Zp2SyKs
         8OtA==
X-Forwarded-Encrypted: i=1; AHgh+RrizehaSPYDprgupbC3laDsPJH3/XX+nmB8ZSEkyNGyNSA5Z9NGLWt1Ppc2bDROwbBnFEqy6QSFmAi3KHpn@vger.kernel.org
X-Gm-Message-State: AOJu0YzAK1WIJ7aPjSzxpQ5qKhnlTnYkWYnsTl0c7OlT+dwTID9aDc3z
	g1LpCldXP013nacZkDjYGNQNCUly4qvHVzzioSIo2M1pgkGnUdbwht+t3a+52glYF7s=
X-Gm-Gg: AfdE7cm315j5Vmj73Jr0qefIeseL98JzAI4WIkY0KP2Vrch/XDZfkkw+Fa6Mry1r/JN
	SKn6uvyoV36irraKwES6U37Dkr+KOHBzmZiYnJS+sLoooM8S9TbYB8GH2kigKqlZL3pW78MtSxB
	nZdFyv8IDdrkdLTQwqyDP03hC4F8kDJwYbP4KLGT4Rgx9vz2gQGfMqKrPD+T6xYS9CJGMm2PEDA
	l70RpY5Ou5Gd2JSlDrD/mRPCAfsjbLowAJ81X0FyzWDzmESXvoFw8YIFXhPU+LrYj9PJdG9rUES
	07Iw4JjzEm44orVS8jQc6URaqoJsgCgU5IDHF58+lAbeGacpWFOi5E6kRLAJJi5762AnjBxQC0/
	FP9YRi875BsBlQykt4aThaRbJ2b7kylpdYTJ4ud4F+MkxO58eEUcRzrDR6aW56yUET5EQAcwM8T
	BrGZdDCGo17/nyTpYp8NHhWaY=
X-Received: by 2002:a17:907:1c89:b0:c12:a16f:6867 with SMTP id a640c23a62f3a-c161e8b0271mr353954366b.26.1783931664621;
        Mon, 13 Jul 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.2.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm979905366b.13.2026.07.13.01.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:34:24 -0700 (PDT)
Message-ID: <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>
Date: Mon, 13 Jul 2026 09:34:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
References: <20260713080631.GB1275@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260713080631.GB1275@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gremlin@altlinux.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtesting.org:url,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F75748D68

On 13/07/2026 09:06, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>   	unsigned long flags;
>   	int ret;
>   
> 
> 

This patch makes sense but doesn't require a Fixes: tag.

With that changed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

