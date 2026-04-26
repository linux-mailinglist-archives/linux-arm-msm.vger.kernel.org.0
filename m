Return-Path: <linux-arm-msm+bounces-104559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHR9ASQS7mkSqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 15:24:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA7469F3F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 15:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10CFF3002523
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 13:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD02336212C;
	Sun, 26 Apr 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfJ1650U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3B361DCA;
	Sun, 26 Apr 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209884; cv=none; b=EZ2Y+nSCJU+ZyIgCAFiAlflHy7DfcDPoKBm+0AW8a2NWMt7YjEWLTY9Neb208Qcg1SGafd7YzLxlMDVlQOmiH+VNC4ELSujFR6ok8LD8xpZvxIjtCyP7ApsMjaNOyDem3C81jDkghJ+O0Cf/KW4kiVefvzguDFmGPbGyCrayHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209884; c=relaxed/simple;
	bh=nFBOyJnmtVWgeJ1x8PETIvoT2Rkk0GN/0bvqZOX2iMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dR56wX+pdhxYT0Tx3z3cc2ivkWAfdYg3GCPCul16boVUortcykfqztU7ux8iXDzzmU+NlJQHCM2pXBJnI/xz4kKyDO3/uJG7frPY6U8J9GPrI/VNG/m0ErFNAWaWbOp8cd87lmKIiolHndqMy4J31QVNo7Q6Iq27jRWoTitUeFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfJ1650U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C5DC2BCAF;
	Sun, 26 Apr 2026 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777209884;
	bh=nFBOyJnmtVWgeJ1x8PETIvoT2Rkk0GN/0bvqZOX2iMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UfJ1650Ubn22q1FmfUfZ6Kq16AzHRVqpeFHwyiw4KlNJd1aC8tlrUVb1UU0AX4Lh8
	 CzP1wfVCyDUPL883vRf5BDMQEchWBFIpb0hD0db4K3tVq4rt9WUwm/H6Gu1vr7Rp9x
	 hlA89oO7ZgbmCtm/w9LYYrmqehKvWa9LCCAKVwtFh4ELhWP5Oq5/gIZO3Huojzp7+O
	 Lww2okFjdkDHwSncYxl10+GCObKCpSt6mvqDTT3YeP7uT13aI7GJQJs3Aqnlzon5+J
	 QwQNs2FS+NvF2ggLSGfgLQMSwnBilQuSfkZ7/Fl8XPJGO1L5u4L3abnW2qV4fNV8nj
	 RYb2me4wZvJ8Q==
Date: Sun, 26 Apr 2026 14:24:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels from DT
Message-ID: <20260426142434.08412f47@jic23-huawei>
In-Reply-To: <20260426142137.61072daf@jic23-huawei>
References: <20260426-pm8xxx-xoadc-label-v4-0-0ec782362615@smankusors.com>
	<20260426142137.61072daf@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 06FA7469F3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Sun, 26 Apr 2026 14:21:37 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 25 Apr 2026 20:39:06 +0000 (UTC)
> Antony Kurniawan Soemardi <linux@smankusors.com> wrote:
>=20
> > This series adds support for reading channel labels from the device tree
> > in the Qualcomm PM8xxx XOADC driver, along with the corresponding DT
> > updates for the PM8921 PMIC. Also removes the redundant error logs when
> > reading values, as returning -EINVAL and -ETIMEDOUT are sufficient to
> > report failures.
> >=20
> > This series also includes minor refactors such as remove redundant
> > error logging and constifying pointers where applicable.
> >=20
> > Tested on Sony Xperia SP (PM8921): =20
> > > cat /sys/bus/iio/devices/iio\:device0/in_voltage7_label   =20
> > usb_vbus =20
> > > cat /sys/bus/iio/devices/iio\:device0/in_temp12_label   =20
> > ref_muxoff =20
> > > sensors   =20
> > iio_hwmon-isa-0000
> > Adapter: ISA adapter
> > vbat:        267.86 V
> > dcin:          4.82 kV
> > ...
> > chg_temp:    +1071.4=C2=B0C
> >=20
> > Note: the sensor readings above are incorrect due to pending calibration
> > fixes are not included in this series. This patch only addresses label
> > visibility. The values are expected to be wrong until the calibration
> > fixes lands separately. =20
>=20
> > ---
> > Changes in v4:
> > - Constify pointers in read operations =20
> Whilst I can't say I care that much about whether we mark everything we
> could const, it does no harm.
>=20
> Applied patches 2-4 to the testing branch of iio.git. I'll rebase that
> on rc1 once available and push out as togreg which linux-next will pick u=
p.
>=20

Backed out as this constification results in masses of discarded const
marking warnings given some of these are passed into core code that
isn't marked up.  Keep any constifying to stuff that is isolated to this
driver.

J
> Thanks,
>=20
> Jonathan
>=20


