Return-Path: <linux-arm-msm+bounces-115968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1DFVEYpNRmqcPwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:37:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB186F6CFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k1hTFGiq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D75C300F77E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330A544B692;
	Thu,  2 Jul 2026 11:37:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2943D6CCE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:37:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992262; cv=none; b=oPseQzsWoiuyjEr6V7VdIimE1fIFdk+FnBglvXByXB/qRBVykwlsrmvZLdW/ou7qsuDDoSPQOp6APWefdOAoRbRquJOibRWzou1HyrzyyOvl/jCQwgVN4gfdPi0feNZNz/vKF4B8K/wi4s82FkbXAKGafNri7WdH0OycAyC+lU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992262; c=relaxed/simple;
	bh=WY9oIWlzoimYhCJKvEg6rl1OwI2uR608QGIY7aWSJ4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOSkK3SYtM/ooeoplPMuj+xx3yKr4IhxVb7GkCFbR9cMp2mqhiLqAYlZoMo/qjI/812BoxLh/0K3/obgC1jPDBdjWn3kWhHIm0eo400alykltYMDeBtB6/RVyzL67wYPBbGtub+Jom6SuFQqkYv/uEQFsKYWF8gHTndSc/OyMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1hTFGiq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA7B1F01560
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782992260;
	bh=u7EXb1weowWTs8qmsPE7dm/b7A2l7/Sm1XmjS9B1n6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k1hTFGiqG4YbriyM+fxdbw/kxpiX1A9Ce6x0tm3iVPCwNBp/H0+fU8x3YanZ6Vhby
	 E1YhFE6tiD1btRWy2QbaFAcw518+hV2Bd4CyYIsN7GuxiIMOCB2XcVJU0bESObzMFt
	 o+felxhputbqHdVsvPNVciqRlj/PYkWgX90RCtmUIaf+Iat7oYCtuYumydunQXB1Ep
	 lABxQNacpI/7pbKffPc86Otp72PU0F+CZbOhgYrLHvSMxpv29AQ34QrZabpUQxIvry
	 vCXnf8Q3PaPS3apqso/xx1yRCADpxy9JtpFJ07YgXZ+RZMdXbHsbiAZFWZZ1YDpnLG
	 BYV4OBYRjIKpQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso1823279e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 04:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr6VMIabntsyy3d9NxvCuYOskrPAxuew4lstKn2YBsIaO0yTKHpw7P0AodSyFNwkxHqjh7X2YnBsCb/Wuo@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBXFK7HNcMTCxhL/n8DEknQk+PVLhZ8ebHucjV+fJby0jS3Pm
	vuCCaLDTbELNp04K7QdZ2ygjUzjABdKZxXzV1XqgK5j6raEuC/vdBnCl5iVTV9zIe/mV3XJeje+
	iRaQRgPUtaObbDnAsNOKBxL5skfmVZnI=
X-Received: by 2002:a05:6512:1383:b0:5ae:b25b:8a43 with SMTP id
 2adb3069b0e04-5aec67ab096mr1418021e87.23.1782992258496; Thu, 02 Jul 2026
 04:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
 <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-1-6ddc317011c0@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 2 Jul 2026 13:37:24 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
X-Gm-Features: AVVi8Cdnq5UobXyHGkMuzdH234LirYD10dZQzOXqVoakHaXA7PLVm3FHzd9rkH4
Message-ID: <CAJZ5v0g6iRNUAKtDNKWa-_pshmnSCdStenNBJ91Xt=PSrhx=aQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] PM: runtime: Clear runtime_error on supplier after
 failed get_sync
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115968-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBB186F6CFA

On Thu, Jul 2, 2026 at 8:08=E2=80=AFAM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> When pm_runtime_get_sync() fails for a supplier device in
> rpm_get_suppliers(), the supplier's power.runtime_error field is left
> set. This causes any subsequent rpm_resume() call on that supplier to
> immediately return -EINVAL at the top of the function without
> attempting an actual resume, making the failure permanent until
> runtime PM is explicitly re-enabled.
>
> Fix this by calling pm_runtime_set_suspended() on the supplier after
> pm_runtime_put_noidle() in the error path. This clears runtime_error
> and resets the runtime PM status to RPM_SUSPENDED, allowing the next
> consumer resume attempt to retry the supplier resume normally.
>
> Change-Id: Id5067d09caca464f663fc95fe745d037e9c56664
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/base/power/runtime.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 335288e8b5b3..9811d024d140 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -309,6 +309,7 @@ static int rpm_get_suppliers(struct device *dev)
>                 /* Ignore suppliers with disabled runtime PM. */
>                 if (retval < 0 && retval !=3D -EACCES) {
>                         pm_runtime_put_noidle(link->supplier);
> +                       pm_runtime_set_suspended(link->supplier);
>                         return retval;
>                 }
>                 refcount_inc(&link->rpm_active);
>
> --

I don't think that this is the way to go here.

Can you please say some more about the specific scenario in which this
happens and explain why it is OK to effectively discard runtime PM
errors occurring when suppliers are handled?

