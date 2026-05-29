Return-Path: <linux-arm-msm+bounces-110330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB1PIeP6GWrB0QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 22:45:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD750608A79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 22:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705BE301A92D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50153B4E94;
	Fri, 29 May 2026 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWkJ4DRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5994381AE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780087516; cv=none; b=ihgCZ+8YMPdHj63vqiMJURSPRtb1baVRxBsz9wCQumqQTCBeI3kD/ubVP22VGwrDUTGqph0ygQP9iFh2Jiaopiudrl/8/9Xj4pSnnbL5DYofexdKYUeK5TPqAY/pBnNbeRNfrD4S7fhtV6T1z6EnLg5PwMwbjBbuMFz0Eui71kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780087516; c=relaxed/simple;
	bh=L8Ni85Q06Eefx8xhs489hrJr1FXCx1F//yOGoH67cUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fz7WPtl/+ghZU9BCY8GyQuQWf1rIC30O8QlydI/sZNvld9iKPzTEm/NXA2WBMjEXn3VP/eaWb77ABiMIYWtCYON1FHbA1oAfyDD/yGCt89+8JAaIc6JhF2IAYRPi90TJGKEaasuRm1KMO95dR/mWlW7yK2/6Qaac06vzzoMXo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWkJ4DRz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CB41F00893
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780087515;
	bh=L8Ni85Q06Eefx8xhs489hrJr1FXCx1F//yOGoH67cUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UWkJ4DRzhKZCkCYz6RvZzZxZz9UyHusHpo/2r71WfFnDfg3kB79At5zvXpf4rHfDk
	 uCue7UA2kg9AOl7G0cRlkMy0Ueq5YdeO1q231gT0u7B1WrEJ9GMm8PCl0UvlW14gOd
	 8ZK8dcRFeZYUtwdH2oGEjN7NtMakXvvhAQzW0VODWyw6lkQ/La+JvRBS9cGmEkko6h
	 //QzBtrjLz9oRHbvvxL811JHZFoQ9EVpqzj0Gn0t01ClEMTzbjEbtO/WzSngndkw1y
	 qfpIAodS1KZjQ7yaP0sazeSGKBI9BcmObO9YmucoWikXBinKz4zwtIxe5VYSc75ena
	 AZ8+jpCvvQGYA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa5e0d57e5so458284e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4D9x7ibBCvOGpfbH4QBTDvFyKWyZJfok0f/s7jAkn0UsVhncrji1cG6+Mop6BH34fZnu/YCm4EACGMNHE@vger.kernel.org
X-Gm-Message-State: AOJu0YxpU2pkHoRgpbCQe68ldhLxn5d4K3CgY1MzP9e2WbfwXQ9bXcNt
	uFniUnqTf7TLRX8ed5JA9ivgR3DPAtaDHZPhCpmbq7I1Tw1owSa4PBq4UZbFKeUpXrfqMVo+g4R
	tW0aK2GQOA12fprXKt/XdPHGMwVSHCN4=
X-Received: by 2002:a05:6512:689:b0:5aa:265f:acd0 with SMTP id
 2adb3069b0e04-5aa6092a8a5mr449918e87.39.1780087514246; Fri, 29 May 2026
 13:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
In-Reply-To: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:45:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-eLSMXdrxgCj5n1X8KyHuTwiDc-0KYot+Jxdec7ziUQ@mail.gmail.com>
X-Gm-Features: AVHnY4L3CTkOpc_4zzPdNijuz6M2O9zERQnv6ya51npZUkYxUKhYGUHbKVRGBqw
Message-ID: <CAD++jLm-eLSMXdrxgCj5n1X8KyHuTwiDc-0KYot+Jxdec7ziUQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110330-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DD750608A79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 10:09=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> Before commit 14dbe186b9d4 ("pinctrl: msmgpio: Make the irqchip immutable=
")
> msm gpio irqchip conditionally initialized pctrl->irq_chip.irq_eoi to
> irq_chip_eoi_parent() only for the GPIO irqs having a wakeup capable irq.
>
> In order to make gpio irqchip immutable pctrl->irq_chip.irq_eoi is
> initialized to msm_gpio_irq_eoi() which now gets invoked for both wake up
> and non-wakeup capable GPIO IRQs.
>
> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
>
> Since the irq_chip_*_parent() APIs internally do not check the valid pare=
nt
> data is present to ensure irq_chip_eoi_parent() is only invoked for wakeu=
p
> capable GPIOs validate d->parent_data within msm_gpio_irq_eoi().
>
> For non wakeup capable GPIOs d->parent_data will be NULL since parent
> irqchip diconnects hierarchy using irq_domain_disconnect_hierarchy() and
> later irq framework trims hierarchy using irq_domain_trim_hierarchy() whi=
ch
> makes d->parent_data as NULL.
>
> No functional impact.
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

