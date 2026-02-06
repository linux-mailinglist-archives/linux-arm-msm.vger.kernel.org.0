Return-Path: <linux-arm-msm+bounces-92061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gChcFIsGhmkRJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:19:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BABEBFFA55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18DCC3004628
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031D52874FA;
	Fri,  6 Feb 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCUujXYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5027F736
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391175; cv=none; b=XISkRWBBGvrh1SoipKsRqUJYqvrH462cCP7drpT2FHncxanFSsWtBLkJwnBYlyFaZEUx8PUCHArKaYbqbvzEpF8u0AuprH19nVmKbvC5BlN+g0NCDl2UPW3WZKIdvsQLUenRGlw+1KPKYRJATrDe9tiUmccRZ0btjy9rVoORQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391175; c=relaxed/simple;
	bh=ZTXrGCIwlyPxm78ocHizd70qzMTnhmTk9GwymX7wia4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yl4aNEjsmaJ6FRQ1EwneEn3IDVutdo/caC2mNGS0CrTve2R+Cu6ZaIPZN49mTqiz0Ia7U0SxW0yuxH9L0m55xuiFUTxkMRfBTI/8eKUp1QmHR/UKWlecsxu/GXUv6dtzgWnfnOVIz08c/9kd5Ip30BFJ4vI+Gu1vBG0J6OWLb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCUujXYR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DC3C19422
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770391175;
	bh=ZTXrGCIwlyPxm78ocHizd70qzMTnhmTk9GwymX7wia4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=iCUujXYRAebQ0GeUcLbPQ/pojtR71u32X+p+X7OHXtX0/e7lfvjhOamu+bOT27u6l
	 4h1Q75eSmPqb4E2zFRDbUYvgyNDpVsX3kAm2V9xVODm5U1VE7krIfHOl3KeVsfcRHj
	 72D+W/nuzVoDCyjX545XbOPu2asb31iqqD8f1Mi/6COscFdyYGVWu7qB6/6/y4PFdq
	 iPrCLt7ZAnVGTQ1d3DNpDpibwuihor/vVrZqVlCimEic2aEhrwTi23zUwOjKfPlYVS
	 ph5YPUHoHp+EIDcfBlm8qfBHvys1khFMO3SneR/SJJ4vaFEorx81zWIyCUlIAPIsjN
	 6uYrlDVfLd+Uw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so7031001fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTJP6HFYjtIB0LdEwC32R45kTpq+y+TBdRd9j4CN/2oM9C8WB86JRtLSOsIEnAwWY9x9piGjpe2tueiH5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwaH3042XUsHk93Ov68pAq/Rxa0oSiTLmONvCBDq1LJ4tbNoiaK
	9x3DIRPPFB4dYhzUuuVvaEie1Cpl0PT8Rk1GlygJt5m/4FE48TzbxOdFpg9AUzCuPYnKxINsoVk
	BmSbev5kOfoaUQVVlbV2jA1dfnweJPg95jwYKDbHqsA==
X-Received: by 2002:a2e:a586:0:b0:383:2537:f126 with SMTP id
 38308e7fff4ca-386b512f077mr10690261fa.30.1770391174356; Fri, 06 Feb 2026
 07:19:34 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Feb 2026 07:19:33 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Feb 2026 07:19:33 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260205-next-15nov_expose_sysfs-v23-2-b0c5bdcc9f94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com>
 <20260205-next-15nov_expose_sysfs-v23-2-b0c5bdcc9f94@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 07:19:33 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdHKCg90fc0UJ45wXYPn=F-dcLhDrv2sO-=VP6k4=UqLw@mail.gmail.com>
X-Gm-Features: AZwV_QgiJUQXZ-hVRzjgw-R7mQClg17M9zC6gzjmh2EQe9UsnOgD45hogWRaoaE
Message-ID: <CAMRc=MdHKCg90fc0UJ45wXYPn=F-dcLhDrv2sO-=VP6k4=UqLw@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Sebastian Reichel <sre@kernel.org>, Bartosz Golaszewski <bgolasze@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92061-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BABEBFFA55
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 18:17:14 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Currently, there is no standardized mechanism for userspace to discover
> supported reboot modes on a platform. This limits userspace scripts, to
> rely on hardcoded assumptions about the available reboot-modes.
>
> Create a class 'reboot-mode' and a device under it. Use the name of the
> registering driver as device name. Expose a sysfs interface under this
> device to show available reboot mode arguments.
>
>  This results in the creation of:
>    /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the supported reboot mode
> arguments provided by the registering driver, enabling userspace to
> query the list of arguments.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

There are some nits from my side below but nothing serious so LGTM anyway.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> +
> +static inline void reboot_mode_release_list(struct list_head *head)

I would have passed priv here as passing list_head as argument looks a bit
weird.

> +{
> +	struct mode_info *info;
> +	struct mode_info *next;
> +

These could be on the same line.

> +		sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
> +		if (!sysfs_info->mode) {
> +			kfree(sysfs_info);
> +			ret = -ENOMEM;
> +			goto error;
> +		}
> +
> +		list_add_tail(&sysfs_info->list, &priv->head);
> +	}
> +
> +	priv->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
> +						 (void *)priv, reboot->dev->driver->name);
> +

Stray newline.

> +	if (IS_ERR(priv->reboot_mode_device)) {
> +		ret = PTR_ERR(priv->reboot_mode_device);
> +		goto error;
> +	}
> +
> +	return 0;

As I said, these are nits so fix them or not but let's get this upstream after
v7.0-rc1.

Bartosz

