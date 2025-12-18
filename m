Return-Path: <linux-arm-msm+bounces-85643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B7CCAC2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532AB3019BEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676832E8B94;
	Thu, 18 Dec 2025 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lTet96wj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12541288502;
	Thu, 18 Dec 2025 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044900; cv=none; b=pSS95YXkZznRYZgHFxXt3hM+fF1pv+/ySCzEC1vTK1oJk/CcaSv3xXPh0HVdygvTK+0n72Hey2VpS/hNauM+EbRaRd2seQQvZY+CYNlwMmrYwue7O7H0C7etFyGb9KLL/Tsz5cLrTkSD2wvCXG86AuVj2jAmLR9UWGtvdiyCwhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044900; c=relaxed/simple;
	bh=hJQGXniDj6XYRfLcZnB351F2cNE20mJsOY0Desfah90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=EpGqz1W2shxi4D4szTTEut+PgzMrVnXdYdh57AMInf4Oltahuw6bQFONtur6hWXqTkFWE7CNL/OOz2XCpgvityD812ZcFlAmogwbbqioHfILMMxh09GGLSluaV0wofNKkLfFTTDO3FGv9IM5cZ/H2hjGpVWY3WpxEG8URTctqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lTet96wj; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hJQGXniDj6XYRfLcZnB351F2cNE20mJsOY0Desfah90=; b=l
	Tet96wjjbxK9+jV6nxMvZeYgskKwZvepT+cRmhw+qKQdPyggFS5kcR6Vg1qYmxkl
	cWjKfFs59rf7FVkozJS3EFY0c0jMyueD/pyqYp9/ugs6dtFDZs0TetKBnY+05JCx
	P+tJtS5WXyMzAeZjXjmd34AkFJxvdyu2W6dEXW3voM=
Received: from slark_xiao$163.com (
 [2409:895a:3845:9f84:28e0:5641:6598:4ec8] ) by ajax-webmail-wmsvr-40-128
 (Coremail) ; Thu, 18 Dec 2025 16:00:36 +0800 (CST)
Date: Thu, 18 Dec 2025 16:00:36 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
X-NTES-SC: AL_Qu2dBPyfu0Ao4CGfY+kWnUwUgu46UMG3vf8u2IMbaeUvswHy2gsJYEZMGmT/wcKhNQuAoAC1QQBH4MZ8QKL4uuvk8YgDKR9PVgcaMSBc
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gCgvCgCntFGktENpzgs+AA--.8285W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC6ASB5WlDtKRTwwAA3i
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMTEtMjEgMjA6NDY6NTQsICJMb2ljIFBvdWxhaW4iIDxsb2ljLnBvdWxhaW5Ab3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj5PbiBXZWQsIE5vdiAxOSwgMjAyNSBhdCAxMTo1N+KAr0FN
IFNsYXJrIFhpYW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4gd3JvdGU6Cj4+Cj4+IFQ5OVc3NjAgaXMg
ZGVzaWduZWQgYmFzZWQgb24gUXVhbGNvbW0gU0RYMzUgY2hpcC4gSXQgdXNlIHNpbWlsYXIKPj4g
YXJjaGl0ZWNodHVyZSB3aXRoIFNEWDcyL1NEWDc1IGNoaXAuIFNvIHdlIG5lZWQgdG8gYXNzaWdu
IGluaXRpYWwKPj4gbGluayBpZCBmb3IgdGhpcyBkZXZpY2UgdG8gbWFrZSBzdXJlIG5ldHdvcmsg
YXZhaWxhYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2
My5jb20+Cj4KPlJldmlld2VkLWJ5OiBMb2ljIFBvdWxhaW4gPGxvaWMucG91bGFpbkBvc3MucXVh
bGNvbW0uY29tPgo+CkhpIExvaWMsCk1heSBJIGtub3cgd2hlbiB0aGlzIHBhdGNoIHdvdWxkIGJl
IGFwcGxpZWQgaW50byBuZXQgb3IgbGludXgtbmV4dD8KSSBzYXcgdGhlIGNoYW5nZXMgaW4gTUhJ
IHNpZGUgaGFzIGJlZW4gYXBwbGllZC4KVDk5Vzc2MCBkZXZpY2Ugd291bGQgaGF2ZSBhIG5ldHdv
cmsgcHJvYmxlbSBpZiBtaXNzaW5nIHRoaXMgY2hhbmdlcyBpbiB3d2FuCnNpZGUuIFBsZWFzZSBo
ZWxwIGRvIGEgY2hlY2tpbmcuCgpUaGFua3MKPj4gLS0tCj4+ICBkcml2ZXJzL25ldC93d2FuL21o
aV93d2FuX21iaW0uYyB8IDMgKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93d2FuL21oaV93
d2FuX21iaW0uYyBiL2RyaXZlcnMvbmV0L3d3YW4vbWhpX3d3YW5fbWJpbS5jCj4+IGluZGV4IGM4
MTRmYmQ3NTZhMS4uYTE0MmFmNTlhOTFmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93d2Fu
L21oaV93d2FuX21iaW0uYwo+PiArKysgYi9kcml2ZXJzL25ldC93d2FuL21oaV93d2FuX21iaW0u
Ywo+PiBAQCAtOTgsNyArOTgsOCBAQCBzdGF0aWMgc3RydWN0IG1oaV9tYmltX2xpbmsgKm1oaV9t
YmltX2dldF9saW5rX3JjdShzdHJ1Y3QgbWhpX21iaW1fY29udGV4dCAqbWJpbQo+PiAgc3RhdGlj
IGludCBtaGlfbWJpbV9nZXRfbGlua19tdXhfaWQoc3RydWN0IG1oaV9jb250cm9sbGVyICpjbnRy
bCkKPj4gIHsKPj4gICAgICAgICBpZiAoc3RyY21wKGNudHJsLT5uYW1lLCAiZm94Y29ubi1kdzU5
MzRlIikgPT0gMCB8fAo+PiAtICAgICAgICAgICBzdHJjbXAoY250cmwtPm5hbWUsICJmb3hjb25u
LXQ5OXc1MTUiKSA9PSAwKQo+PiArICAgICAgICAgICBzdHJjbXAoY250cmwtPm5hbWUsICJmb3hj
b25uLXQ5OXc1MTUiKSA9PSAwIHx8Cj4+ICsgICAgICAgICAgIHN0cmNtcChjbnRybC0+bmFtZSwg
ImZveGNvbm4tdDk5dzc2MCIpID09IDApCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gV0RTX0JJ
TkRfTVVYX0RBVEFfUE9SVF9NVVhfSUQ7Cj4+Cj4+ICAgICAgICAgcmV0dXJuIDA7Cj4+IC0tCj4+
IDIuMjUuMQo+Pgo=

