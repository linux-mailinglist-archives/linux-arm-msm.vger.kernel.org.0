Return-Path: <linux-arm-msm+bounces-22365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93A90494D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 05:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D95561F23001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 03:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A2D12E5E;
	Wed, 12 Jun 2024 03:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="X8poSioc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D93C3214;
	Wed, 12 Jun 2024 03:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718161588; cv=none; b=kBAbPhkoNBQsZmcwW7hA8BQmMZyOLm+Hi2FdpJteZP48kB+My4jp1oW5g7WoTp6ALEDvuPj5IMbIRQlZF94y9jtmayrCheZt8nJjy6ks38Yml5OWVtXR9cy2QQ2mT9Ztsi0116V0f2Uhbi+ld2/J/yoejokkAiNWyJrvMMwIuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718161588; c=relaxed/simple;
	bh=+ctwHilzsepjKZ1sUUMB0cpG3p2QV3xK1hOQnQBgAdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Herj/sJJj4pXmE5eSIUJ4+GLMExWbOPpU8QrQu2HNJPEEsijzByM/V60HabQk9R5RSePhsjVc+n+NP/EVV+31u4zUEiN2O3DoCLJ9didCNar4nvZvM6mMIc3Bdot1oUmp54+JROKUeHqkcwpPFeWYdpeSejkLTKpt3Rjw4TZdAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=X8poSioc reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=jEJJhb2OCVdkrKmlNWZ/Xdy7wOT5PME9awKqsmwRDw4=; b=X
	8poSiocNMuEp9+oc2c9KB70weJ5FyWmLfXpOqi897OkM3GD6nt5INasD8F+8KzJR
	1ipxR5Iv1EJSXGNN1vFjRc7zWO6uXwAKnrYGjI1jk768VDuxkNE+qa8C3Ao22Ci3
	dA/PPDDbfKLWd2tSITox4Hoaat/dVv8EXS8UE99VI0=
Received: from slark_xiao$163.com ( [112.97.57.186] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Wed, 12 Jun 2024 11:05:38 +0800
 (CST)
Date: Wed, 12 Jun 2024 11:05:38 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Sergey Ryazanov" <ryazanov.s.a@gmail.com>, 
	"Manivannan Sadhasivam" <mani@kernel.org>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"Loic Poulain" <loic.poulain@linaro.org>
Cc: quic_jhugo@quicinc.com, "Qiang Yu" <quic_qianyu@quicinc.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re:Re: [PATCH v1 2/2] net: wwan: Fix SDX72 ping failure issue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <c292fcdc-4e5b-4e6a-9317-e293e2b6b74e@gmail.com>
References: <20240607100309.453122-1-slark_xiao@163.com>
 <30d71968-d32d-4121-b221-d95a4cdfedb8@gmail.com>
 <97a4347.18d5.19004f07932.Coremail.slark_xiao@163.com>
 <c292fcdc-4e5b-4e6a-9317-e293e2b6b74e@gmail.com>
X-NTES-SC: AL_Qu2aCv2dvk0o7iWZYekfmk8Sg+84W8K3v/0v1YVQOpF8jA/o9iACQHlnHHDUz/6yNiOQnDyzVhpP0898TKtfWr8Lkx8TjBtiq6VOCoY4ykLH6Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <320ba7ec.38c9.1900a687ddc.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v+yCEGlmcS80AA--.351W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRw-6ZGV4Juc3SQAJs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMTIgMDY6NDY6MzMsICJTZXJnZXkgUnlhemFub3YiIDxyeWF6YW5vdi5zLmFA
Z21haWwuY29tPiB3cm90ZToKPk9uIDExLjA2LjIwMjQgMDQ6MzYsIFNsYXJrIFhpYW8gd3JvdGU6
Cj4+ICtNb3JlIG1haW50YWluZXIgdG8gdGhpcyBzZWNvbmQgcGF0Y2ggbGlzdC4KPj4gCj4+IEF0
IDIwMjQtMDYtMDggMDY6Mjg6NDgsICJTZXJnZXkgUnlhemFub3YiIDxyeWF6YW5vdi5zLmFAZ21h
aWwuY29tPiB3cm90ZToKPj4+IEhlbGxvIFNsYXJrLAo+Pj4KPj4+IHdpdGhvdXQgdGhlIGZpcnN0
IHBhdGNoIGl0IGlzIGNsb3NlIHRvIGltcG9zc2libGUgdG8gdW5kZXJzdGFuZCB0aGlzCj4+PiBv
bmUuIE5leHQgdGltZSBwbGVhc2Ugc2VuZCBzdWNoIHRpZ2h0bHkgY29ubmVjdGVkIHBhdGNoZXMg
dG8gYm90aAo+Pj4gbWFpbGluZyBsaXN0cy4KPj4+Cj4+IFNvcnJ5IGZvciB0aGlzIG1pc3Rha2Ug
c2luY2UgaXQncyBteSBmaXJzdCBjb21taXQgYWJvdXQgY29tbWl0dGluZyBjb2RlIHRvIDIKPj4g
ZGlmZmVyZW5jZSBhcmVhOiBtaGkgYW5kIG1iaW0uIEJvdGggdGhlIG1haW50YWluZXJzIGFyZSBk
aWZmZXJlbmNlLgo+PiBJbiBjYXNlIGEgbmV3IHZlcnNpb24gY29tbWl0IHdvdWxkIGJlIGNyZWF0
ZWQsIEkgd291bGQgbGlrZSB0byBhc2sgaWYKPj4gc2hvdWxkIEkgYWRkIGJvdGggc2lkZSBtYWlu
dGFpbmVycyBvbiB0aGVzZSAyIHBhdGNoZXMgPwo+Cj5ObyB3b3JyaWVzLiBXZSBmaW5hbGx5IGdv
dCBib3RoIHNpZGVzIG9mIHRoZSBwdXp6bGUuIEJUVywgbG9va3MgbGlrZSB0aGUgCj5maXJzdCBw
YXRjaCBzdGlsbCBsYWNrcyBMaW51eCBuZXRkZXYgbWFpbGluZyBsaXN0IGluIHRoZSBDQy4KPgo+
VXN1YWxseSBtYWludGFpbmVycyBhcmUgcmVzcG9uc2libGUgZm9yIGFwcGx5aW5nIHBhdGNoZXMg
dG8gdGhlaXIgCj5kZWRpY2F0ZWQgcmVwb3NpdG9yaWVzICh0cmVlcyksIGFuZCB0aGVuIGV2ZW50
dWFsbHkgZm9yIHNlbmRpbmcgdGhlbSBpbiAKPmJhdGNoIHRvIHRoZSBtYWluIHRyZWUuIFNvLCBp
ZiBhIHdvcmsgY29uc2lzdHMgb2YgdHdvIHBhdGNoZXMsIGl0IGlzIAo+YmV0dGVyIHRvIGFwcGx5
IHRoZW0gdG9nZXRoZXIgdG8gb25lIG9mIHRoZSB0cmVlcy4gT3RoZXJ3aXNlLCBpdCBjYW4gCj5j
YXVzZSBhIGJ1aWxkIGZhaWx1cmUgaW4gb25lIHRyZWUgZHVlIHRvIGxhY2sgb2YgcmVxdWlyZWQg
Y2hhbmdlcyB0aGF0IAo+aGF2ZSBiZWVuIGFwcGxpZWQgdG8gb3RoZXIuIFNvbWV0aW1lcyBjb250
cmlidXRvcnMgZXZlbiBzcGVjaWZ5IGEgCj5wcmVmZXJyZWQgdHJlZSBpbiBhIGNvdmVyIGxldHRl
ci4gSG93ZXZlciwgaXQgaXMgc3RpbGwgdXAgdG8gbWFpbnRhaW5lcnMgCj50byBtYWtlIGEgZGVj
aXNpb24gd2hpY2ggdHJlZSBpcyBiZXR0ZXIgd2hlbiBhIHdvcmsgY2hhbmdlcyBzZXZlcmFsIAo+
c3Vic3lzdGVtcy4KPgoKVGhhbmtzIGZvciB5b3VyIGRldGFpbGVkIGV4cGxhbmF0aW9uLiAKU2lu
Y2UgdGhpcyBjaGFuZ2Ugd2FzIG1vZGlmaWVkIG1haW5seSBvbiBtaGkgc2lkZSwgSSBwcmVmZXIg
dG8gY29tbWl0IGl0IHRvCiBtaGkgc2lkZS4gCkBsb2ljIEBtYW5pLCB3aGF0J3MgeW91ciBvcGlu
aW9uPwoKPj4+IE9uIDA3LjA2LjIwMjQgMTM6MDMsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+Pj4gRm9y
IFNEWDcyIE1CSU0gZGV2aWNlLCBpdCBzdGFydHMgZGF0YSBtdXggaWQgZnJvbSAxMTIgaW5zdGVh
ZCBvZiAwLgo+Pj4+IFRoaXMgd291bGQgbGVhZCB0byBkZXZpY2UgY2FuJ3QgcGluZyBvdXRzaWRl
IHN1Y2Nlc3NmdWxseS4KPj4+PiBBbHNvIE1CSU0gc2lkZSB3b3VsZCByZXBvcnQgImJhZCBwYWNr
ZXQgc2Vzc2lvbiAoMTEyKSIuCj4+Pj4gU28gd2UgYWRkIGEgbGluayBpZCBkZWZhdWx0IHZhbHVl
IGZvciB0aGVzZSBTRFg3MiBwcm9kdWN0cyB3aGljaAo+Pj4+IHdvcmtzIGluIE1CSU0gbW9kZS4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4K
Pj4+Cj4+PiBTaW5jZSBpdCBhIGJ1dCBmaXgsIGl0IG5lZWRzIGEgJ0ZpeGVzOicgdGFnLgo+Pj4K
Pj4gQWN0dWFsbHksIEkgdGhvdWdodCBpdCdzIGEgZml4IGZvciBjb21tb24gU0RYNzIgcHJvZHVj
dC4gQnV0IG5vdyBJIHRoaW5rCj4+IGl0IHNob3VsZCBiZSBvbmx5IG1lZXQgZm9yIG15IFNEWDcy
IE1CSU0gcHJvZHVjdC4gUHJldmlvdXMgY29tbWl0Cj4+IGhhcyBub3QgYmVlbiBhcHBsaWVkLiBT
byB0aGVyZSBpcyBubyBjb21taXQgaWQgZm9yICJGaXhlcyIuCj4+IEJ1dCBJIHRoaW5rIEkgc2hh
bGwgaW5jbHVkZSB0aGF0IHBhdGNoIGluIFYyIHZlcnNpb24uCj4+IFBsZWFzZSByZWY6Cj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA1MjAwNzA2MzMuMzA4OTEzLTEtc2xhcmtf
eGlhb0AxNjMuY29tLwo+Cj5UaGVyZSBhcmUgbm90aGluZyB0byBmaXggeWV0LiBHcmVhdC4gVGhl
biB5b3UgY2FuIHJlc2VuZCB0aGUgRm94Y29ubiAKPlNEWDcyIGludHJvZHVjdGlvbiB3b3JrIGFz
IGEgc2VyaWVzIHRoYXQgYWxzbyBpbmNsdWRlcyB0aGVzZSBtdXggaWQgCj5jaGFuZ2VzLiBKdXN0
IHJlbmFtZSB0aGlzIHNwZWNpZmljIHBhdGNoIHRvIHNvbWV0aGluZyBsZXNzIHRlcnJpZnlpbmcu
IAo+TWVhbiwgcmVtb3ZlIHRoZSAiRml4IiB3b3JkIGZyb20gdGhlIHN1YmplY3QsIHBsZWFzZS4K
Pgo+TG9va3MgbGlrZSAibmV0OiB3d2FuOiBtaGk6IG1ha2UgZGVmYXVsdCBkYXRhIGxpbmsgaWQg
Y29uZmlndXJhYmxlIiAKPnN1YmplY3QgYWxzbyBzdW1tYXJpemUgdGhlIHJlYXNvbiBvZiB0aGUg
Y2hhbmdlLgo+CgpDdXJyZW50bHkgSSBkb24ndCBrbm93IGlmIG15IHByZXZpb3VzIGNvbW1pdCB3
aGljaCBoYXMgYmVlbiByZXZpZXdlZCBzdGlsbApiZSBlZmZlY3RpdmUuIFNpbmNlIHRoaXMgbGlu
a19pZCBjaGFuZ2VzIG9ubHkgd29ya3MgZm9yIE1CSU0gbW9kZSBvZiBTRFg3Mi4KSWYga2VlcHMg
dGhlIGNvbW1pdCBvZiBbMV0sIHRoZW4gSSB3aWxsIHVwZGF0ZSB0aGlzIHBhdGNoIHdpdGggdjIg
dmVyc2lvbiB3aGljaCBqdXN0IHVwZGF0ZQp0aGUgc3ViamVjdCAuIElmIG5vdCwgdGhlbiB0aGlz
IFNEWDcyIHNlcmllcyB3b3VsZCBoYXZlIDMgcGF0Y2hlczogWzFdICsgZmlyc3QgcGF0Y2gKKyBz
ZWNvbmQgcGF0Y2hbdjJdKG9yIDIgcGF0Y2hlczogY29tYmluZSBbMV0gd2l0aCBmaXJzdCBwYXRj
aCArIHNlY29uZCBwYXRjaFt2Ml0pLgpQbGVhc2UgbGV0IG1lIGtub3cgd2hpY2ggc29sdXRpb24g
d291bGQgYmUgYmV0dGVyLgoKVGhhbmtzLgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvbmV0L3d3
YW4vbWhpX3d3YW5fbWJpbS5jIHwgMyArKy0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd3dhbi9taGlfd3dhbl9tYmltLmMgYi9kcml2ZXJzL25ldC93d2FuL21oaV93d2FuX21iaW0u
Ywo+Pj4+IGluZGV4IDNmNzJhZTk0M2IyOS4uNGNhNWM4NDUzOTRiIDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+Pj4gKysrIGIvZHJpdmVycy9uZXQv
d3dhbi9taGlfd3dhbl9tYmltLmMKPj4+PiBAQCAtNjE4LDcgKzYxOCw4IEBAIHN0YXRpYyBpbnQg
bWhpX21iaW1fcHJvYmUoc3RydWN0IG1oaV9kZXZpY2UgKm1oaV9kZXYsIGNvbnN0IHN0cnVjdCBt
aGlfZGV2aWNlX2lkCj4+Pj4gICAgCW1iaW0tPnJ4X3F1ZXVlX3N6ID0gbWhpX2dldF9mcmVlX2Rl
c2NfY291bnQobWhpX2RldiwgRE1BX0ZST01fREVWSUNFKTsKPj4+PiAgICAKPj4+PiAgICAJLyog
UmVnaXN0ZXIgd3dhbiBsaW5rIG9wcyB3aXRoIE1ISSBjb250cm9sbGVyIHJlcHJlc2VudGluZyBX
V0FOIGluc3RhbmNlICovCj4+Pj4gLQlyZXR1cm4gd3dhbl9yZWdpc3Rlcl9vcHMoJmNudHJsLT5t
aGlfZGV2LT5kZXYsICZtaGlfbWJpbV93d2FuX29wcywgbWJpbSwgMCk7Cj4+Pj4gKwlyZXR1cm4g
d3dhbl9yZWdpc3Rlcl9vcHMoJmNudHJsLT5taGlfZGV2LT5kZXYsICZtaGlfbWJpbV93d2FuX29w
cywgbWJpbSwKPj4+PiArCQltaGlfZGV2LT5taGlfY250cmwtPmxpbmtfaWQgPyBtaGlfZGV2LT5t
aGlfY250cmwtPmxpbmtfaWQgOiAwKTsKPj4+Cj4+PiBJcyBpdCBwb3NzaWJsZSB0byBkcm9wIHRo
ZSB0ZXJuYXJ5IG9wZXJhdG9yIGFuZCBwYXNzIHRoZSBsaW5rX2lkIGRpcmVjdGx5Pwo+Pj4KPj4+
PiAgICB9Cj4+Pj4gICAgCj4+Pj4gICAgc3RhdGljIHZvaWQgbWhpX21iaW1fcmVtb3ZlKHN0cnVj
dCBtaGlfZGV2aWNlICptaGlfZGV2KQo+Cj4tLQo+U2VyZ2V5ClsxXSAtIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNDA1MjAwNzA2MzMuMzA4OTEzLTEtc2xhcmtfeGlhb0AxNjMuY29t
Lwo=

