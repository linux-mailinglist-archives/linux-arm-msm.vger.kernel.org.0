Return-Path: <linux-arm-msm+bounces-64925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CBCB0518D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C683D1AA8322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F60B2D3A98;
	Tue, 15 Jul 2025 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="VX+QduDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762071F4174;
	Tue, 15 Jul 2025 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752559926; cv=none; b=k80UIq9Y6/yOz5GN8ymUuqI0qe5R1FJezga9Sa5+jVTX0Ju5/3Ru7peCWP3xJOMlZRYswVVegNNKoGbeqUSU3PRu+vbBKg5E5W+XaQkuGESADYXBerXd+nVbYl2rz30ATbxoKv5bhvVL0Cj7ZwWMvcQ/uDuH5hn+a5iz2A/ha1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752559926; c=relaxed/simple;
	bh=pKkYf0pf9SiiYQLjJSXZhHpp5J+CagnmvAcX4Q1WL1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=BYroj/fNL4/HtXT7Nj/CBG+qX01WZxvOHK4EJdm7NfRxvMO8LGJf7ty/hsyNFVG0ZZMBnfv1k2hg4KPKODQlS921MNmpC3t/qu99CF2RxyAtjM2GR/giX8qt0rAXyXhTgAsN4kA/deIMaWShWBxUx6duu7X/M+Q62Ob6S4h1CPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=VX+QduDY reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=2AAMJf9maUaSbdg1Sv1it05urNJplT7iXxy+4HxO3a4=; b=V
	X+QduDYHn7WI5C8WTm1hyejbxQyFZJk0I9jYC9AHKiHCgkkLtItpylL5oEU/aO4B
	JIfz+agsJfJg4r7VWDAXKdNlf7cFSoKUvJ5xxz8ET4HInT/k7g6mZ93DEPOnmO9A
	H1Sejfa5f0jIdX51i1lAoLnWoP4s9CtD98mCHptK2g=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Tue, 15 Jul 2025 13:54:29 +0800
 (CST)
Date: Tue, 15 Jul 2025 13:54:29 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	mripard@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <85ple2ju6m.wl-ashutosh.dixit@intel.com>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
 <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
 <85ple2ju6m.wl-ashutosh.dixit@intel.com>
X-NTES-SC: AL_Qu2eAPmet0At7yWRYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCPp9C0vUnNTMUnG6MWDDiCwnQiHWzVR6spgbahGYoQgR2kpPlq5MmA38IZpXJoXxw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <23a4efde.4f62.1980ca61c5e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bSgvCgD3n84V7XVo2yEEAA--.19921W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgGLXmh15WLOpAADs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBEaXhpdCzCoApBdCAyMDI1LTA3LTE1IDA2OjE1OjEzLCAiRGl4aXQsIEFzaHV0b3NoIiA8
YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPiB3cm90ZToKPk9uIFRodSwgMDMgSnVsIDIwMjUgMTQ6
Mjc6NDMgLTA3MDAsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4+Cj4+IE9uIFRodSwgSnVsIDAz
LCAyMDI1IGF0IDA4OjQ5OjUzUE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+Cj5IaSBBbmR5LAo+
Cj4+ID4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiA+Cj4+ID4g
SW4gc29tZSBhcHBsaWNhdGlvbiBzY2VuYXJpb3MsIHdlIGhvcGUgdG8gZ2V0IHRoZSBjb3JyZXNw
b25kaW5nCj4+ID4gY29ubmVjdG9yIHdoZW4gdGhlIGJyaWRnZSdzIGRldGVjdCBob29rIGlzIGlu
dm9rZWQuCj4+ID4KPj4gPiBJbiBtb3N0IGNhc2VzLCB3ZSBjYW4gZ2V0IHRoZSBjb25uZWN0b3Ig
YnkgZHJtX2F0b21pY19nZXRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyCj4+ID4gaWYgdGhlIGVuY29k
ZXIgYXR0YWNoZWQgdG8gdGhlIGJyaWRnZSBpcyBlbmFibGVkLCBob3dldmVyIHRoZXJlIHdpbGwK
Pj4gPiBzdGlsbCBiZSBzb21lIHNjZW5hcmlvcyB3aGVyZSB0aGUgZGV0ZWN0IGhvb2sgb2YgdGhl
IGJyaWRnZSBpcyBjYWxsZWQKPj4gPiBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZW5jb2RlciBoYXMg
bm90IGJlZW4gZW5hYmxlZCB5ZXQuIEZvciBpbnN0YW5jZSwKPj4gPiB0aGlzIG9jY3VycyB3aGVu
IHRoZSBkZXZpY2UgaXMgaG90IHBsdWcgaW4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+PiA+Cj4+ID4g
U2luY2UgdGhlIGNhbGwgdG8gYnJpZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0aGUgY29u
bmVjdG9yLCBwYXNzaW5nCj4+ID4gZG93biB0aGUgY29ycmVzcG9uZGluZyBjb25uZWN0b3IgZGly
ZWN0bHkgd2lsbCBtYWtlIHRoaW5ncyBzaW1wbGVyLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTog
QW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiA+IC0tLQo+PiA+Cj4+Cj4+IFJl
dmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29t
bS5jb20+Cj4KPlRoaXMgc2VlbXMgdG8gYmUgYnJlYWtpbmcgJ21ha2UgYWxsbW9kY29uZmlnJy4g
VGhpcyBpcyB3aGF0IGlzIGJlaW5nIHNlZW46Cj4KPi4uL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jOiBJbiBmdW5jdGlvbiDigJhnZV9iODUw
djNfbHZkc19kZXRlY3TigJk6Cj4uLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1z
dGRweHh4eC1nZS1iODUwdjMtZncuYzoxNDU6MTY6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0
byBmdW5jdGlvbiDigJhnZV9iODUwdjNfbHZkc19icmlkZ2VfZGV0ZWN04oCZCj4gIDE0NSB8ICAg
ICAgICAgcmV0dXJuIGdlX2I4NTB2M19sdmRzX2JyaWRnZV9kZXRlY3QoJmdlX2I4NTB2M19sdmRz
X3B0ci0+YnJpZGdlKTsKPiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+Li4vZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgt
Z2UtYjg1MHYzLWZ3LmM6MTI0OjE6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgMTI0IHwgZ2VfYjg1
MHYzX2x2ZHNfYnJpZGdlX2RldGVjdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4uLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1i
ODUwdjMtZncuYzoxNDY6MTogZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQg
ZnVuY3Rpb24gWy1XZXJyb3I9cmV0dXJuLXR5cGVdCj4gIDE0NiB8IH0KPiAgICAgIHwgXgo+Cj5D
b3VsZCB5b3UgcGxlYXNlIHBvc3QgYSBmaXggZm9yIHRoaXMuIE1heWJlIGRvICdtYWtlIGFsbG1v
ZGNvbmZpZycgdG8gY2hlY2sKCj5pZiB5b3UgaGF2ZW4ndCBtaXNzZWQgYW55dGhpbmcgZWxzZS4K
CgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEkgaGF2ZSBzZW50IGEgZml4IGZvciB0aGlzOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTA3MTUwNTQ3NTQuODAwNzY1LTEt
YW5keXNocmtAMTYzLmNvbS9ULyN1CgpBbmQgYmVmb3JlIHJlbGVhc2luZyB0aGUgZml4IHBhdGNo
IHRoaXMgdGltZSwgSSBoYWQgYWxyZWFkeSBlbnN1cmVkIHRoYXQgdGhlICJtYWtlIGFsbG1vZGNv
bmZpZyIgY29tcGlsYXRpb24gd2FzIHN1Y2Nlc3NmdWwuCgoKTWFueSB0aGFua3MuCiA+Cj5UaGFu
a3MuCj4tLQo+QXNodXRvc2gK

