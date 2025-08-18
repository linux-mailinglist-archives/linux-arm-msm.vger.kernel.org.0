Return-Path: <linux-arm-msm+bounces-69525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF6BB29F5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628AC1741D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA852C237E;
	Mon, 18 Aug 2025 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="O4KWLn1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4411E42A9D;
	Mon, 18 Aug 2025 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513929; cv=none; b=XQG6XC1t5Ygikf87WRX9lSZdcG8e9xQ+sx5pqk91R5vjfwFwhzAf6H38IVSvMDCE1/b/9cwFOesp5MQLDrxCAeJvhO7mAXeMqFsJ+vawCrBY3N3bRni0Kiv4AOui5OC2r0M5lRIJIT4fk5VjE84XRVgnn7Qr8aCY5dbzpNCI+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513929; c=relaxed/simple;
	bh=efdPBkydLmY/ZTpYB/17A2kvC8/rYbvJhIhTjYgpWP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=H4wt4Bit68pOIA3regik6cZFVFQvqDcYlGnST0TDxYHCzdhX6AR30z8uCBMKh+jd+z1SZqc7p7b3cTACCgqlo3j8xSc42166UYoze+JdOGEMTol0p11UqnZaPxCA7ZHmPfCr+a4HiAqiYsrpzw9l4uQ/Z1Atwu4BVhRMrXGBY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=O4KWLn1q reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=UI+QSrPvaZI5PI+QLMVEJP6Ykyn+CzzfTwDZnBxma4A=; b=O
	4KWLn1qT0biDwSVdI5UZciBdfxzV7EHQQyzOnkmjvRGd9Cxnk9qshqYOox9WjZul
	fhP94tRNEuNvby+0pMVJ45PPKG94OMofkNdq/vIsVXVqVtHnLQYilmePhjF7bVYu
	2V2wOc7grCcIBvOxpDWu8SNhGyi9PVBr59l67hpxw8=
Received: from slark_xiao$163.com ( [2409:895b:3271:c6a5:2c24:eb9d:11c0:c02]
 ) by ajax-webmail-wmsvr-40-125 (Coremail) ; Mon, 18 Aug 2025 18:45:04 +0800
 (CST)
Date: Mon, 18 Aug 2025 18:45:04 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] bus: mhi: host: pci_generic: Add more Foxconn
 T99W696 modem
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <ma7am34lifhb3avqyiodtbsfmlmi6s5tsw7kqf2rp2eyiq3uqw@ty57xdfbe5ao>
References: <20250729085726.106807-1-slark_xiao@163.com>
 <ma7am34lifhb3avqyiodtbsfmlmi6s5tsw7kqf2rp2eyiq3uqw@ty57xdfbe5ao>
X-NTES-SC: AL_Qu2eB/mavEEr4iSQYOkfmk8Sg+84W8K3v/0v1YVQOpF8jAzp/REKU3RSOlru2u60KgermgmGUxd/7/VKUI5HWqgQQO6O2ohwTEeaI/b504ZpfA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7eb35c0c.93ee.198bcc85d6c.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fSgvCgA3vw0xBKNoWlgcAA--.3974W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibgWtZGii+3DYwQACs4
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA4LTE4IDE2OjE0OjI4LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIFR1ZSwgSnVsIDI5LCAyMDI1IGF0IDA0OjU3OjI2UE0gR01U
LCBTbGFyayBYaWFvIHdyb3RlOgo+PiBUaGVyZSBhcmUgbW9yZSBwbGF0Zm9ybXMgbmVlZCBzdXBw
b3J0IEZveGNvbm4gVDk5VzY5NiBtb2RlbS4KPj4gVGhpcyByZXF1aXJlbWVudCBjb21lcyBmcm9t
IExlbm92byBzaWRlIHNpbmNlIHRoZXkgd2FudCAxIHBsYXRmb3JtCj4+IHRvIGNvcnJlc3BvbmQg
dG8gMSBtb2RlbSBTS1UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFya194
aWFvQDE2My5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMu
YyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJp
Yy5jIGIvZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYwo+PiBpbmRleCA0ZWRiNWJi
NDc2YmEuLjFmYzQzZjFiODZiZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYwo+PiArKysgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5j
Cj4+IEBAIC05MzIsNiArOTMyLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7Cj4+ICAJLyogRm94Y29ubiBUOTlXNjk2LjAwLCBGb3hj
b25uIFNLVSAqLwo+PiAgCXsgUENJX0RFVklDRV9TVUIoUENJX1ZFTkRPUl9JRF9RQ09NLCAweDAz
MDgsIFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMTQ2KSwKPj4gIAkJLmRyaXZlcl9kYXRhID0g
KGtlcm5lbF91bG9uZ190KSAmbWhpX2ZveGNvbm5fdDk5dzY5Nl9pbmZvIH0sCj4+ICsJLyogRm94
Y29ubiBUOTlXNjk2LjA1LCBMZW5vdm8gVDE0ICovCj4+ICsJeyBQQ0lfREVWSUNFX1NVQihQQ0lf
VkVORE9SX0lEX1FDT00sIDB4MDMwOCwgUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAweGUxNTApLAo+
PiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94Y29ubl90OTl3Njk2
X2luZm8gfSwKPj4gKwkvKiBGb3hjb25uIFQ5OVc2OTYuMDYsIExlbm92byBUMTUgKi8KPj4gKwl7
IFBDSV9ERVZJQ0VfU1VCKFBDSV9WRU5ET1JfSURfUUNPTSwgMHgwMzA4LCBQQ0lfVkVORE9SX0lE
X0ZPWENPTk4sIDB4ZTE1MSksCj4+ICsJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkg
Jm1oaV9mb3hjb25uX3Q5OXc2OTZfaW5mbyB9LAo+PiArCS8qIEZveGNvbm4gVDk5VzY5Ni4wNywg
TGVub3ZvIFQxNiAqLwo+PiArCXsgUENJX0RFVklDRV9TVUIoUENJX1ZFTkRPUl9JRF9RQ09NLCAw
eDAzMDgsIFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMTUyKSwKPj4gKwkJLmRyaXZlcl9kYXRh
ID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX2ZveGNvbm5fdDk5dzY5Nl9pbmZvIH0sCj4+ICsJLyog
Rm94Y29ubiBUOTlXNjk2LjA4LCBMZW5vdm8gUDE0cyAqLwo+PiArCXsgUENJX0RFVklDRV9TVUIo
UENJX1ZFTkRPUl9JRF9RQ09NLCAweDAzMDgsIFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMTUz
KSwKPj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX2ZveGNvbm5fdDk5
dzY5Nl9pbmZvIH0sCj4+ICsJLyogRm94Y29ubiBUOTlXNjk2LjA5LCBMZW5vdm8gUDE2cyAqLwo+
PiArCXsgUENJX0RFVklDRV9TVUIoUENJX1ZFTkRPUl9JRF9RQ09NLCAweDAzMDgsIFBDSV9WRU5E
T1JfSURfRk9YQ09OTiwgMHhlMTU0KSwKPj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9u
Z190KSAmbWhpX2ZveGNvbm5fdDk5dzY5Nl9pbmZvIH0sCj4+ICsJLyogRm94Y29ubiBUOTlXNjk2
LjEwLCBMZW5vdm8gUDEgKi8KPj4gKwl7IFBDSV9ERVZJQ0VfU1VCKFBDSV9WRU5ET1JfSURfUUNP
TSwgMHgwMzA4LCBQQ0lfVkVORE9SX0lEX0ZPWENPTk4sIDB4ZTE1NSksCj4+ICsJCS5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9mb3hjb25uX3Q5OXc2OTZfaW5mbyB9LAo+Cj5T
aW5jZSBhbGwgVDk5VzY5NiBkZXJpdmF0aXZlcyBhcmUgdXNpbmcgdGhlIHNhbWUgY29uZmlnLCBj
YW4ndCB5b3UgdXNlIGJlbG93Pwo+Cj4JUENJX0RFVklDRV9TVUIoUENJX1ZFTkRPUl9JRF9RQ09N
LCAweDAzMDgsIFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgUENJX0FOWV9JRCksCj4JCS5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9mb3hjb25uX3Q5OXc2OTZfaW5mbyB9LAo+Cj5J
J20gcHJlc3VtZWQgdGhhdCBhbGwgMHgwMzA4IGJhc2VkIG1vZGVtcyBhcmUgVDk5VzY5NiBkZXJp
dmF0aXZlcy4KPgo+LSBNYW5pCj4KSGkgTWFuaSwKWWVhaCwgdGhpcyBpcyByZWFsbHkgaGVscGZ1
bC4KU28gc2hhbGwgSSB1cGRhdGUgdGhlIHByZXZpb3VzIFQ5OVc2OTYgSURzIHdpdGggdGhpcyBu
ZXcgbWF0Y2ggY2FzZT8KClRoYW5rcwo+LS0gCj7grq7grqPgrr/grrXgrqPgr43grqPgrqngr40g
4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCg==

