Return-Path: <linux-arm-msm+bounces-52157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28DA6B87A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 11:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1013F189AF17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D631F152E;
	Fri, 21 Mar 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="jw03Jjnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C0B1EBFF0;
	Fri, 21 Mar 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742551606; cv=none; b=GdRyHzVY6CNQgrATPZJZiKCUeKLYR1NOp90dBMkRzn3XEykVlK3Vd6GIGdrMDq2EjHI/zme6a7koFlRlsxMHgihZt7NC5nSp2eQwedIDo5tu2O7kJ0swsqbp+SNTJHm9m5q/1Gyg0snRKGjN2EwW+JedKgABPHkOdwKZmw8RDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742551606; c=relaxed/simple;
	bh=xf5jgePRVrNAPJgRFo3kE61x88rMoUTorU0wBcZPvs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=t5DLGTmfib+2mBq1FCrKJa+5+N38hSMcbjHTyJqIkLECBtYtFctAFaka6J6yKQebrcZh8j30rJGdcc8zt6dlHqirc86q4Ydc1fXSo4NqjG2hv91IS9HezVqv4Z2jWK+8GJHPI5ybXlinAUmsdFRpXTGQCs9N9h7biFqGv5b/Fao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=jw03Jjnd reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=taNGpSsT9yLqZwW/7TUK635vZZQRd6sl6eS/ZIQodwA=; b=j
	w03JjndOyDU0V9XCF5Ag4w3qmFyQkKqaU3kNqxmn/cFJi4OFpH51NkPQnYRIqHqa
	CxmaXjUO3jSwlm3LGwfN9yOltaMRuOSK9NjDjSCH1k5ikhaKyfcNICpKydysyEgE
	vSjXCLy0yB+QX4ztKnRbPouB5dVR6pkXfe0Jrttrqo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Fri, 21 Mar 2025 18:05:33 +0800
 (CST)
Date: Fri, 21 Mar 2025 18:05:33 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: lumag@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
X-NTES-SC: AL_Qu2fAPmevk0o5SWebOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDjp4xEhV2B6MH/20uOCARCyuyGufh9t7txYW6d3eJ0gIXOvsAZyJ0cP6n6VjAxo3w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5a6bffa.a00e.195b82a4808.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgD3T37tOd1nOPOCAA--.44580W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAMXXmfdMFz-jgABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIE1heGltZe+8jAoKQXQgMjAyNS0wMy0yMSAxNzo0ODowNCwgIk1heGltZSBSaXBhcmQiIDxt
cmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDQ6NTM6
MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gCj4+IEluIHNvbWUgYXBwbGljYXRpb24gc2NlbmFyaW9zLCB3ZSBo
b3BlIHRvIGdldCB0aGUgY29ycmVzcG9uZGluZwo+PiBjb25uZWN0b3Igd2hlbiB0aGUgYnJpZGdl
J3MgZGV0ZWN0IGhvb2sgaXMgaW52b2tlZC4KPj4gCj4+IEluIG1vc3QgY2FzZXMsIHdlIGNhbiBn
ZXQgdGhlIGNvbm5lY3RvciBieSBkcm1fYXRvbWljX2dldF9jb25uZWN0b3JfZm9yX2VuY29kZXIK
Pj4gaWYgdGhlIGVuY29kZXIgYXR0YWNoZWQgdG8gdGhlIGJyaWRnZSBpcyBlbmFibGVkLCBob3dl
dmVyIHRoZXJlIHdpbGwKPj4gc3RpbGwgYmUgc29tZSBzY2VuYXJpb3Mgd2hlcmUgdGhlIGRldGVj
dCBob29rIG9mIHRoZSBicmlkZ2UgaXMgY2FsbGVkCj4+IGJ1dCB0aGUgY29ycmVzcG9uZGluZyBl
bmNvZGVyIGhhcyBub3QgYmVlbiBlbmFibGVkIHlldC4gRm9yIGluc3RhbmNlLAo+PiB0aGlzIG9j
Y3VycyB3aGVuIHRoZSBkZXZpY2UgaXMgaG90IHBsdWcgaW4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+
PiAKPj4gU2luY2UgdGhlIGNhbGwgdG8gYnJpZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0
aGUgY29ubmVjdG9yLCBwYXNzaW5nCj4+IGRvd24gdGhlIGNvcnJlc3BvbmRpbmcgY29ubmVjdG9y
IGRpcmVjdGx5IHdpbGwgbWFrZSB0aGluZ3Mgc2ltcGxlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPgo+RlRSLCBJJ20gYWdhaW5zdCBp
dCBhbmQgd291bGQgaGF2ZSBhcHByZWNpYXRlZCB0aGF0IHlvdSB3YWl0IGZvciBhCj5tZWFuaW5n
ZnVsIGNsb3N1cmUgdG8gdGhlIGRpc2N1c3Npb24gd2UndmUgaGFkIG9uIHRoaXMuCgpObyBwcm9i
bGVtLiBJIGp1c3Qgd2FudCB0byBrbm93IGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcy4KCgo+Cj5N
YXhpbWUK

