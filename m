Return-Path: <linux-arm-msm+bounces-118242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqbkKO/HUGoV5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:22:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB756739A2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:22:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KlRBW7cX;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 000963041A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A4E404BFD;
	Fri, 10 Jul 2026 10:15:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7073B42D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678515; cv=none; b=VD32UXohgOsh95O2WawZ9iJe5nE8qa1JSWiW0OCbRzCRXaYlGVrBoGS70w6TNRH30IXHtukr7OT2g+oYkCeAijAO/pC60JzKTvpEA/0y8XdlFq6jqV8xSgioLxxprkLjVt4+myrBZH9huqNP1xnewboREfC3jFemvTw13Ollzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678515; c=relaxed/simple;
	bh=fkY09JmZKv4DA/dlClFK+sgmnRGhXR9B0jaApDjTccI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBOsIh6xoRCx+Z+zWDib8cmv4QUKd5vK9PrLDjL4QAz2XYcvUXpVH2PaTol1KJ/2f6vjNZ8zM0/eI3w/HXEKivgBqaoWlmcawjcG00Lhtgznco05VHcoKQbFSaJg7UsF580mBO62JNMBCktBwEMuKpRGcWIzFTv6zfBh+3DMLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlRBW7cX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C49D1F00ADE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678514;
	bh=wifolWv+k77dwMZHrvYZrFfpeCVTKhalvhqfjczN4xo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KlRBW7cXO7MWu+lAVPbJWI9sMSl3olCE0N1zy9p/6G2sxCaKrxFOGdyF+SK/jhXz+
	 x/6nNyI9AVsI6wNvZyQNQDx4OAp+hnwdmkX4ACpH2xv91vdDJTPrCKrzWwJrUAoXRj
	 FIFMRH0ANXSEregeYwtmXXw63eBkeokKc/lF+XnGMLJ4uWoGosLADkzLhVVwaqUTPS
	 vC1OAkmp4A2JOxOrl1xv6Dedtda3kj6aFhB2kY6KY5aK0mBzRj1BOdNS/P5Hs2uyMT
	 Rgn6JbyKUq/03kpBuG/G6KV7pV9eEV1Rwx4li6rosPEtmbuVmGc7ebCBk+z7Wlf6c1
	 ONfsboE8nepOw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so876233e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:15:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoWwrlJDoYBpj293omKkqQ3gRy9+xIXl/OAcTfI8oDrZIv+gyJ/xQiqypISz4hi/W5tONem5l2ik1NIbbbj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx711bYByUUWVKElOaYzR6So2Dvk+vf256InY4AYDTi6BN0J8Ch
	g5nCQS3h3SIMOLbwtvoK/Q9BzW3PUDkaY4DYSYv7hsLFN3h7MjJRyu4qbdMCJz13VuRiSpmNQP0
	IX7s8euqm9xGWD12ddFkmiSGgSsrAShA=
X-Received: by 2002:a05:6512:a8b:b0:5ad:5c4a:8221 with SMTP id
 2adb3069b0e04-5b011408a4amr2672040e87.0.1783678512340; Fri, 10 Jul 2026
 03:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
 <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-1-be81d6c15043@oss.qualcomm.com>
In-Reply-To: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-1-be81d6c15043@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 10 Jul 2026 12:14:57 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j2idK3fgdmNmT4dsAW5dqDuLon7iKtLMHfGdYRoPtq7A@mail.gmail.com>
X-Gm-Features: AUfX_mzEFvX7sYbyQjGQfbLNXLXyGl0tAJeEyZsQuLv9AOnDMi0cU5yOUDPj2h0
Message-ID: <CAJZ5v0j2idK3fgdmNmT4dsAW5dqDuLon7iKtLMHfGdYRoPtq7A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Alok Chauhan <alokc@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Dilip Kota <dkota@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>, 
	bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:broonie@kernel.org,m:alokc@codeaurora.org,m:swboyd@chromium.org,m:dianders@chromium.org,m:dkota@codeaurora.org,m:girishm@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB756739A2E

On Fri, Jul 10, 2026 at 12:13=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> When a runtime resume callback returns an error, rpm_callback() sets
> power.runtime_error on the device.  This causes all subsequent calls to
> rpm_resume() to return -EINVAL immediately at the top of the function
> without invoking the callback again, making the failure permanent until
> runtime PM is explicitly re-initialized.
>
> Unlike suspend failures, resume failures should be retryable.  If a
> device's resume callback fails, there is no reason to permanently block
> future resume attempts on that device and all of its consumers.
>
> Fix this by moving the power.runtime_error assignment out of the generic
> rpm_callback() and into rpm_suspend() at its fail label, where suspend
> callback failures are handled.  Resume callback failures now return the
> error to the caller but leave power.runtime_error clear, allowing the
> next resume attempt to invoke the callback normally.
>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/base/power/runtime.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 335288e8b5b3..fab38bc98113 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), s=
truct device *dev)
>         if (retval =3D=3D -EACCES)
>                 retval =3D -EAGAIN;
>
> -       if (retval !=3D -EAGAIN && retval !=3D -EBUSY)
> -               dev->power.runtime_error =3D retval;
> -
>         return retval;
>  }
>
> @@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmfla=
gs)
>         dev->power.deferred_resume =3D false;
>         wake_up_all(&dev->power.wait_queue);
>
> +       if (retval !=3D -EAGAIN && retval !=3D -EBUSY)
> +               dev->power.runtime_error =3D retval;
> +
>         /*
>          * On transient errors, if the callback routine failed an autosus=
pend,
>          * and if the last_busy time has been updated so that there is a =
new
>
> --

This has been applied already.

Please provide a follow-up documentation update reflecting this change.

Thanks!

