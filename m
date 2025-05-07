Return-Path: <linux-arm-msm+bounces-57058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC72AAD5B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D5A1C06FDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8E21D61BC;
	Wed,  7 May 2025 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="IGXm52W9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214771D63C0;
	Wed,  7 May 2025 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598261; cv=none; b=PRVMNv4CqqQv/BfkG+RhoI/0WE22PXAuQdHGto22rbUsgT8qLDOCDS3SM1D/4Rmfp5LQULz+6T3kzWnmZMWHI7kT84sIcgNcbVY6GiwBwD5tOhC1N/qlRreZhWjNnyzlYzyiS5I4nhLN2e4bYorOBDbNMzG7q0phLRoCdzuc794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598261; c=relaxed/simple;
	bh=IxXYbJZD48dI0SPVv07NCmFRsZxS5O4mEiYyeuloddY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=KfeH4I5/bE034CQ++XjI2pVg2vtiV/YJlydGbxSBxliaIShLOhNopDlKWbbxo81jUhvU5g1VUpmuvv2XmCbID8YLfzaeQ2V76YueTjolKpUBEsEwhqVKpca9BsJB7hgDTt/79pY2MJCfcxFJUhBnb4hXjRg6/vVK27z8AnK9ByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=IGXm52W9 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PcVJcsU188XGP4XUJP8u7N7/UYZL6lmQlc06xU1P3b4=; b=I
	GXm52W9An7b66EY+bwlClR2kb61UfayXY4DJB9K8JuFRbRLOZ2TBmIn0Mq5I228Q
	hXMoTGkSq5j9dLHnAg/e/g0taBwjPkHiyVrcprvsL4N4MIIlcJ5+TYGDLoznP+oP
	NEadLyop4merzsaX1tC+JTu5O/vbf43G1vxLfbV0xM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-104 (Coremail) ; Wed, 7 May 2025 14:09:13 +0800 (CST)
Date: Wed, 7 May 2025 14:09:13 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Maxime Ripard" <mripard@kernel.org>
Cc: lumag@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <1bb549f4.746e.1965c8256e4.Coremail.andyshrk@163.com>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
 <1bb549f4.746e.1965c8256e4.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2fBPmSt0ku5SebbOkfmkcVgOw9UcO5v/Qk3oZXOJF8jC7pxyUYZFlTGWvs7PCDJim1nQiHezZt88JTXIVAZqUNHPapzRP0H9he/eEM1/JOWw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <20cd09da.5462.196a95cce13.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aCgvCgCnD4oJ+RpoUXimAA--.12567W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA1GXmga9Zpt5QABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpQaW5nLi4uLi4uCgpBdCAyMDI1LTA0LTIyIDE1OjU5OjI3LCAiQW5keSBZYW4iIDxhbmR5c2hy
a0AxNjMuY29tPiB3cm90ZToKPgo+SGkgYWxsLAo+Cj5BdCAyMDI1LTAzLTIxIDE3OjQ4OjA0LCAi
TWF4aW1lIFJpcGFyZCIgPG1yaXBhcmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4+T24gRnJpLCBNYXIg
MjEsIDIwMjUgYXQgMDQ6NTM6MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+PiBGcm9tOiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+PiAKPj4+IEluIHNvbWUgYXBwbGlj
YXRpb24gc2NlbmFyaW9zLCB3ZSBob3BlIHRvIGdldCB0aGUgY29ycmVzcG9uZGluZwo+Pj4gY29u
bmVjdG9yIHdoZW4gdGhlIGJyaWRnZSdzIGRldGVjdCBob29rIGlzIGludm9rZWQuCj4+PiAKPj4+
IEluIG1vc3QgY2FzZXMsIHdlIGNhbiBnZXQgdGhlIGNvbm5lY3RvciBieSBkcm1fYXRvbWljX2dl
dF9jb25uZWN0b3JfZm9yX2VuY29kZXIKPj4+IGlmIHRoZSBlbmNvZGVyIGF0dGFjaGVkIHRvIHRo
ZSBicmlkZ2UgaXMgZW5hYmxlZCwgaG93ZXZlciB0aGVyZSB3aWxsCj4+PiBzdGlsbCBiZSBzb21l
IHNjZW5hcmlvcyB3aGVyZSB0aGUgZGV0ZWN0IGhvb2sgb2YgdGhlIGJyaWRnZSBpcyBjYWxsZWQK
Pj4+IGJ1dCB0aGUgY29ycmVzcG9uZGluZyBlbmNvZGVyIGhhcyBub3QgYmVlbiBlbmFibGVkIHll
dC4gRm9yIGluc3RhbmNlLAo+Pj4gdGhpcyBvY2N1cnMgd2hlbiB0aGUgZGV2aWNlIGlzIGhvdCBw
bHVnIGluIGZvciB0aGUgZmlyc3QgdGltZS4KPj4+IAo+Pj4gU2luY2UgdGhlIGNhbGwgdG8gYnJp
ZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0aGUgY29ubmVjdG9yLCBwYXNzaW5nCj4+PiBk
b3duIHRoZSBjb3JyZXNwb25kaW5nIGNvbm5lY3RvciBkaXJlY3RseSB3aWxsIG1ha2UgdGhpbmdz
IHNpbXBsZXIuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2Nr
LWNoaXBzLmNvbT4KPj4KPj5GVFIsIEknbSBhZ2FpbnN0IGl0IGFuZCB3b3VsZCBoYXZlIGFwcHJl
Y2lhdGVkIHRoYXQgeW91IHdhaXQgZm9yIGEKPj5tZWFuaW5nZnVsIGNsb3N1cmUgdG8gdGhlIGRp
c2N1c3Npb24gd2UndmUgaGFkIG9uIHRoaXMuCj4KPkNhbiB3ZSBzdGFydCB0byByZXZpZXcgdGhp
cyBwYXRjaD8gU2luY2UgaXQncyBiZWVuIGFsbW9zdCBhIG1vbnRoIG5vdyBhbmQKPm5vIG9uZSBo
YXMgcmFpc2VkIGFueSBvYmplY3Rpb24gdG8gRG1pdHJ5J3Mgc3VnZ2VzdGlvblsxXS4KPgo+Cj5b
MV1odHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvdncybmNkb214M3J3bHRiMnhsbzZu
ZjNyYXBnY2R0Y2pjb2RvZmdtZWNyenphYmY3amlAcHlic2Z2Mjdqa3EyLwo+Cj4KPj4KPj5NYXhp
bWUK

