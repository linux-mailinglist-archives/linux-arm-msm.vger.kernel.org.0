Return-Path: <linux-arm-msm+bounces-106973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMxpHo8DAmrknAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:27:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 157455121F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 206D73014172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B578B42B751;
	Mon, 11 May 2026 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFPorXmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3F3FFAB2;
	Mon, 11 May 2026 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516860; cv=none; b=t+GNN/xZyLkaPDBEugrw6zCWPIVkKSeIFLrU86jKwAJwf20NIA597w9ayhenImDKEbQnCU8+3zbqy8KmTWYQ9Z9X5EWch5A9UKpmmCcq0Hu86Pyob/DGBHEUuusdVFGkb2eIHy7/4HA2MqOQFqefk1pPV+NLiLs+8P6kAJvhEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516860; c=relaxed/simple;
	bh=BBVqtaERJSrNr2MANl4kxg7k3rO7Ou9Ei8riFRQh3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhENF8wWRNpBlK995kc9vftTwkqfayPNrkOiI5V12wix+2+I0GNk42v9REiHNAeS+addrBU9aEvIJGVrzAKC4XjpNWBOyeHqIA7h+/W+CSLZALVfWZ6GJvb78FTO+QhMcNgt+afnHW5gIoHWbjNXcxvHk21xMO59rL/IH3zKXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFPorXmO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41102C2BCC9;
	Mon, 11 May 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516860;
	bh=BBVqtaERJSrNr2MANl4kxg7k3rO7Ou9Ei8riFRQh3vs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MFPorXmOLEjjxToQ0+xb6E7fMYWMiz65K1Wk6QuX5leUjLdaCn6CZkLGebPyTlUFt
	 zR+tY22uUl3P2VYjkAKKTjyk2J9UCtTPSMNCVFwLcwYx2vRe47QyMAkKotNuIWFyT3
	 Fxf6PK8W+SdRM7XLnucnvNxHUiWrIr0kuF0geibyB8xqQp8TkP5BaWEi3lhyqaU7Lm
	 byAtYabatex0I6JRa+XWLWq7mwPccp3BjLLal6Br9PIK9pTOZbBVPM1ygNxrG7Y0F0
	 TRXOAzisU91gYrG1pdYJwgttUbjR7+DHoUpco2x+CApcSx6gOX8VuxyO0PU3lCcF12
	 7z3B07Fi82xTQ==
Date: Mon, 11 May 2026 17:27:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, phone-devel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6 0/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-ID: <20260511172729.42407b1d@jic23-huawei>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 157455121F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 10 May 2026 07:01:29 +0000 (UTC)
Antony Kurniawan Soemardi <linux@smankusors.com> wrote:

> This series adds support for reading channel labels from the device tree
> in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
> updates for the PM8921 PMIC. Also removes the redundant error logs when
> reading values, as returning -EINVAL and -ETIMEDOUT are sufficient to
> report failures.
>=20
> This series also includes minor refactoring, such as removing redundant
> error loggings.
>=20
> Tested on Sony Xperia SP (PM8921):
> > cat /sys/bus/iio/devices/iio\:device0/in_voltage7_label =20
> usb_vbus
> > cat /sys/bus/iio/devices/iio\:device0/in_temp12_label =20
> ref_muxoff
> > sensors =20
> iio_hwmon-isa-0000
> Adapter: ISA adapter
> vbat:        267.86 V
> dcin:          4.82 kV
> ...
> chg_temp:    +1071.4=C2=B0C
>=20
> Note: the sensor readings above are incorrect due to pending calibration
> fixes are not included in this series. This patch only addresses label
> visibility. The values are expected to be wrong until the calibration
> fixes lands separately.
Applied patches 3 and 4 to the testing branch of iio.git.

When I get caught up with the backlog and the tests finish I'll push that
out as togreg for linux-next to pick up.

Thanks,

Jonathan

