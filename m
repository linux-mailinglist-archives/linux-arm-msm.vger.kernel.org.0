Return-Path: <linux-arm-msm+bounces-88516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BFD11F84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215443032950
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30A231064E;
	Mon, 12 Jan 2026 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=buaa.edu.cn header.i=@buaa.edu.cn header.b="TrotUIJZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5169927A123
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214473; cv=none; b=Oc4L9eBWM14oDSWYtWuJQW3ZyDY3opPnbeU/vxoluYKgbTA/irmTC0fOZn8ryOXis+7zw2eI0tU8F3i3V3zPzMKURQZbp79ge9QRjnVRbPziuY97E5ukZecblTpBPC5kx8Vo9WMO2Hpl0JQC83n49VFvLN3aLI8Z7OenLYKTXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214473; c=relaxed/simple;
	bh=BvhIzPDWpH2YuGhBpcvnIw4ADloshKiGP8oHBo6Y/C4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=TU+sJfYR5wnPTmBKyu3FFAp107+0Y4043h29IqiDz/s3f83HS77oMUu0NG10ACeGaQT6ryUaUuY08DncdyN0aB55B4TZEVxOu2lGdaQ4N2HRGBDLT/qvwayzMQYdrqPyD3/lhmeCewKiMm629804U7kD5vL6E1uDlT8X6b6iqE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buaa.edu.cn; spf=pass smtp.mailfrom=buaa.edu.cn; dkim=fail (0-bit key) header.d=buaa.edu.cn header.i=@buaa.edu.cn header.b=TrotUIJZ reason="key not found in DNS"; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buaa.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buaa.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=buaa.edu.cn; s=buaa; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=EFFu1vxT9Ga1UlHn2AU8ueN0ysuZIXQk8bAX
	Mf/0TmI=; b=TrotUIJZ8t2V9EItUrZDKt6x/GfgX2ZstW4mHLLIqHWQE/mHkBw3
	thHyE4xNxIsKFovtMlGzuVVnHSVQtsv1mJ3e5Xmi9li3ajFkBiuNJSckGuE0DnA/
	dopG1+uuD6U78kC1Xfv1UxB5MQkr6r1WMncTxMP8XsAfIWol3J0AX8M=
Received: from zy2421106$buaa.edu.cn ( [219.224.171.14] ) by
 ajax-webmail-coremail-app1 (Coremail) ; Mon, 12 Jan 2026 18:40:52 +0800
 (GMT+08:00)
Date: Mon, 12 Jan 2026 18:40:52 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xingjing Deng" <zy2421106@buaa.edu.cn>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Xingjing Deng" <micro6947@gmail.com>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: =?UTF-8?Q?Re:_=E3=80=90SPAM=E3=80=91_Re:_[PATCH]_misc:_fastrpc:_p?=
 =?UTF-8?Q?ossible_double-free_of_cctx->remote=5Fheap?=
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20240305(0ac2fdd1) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-63b7ebb9-fa87-40c1-9aec-818ec5a006d9-buaa.edu.cn
In-Reply-To: <2026011227-casualty-rephrase-9381@gregkh>
References: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
 <2026011227-casualty-rephrase-9381@gregkh>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <31f000e3.c65c.19bb1cb5978.Coremail.zy2421106@buaa.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID:OCz+CgCHdyy0z2Rpver3AA--.21043W
X-CM-SenderInfo: d21skjarrqlqpexdthxhgxhubq/1tbiAgQFCWljsbNKqwABsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGksdjIgd2lsbCBhZGQgdGhlIG1pc3NpbmcgdGFnczoKRml4ZXM6IDA4NzE1NjEwNTVlNjYgKCJt
aXNjOiBmYXN0cnBjOiBBZGQgc3VwcG9ydCBmb3IgYXVkaW9wZCIpCkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnICMgNi4yKwpJ4oCZbSBoYXZpbmcgdHJvdWJsZSBzZW5kaW5nIHYyIHZpYSBnaXQg
c2VuZC1lbWFpbCBhdCB0aGUgbW9tZW50OyBJIHdpbGwKcmVzZW5kIHRoZSBhY3R1YWwgdjIgcGF0
Y2ggYXMgc29vbiBhcyBTTVRQIGlzIHdvcmtpbmcuClRoYW5rcywgWGluZ2ppbmcgRGVuZy4KCgo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+IEZyb206ICJHcmVnIEtIIiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+Cj4gU2VuZCB0aW1lOk1vbmRheSwgMDEvMTIvMjAyNiAxNzoxNjoz
OAo+IFRvOiAiWGluZ2ppbmcgRGVuZyIgPG1pY3JvNjk0N0BnbWFpbC5jb20+Cj4gQ2M6IHNyaW5p
QGtlcm5lbC5vcmcsIGFtYWhlc2hAcXRpLnF1YWxjb21tLmNvbSwgYXJuZEBhcm5kYi5kZSwgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5v
cmcsICJYaW5namluZyBEZW5nIiA8eGpkZW5nQGJ1YWEuZWR1LmNuPgo+IFN1YmplY3Q6IOOAkFNQ
QU3jgJEgUmU6IFtQQVRDSF0gbWlzYzogZmFzdHJwYzogcG9zc2libGUgZG91YmxlLWZyZWUgb2Yg
Y2N0eC0+cmVtb3RlX2hlYXAKPiAKPiAKPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAwNTowMjoy
MVBNICswODAwLCBYaW5namluZyBEZW5nIHdyb3RlOgo+ID4gZmFzdHJwY19pbml0X2NyZWF0ZV9z
dGF0aWNfcHJvY2VzcygpIG1heSBmcmVlIGNjdHgtPnJlbW90ZV9oZWFwIG9uIHRoZQo+ID4gZXJy
X21hcCBwYXRoIGJ1dCBkb2VzIG5vdCBjbGVhciB0aGUgcG9pbnRlci4gTGF0ZXIsIGZhc3RycGNf
cnBtc2dfcmVtb3ZlKCkKPiA+IGZyZWVzIGNjdHgtPnJlbW90ZV9oZWFwIGFnYWluIGlmIGl0IGlz
IG5vbi1OVUxMLCB3aGljaCBjYW4gbGVhZCB0byBhCj4gPiBkb3VibGUtZnJlZSBpZiB0aGUgSU5J
VF9DUkVBVEVfU1RBVElDIGlvY3RsIGhpdHMgdGhlIGVycm9yIHBhdGggYW5kIHRoZSBycG1zZwo+
ID4gZGV2aWNlIGlzIHN1YnNlcXVlbnRseSByZW1vdmVkL3VuYm91bmQuCj4gPiBDbGVhciBjY3R4
LT5yZW1vdGVfaGVhcCBhZnRlciBmcmVlaW5nIGl0IGluIHRoZSBlcnJvciBwYXRoIHRvIHByZXZl
bnQgdGhlCj4gPiBsYXRlciBjbGVhbnVwIGZyb20gZnJlZWluZyBpdCBhZ2Fpbi4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogWGluZ2ppbmcgRGVuZyA8eGpkZW5nQGJ1YWEuZWR1LmNuPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9taXNjL2Zhc3RycGMuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2Zhc3RycGMu
YyBiL2RyaXZlcnMvbWlzYy9mYXN0cnBjLmMKPiA+IGluZGV4IGVlNjUyZWYwMTUzNC4uZmIzYjU0
ZTA1OTI4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9taXNjL2Zhc3RycGMuYwo+ID4gKysrIGIv
ZHJpdmVycy9taXNjL2Zhc3RycGMuYwo+ID4gQEAgLTEzNzAsNiArMTM3MCw3IEBAIHN0YXRpYyBp
bnQgZmFzdHJwY19pbml0X2NyZWF0ZV9zdGF0aWNfcHJvY2VzcyhzdHJ1Y3QgZmFzdHJwY191c2Vy
ICpmbCwKPiA+ICAJfQo+ID4gIGVycl9tYXA6Cj4gPiAgCWZhc3RycGNfYnVmX2ZyZWUoZmwtPmNj
dHgtPnJlbW90ZV9oZWFwKTsKPiA+ICsJZmwtPmNjdHgtPnJlbW90ZV9oZWFwID0gTlVMTDsKPiA+
ICBlcnJfbmFtZToKPiA+ICAJa2ZyZWUobmFtZSk7Cj4gPiAgZXJyOgo+ID4gLS0gCj4gPiAyLjI1
LjEKPiA+IAo+IAo+IFdoYXQgY29tbWl0IGlkIGRvZXMgdGhpcyBmaXg/ICBTaG91bGQgaXQgZ28g
dG8gc3RhYmxlIGtlcm5lbHM/Cj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCg==

