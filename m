Return-Path: <linux-arm-msm+bounces-54913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 168ECA96062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 10:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152553A7E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 08:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694681EBFF7;
	Tue, 22 Apr 2025 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="psAeqVoP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B2F25522B;
	Tue, 22 Apr 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308832; cv=none; b=GSdT2tP1fqSrR3sLQ8/x2tij1/ryALn26BlaaWZyMtZVngccRSHxMVZ9uxqmQJcIXr6G4yjJg96YhqetcS0mbQc4cN6QmBhJ09vxu6p/9gwvhi6NRGitEDT4QqlFt3RQIMPniE06OeI/VaSNSHq9+hdC90cNYRjg+KeZFY1WMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308832; c=relaxed/simple;
	bh=3CR+/f2NiMSAagT+V1OjsdLfNcuUb59reoY8+3eCTCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=VpHTbgle8eUvkgJNFMMQiNCD0lvOKG5UxjF+G1uqZUeEB7e17dEX6dJfUgOCW/pntqZkwd86RGOsIIMwwvbKF1k/KKA8F1gKZlg6KFHHH7BeQM59A/pABJQx6lk/dirEGYnfJrtCwzQ2LT+m7VpFuJbu8vcajlL1Fx18g2W4o8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=psAeqVoP reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0/6nEFrgS1C04Ibd4G7cvNL9wRLiPUrNDF6gwaEK1B4=; b=p
	sAeqVoPySESnzmUVTK4aza7vwvLgunqAAY/En8AQLpv1FFiqv+yOtXhPxWiYk3KI
	iK98sKhWxw/jKvgpUCPlQMXDk/BeEe27ep2hzNPzjqlUlvrd1r9KjxBTPkQDm+30
	AzaZYLUhnWPuCl5qXIBFqEoqI+RM10mV0MPkeobP5Q=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Tue, 22 Apr 2025 15:59:27 +0800
 (CST)
Date: Tue, 22 Apr 2025 15:59:27 +0800 (CST)
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
Subject: Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
X-NTES-SC: AL_Qu2fB/+bt08t4SmeY+kfmkcVgOw9UcO5v/Qk3oZXOJF8jCzp8D4yf1JTEnDy1fCDKg+MkAiHYjpJ8Pt0f7d2fYwujCqEY09RcV7NnzuMedMx4g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1bb549f4.746e.1965c8256e4.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgAnjYdgTAdoaPGbAA--.58451W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gA3XmgHRzC35wACsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIGFsbCwKCkF0IDIwMjUtMDMtMjEgMTc6NDg6MDQsICJNYXhpbWUgUmlwYXJkIiA8bXJpcGFy
ZEBrZXJuZWwub3JnPiB3cm90ZToKPk9uIEZyaSwgTWFyIDIxLCAyMDI1IGF0IDA0OjUzOjM4UE0g
KzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiBGcm9tOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1j
aGlwcy5jb20+Cj4+IAo+PiBJbiBzb21lIGFwcGxpY2F0aW9uIHNjZW5hcmlvcywgd2UgaG9wZSB0
byBnZXQgdGhlIGNvcnJlc3BvbmRpbmcKPj4gY29ubmVjdG9yIHdoZW4gdGhlIGJyaWRnZSdzIGRl
dGVjdCBob29rIGlzIGludm9rZWQuCj4+IAo+PiBJbiBtb3N0IGNhc2VzLCB3ZSBjYW4gZ2V0IHRo
ZSBjb25uZWN0b3IgYnkgZHJtX2F0b21pY19nZXRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyCj4+IGlm
IHRoZSBlbmNvZGVyIGF0dGFjaGVkIHRvIHRoZSBicmlkZ2UgaXMgZW5hYmxlZCwgaG93ZXZlciB0
aGVyZSB3aWxsCj4+IHN0aWxsIGJlIHNvbWUgc2NlbmFyaW9zIHdoZXJlIHRoZSBkZXRlY3QgaG9v
ayBvZiB0aGUgYnJpZGdlIGlzIGNhbGxlZAo+PiBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZW5jb2Rl
ciBoYXMgbm90IGJlZW4gZW5hYmxlZCB5ZXQuIEZvciBpbnN0YW5jZSwKPj4gdGhpcyBvY2N1cnMg
d2hlbiB0aGUgZGV2aWNlIGlzIGhvdCBwbHVnIGluIGZvciB0aGUgZmlyc3QgdGltZS4KPj4gCj4+
IFNpbmNlIHRoZSBjYWxsIHRvIGJyaWRnZSdzIGRldGVjdCBpcyBpbml0aWF0ZWQgYnkgdGhlIGNv
bm5lY3RvciwgcGFzc2luZwo+PiBkb3duIHRoZSBjb3JyZXNwb25kaW5nIGNvbm5lY3RvciBkaXJl
Y3RseSB3aWxsIG1ha2UgdGhpbmdzIHNpbXBsZXIuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5
IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4KPkZUUiwgSSdtIGFnYWluc3QgaXQgYW5k
IHdvdWxkIGhhdmUgYXBwcmVjaWF0ZWQgdGhhdCB5b3Ugd2FpdCBmb3IgYQo+bWVhbmluZ2Z1bCBj
bG9zdXJlIHRvIHRoZSBkaXNjdXNzaW9uIHdlJ3ZlIGhhZCBvbiB0aGlzLgoKQ2FuIHdlIHN0YXJ0
IHRvIHJldmlldyB0aGlzIHBhdGNoPyBTaW5jZSBpdCdzIGJlZW4gYWxtb3N0IGEgbW9udGggbm93
IGFuZApubyBvbmUgaGFzIHJhaXNlZCBhbnkgb2JqZWN0aW9uIHRvIERtaXRyeSdzIHN1Z2dlc3Rp
b25bMV0uCgoKWzFdaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL3Z3Mm5jZG9teDNy
d2x0YjJ4bG82bmYzcmFwZ2NkdGNqY29kb2ZnbWVjcnp6YWJmN2ppQHB5YnNmdjI3amtxMi8KCgo+
Cj5NYXhpbWUK

