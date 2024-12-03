Return-Path: <linux-arm-msm+bounces-40119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588D59E2392
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D94C287181
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DBF1F9A94;
	Tue,  3 Dec 2024 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="BuAmIfQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287B01F9427;
	Tue,  3 Dec 2024 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240084; cv=none; b=YyJ5HiRwVYb8o39ZMCam7cqKc1MOvkSBAPj4GymcGUmgfiUFgI6RcnPsaOfdcTNpfiWlaiK7/LYM4RlVGE/GkU+Uo1B29x5iqzfyXEbYhLP38pkjM5VWrdJoStmHBYRMZhm7eXZoaS11OJyVO3DlLtyynLf3XZJ7BVenfeqDl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240084; c=relaxed/simple;
	bh=rvNUSBrexrgvn6qC5F5NGhEbMHkIN1b9AQXKqKFKjcM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=e2Ms8Z2GwHTjgsM0QJFhItjl3KP9HmJ7B72vCDDUTOy9cOVU/6obznx8bzTBoPjbNaOEdYo5+8VaIbL7GCV/r7qA4/yIiZJsVp5sZUjl1wHd9KZUHOjqLZ1PgSs5WeuDtpmEK4jiht8Q5S3jUoxwVIvQjcrFacm/xPMsYeCQwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=BuAmIfQp reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=wjZN+HxTPKuwwQ6Fd9vf5fIHwqabYcyUg3ydJhnu5jw=; b=B
	uAmIfQp3ND6qF26J3ebVN7ErDckCFUm8PXMX7+I5QFjM2WvYkd4lNcoJraoBkLGJ
	Qdeq05gYs+wAwIbtXVjX1kGRynoQhsdt1/ZYAaI/sCTdf1WpcoZ9qu4Xb1+Syyek
	17kxq0vuLRSm0So8yoVYjpEBLkXnvdLTh4YBtuq7JE=
Received: from 00107082$163.com ( [111.35.188.140] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Tue, 3 Dec 2024 23:33:45 +0800 (CST)
Date: Tue, 3 Dec 2024 23:33:45 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, 
	"Michael Ellerman" <mpe@ellerman.id.au>, 
	"Nicholas Piggin" <npiggin@gmail.com>, 
	"Christophe Leroy" <christophe.leroy@csgroup.eu>, 
	"Naveen N Rao" <naveen@kernel.org>, 
	"Madhavan Srinivasan" <maddy@linux.ibm.com>, 
	=?GBK?Q?Marek_Beh=A8=B2n?= <kabel@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Konrad Dybcio" <konradybcio@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH] genirq: Remove leading space from .irq_print_chip()
 callbacks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <a779f3f44c24716d783d782c935be9fe4f410bff.1733238060.git.geert+renesas@glider.be>
References: <a779f3f44c24716d783d782c935be9fe4f410bff.1733238060.git.geert+renesas@glider.be>
X-NTES-SC: AL_Qu2YAf6fv0gp4ymRZukZnEYQheY4XMKyuPkg1YJXOp80mCT8/CAnbG5PJ0TM/PmyMBCmoQmQYj1Eyv51WqJ0Wrq3/ixk5Y2YjnuPGeDTokBU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6392704d.c158.1938d27f38e.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3vwzbJE9nqmU2AA--.1844W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqR+qqmdPHZAA7gACs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SEksIApBdCAyMDI0LTEyLTAzIDIzOjAyOjMxLCAiR2VlcnQgVXl0dGVyaG9ldmVuIiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+VGhlIHNwYWNlIHNlcGFyYXRvciB3YXMgZmFjdG9y
ZWQgb3V0IGZyb20gdGhlIG11bHRpcGxlIGNoaXAgbmFtZSBwcmludHMsCj5idXQgc2V2ZXJhbCBp
cnFfY2hpcC5pcnFfcHJpbnRfY2hpcCgpIGNhbGxiYWNrcyBzdGlsbCBwcmludCBhIGxlYWRpbmcK
PnNwYWNlLiAgUmVtb3ZlIHRoZSBzdXBlcmZsdW91cyBkb3VibGUgc3BhY2VzLgo+Cj5GaXhlczog
OWQ5ZjIwNGJkZjcyNDNiZiAoImdlbmlycS9wcm9jOiBBZGQgbWlzc2luZyBzcGFjZSBzZXBhcmF0
b3IgYmFjayIpCj5TaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPgo+LS0tCj5Ob3QgZXZlbiBjb21waWxlLXRlc3RlZC4uLgo+Cj5GZWVsIGZy
ZWUgdG8gZm9sZCB0aGlzIGludG8gdGhlIG9yaWdpbmFsLCBhbmQgZml4IHRoZSBzcGVsbGluZwo+
cy9wcmV2aW9zdWx5L3ByZXZpb3VzbHkvIHdoaWxlIGF0IGl0Lgo+LS0tCj4gYXJjaC9wb3dlcnBj
L3N5c2Rldi9mc2xfbXNpLmMgICAgICAgICAgfCAyICstCj4gZHJpdmVycy9idXMvbW94dGV0LmMg
ICAgICAgICAgICAgICAgICAgfCAyICstCj4gZHJpdmVycy9pcnFjaGlwL2lycS1wYXJ0aXRpb24t
cGVyY3B1LmMgfCAyICstCj4gZHJpdmVycy9zb2MvcWNvbS9zbXAycC5jICAgICAgICAgICAgICAg
fCAyICstCj4gNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4KPmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9tc2kuYyBiL2FyY2gvcG93
ZXJwYy9zeXNkZXYvZnNsX21zaS5jCj5pbmRleCAxYWEwY2IwOTdjOWM5ZDdjLi43YjlhNWVhOWNh
ZDlkM2M3IDEwMDY0NAo+LS0tIGEvYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfbXNpLmMKPisrKyBi
L2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jCj5AQCAtNzUsNyArNzUsNyBAQCBzdGF0aWMg
dm9pZCBmc2xfbXNpX3ByaW50X2NoaXAoc3RydWN0IGlycV9kYXRhICppcnFkLCBzdHJ1Y3Qgc2Vx
X2ZpbGUgKnApCj4gCXNycyA9IChod2lycSA+PiBtc2lfZGF0YS0+c3JzX3NoaWZ0KSAmIE1TSV9T
UlNfTUFTSzsKPiAJY2FzY2FkZV92aXJxID0gbXNpX2RhdGEtPmNhc2NhZGVfYXJyYXlbc3JzXS0+
dmlycTsKPiAKPi0Jc2VxX3ByaW50ZihwLCAiIGZzbC1tc2ktJWQiLCBjYXNjYWRlX3ZpcnEpOwo+
KwlzZXFfcHJpbnRmKHAsICJmc2wtbXNpLSVkIiwgY2FzY2FkZV92aXJxKTsKPiB9Cj4gCj4gCj5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbW94dGV0LmMgYi9kcml2ZXJzL2J1cy9tb3h0ZXQuYwo+
aW5kZXggNjI3NjU1MWQ3OTY4MGU4NS4uMWU1N2ViZmI3NjIyOWFhMCAxMDA2NDQKPi0tLSBhL2Ry
aXZlcnMvYnVzL21veHRldC5jCj4rKysgYi9kcml2ZXJzL2J1cy9tb3h0ZXQuYwo+QEAgLTY1Nyw3
ICs2NTcsNyBAQCBzdGF0aWMgdm9pZCBtb3h0ZXRfaXJxX3ByaW50X2NoaXAoc3RydWN0IGlycV9k
YXRhICpkLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnApCj4gCj4gCWlkID0gbW94dGV0LT5tb2R1bGVzW3Bv
cy0+aWR4XTsKPiAKPi0Jc2VxX3ByaW50ZihwLCAiIG1veHRldC0lcy4laSMlaSIsIG1veF9tb2R1
bGVfbmFtZShpZCksIHBvcy0+aWR4LAo+KwlzZXFfcHJpbnRmKHAsICJtb3h0ZXQtJXMuJWkjJWki
LCBtb3hfbW9kdWxlX25hbWUoaWQpLCBwb3MtPmlkeCwKPiAJCSAgIHBvcy0+Yml0KTsKPiB9Cj4g
Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1wYXJ0aXRpb24tcGVyY3B1LmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXBhcnRpdGlvbi1wZXJjcHUuYwo+aW5kZXggOGU3NmQyOTEzZTZi
ZWJiZi4uNDQ0MWZmZTE0OWVhMGQ5NiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cGFydGl0aW9uLXBlcmNwdS5jCj4rKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXBhcnRpdGlvbi1w
ZXJjcHUuYwo+QEAgLTk4LDcgKzk4LDcgQEAgc3RhdGljIHZvaWQgcGFydGl0aW9uX2lycV9wcmlu
dF9jaGlwKHN0cnVjdCBpcnFfZGF0YSAqZCwgc3RydWN0IHNlcV9maWxlICpwKQo+IAlzdHJ1Y3Qg
aXJxX2NoaXAgKmNoaXAgPSBpcnFfZGVzY19nZXRfY2hpcChwYXJ0LT5jaGFpbmVkX2Rlc2MpOwo+
IAlzdHJ1Y3QgaXJxX2RhdGEgKmRhdGEgPSBpcnFfZGVzY19nZXRfaXJxX2RhdGEocGFydC0+Y2hh
aW5lZF9kZXNjKTsKPiAKPi0Jc2VxX3ByaW50ZihwLCAiICU1cy0lbHUiLCBjaGlwLT5uYW1lLCBk
YXRhLT5od2lycSk7Cj4rCXNlcV9wcmludGYocCwgIiU1cy0lbHUiLCBjaGlwLT5uYW1lLCBkYXRh
LT5od2lycSk7Cj4gfQo+IAo+IHN0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAgcGFydGl0aW9uX2lycV9j
aGlwID0gewo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3Fjb20vc21wMnAuYyBiL2RyaXZlcnMv
c29jL3Fjb20vc21wMnAuYwo+aW5kZXggNDc4M2FiMWFkYjhkOTUzYi4uYTNlODhjZWQzMjhhOTFm
MSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvc29jL3Fjb20vc21wMnAuYwo+KysrIGIvZHJpdmVycy9z
b2MvcWNvbS9zbXAycC5jCj5AQCAtMzY1LDcgKzM2NSw3IEBAIHN0YXRpYyB2b2lkIHNtcDJwX2ly
cV9wcmludF9jaGlwKHN0cnVjdCBpcnFfZGF0YSAqaXJxZCwgc3RydWN0IHNlcV9maWxlICpwKQo+
IHsKPiAJc3RydWN0IHNtcDJwX2VudHJ5ICplbnRyeSA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9k
YXRhKGlycWQpOwo+IAo+LQlzZXFfcHJpbnRmKHAsICIgJThzIiwgZGV2X25hbWUoZW50cnktPnNt
cDJwLT5kZXYpKTsKPisJc2VxX3ByaW50ZihwLCAiJThzIiwgZGV2X25hbWUoZW50cnktPnNtcDJw
LT5kZXYpKTsKPiB9Cj4gCj4gc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBzbXAycF9pcnFfY2hpcCA9
IHsKPi0tIAo+Mi4zNC4xCgpNYXRjaCB3aXRoIG15IGNoZWNrIHJlc3VsdCBhZ2FpbnN0IC5pcnFf
cHJpbnRfY2hpcCBpbXBsZW1lbnRhdGlvbiB1bmRlciBkcml2ZXJzLgpCdXQgSSB0aGluayAiJThz
IiBhbmQgIiU1cy0lbHUiIHNob3VsZCBiZSAiJXMiIGFuZCAiJXMtJWx1Iiwgb3RoZXJ3aXNlIHRo
ZXJlIHdvdWxkIHN0aWxsCmJlIGxlYWRpbmcgc3BhY2VzIHdoZW4gdGhlIGRldmljZSBuYW1lIHN0
cmluZyBpcyBzaG9ydC4KCgpUaGFua3MKRGF2aWQK

