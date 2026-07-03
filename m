Return-Path: <linux-arm-msm+bounces-116376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VaRsDhf8R2opigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 20:14:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBEF704CF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 20:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ra4xy5wv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F7EF30314FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 18:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF5630D41E;
	Fri,  3 Jul 2026 18:09:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE793112AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 18:09:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102193; cv=none; b=DAVciXe+JJNnNnZ0n9ROI4W2BV3Q/d51coNFNMRKmDDqXk/+gVV/mGLj9xuYTJPBzfoMw9epeF2RHf4wGQtWlIGybd+WcuLWpEnigt1Gq6rI4/MLcKiuLTB+7sZkHjBEfMuQAvVX7UL/lgAg8VQ8V3FSEPxl/6+zUXS3p5DjAZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102193; c=relaxed/simple;
	bh=tgraSq/9gwcx1TlvQJClsEB9nYR8gJqZ8hIiRgK1PwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/lOPeDhQqIz8Z5+tHu5xICEBGE2jxcOylxfg1fxU102KzqmhlDmBn9pq69Hk6T7tqPKC3dwbUQP97qsmhDSQonfpotAuIt8nVRmnK2nTDTXaHuL1FKaTs95IiIpTSi5/ciGHs0y1BJk/3fWUAskvLWYj9Qj70Gft/PcOcvAqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4xy5wv; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso8112335e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102190; x=1783706990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=ra4xy5wvOi/TPR2Z34MK32O/ruNxzV+1v6h5iMDy1P1Fn3UGUdPZM2687Pony5MH/s
         WLLI7YRHTn4SPDcZsIu7rwolyAPhKocKplLXYQIeCbqypXDo9Bgn9zyBZg+AYgdPS3c1
         aC0uv6QHm9h7b6sKySLAA0Ho1VbwhCEAwnI9dTQ4gsjtlUt+MTijdQasxwuPvJmyQaOV
         k9IObRwH0OUTZ17q3WKTOsLRgxAQMxGvzdvs/u9wU4so5i/GhP1eYPxkJggBq5exxNCC
         umrd9HSyTHQypGHWdLak08XO0Qr3hi3XOCH5195z4JS1UN6UInIl2mW0V978DqbgDTOT
         D3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102190; x=1783706990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=oTv1zi4enKF+1XYr+iGKoXtJEyQmFXx+rQw0C1AhVN0JBHF1GQ14SO2v1kZ0vt/cLk
         rkiHckg7dKg4hjCHySUb6iENYMtWX1MNy0LEJ7dn3qOJftE+agsNUAmEUPlRrp3hjnqU
         jNpCILMqjswk1ltSIzvcpV7YPcCsGoDjF+6JYs2HMwgMn5KuWuzCh9Zh9JdS5q+X5upm
         gkKT3y3bOogvueao/akR22bSLfkknSIKbvxNQnHY/Gee5vCi9tI0qj5vA4zCXXpfAeUl
         3r7WQd9WzsxkA2BrexUDLCLUnO2ie/HhkgNTRGksFJSPwLAKCZfGGuCWXnY4+byDOx2E
         6Wyg==
X-Gm-Message-State: AOJu0Yy30Ztd/gNbm/NDCHov4RKL1eG6hvgEzAYSU8GBz40qYeF0kjg9
	/TX/luZPnWOVKCRXJj4R8XlcZ3BLmx9BtaS2pQKBMxaS/ArOrzYxMZDW
X-Gm-Gg: AfdE7cle4/UQXSS11VvsRNdeq71IQrZvK8DcWuT8sLWJYm2BT28fM1/SUPSN0pk20wG
	/aXNLayLjwMcuX/r/waPqUFRyhJsRhhPYA34NRXN3860DaycTTv6Hd/W74W9VZTrh+BXlJ2b/TE
	RtUCBg91qS1X/nwfryg/obH8CdtFeuSOd4qasvz+OruCVJUT0cpx8xgMMcLzgIoa5vCGpv9PFbF
	VgN5bSlFKur2/hnz9ksL8bRSuQ0BWND/nVGFkRd0IIBrRwrZQANJr6BlnemC8gTbdXramwmYQ6u
	cA4+jh4w7bsvXwvaL51T4BSWSrj8QMPboLQvXV6JwDMmJ0QEf3A2yQAmpXlXC8RuGmkmXYs+0SD
	REAnlJQ/YgTV/ixfXCx4HAaIt1ht7/VFJgW116KtIFVRohi1L3q4VODOT7OiSc4ayAT0/2lMAUd
	R/BA+KvQ4sHVoA1StQ8Q5WVGxXgKLmkwbFiLN5wa1CEatHliX8b1vyfe5CIQD7ICcqvAFLtzFat
	MIix9De
X-Received: by 2002:a05:600c:314f:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493d11cf274mr4122605e9.8.1783102190297;
        Fri, 03 Jul 2026 11:09:50 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm1044214f8f.33.2026.07.03.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:09:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8a418031-4bfc-4212-a7e7-0d88aa4621c7@gmail.com>
Date: Fri, 3 Jul 2026 19:09:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Casey Connolly <casey.connolly@linaro.org>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116376-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DBEF704CF5

Hi all,

On 7/3/26 06:03, Gaurav Kohli wrote:
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS
> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
> +	  TMD messaging and handles QMI communication with remote processors
> +	  to exchange mitigation state and apply thermal mitigation requests.
> +

QCOM_QMI_TMD can trigger an unmet dependency and build failure due to
selecting QCOM_QMI_HELPERS, without ensuring NET is enabled:

WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
  Depends on [n]: NET [=n]
  Selected by [y]:
  - QCOM_QMI_TMD [=y] && ARCH_QCOM [=y]

- Julian Braha

