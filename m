Return-Path: <linux-arm-msm+bounces-111468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t5/PFFLoI2qK0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:28:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA564D02E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:28:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBD323022DCB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5AE314A8D;
	Sat,  6 Jun 2026 09:28:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741941D5170;
	Sat,  6 Jun 2026 09:28:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738127; cv=none; b=e81mkGZ9qSIeLhQP8GfYasX/qZp8yhfq+nEBLGjgKEMzp7fGkQWsCTVMRJz1JWWwDNHrld4H4FIqiAUkFs5ZcIQ7N/sH5VfJz+mywVlCy/won4P3l2Rv3OvTFo5fKSIeNCBO0/qEwd8MTBHLAvwRezRnstoBLk15s/mjpof/wRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738127; c=relaxed/simple;
	bh=e7Tx9J+jLLyejMaHMmNbjZe776PL4e1aBAsaFXbxOjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qAFZ5DvfOCRpWoqsNq3i9Ln9JCCV6OKLpt89WqG4g1YUoIHl15Vkp8nb9eRevanzDb0yLWJxLY8JFxvgKxd7fuEgNt1LAUy7db3S5N/a5UVRR1ExanBlxl2+40/yZtWpTaIfvew3yxi0wn+QS3L9OqUoKH0vpOoQqnpcrDJKKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-03 (Coremail) with SMTP id rQCowAAnSuFD6CNqJ87HEw--.7493S2;
	Sat, 06 Jun 2026 17:28:37 +0800 (CST)
Message-ID: <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 06 Jun 2026 17:28:35 +0800
In-Reply-To: <178073773007.397244.9871455646149843167.b4-reply@b4>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
	 <178040480680.1778078.1165164069560552075.b4-review@b4>
	 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
	 <178073773007.397244.9871455646149843167.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAnSuFD6CNqJ87HEw--.7493S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4fAryrGFy8tFy8XFWDurg_yoW8Gr18pF
	WxJa1ayF4kKF1xGw40yw1DZrZ3twnayr1Yqrn8GF17Z3Z8ur18trW5KrZxWFnFgryF9r4a
	va4xAasrZFWDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2VbyDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-111468-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:from_mime,iscas.ac.cn:email,vger.kernel.org:from_smtp,pastebin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAAA564D02E

=E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu Luo=E5=86=
=99=E9=81=93=EF=BC=9A
> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-02=E4=BA=8C=E7=9A=84 20:53 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > > On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng
> > > <zhengxingda@iscas.ac.cn> wrote:
> > >=20
> > > I don't focus on the upstream for a while, was this problem still
> > > here
> > > recently? Could you attach the base commit, so I can reproduce
> > > it.
> >=20
> > I tested on v7.0.10 (with some extra patches, but not related to
> > sc8280xp).
> >=20
> > It seems that raid456 module will lead to the hang because improper
> > usage of GPI DMA, and without it loaded it seems to be working
> > fine.
> >=20
> > Could you check whether you have any problems with
> > CONFIG_MD_RAID456=3Dy
> > set?
> >=20
>=20
> The magnetic keyboard (USB HID) can't be connected somehow, others
> are
> fine, such as the spi touchscreen (not upstream yet), which utilizes
> DMA definitely. My config is here https://pastebin.com/SdjuyJYk

Is this a defconfig?

BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
exhibiting the problem (because there should be "public" GPI DMA
consumers to trigger the stuck/reset).

>=20
> Which device are you testing? Please attach more information if
> possible.

My device is gaokun3 too, although I used the mainline device tree.

>=20
> > Thanks,
> > Icenowy


