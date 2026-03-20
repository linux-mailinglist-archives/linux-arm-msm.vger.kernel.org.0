Return-Path: <linux-arm-msm+bounces-98968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IZgDquTvWnY+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 19:36:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB92DF833
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 19:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73CD730B3F59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69203E5EF1;
	Fri, 20 Mar 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBl+rERW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CA2F691D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031367; cv=none; b=psjva+hJxgfaFn/xzIW8cNMrdva3CM0yoVpADi582W7m/QKGB6xjRnnly0ze9A+93imcCYYniI4AvKtH5SVtfWvxtC+NZT4iYkpL7DT8v9xPG4i2J0K5bTLXZv7sHjsZWcrRq+bz4bHVMLlSCc4EnaU39nNjQv2tMvNrzlMPXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031367; c=relaxed/simple;
	bh=Ui1LMtolXUlaS9y3lEyQSIQB+UiTyBSjgH+rPDVPRG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJYcshnPZCM0svpqfHYa8vIpeBOx2TxH0ypREufyU8LDLo/5Nb9b9LT8C/QeVGiLww5+BBNv7OSJ2s00y3y1mJf39/rOjD2yRmjBGGfN0Np7rpGd00NUucZakqx9QUoXqgUhEmBkkgQm9UFBNLT0YrYOTVeKzBE8akgyb42lYqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBl+rERW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BE6C4DDE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774031367;
	bh=Ui1LMtolXUlaS9y3lEyQSIQB+UiTyBSjgH+rPDVPRG0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rBl+rERWcLrlYKl/SjKqlgPjZl+6AExaY8d0XVznzJZkqKM9GK4BDsOgxXFM1XKwm
	 hLYXkV/zyIH+giQozNL7buuUWBRVcsyg2I2cR+ZCvjQRozzk3+R+u9toNcQj7kvGd5
	 NnsXe9NmkdePosVqxmZRUpsNPerYWiF7Hi+aCHjciFdBA4+7sVlX0ewb2MHNCP+kSK
	 dvisiofeP+whMKa5VdmC7AqFiPIFyURLAK7JYwxwbXWdmPffzjw3mVYlXw+yQIqzBS
	 A1ugjfdehUY/ckORhtVuOeAg5PIneb0mKvPMiHqyr0+a9qm9RtiBtlCExVB5I0KX5Z
	 53b1HQr7gB7uQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40429b1d8baso819368fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULcW16wtCOY21K7SJdxVfIkWrYBpWuRnWt1Y5w5O3+jvbKg2deh7yADH0Y6hrn9FNsAkXdSxQx2sdywJOS@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwcsNpeuAz8gWaGycdS2MQnH5tG1vj3aKIovHkDGE6TkXgaNs
	Naos804C6FgbAIOhxZQIJo5ds8CkeKc7M3OquRdTf1niaZHfxxmhi4s7pV8FRIXO0n+i5pAnO4j
	mS2lKY1KYyd5LonJHvHBqfv+ECbBP/VU=
X-Received: by 2002:a05:6871:3851:b0:41c:25b1:9318 with SMTP id
 586e51a60fabf-41c25b19ab5mr1162173fac.36.1774031366491; Fri, 20 Mar 2026
 11:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
In-Reply-To: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 20 Mar 2026 19:29:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hv+t8=mT39-xOkGUS5i6vckJxwfQfqGZ4foxK2rFn8gw@mail.gmail.com>
X-Gm-Features: AaiRm50lpWFrKCn6KRaJTYKQwv6QBAgtF8jFi_EETMk7a9ySSewrI0ssB9gKKQ4
Message-ID: <CAJZ5v0hv+t8=mT39-xOkGUS5i6vckJxwfQfqGZ4foxK2rFn8gw@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98968-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.869];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 90CB92DF833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 8:38=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> CPU can get IPI interrupt from another CPU while it is executing
> cpuidle_select() or about to execute same. The selection do not account
> for pending interrupts and may continue to enter selected idle state only
> to exit immediately.
>
> Example trace collected when there is cross CPU IPI.
>
>  [000] 154.892148: sched_waking: comm=3Dsugov:4 pid=3D491 prio=3D-1 targe=
t_cpu=3D007
>  [000] 154.892148: ipi_raise: target_mask=3D00000000,00000080 (Function c=
all interrupts)
>  [007] 154.892162: cpu_idle: state=3D2 cpu_id=3D7
>  [007] 154.892208: cpu_idle: state=3D4294967295 cpu_id=3D7
>  [007] 154.892211: irq_handler_entry: irq=3D2 name=3DIPI
>  [007] 154.892211: ipi_entry: (Function call interrupts)
>  [007] 154.892213: sched_wakeup: comm=3Dsugov:4 pid=3D491 prio=3D-1 targe=
t_cpu=3D007
>  [007] 154.892214: ipi_exit: (Function call interrupts)
>
> This impacts performance and the above count increments.
>
> commit ccde6525183c ("smp: Introduce a helper function to check for pendi=
ng
> IPIs") already introduced a helper function to check the pending IPIs and
> it is used in pmdomain governor to deny the cluster level idle state when
> there is a pending IPI on any of cluster CPUs.

You seem to be overlooking the fact that resched wakeups need not be
signaled via IPIs, but they may be updates of a monitored cache line.

> This however does not stop CPU to enter CPU level idle state. Make use of
> same at CPUidle to deny the idle entry when there is already IPI pending.
>
> With change observing glmark2 [1] off screen scores improving in the rang=
e
> of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having tw=
o
> clusters each with 4 CPUs.
>
> [1] https://github.com/glmark2/glmark2
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/cpuidle/cpuidle.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3=
ac78c081868c2ad 100644
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device=
 *dev,
>         bool broadcast =3D !!(target_state->flags & CPUIDLE_FLAG_TIMER_ST=
OP);
>         ktime_t time_start, time_end;
>
> +       if (cpus_peek_for_pending_ipi(drv->cpumask))
> +               return -EBUSY;
> +

So what if the driver handles all CPUs in the system and there are
many of them (say ~500) and if IPIs occur rarely (because resched
events are not IPIs)?

>         instrumentation_begin();
>
>         /*
>
> ---

