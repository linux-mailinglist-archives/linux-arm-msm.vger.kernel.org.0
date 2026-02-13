Return-Path: <linux-arm-msm+bounces-92826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H9HAYCGj2mpRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 21:16:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F121395A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 21:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BD1B30193A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 20:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6278A1D63E4;
	Fri, 13 Feb 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwDW2/FZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A581A2389
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771013756; cv=none; b=rFQrjaZduoOU2Z6CafIBcIjFtN5OOx+cZiJa2sBgwcvAeIcBG2YJjFqWtg0GrK7ensRUnx0fMr2GCJuYRaMxmlWcu69ZEZnd+5yiS/1Kcx7c8vDlTKq7tz+3ZVSzrzb+LbukvW3KxPoMORGNX5mjDy43Acn18zYWM0Kg1AqSRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771013756; c=relaxed/simple;
	bh=mu27IakBfFCEbleUKar8R8u9QCd0EMoUSdA8AVTcPr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc+AgC1uaU1ciamz0K3b4i0z2wzzoBorgx951K+NTaN6vIpuDJGHf4fY0d91nsEKECs7/YYslaCr3pUMVjDryDq7ZVuSwJucWwk/Mg4eb8eDXpclTkhD3xnLZ89hIQUuS3jJHfO47NoHTE/WrkcXLz1B9XUQ9AKKxobn7ACPP1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwDW2/FZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43634d384dfso78264f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771013753; x=1771618553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkVgqEayDWamJpu2tr6+LHBVutmPD4jzDu7HrpilMLs=;
        b=hwDW2/FZozTMIQhNahKlMKds0XGtnmlyChtXiZulfv+yurCShaO6akCtgY20Evg9FZ
         DjzyyzbRH0a6Iv9iebJRTAOmPzQmiqawcHo2VGW63PtCvpV4knZ7xF3enxU2EN0w8ksj
         mWwVlNDuZ7VoOnLpzzn3b6jIhKqwa7s80zaqIAsS663maNLtbA+VyW2Y3pONm6GomIBu
         XyRLlvpEbHUacFQAjn+y/FsLKpXOIlvgvOsGgRctxfukPj/1FI/8BIXKn+mvO5rXuAss
         OWCLoAtNBTtNMGHkliHRfrSv8KZsiDxUGry+YjtorlZVZHmbSOvxC8XrEs0bCdTJjSWp
         9oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771013753; x=1771618553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkVgqEayDWamJpu2tr6+LHBVutmPD4jzDu7HrpilMLs=;
        b=kvw8ANnk3DK5bMKh0hcAj3lBIZrd7YZ66/lmNzzBTROlp9pQS+De1sdyOCnbPvDyJ6
         Pdgt4HGKlhHeOa2qZmhHWfDBEMVttKaMxYOqX8cn+8qtybt3r+dVlCCYzxbbh7EqkCeQ
         wZgDu3A566P6ZlwTdltqC68tgWRS0ZZns4IeDq4YUIbLktEVziVy5Ayfk6VuY7MF46Mv
         Ru7ewcfjseOMnJwxPIe3gTXvBw/K1Qofd9r/+obbcK9hWUttZE4d9U5PXK6xlco0ILve
         Ju12OEZ2HXperyAEgGdFAlosSuvN5Og31Zj/hJhvyaolSnSH3/Tkg17IY/1DmQVbFwdC
         nGCA==
X-Forwarded-Encrypted: i=1; AJvYcCW6+jkqu7hwiuS1//jD0yDU5kIu0/0SKZF8FGdgwWdFJCognmBFW0vrKwPHER/TcTOGtqeDmnYfafhUxePT@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUi0s4aK+N8ROEQfAaUTmqXnpZocY6G8qCOIMkr4HjD0ukezw
	YPNiPNzz+CNoxSj2N2pbN1fNTqgvtzOe0kcxYznmHcy+qM3pPgzzRMK7
X-Gm-Gg: AZuq6aKYsb8pE0DrsnG8mQSpVwqiITYA3T7lZppWyOIMZoOCAcmGxhqWES+6CxwOCAV
	D3VnZ70NFTFcaBy/ZVI0+z6/CDTjcPDoNv9jNbq/uiMLckyGv6RrV4V/YR5r6uNqNi9xT8KRjgw
	EoIYrqWTY+erz8pxNfV6xQ/PhK/wUd85BnOBHEiTm6ZGmdFLaZmmzmyvA1nWbviCjvveM5/tb+0
	zrW19yA93Bj9cT+j71nal/aP/TigqnhvDCKhKEy4O0U67klFzXMXnHnHSso9Evy/g57mK8P8PNB
	vNnKYSENJmrkJ9rHRyWZZGXXroNqd+hVur+ZNUj+VENW3fLSZpi623uKNOKg6AMrRw/Dlswg9f0
	u/JuNCCAz2KCgrYSq+WAnZu3ghzjYZiMVKUkueLA3wokdQ+S/zXEF3D8YkYpfkMN8xpsVbuXEMo
	IY9pQ5fdvN8j1VEtw=
X-Received: by 2002:a05:6000:3106:b0:431:8f8:7f2a with SMTP id ffacd0b85a97d-43796aa5147mr3919316f8f.1.1771013752937;
        Fri, 13 Feb 2026 12:15:52 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:34e8:30f1:fec3:9b0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd793sm8082304f8f.25.2026.02.13.12.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 12:15:52 -0800 (PST)
Date: Fri, 13 Feb 2026 22:15:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
	konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <20260213201550.vk5cosmoewokarlx@skbuf>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
 <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
 <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
 <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92826-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70F121395A6
X-Rspamd-Action: no action

Hello Loic,

On Fri, Feb 13, 2026 at 04:04:43PM +0100, Loic Poulain wrote:
> On Fri, Feb 13, 2026 at 11:45 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Feb 13, 2026 at 10:45:32AM +0100, Loic Poulain wrote:
> > > On Fri, Feb 13, 2026 at 10:07 AM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Thu, Feb 05, 2026 at 05:02:40PM +0100, Loic Poulain wrote:
> > > > > Enabling runtime PM before attaching the hsphy instance as driver data
> > > > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > > > expect valid driver data. There is a small window where the suspend
> > > > > callback may run after PM runtime enabling and before runtime forbid.
> > > >
> > > > So here too, the commit should reflect that this cannot really happen in
> > > > practice.
> > >
> > > This happened  in practice in the qcom‑qusb2 PHY driver, with the same
> > > code flow.
> > > Bug: https://github.com/qualcomm-linux/qcom-deb-images/issues/208
> > > Patch: https://lore.kernel.org/linux-arm-msm/20251219085640.114473-1-loic.poulain@oss.qualcomm.com/
> >
> > Thanks for the link.
> >
> > > I know it may sound unlikely, but this crash has been reported
> > > several times during boot‑stress testing. I haven’t investigated
> > > deeply enough to determine whether it’s caused by an unfortunate
> > > preemption window or a racing CPU.
> >
> > But I'm literally asking for *what* would trigger the suspend in that
> > initial window between enable() and forbid() cause I don't see it.
> 
> To be honest, I had not initially looked into the exact cause of the
> suspend trigger until now, but here is what is happening.
> 
> The PHY is a supplier of the USB device. A USB device cannot be probed
> until all its suppliers are ready. As long as the PHY is not ready, the
> device core keeps retrying the probe, which fails with -EPROBE_DEFER.
> 
> At some point the PHY probe finally runs, but the device core may still be
> attempting to probe the USB device concurrently.
> 
> Inside __driver_probe_device(), we have:
> 
>     ret = really_probe(dev, drv);
>     pm_request_idle(dev);
> 
>     if (dev->parent)
>         pm_runtime_put(dev->parent);
> 
>     pm_runtime_put_suppliers(dev);
>     return ret;
> 
> This means that whenever a USB probe attempt completes, whether with an
> error or not, its suppliers are released via pm_runtime_put_suppliers().
> Releasing suppliers may in turn trigger a runtime suspend.
> 
> In our case, since the PHY is a supplier of the USB device, the USB core
> keeps 'looping' in __driver_probe_device() returning -EPROBE_DEFER until
> the PHY becomes ready. As a result, pm_runtime_put_suppliers() may run
> concurrently with the PHY's probe function. If this happens after
> runtime PM has been enabled for the PHY, but before the driver has
> forbidden suspend or taken a PM reference, the PHY may end up being
> runtime-suspended 'unexpectedly'.

Please resend this patch with the commit message including this
explanation (note that your code snippet from __driver_probe_device() is
missing a relevant call to pm_runtime_get_suppliers()).

Also, please separate the devres change to its own patch. It is fixing a
different logical issue (missing pm_runtime_disable() causes device with
unbound driver to have non-zero dev->power.disable_depth; should warn on
driver re-probe).

Another comment upon reviewing this driver's runtime PM use (although
this is at most something that may result in a patch for "next"):

This driver uses hsphy->phy_initialized to make sure qcom_snps_hsphy_suspend()
isn't called unless qcom_snps_hsphy_init() was called.

Don't we achieve the same behaviour by replacing "hsphy->phy_initialized = true"
with pm_runtime_get_sync(dev) and "hsphy->phy_initialized = false" with
pm_runtime_put(dev)?

