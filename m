Return-Path: <linux-arm-msm+bounces-65485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C076AB08E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DE6A4305E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833602E6108;
	Thu, 17 Jul 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="RWiUZ0uQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3242E49AF;
	Thu, 17 Jul 2025 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752758844; cv=none; b=apBqiYNvf/6uUcd4XV69f5c546YeBrHwQEvrnXN7juruAookySosQ116IGzJAjcWpNzlhXhn2QwkwO663X/DwK5wrwB3FT1taMEcdBcHv6qrOTPkGUo5B6Vq4oIszS9T24m5KNhBDNSzHaNa4rLucRW2UDD+a/Tk0Y0pO9wdwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752758844; c=relaxed/simple;
	bh=RdIr93HCsd5trCZ25EtHr2HNHx/dURXjk15kSU7Cvak=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFCHQ7P4/PHvooh1hKXL2LUQby0KnlQHX1C9J4bdogie8ta/u6ApCrE5Fl9ubXoou3KpRzohER5H2Ldw5Gu3NtQ3Nucs0x1UUhY4OlnIsXP58CkhdD5JFIlcWG4KC8o/cd7nfCQjIWlFmkjYAqeSVdi1zNY4PkZuUVuUPEw3Prw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=RWiUZ0uQ; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1752758834; x=1753018034;
	bh=RdIr93HCsd5trCZ25EtHr2HNHx/dURXjk15kSU7Cvak=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RWiUZ0uQfyAcrEe4uC78ctOycMxATF1QqEFoVWdRELQWKjHGq3nHke4+j1yaArEns
	 iAGE9Xj8OSSaw/j96tbZj7cReZ5fqYI5lwexJJUjCKTO9ehDUyTs/XYMMsH4UfUnxn
	 aAMYTnsypInC1qCjcCPnSpciMr2o21hfLOGrKsQwfzw/OWzl8Jlvf7FehPmG4oJ5OP
	 cwpiocJ2X3LJGHqvB8grYV70EWSu6GTIDxdCYt4t7hiifEoetdiaK/sYi57OfwcfSz
	 UlmlCTbThqB4EUCrRzVPbjoyMbPbmVwU1kUOxma+Qe5MKetD9Wjop5xT/rh5JeWU+z
	 0aDi08/rDqV8A==
Date: Thu, 17 Jul 2025 13:27:08 +0000
To: Simon Horman <horms@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Luca Weiss <luca@lucaweiss.eu>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 0/4] QRTR bus and Qualcomm Sensor Manager IIO drivers
Message-ID: <o9POEVj6j_JoTCM8BNtkY-tPUh1jfHXyAgY7SHyws3zOuRqlaXZZsrDoaYxGtVjWyQdrFxAH1ztg4OD-Szh9ZdlYSe_3NbEMrY54DaqZYi4=@protonmail.com>
In-Reply-To: <20250710112208.GR721198@horms.kernel.org>
References: <20250710-qcom-smgr-v2-0-f6e198b7aa8e@protonmail.com> <20250710112208.GR721198@horms.kernel.org>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: d6c5cc2a5bde08cc4748ec2dd9e771e78efe4bcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, July 10th, 2025 at 12:22 PM, Simon Horman <horms@kernel.org> w=
rote:

> On Thu, Jul 10, 2025 at 09:06:26AM +0100, Yassine Oudjana via B4 Relay wr=
ote:
>=20
> > Sensor Manager is a QMI service available on several Qualcomm SoCs whic=
h
> > exposes available sensors and allows for getting data from them. This
> > service is provided by either:
> >=20
> > - SSC (Snapdragon Sensor Core): Also known as SLPI (Sensor Low Power
> > Island). Has its own set of pins and peripherals to which sensors are
> > connected. These peripherals are generally inaccessible from the AP,
> > meaning sensors need to be operated exclusively through SSC. The only
> > known SoCs in this category are MSM8996 and MSM8998 (and their
> > derivatives).
> > - ADSP (Audio DSP): Shares pins and peripherals with the AP. At least o=
n
> > some devices, these pins could be configured as GPIOs which allows the =
AP
> > to access sensors by bit-banging their interfaces. Some SoCs in this
> > category are SDM630/660, MSM8953, MSM8974 and MSM8226.
> >=20
> > Before Sensor Manager becomes accessible, another service known as Sens=
or
> > Registry needs to be provided by the AP. The remote processor that prov=
ides
> > Sensor Manager will then request data from it, and once that process is
> > done, will expose several services including Sensor Manager.
> >=20
> > This series adds a kernel driver for the Sensor Manager service, exposi=
ng
> > sensors accessible through it as IIO devices. To facilitate probing of =
this
> > driver, QRTR is turned into a bus, with services being exposed as devic=
es.
> > Once the Sensor Manager service becomes available, the kernel attaches =
its
> > device to the driver added in this series. This allows for dynamic prob=
ing
> > of Sensor Manager without the need for static DT bindings, which would =
also
> > not be ideal because they would be describing software rather than
> > hardware. Sensor Manager is given as a working example of the QRTR bus.
> > Kernel drivers for other services may also be able to benefit from this
> > change.
>=20
>=20
> ...
>=20
> Hi Yassine,
>=20
> This series both adds an IIO driver and updates Networking code.
>=20
> I'd suggest splitting the series so that the Networking updates can be
> targeted at net-next, while the IIO driver is targeted at a different tre=
e.
>=20
> Also, I note that this series does not compile against current net-next.
> This seems like it should be addressed, at least for the Networking
> changes.

I targeted linux-next. By including the IIO driver my idea was to show
an example of using the QRTR bus, but if it has to target different trees
then sure, I'll split it.


