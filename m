Return-Path: <linux-arm-msm+bounces-112234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44p9Ou8+KGq+AwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:27:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5976625AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6DF9309AE30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97DD4963CC;
	Tue,  9 Jun 2026 15:55:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC724963BF;
	Tue,  9 Jun 2026 15:54:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020503; cv=none; b=dtwZ2lNGieNZ/2jIWYR7VcgqYROI/IRMvtAjV/jBGKrsoFLlLc3LMQpHx6/LJ4Ntm+//M9Wc/pskeumcnJ7So4xew0kEb6IfwB6sMQ9HPLIQ4WZgVY768+XGCkSj3FtF4ZQiFC5+LxzY9UTT46v0O2A2zE59WHs7A2mX72EjxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020503; c=relaxed/simple;
	bh=tQOiNWiHxn59a96n98eOjRoNal+l/6qT7jvIuInbsWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BAvQLbUKmFBTDGs4yTHYXkxjtxM9FE1IR9hbHh240RZFYyFfc2PZgGH/MgHC7x9y6hTziSFiE3iTJ8IxjFvq0gwwr+Mmr1gIujadKMXlMLiQluPcCoB+RYkORjnkNTHUGpbBe8dXqzpqWJVuUddwTfNbxj2KN+7eFvabhdTwOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.167])
	by APP-03 (Coremail) with SMTP id rQCowAAXOuFONyhqlrwqFA--.5106S2;
	Tue, 09 Jun 2026 23:54:55 +0800 (CST)
Message-ID: <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Pengyu Luo
	 <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio	
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 23:54:54 +0800
In-Reply-To: <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
	 <178040480680.1778078.1165164069560552075.b4-review@b4>
	 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
	 <178073773007.397244.9871455646149843167.b4-reply@b4>
	 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
	 <178073918523.417326.15121723011916371966.b4-reply@b4>
	 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
	 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
	 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
	 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAXOuFONyhqlrwqFA--.5106S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1DAFyrAr1xXr1DZFyrJFb_yoW5GF4fpF
	yUGay5KF4ktF1rGw4xtw15XrWftr1ayryUZrn8Gr18Jw1qvr15tr47Jrs093WDZrn7uw4a
	yF45Aas7Xry8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112234-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A5976625AD

=E5=9C=A8 2026-06-09=E4=BA=8C=E7=9A=84 14:23 +0200=EF=BC=8CKonrad Dybcio=E5=
=86=99=E9=81=93=EF=BC=9A
> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 21:51 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng
> > > <zhengxingda@iscas.ac.cn> wrote:
> > > >=20
> > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu L=
uo=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPeng=
yu Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >=20
> > > > > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > > > > >=20
> > > > > > > The magnetic keyboard (USB HID) can't be connected
> > > > > > > somehow,
> > > > > > > others
> > > > > > > are
> > > > > > > fine, such as the spi touchscreen (not upstream yet),
> > > > > > > which
> > > > > > > utilizes
> > > > > > > DMA definitely. My config is here
> > > > > > > https://pastebin.com/SdjuyJYk
> > > > > >=20
> > > > > > Is this a defconfig?
> > > > > >=20
> > > > >=20
> > > > > Yes.
> > > > >=20
> > > > > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected
> > > > > > too
> > > > > > for
> > > > > > exhibiting the problem (because there should be "public"
> > > > > > GPI
> > > > > > DMA
> > > > > > consumers to trigger the stuck/reset).
> > > > > >=20
> > > > >=20
> > > > > Is this still necessary? I checked the fedora discussion and
> > > > > your
> > > > > GPI
> > > > > DMA fix. And GPI DMA is only for the QUP-supported
> > > > > peripherals as
> > > > > the
> > > > > binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
> > > >=20
> > > > The devicetree without this fix seems to be still incorrect,
> > > > because
> > > > with the device tree fix even if the GPI DMA driver misbehaves
> > > > the
> > > > system won't be stuck (although it will iterate all GPI
> > > > channels
> > > > and
> > > > then fail to function at all).
> > > >=20
> > >=20
> > > Back to the start. You said some GPI interfaces aren't available
> > > to
> > > HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick
> > > test,
> > > and spi6 consumed it, no stuck or reset. Could you give me a
> > > unavailable channel?
> >=20
> > I think channel 0b10000 of gpi_dma2 could be an example?
> >=20
> > It seems that 4 channels are tried on gpi_dma2 before hang on my
> > gaokun3, but as gaokun3 has no known serial access, it's possible
> > that
> > 0b100000 or 0b1000 is problematic.
> >=20
> > (The reason gpi_dma2 is checked first is because it's the GPI DMA
> > controller with the smallest address)
> >=20
> > BTW I just took the values from Windows DSDT, which is quite
> > conservative.
>=20
> So, with DMA_PRIVATE set, is this series made redundant?

I assume technically the trustzone is still protecting some channels,
although the system stuck issue is fixed.

This series should still be relevant, although not so emergent.

Thanks,
Icenowy

>=20
> Konrad


