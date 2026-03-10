Return-Path: <linux-arm-msm+bounces-96668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGk+N2kosGn1ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:19:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C89251B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6650B31E68B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58403AB294;
	Tue, 10 Mar 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzzJYUSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE33AB27C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148908; cv=none; b=LGV9jfX4p9fRWC+2fHtA9rJmSOEH9ggSUiC7U/zz1nRxupYqIT/xTQBROV615I/VAe9G0o/w6XwKewfteukRhSwDSz0WQ0WstabjjuxFL3yDlI5H3/Q5o52VtZc4giQh9eyFbx3LP2ynvqNBR8VhkFdzWpbyHKLuhO9YL1wD+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148908; c=relaxed/simple;
	bh=Hc2i1i6qj/8C5856w2BZ/6732B5yplOCjTNCTOxWPbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdCsQceD/E5l94njXhAiMwok/LDo2qYU4ZlBgKEGruSJBPKgtGjnDsWhND1VSJ+cLXupi3tutqCKnXDhgf7atGK5nmgsoYTd03mIW11cq7OkgLk0En0MnuKm4QhF4YJSZZqAEZDnJ7ulk0VWSFcfuo7dLf+I5yhAwTK3uada1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzzJYUSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685F5C2BCAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148908;
	bh=Hc2i1i6qj/8C5856w2BZ/6732B5yplOCjTNCTOxWPbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RzzJYUSpKuHtfGDCLbbs8oCtVZ5SoiwVDx1+EdhrVCN4UcHhZ8oBEhkLZzQ3VaOBh
	 3ACjCge5BR4YJxp9pE1EMl5U0mMCGsxPC/BrGG8gD5FcjDoj8y3XFWQGoMmiYqzWyg
	 slzGjDLc4lAv2nhaFRdGcIK7BfEzFsDxGAhTHaeOBT6urvxiPJ8LcUKGqz087CLJP+
	 TMXGTDEypDWu5FYT2nBC3jvhyHXGkDKKh0kVPhnCiMpRbZElzCRQd03io6zWVMBVFo
	 d8WKPetNOcnvTtcM9gZCua/NaxS8+h+JoLc383Hhriwp4v8fcltVFi0ed7FNfnnZ+H
	 UQylkXREeA4lw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1443780c4so3159520e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:21:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4uws4cnXKQ6/gpZIvk1dpCDO4R/quoc4WJyF+0Ts4wi/51EO8JGf3OU3JRqJVaL3jASdH99r24qZ2cXoj@vger.kernel.org
X-Gm-Message-State: AOJu0YyF18sbNTfVDD/T+ZZnLI/YdnskD9KeBpSTOo6T43a9Iaz5VEkQ
	GnfH5xwLw1OH1hMm2Aq1EBCF/nuiGMeDdOxu9midu9CFQeuC1LrRZlIqObiQ7yDmaiMvxnlxqWW
	upU02NIX7b89tBO8pHB5HSyPogf1Y/Bb1czj99HmH1Q==
X-Received: by 2002:a05:6512:61c2:20b0:5a1:3d15:2861 with SMTP id
 2adb3069b0e04-5a14e47483dmr949405e87.6.1773148907079; Tue, 10 Mar 2026
 06:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh> <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com> <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com> <CAMRc=MfxV+rBb5YGOObBZfoTcaSCbXAPjkaEUTpTD0qhLwrFnw@mail.gmail.com>
In-Reply-To: <CAMRc=MfxV+rBb5YGOObBZfoTcaSCbXAPjkaEUTpTD0qhLwrFnw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 14:21:35 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdGKu-3eV2kNKvZz6eDbtcGfOCOyA3XZxRXKoGh6RjaOA@mail.gmail.com>
X-Gm-Features: AaiRm53c8PWjGI40GND30ZAMlC7ysJ8tfbal5hr0nmVntTMkoBLWXSsvA37N_B8
Message-ID: <CAMRc=MdGKu-3eV2kNKvZz6eDbtcGfOCOyA3XZxRXKoGh6RjaOA@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E3C89251B9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96668-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 2:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> Actually, the cpuidle-psci-domain driver already binds to that node so it
> would need something like:
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..f583156a6f41 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -165,6 +165,10 @@ static int psci_cpuidle_domain_probe(struct platform=
_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> +       ret =3D devm_of_platform_populate(&pdev->dev);
> +       if (ret)
> +              return ret;
> +
>         pr_info("Initialized CPU PM domain topology using %s mode\n",
>                 use_osi ? "OSI" : "PC");
>         return 0;
>
> Though that also depends on whether we can live with the fact that it can
> be disabled in Kconfig.
>

Sorry for the noise but I forgot to add that in that case, maybe it
would be better to provide an MFD driver binding to the psci node and
creating separate cells for cpuidle-domain and reboot-mode.

Bart

