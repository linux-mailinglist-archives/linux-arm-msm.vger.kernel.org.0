Return-Path: <linux-arm-msm+bounces-116411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cygUNlAaSGpxmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:23:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACC70578F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:23:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LzCKe9wM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 754F1301184A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DAA346A0B;
	Fri,  3 Jul 2026 20:23:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2D327204
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:23:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110220; cv=none; b=pDo9OHB0A/4u/uU27C4cbDJ5XeZZLHmbVLdqAyf1ve6PNZe3ThQX6WhJi4hfPzqtvJMDKy3dBuobpRzEwjgOowVNUBbR54ftx2aULIIQ8wZIrtQwgeDdtW2MGuliNzv4MrYgTgqiF6WAuKrlSS1ypKHxTDEgDznmnarS3eFwaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110220; c=relaxed/simple;
	bh=+lLKo+hfgft3HZbL+R5Lk/WjvfQOY0bJEByCh077yok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceyB5/wjbiyBOV6Elar9qKCGr8J73uIOJtRvEDRoCNFpPTUgGZgDIMKcExy3FSAAs5lIaYEKWWuvqZppIhcshD/lOgSfk1Zw14BiKTXucrB3kfl6mTDKufG187bcg3PdcG3Bx3aR0gvJu+H9M6QBGFXfrbBiRjO6yT/PiUU/Oko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzCKe9wM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C231F00ADF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110219;
	bh=K9OaFBi3ks/K/oOukwD8pGfn1NuBqlXea9Mvvp0CecQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LzCKe9wMFPr2YK93DsxQEtjnjbXVH2n3e47AlAzL0CNV+nRlNmowroDN8fl35u3Jj
	 T+PcMQwfyTWEo1iKWe7yPPvL25426DKGG6na+V8LAo2dIG7oN0WHOWlqyVBla08wLa
	 OgLAqBScnnAnli6S1p3oBcpmSC7g411NyogeTZ+iW0N8a9ggo44sGmdhZJSXotSxPL
	 aaQtjVvUAWtcfIQbHxA9NYQiMCFwD7RWkvh2G4AmPXkUS2fwDFL2oQg79tyr34srmH
	 yZU425yUkLREuLRgJiChAKK6w6ZoUj/rm6/K3gAJb3wFEgdWtFotuOxc5BgNzjRarx
	 +2u0AfchX/V1g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so664657e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:23:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqy8K9epxHDJiWUSRb4KwXqQiiZlfqncfLda3z7stsrbqIupWH99z69LBsuxE+xJGg5t+rKi1+Uy6LvX+bP@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQ3Yo7kx7A8tMktu2DFxAxyGOgGePDcBkyDNNTx4NuTbhLxCo
	+vjxnIDds+T8E84m+90GbokzE3cl4F1qShhK5AsCX3jkKJ0pDtLcbWFYv0vv3Rj55HVz0lH4win
	HV1WiB2fUco5/8MBs6Q7IVE2wZYRkO34=
X-Received: by 2002:ac2:4e16:0:b0:5ae:bdaa:df02 with SMTP id
 2adb3069b0e04-5aed50b4946mr65751e87.45.1783110217735; Fri, 03 Jul 2026
 13:23:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
 <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
In-Reply-To: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 3 Jul 2026 22:23:24 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
X-Gm-Features: AVVi8CefGUyrFFdZwPYGZlC3wvidhE3xdDNTkOOUOg1Ptb_xKwPZ7PIeqlLivR8
Message-ID: <CAJZ5v0haSHfupyfnVGX_v4K0wYrjn-83NiDPPfC22x=zwi8igg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Girish Mahadevan <girishm@codeaurora.org>, 
	Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116411-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61ACC70578F

On Fri, Jul 3, 2026 at 5:05=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> When a runtime resume callback returns an error, rpm_callback() sets
> power.runtime_error on the device.  This causes all subsequent calls to
> rpm_resume() to return -EINVAL immediately at the top of the function
> without invoking the callback again, making the failure permanent until
> runtime PM is explicitly re-initialized.
>
> Unlike suspend failures, resume failures should be retryable.  If a
> device's resume callback fails transiently, there is no reason to
> permanently block future resume attempts on that device and all of its
> consumers.
>
> Fix this by conditioning the power.runtime_error assignment in
> rpm_callback() on the device being in the RPM_SUSPENDING state.  At the
> point rpm_callback() runs, __update_runtime_status() has already set the
> device status to either RPM_SUSPENDING or RPM_RESUMING, so the two paths
> are reliably distinguishable.  Suspend callback failures continue to set
> power.runtime_error as before.  Resume callback failures return the error
> to the caller but leave power.runtime_error clear, allowing the next
> resume attempt to invoke the callback normally.
>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/base/power/runtime.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 335288e8b5b3..70d933bcd295 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -469,7 +469,13 @@ static int rpm_callback(int (*cb)(struct device *), =
struct device *dev)
>         if (retval =3D=3D -EACCES)
>                 retval =3D -EAGAIN;
>
> -       if (retval !=3D -EAGAIN && retval !=3D -EBUSY)
> +       /*
> +        * Only stick the error on suspend failures.  Resume failures are=
 not
> +        * treated as permanent so that the next resume attempt will run =
the
> +        * callback again rather than short-circuiting on runtime_error.
> +        */
> +       if (retval !=3D -EAGAIN && retval !=3D -EBUSY &&
> +           dev->power.runtime_status =3D=3D RPM_SUSPENDING)
>                 dev->power.runtime_error =3D retval;

Why don't you move this check to rpm_suspend()?

