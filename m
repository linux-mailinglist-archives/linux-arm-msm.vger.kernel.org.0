Return-Path: <linux-arm-msm+bounces-24590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF691B9F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641BD285531
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3C1474A9;
	Fri, 28 Jun 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="j8MBJLZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3330B14386F;
	Fri, 28 Jun 2024 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563521; cv=none; b=H+G5luw5b1z+KGWVI1Vt0d0GZ3bevJ0ys/LWqbRObJcPR4bUZnPeN8ScFAtadYIl8dbOt3KbdvqSF0CV2v8uzii8VLCTELhJaJGNejRdrGYmXaOIBvFpfoftF5762DVenPoy7WlX6J8DvwE2A4tp6YdsTTjWKjW47pTZfe4Ul60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563521; c=relaxed/simple;
	bh=qRY2BttLFavGC0/FEKgRQmh0bDCXs9H3mYiv5W7T9/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=F047Eh/3pmIIdUpw6NF0Vv68bGqphFR3JLKLMRZxlVgKiv5xhQKo70UavDZOGSJNl3tLZta/LdGgEOOcjVrit0vY7vx4ORnEQ5DojqEXmiIcoH+6c3eEmXAXfkCdVgItkLA5s7eOt8n65QeEeHtr7f+tl+WS24TU53CLtDUQzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=j8MBJLZI reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=8dm2yPnUBy+Zwic0JqYYPGSYk9HXlXSy6pvyaLYdubE=; b=j
	8MBJLZI1RSp3f9pNMxxk9Mv4PjPyFCdx4UyqdjX5TU9bo1qsKgsoZvmx2DYc7dAd
	PrWw41rsG+hLJdDsawkB8k8FjnEpf1HTFLAyEUtDbXwamoebx0H3aN3XOOX62yGt
	iv5dujTTvdCqT5q0WlhH0GKBGh0de4dlwGiM3h98pM=
Received: from slark_xiao$163.com ( [112.97.61.84] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Fri, 28 Jun 2024 16:31:40 +0800
 (CST)
Date: Fri, 28 Jun 2024 16:31:40 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	quic_jhugo@quicinc.com, netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
References: <20240628073605.1447218-1-slark_xiao@163.com>
 <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
X-NTES-SC: AL_Qu2aC/mdvE0r5iSdZ+kfmk8Sg+84W8K3v/0v1YVQOpF8jBLo0w4rRVxgI2Hp/cKNLi6tlzu0ViZu0OhWXqpzZ7ooSYwDKdnixOFe4YYADrnHLg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <455cd5ee.86ad.1905df8bbab.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD333DsdH5mXmkTAA--.29661W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbioxsMZGVOEH3Z8wACs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMjggMTU6NTE6NTQsICJEbWl0cnkgQmFyeXNoa292IiA8ZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnPiB3cm90ZToKPk9uIEZyaSwgSnVuIDI4LCAyMDI0IGF0IDAzOjM2OjA1
UE0gR01ULCBTbGFyayBYaWFvIHdyb3RlOgo+PiBBbGlnbiB3aXRoIFFjb20gU0RYNzIsIGFkZCBy
ZWFkeSB0aW1lb3V0IGl0ZW0gZm9yIEZveGNvbm4gU0RYNzIuCj4+IEFuZCBhbHNvLCBhZGQgZmly
ZWhvc2Ugc3VwcG9ydCBzaW5jZSBTRFg3Mi4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNsYXJrIFhp
YW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gLS0tCj4+IHYyOiAoMSkuIFVwZGF0ZSB0aGUgZWRs
IGZpbGUgcGF0aCBhbmQgbmFtZSAoMikuIFNldCBTRFg3MiBzdXBwb3J0Cj4+IHRyaWdnZXIgZWRs
IG1vZGUgYnkgZGVmYXVsdAo+PiB2MzogRGl2aWRlIGludG8gMiBwYXJ0cyBmb3IgRm94Y29ubiBz
ZHg3MiBwbGF0Zm9ybQo+Cj5HZW5lcmljIGNvbW1lbnQ6IHBsZWFzZSBzZW5kIGFsbCB0aGUgcGF0
Y2hlcyB1c2luZyBhIHNpbmdsZQo+Z2l0LXNlbmQtZW1haWwgY29tbWFuZC4gVGhpcyB3YXkgaXQg
d2lsbCB0aHJlYWQgdGhlbSBwcm9wZXJseSwgc28gdGhhdAo+dGhleSBmb3JtIGEgc2luZ2xlIHBh
dGNoc2VyaWVzIGluIGRldmVsb3BlcnMncyBtYWlsIGNsaWVudHMuIE9yIHlvdSBjYW4KPmp1c3Qg
dXNlICdiNCcgdG9vbCB0byBtYW5hZ2UgYW5kIHNlbmQgdGhlIHBhdGNoc2V0Lgo+CgpTZW5kIGFn
YWluIHdpdGggY29tbWFuZCAiZ2l0IHNlbmQtZW1haWwgdjMtKi5wYXRjaCAuLi4iLiBQbGVhc2Ug
dGFrZSBhIHZpZXcgb24gdGhhdC4KVGhhbmtzLgoKPj4gLS0tCj4+ICBkcml2ZXJzL2J1cy9taGkv
aG9zdC9wY2lfZ2VuZXJpYy5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQo+PiAKPgo+Cj4tLSAKPldpdGggYmVz
dCB3aXNoZXMKPkRtaXRyeQo=

