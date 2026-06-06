Return-Path: <linux-arm-msm+bounces-111518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WBcYF2MfJGqZ3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF364D9B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 15:23:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111518-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111518-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E398B3011756
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 13:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E699F3A543F;
	Sat,  6 Jun 2026 13:21:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BEA31355C;
	Sat,  6 Jun 2026 13:21:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752087; cv=none; b=J0x9keW55+l2Skn5OIYfBnbY1V+t4+L9OuSYQm3k0GcBw7svs64pLX9zzeySOv4LudeQPymc8EJE8MKdEZrlW/syqf46RKxjhZ2qlPPXq433mh3geHMDtKRtB8bUOZL8vJl/utg+GIixofVoYltAhJl4HqU7kHFlzVCnkfqpn1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752087; c=relaxed/simple;
	bh=sG/4eyvC2vTUCyj/KvdzGZT8QyGpmwcxxwT8wHqTPWk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5kYzNVLhw/CNYap6oFcE5Ibte9V3S8l62YV3Km8EfuaOER6SCH/QENmzd0EwgHj5hWdxhRRWdDGcSE6hmhPtCAaH/C0+CDahN0yft1SGtgIew609XUNysI3AToU/ReOYsOu72IyVpfekPiNyqstewrWHUeelQMNulUqHwFjXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-01 (Coremail) with SMTP id qwCowADnjdbPHiRq4k2+AA--.20353S2;
	Sat, 06 Jun 2026 21:21:20 +0800 (CST)
Message-ID: <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 06 Jun 2026 21:21:19 +0800
In-Reply-To: <178073918523.417326.15121723011916371966.b4-reply@b4>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
	 <178040480680.1778078.1165164069560552075.b4-review@b4>
	 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
	 <178073773007.397244.9871455646149843167.b4-reply@b4>
	 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
	 <178073918523.417326.15121723011916371966.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowADnjdbPHiRq4k2+AA--.20353S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW7JFW5Kw45Wry5Xry7ZFb_yoW8Jw1DpF
	WkCay5KF4v9F1xGw4xtr4kX3yftw1vyry5XFn0qF1jq3Z8Cr1rK3yakrZY9w12gr93uw4a
	9a1fuas2qFWkJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111518-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pastebin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15EF364D9B7

=E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu Luo=E5=86=
=99=E9=81=93=EF=BC=9A
> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > >=20
> > > The magnetic keyboard (USB HID) can't be connected somehow,
> > > others
> > > are
> > > fine, such as the spi touchscreen (not upstream yet), which
> > > utilizes
> > > DMA definitely. My config is here https://pastebin.com/SdjuyJYk
> >=20
> > Is this a defconfig?
> >=20
>=20
> Yes.
>=20
> > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
> > exhibiting the problem (because there should be "public" GPI DMA
> > consumers to trigger the stuck/reset).
> >=20
>=20
> Is this still necessary? I checked the fedora discussion and your GPI
> DMA fix. And GPI DMA is only for the QUP-supported peripherals as the
> binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml

The devicetree without this fix seems to be still incorrect, because
with the device tree fix even if the GPI DMA driver misbehaves the
system won't be stuck (although it will iterate all GPI channels and
then fail to function at all).

Thanks,
Icenowy

>=20
> > > Which device are you testing? Please attach more information if
> > > possible.
> >=20
> > My device is gaokun3 too, although I used the mainline device tree.


