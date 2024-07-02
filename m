Return-Path: <linux-arm-msm+bounces-24860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7591EF15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCAF1C21E24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E1212CDBE;
	Tue,  2 Jul 2024 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="loVi0lTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9638B55C1A;
	Tue,  2 Jul 2024 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902256; cv=none; b=NFPmyLGUDaJVHofBT8x+NKhqoP9dD7wTIogbaRpB50owgelzXH3VJ6cRXp89JIS0s63Lq/ZXk3s8SBFZJPvEk2sDUMN3J8O6GZtzK7gQ+VUTdFzrzXCF8UQaf37mmsOG+kHI5jl8ShrNld6WbAkMgTh1UeT+hsjkkp67pXfvorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902256; c=relaxed/simple;
	bh=UAGz36GzDRbjI6reTwN9YMfCHXc8pEkpxHuGS4AqFjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=O9xMx7LPgMBH4K9M29hM4XU5grIpl2DkAn0xZHqSRyRygQCBtNDndOL2NrSMedoqmrTSeSIn/+8Vu8NFzoizOdw+Bljk0LISDRhnipjhN0DlVCcLymgX7DL60WnCu2hK2+oIb62N4LuRvVYRFe3Ila8HH4jPzjr8xgRySqxM4Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=loVi0lTJ reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=fLVsBbnnDbL66uhUWeUm4ZoU9ECknvNANzn2gVFeDmY=; b=l
	oVi0lTJ5+tgMys83TypStMTOs6/qib1aGVWPRjJbDptxJJEmaRayx6714O9ScUWm
	HfGUaGc8w7JPESxRLYxm4gmsIlC6CWGIyLKMWuuYnt2QA1NeGUpbif+lrB0tPVQn
	kfDjNfODiAy2ehKSCLGRA37bOEDYCwBMfFLzetgfyA=
Received: from slark_xiao$163.com ( [112.97.57.76] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Tue, 2 Jul 2024 14:36:46 +0800 (CST)
Date: Tue, 2 Jul 2024 14:36:46 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Jeffrey Hugo" <quic_jhugo@quicinc.com>, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v4 2/3] bus: mhi: host: Add name for mhi_controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240701162715.GD133366@thinkpad>
References: <20240701021216.17734-1-slark_xiao@163.com>
 <20240701021216.17734-2-slark_xiao@163.com>
 <36b8cdab-28d5-451f-8ca3-7c9c8b02b5b2@quicinc.com>
 <20240701162715.GD133366@thinkpad>
X-NTES-SC: AL_Qu2aC/WbvUor4COeYOkfmk8Sg+84W8K3v/0v1YVQOpF8jDjp5A4rXkRlE1r59fKtICS+jT6xQQdUyOFnbbJmdKkNibmEF9oLUPE1K8wk6CEPNA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c4d4ef3.62f4.1907228f9a5.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD33xX+n4NmK1AaAA--.31162W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQQPZGV4IYYnYgADsm
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDctMDIgMDA6Mjc6MTUsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pdmFu
bmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj5PbiBNb24sIEp1bCAwMSwgMjAyNCBh
dCAwOToxMzo1MEFNIC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4+IE9uIDYvMzAvMjAyNCA4
OjEyIFBNLCBTbGFyayBYaWFvIHdyb3RlOgo+PiA+IEZvciBTRFg3MiBNQklNIG1vZGUsIGl0IHN0
YXJ0cyBkYXRhIG11eCBpZCBmcm9tIDExMiBpbnN0ZWFkIG9mIDAuCj4+ID4gVGhpcyB3b3VsZCBs
ZWFkIHRvIGRldmljZSBjYW4ndCBwaW5nIG91dHNpZGUgc3VjY2Vzc2Z1bGx5Lgo+PiA+IEFsc28g
TUJJTSBzaWRlIHdvdWxkIHJlcG9ydCAiYmFkIHBhY2tldCBzZXNzaW9uICgxMTIpIi5JbiBvcmRl
ciB0bwo+PiA+IGZpeCB0aGlzIGlzc3VlLCB3ZSBkZWNpZGUgdG8gdXNlIHRoZSBkZXZpY2UgbmFt
ZSBvZiBNSEkgY29udHJvbGxlcgo+PiA+IHRvIGRvIGEgbWF0Y2ggaW4gY2xpZW50IGRyaXZlciBz
aWRlLiBUaGVuIGNsaWVudCBkcml2ZXIgY291bGQgc2V0Cj4+ID4gYSBjb3JyZXNwb25kaW5nIG11
eF9pZCB2YWx1ZSBmb3IgdGhpcyBNSEkgcHJvZHVjdC4KPj4gPiAKPj4gPiBTaWduZWQtb2ZmLWJ5
OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4+ID4gKysrIGIvaW5jbHVkZS9saW51
eC9taGkuaAo+PiA+IEBAIC0yODksNiArMjg5LDcgQEAgc3RydWN0IG1oaV9jb250cm9sbGVyX2Nv
bmZpZyB7Cj4+ID4gICB9Owo+PiA+ICAgLyoqCj4+ID4gKyAqIEBuYW1lOiBkZXZpY2UgbmFtZSBv
ZiB0aGUgTUhJIGNvbnRyb2xsZXIKPj4gCj4+IFRoaXMgbmVlZHMgdG8gYmUgYmVsb3cgdGhlIG5l
eHQgbGluZQo+PiAKPgo+SWYgdGhpcyBpcyB0aGUgb25seSBjb21tZW50IG9mIHRoZSB3aG9sZSBz
ZXJpZXMsIEkgd2lsbCBmaXggaXQgdXAgd2hpbGUKPmFwcGx5aW5nLiBPdGhlcndpc2UsIGZpeCBp
dCB3aGlsZSBzZW5kaW5nIG5leHQgcmV2aXNpb24uCj4KPldpdGggdGhhdCwKPgo+UmV2aWV3ZWQt
Ynk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5v
cmc+Cj4KPi0gTWFuaQoKVGhhbmtzIGZvciB0aGF0Xl4KPgo+PiA+ICAgICogc3RydWN0IG1oaV9j
b250cm9sbGVyIC0gTWFzdGVyIE1ISSBjb250cm9sbGVyIHN0cnVjdHVyZQo+PiA+ICAgICogQGNu
dHJsX2RldjogUG9pbnRlciB0byB0aGUgc3RydWN0IGRldmljZSBvZiBwaHlzaWNhbCBidXMgYWN0
aW5nIGFzIHRoZSBNSEkKPj4gPiAgICAqICAgICAgICAgICAgY29udHJvbGxlciAocmVxdWlyZWQp
Cj4+ID4gQEAgLTM2Nyw2ICszNjgsNyBAQCBzdHJ1Y3QgbWhpX2NvbnRyb2xsZXJfY29uZmlnIHsK
Pj4gPiAgICAqIHRoZXkgY2FuIGJlIHBvcHVsYXRlZCBkZXBlbmRpbmcgb24gdGhlIHVzZWNhc2Uu
Cj4+ID4gICAgKi8KPj4gPiAgIHN0cnVjdCBtaGlfY29udHJvbGxlciB7Cj4+ID4gKwljb25zdCBj
aGFyICpuYW1lOwo+PiA+ICAgCXN0cnVjdCBkZXZpY2UgKmNudHJsX2RldjsKPj4gPiAgIAlzdHJ1
Y3QgbWhpX2RldmljZSAqbWhpX2RldjsKPj4gPiAgIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX2Rl
bnRyeTsKPj4gCj4KPi0tIAo+4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCu
muCuv+CuteCuruCvjQo=

