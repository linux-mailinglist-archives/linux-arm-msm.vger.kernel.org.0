Return-Path: <linux-arm-msm+bounces-114123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0tDvGhBMOmoh5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:04:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E276B58C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:04:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OCqCXgjP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC922304C911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F59630C176;
	Tue, 23 Jun 2026 09:02:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6191A9F91
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:02:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205332; cv=none; b=KbTT38qY8/vdgs8IA+07EVDIzdaEjbTWOCM4W+cpKsmtxu2HD3bUX/bMfrRwFuT6T1cn2Zx/GxFqG4omxWLve8H/cWuP3RyaFCYUOrvn45/5I80ltI2U/60w15aCpxN64BIR+tOwidIia5TOk7deC96eL3rG/rLdTQLJWjOuOz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205332; c=relaxed/simple;
	bh=1OjlgbHQMpbVV+RRAzlJB/hfT5HKL/E+E7OuwegV8QE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiNaeUFAJ6flHalNpFuKZtej6bB9YQ9LqDeo7dwk+D41chmPmbxWhByMIXOMD+OmiqvJ+WaiF6fIrVmKIEvp6mQLDWfNakAPWtIsIpZeIq2u6D22PMaJcAOdgtqwZnr0jHYlxQcgYsTIYfZqxNonv+QfBEMtYNRX8lRx+fUlOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCqCXgjP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9DC1F000E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782205329;
	bh=1OjlgbHQMpbVV+RRAzlJB/hfT5HKL/E+E7OuwegV8QE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OCqCXgjPxattivM31l4vsEkHa2uiOucYP7PfVSz2oontg+kq7L8hSczZxvFV/6ufb
	 1gOfGIvdbmWzDcKgLgnFyim3jpSr3F2EvLiyZIsL+Cze80ondL6QjGgywWMHYz5hjM
	 qNJ6UDfCuU+aaQa8jyzcQ2loN1ni9/ws/PDenMvvHkHNMkxzbSKiTh3+tpC3Uc1znZ
	 7yJvDGxLXCUGvNyv0otZq2qozIk11Jo/ZaD9mUSnCd3sKcoS1y0L4XZJphDRiAKJWJ
	 I2cnV1pJfChqVBHcDPiX/9Z/PmChwk5zgPFAqUOKws/javXhtCS/EDFHK0zpUv8hyy
	 x021Iw4+hJkJA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3967725a77fso60841621fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gg3+h67kDKckoQeq1HaY9eJi2jI810+g8XBaFLEcL8KZdj2r+k8umKrRZfp3xmSNk7wIYJrLSOO/BLYzT@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnYuT9siGotQgIWPEwBGVQOBmlPPhPewWqkcyv0yn7a5ky2NW
	swX9utV1oRwGcI+nsVSLDD4/PjAZrwGx4dC/s6oiwhrvidTrOHxehfLH+PNfy8JKlvXuWfRbD21
	KxE95jdevAdO61gnHDHcGkmeYjLLD+wPJNw3C+aIdmQ==
X-Received: by 2002:a05:651c:b25:b0:399:8e6f:408d with SMTP id
 38308e7fff4ca-399989f71cemr37883471fa.13.1782205328165; Tue, 23 Jun 2026
 02:02:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:02:06 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:02:06 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622-bt_bugfix-v1-11-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-11-11f936d84e72@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 05:02:06 -0400
X-Gmail-Original-Message-ID: <CAMRc=McmkN=Oho2A+XWgvrRG3QfF61HaPkeCperSaiCzqOc1Dw@mail.gmail.com>
X-Gm-Features: AVVi8CcSTbByqSdZAEXODdVz0OKEiC4XEODVjFqFYlT72jGmB2Vkm4nav_d8T6c
Message-ID: <CAMRc=McmkN=Oho2A+XWgvrRG3QfF61HaPkeCperSaiCzqOc1Dw@mail.gmail.com>
Subject: Re: [PATCH 11/13] Bluetooth: btusb: Move struct btusb_data and macros
 into btusb.h
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ben Young Tae Kim <ytkim@qca.qualcomm.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114123-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5E276B58C8

On Mon, 22 Jun 2026 16:52:24 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
> btusb.c is growing large as vendor-specific code accumulates. Ideally,
> btusb.c contains only the default implementation while vendor-specific
> code lives in separate files for easier maintenance.
>
> The newly added btusb.h also reduces unnecessary data copies in hooks
> like btusb_mtk_setup().
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---

I would be ok with this if you added a user of this new header in the subsequent
patches but I don't see these so I'll hold off my R-b until you can show the
need for one.

Bart

