Return-Path: <linux-arm-msm+bounces-99700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECT3C5OzwmmRkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:53:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 750403186B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 792B13082D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2A7352921;
	Tue, 24 Mar 2026 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1lXF4ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53B35F190
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367204; cv=pass; b=Prn95mcqCzbsZExMLJucIdnXmYY4Nm0hboZIMAWjaerCNzv4pBvbTuqrzeXkmaq7AUijsDTc2SKJlyibEGH/wZuC5h03AblAHOfolu7g2h+t1oA3H12EaonlR1yuHVPGtP3HRDUgl33U5U36GiSq+pu1+W/HaBo2aMhGeZC3rls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367204; c=relaxed/simple;
	bh=myealnjHRpNkrPuC+NI071bKS4zheQrDWTxXlU2rEuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3yrDijzHlmBOoUXAKiwmWmFgfk4761fPqHPuqu5RGXa1+xYfr0gDv+VPL8WupkPq9AoCyOpLlBPe3inUOjzJPAYeylj3JiytADqeT2y5NC/0tW2sQd4Bj7G5b0nWzEv+SL2Ln+oPmkhzW5lUo15B2lksMSaw/XcBe8vM2nZrrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1lXF4ad; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so5042105e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367199; cv=none;
        d=google.com; s=arc-20240605;
        b=JDycNsPzmK/N00RJOQ9rhCcveTGHl+O4u+qybIJ+QMUiudX0tG7wC8So8l25y2uUsS
         SsLJhUzlwDJgedqVzUuKhbn5XJZxMzYbXqX+3bKNupHVIHHIBx/4hrGq8iPycyzr3nd1
         KoDu69ECIqfBGsM7fcbt9mlGkHCTeTrFF6eUdpAsWreiCi250U2YLjnxTYIvSPBFpFDt
         I2I/GjBmO1B3cpgIbEexij2CfMi6vTXVzxHDyXnCokwO5Np2oZQ3833r5foIdXqUN+bu
         zAaK2gOIFcyomhlrAIsfHcyWDDN65OM5F7hhIePReGrJzoePdd/5aITrmKbkKzGBhHOd
         J0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZM1xEwGx87iUs7rsSEz5+XXJ45+mZ7eY/kl/Zbvofbc=;
        fh=hfqGGpGD8E8aJRGtBxn1OezZk0FinW2EXoEcPWwKnqk=;
        b=OdIvVK/Iin+X+Nv7nySSxpjEdkqCgNrwvkMKsziv9JFow5lm8k7RuLKZt6XirsAeZJ
         +L9Tc25gszm+Nw2zXACB4vtE1wez7gyzmit9+oZjOd5KcYXFkyLcmHnWLLWX+QRd9hho
         pUFcbmMw9hX1LI4pV2sVm2fWiqFJ2ImQ1ayxKnKPh0DzpOtFjbCHM9PZUh7R8aBzhnAT
         HhtC7kIn7L+JoDIrQUSNudhpqQGho48ET10mbbSKaE8OkEkn1JrsHxjT1UtOxh64KWqu
         bTc38qIWtjJE6dWoXBA1XScBSgFwPYdhktzwsix0C3XbXsogvfbUGlZYh0uAPx4U/QYg
         LRvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774367199; x=1774971999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM1xEwGx87iUs7rsSEz5+XXJ45+mZ7eY/kl/Zbvofbc=;
        b=Y1lXF4ad/OTUIeHjeYU7ap56/TZnzdQQsrJDJDlQMjG8udHYjzKh81AIai+evDe0FN
         SwyX85unoW137PvEKo6UeGyHV7ImzN0WwFIqD4hwhaQxx9ybTVlW+2QLXoTEm85zK3cN
         trsDo1en0ob4NfAYsf51sbR2GtbL+gmh1fr0fWyuCiHj05Cz6AHQtDErHrcEx7PtQMz4
         CLDbb+Zigi/PbIxR6f7JQ/C3svSAs/zLtXCZc5ghJt0IMdi+ynFJoZOowPbVwqvNDF3H
         G8AZGsDa8zfAQy39gRTZcudHdIF/YWPQnQY3aNKk8QvxeI3RcAvttdoNwKYJ/d3KLlHU
         IJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367199; x=1774971999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM1xEwGx87iUs7rsSEz5+XXJ45+mZ7eY/kl/Zbvofbc=;
        b=JiQI6QkO93g5r/Nzg/ff3DY/F3LWXHN3/aKYp0o4Dor3N9CPGqyjIYbYeHVRuccNLR
         B7VkyNDM6kG1oG6IwCMr8nfUiucpTAT0K7HODrNygGnBGJqa7TONtyD6m2MwyNNEt5KX
         H9wkWgBtht+BQHKeeP+pQiKluDKbnYVxdLs3m//qXFPnvexWNu5lCK4Sm/mtn2jNdFsp
         PA5eHApTdTTkKK5kLS5ZP1DAnZLCWgX8h/6tYJWflOVabGqA64zAGkarlsuKfYtTa1OU
         R3iKeP2v0Ru0hQYJvhBhWb8jqSQmyLBQY8yS4Mu4D8wWcXKRNQl0po7eZQLA108WErd4
         jRWw==
X-Forwarded-Encrypted: i=1; AJvYcCXfB/m+vAfo22VXz+rE6BF23c3fwkO7lTe9esKueM1DkRt9fThcxsbE5Whh/Osnti44u+v5ThDldUjdZuty@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHtDCL3fjuUsPmSWj4kBHO5TnBOqJSRS9N5qaup6x8GI1FMOf
	wgC5P2exkMU0USvDy3qQOgMXORkKSVStBFHPjwc8Wznm48MyGhh1OOqfx96oYrtauhJ96cg0aDL
	zXMkeze+0eQw/YHYNZse1S02/8HCPSjJdb2sIdiOfhg==
X-Gm-Gg: ATEYQzzF9mQM67nvSWDtC8fMgk3r3ZLQpKV7bmXNcoMIyu7Bf+Q67VJT2/h/TTZwlaU
	RBAABQzL87Rh1DM8O5SEYvHg8e9TEb0cBvTuGJSGYlRDZ8Qynj1aVbE1oq85xptlSa1wOqoEuXF
	WKHppkVwr+9kqJj732uw0ppPpTJq6lq4n0OtGBCnVSXy/+OaxYJr0/CxWOyymo8bu4tMwqKjMvf
	kbGPsOVQS35Pfb79WQXzPm/KerTb8sta4XyuK0xtkWCnpnnqtKFf30Um0OMV2kzV041/xNyPO3u
	q/r25kR5
X-Received: by 2002:a05:6512:3b13:b0:5a2:77d4:1043 with SMTP id
 2adb3069b0e04-5a285b54b7dmr5517789e87.22.1774367198561; Tue, 24 Mar 2026
 08:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
In-Reply-To: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:46:02 +0100
X-Gm-Features: AQROBzArOop2zxB1wGihvKREx53zwjJBE38Iy4OR1x3l_zaCLa4QZf1aF6IScrQ
Message-ID: <CAPDyKFqJX3rN0GY1j3-RDXGc0jCcMTG=OmWzi9+2y7CXJOvY3A@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99700-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 750403186B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 at 08:38, Maulik Shah <maulik.shah@oss.qualcomm.com> wrote:
>
> CPU can get IPI interrupt from another CPU while it is executing
> cpuidle_select() or about to execute same. The selection do not account
> for pending interrupts and may continue to enter selected idle state only
> to exit immediately.
>
> Example trace collected when there is cross CPU IPI.
>
>  [000] 154.892148: sched_waking: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>  [000] 154.892148: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
>  [007] 154.892162: cpu_idle: state=2 cpu_id=7
>  [007] 154.892208: cpu_idle: state=4294967295 cpu_id=7
>  [007] 154.892211: irq_handler_entry: irq=2 name=IPI
>  [007] 154.892211: ipi_entry: (Function call interrupts)
>  [007] 154.892213: sched_wakeup: comm=sugov:4 pid=491 prio=-1 target_cpu=007
>  [007] 154.892214: ipi_exit: (Function call interrupts)
>
> This impacts performance and the above count increments.
>
> commit ccde6525183c ("smp: Introduce a helper function to check for pending
> IPIs") already introduced a helper function to check the pending IPIs and
> it is used in pmdomain governor to deny the cluster level idle state when
> there is a pending IPI on any of cluster CPUs.
>
> This however does not stop CPU to enter CPU level idle state. Make use of
> same at CPUidle to deny the idle entry when there is already IPI pending.
>
> With change observing glmark2 [1] off screen scores improving in the range
> of 25% to 30% on Qualcomm lemans-evk board which is arm64 based having two
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
> index c7876e9e024f9076663063ad21cfc69343fdbbe7..c88c0cbf910d6c2c09697e6a3ac78c081868c2ad 100644
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -224,6 +224,9 @@ noinstr int cpuidle_enter_state(struct cpuidle_device *dev,
>         bool broadcast = !!(target_state->flags & CPUIDLE_FLAG_TIMER_STOP);
>         ktime_t time_start, time_end;
>
> +       if (cpus_peek_for_pending_ipi(drv->cpumask))
> +               return -EBUSY;

As other reviews already pointed out, this must be called only for the
current CPU.

That said, did you play with bailing out just before the call to the
target_state->enter()? It would be interesting to know if that changes
the "stats" somehow.

> +
>         instrumentation_begin();
>
>         /*
>
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-cpuidle_ipi-4c64036f9a48
>
> Best regards,
> --
> Maulik Shah <maulik.shah@oss.qualcomm.com>
>

Kind regards
Uffe

