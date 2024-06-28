Return-Path: <linux-arm-msm+bounces-24595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108D91BA1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A20351C22637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34C214B95F;
	Fri, 28 Jun 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="ZHVlouOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2887314277;
	Fri, 28 Jun 2024 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563744; cv=none; b=NMVk4GifXVxcZrNdKlTn1UZBAQ1oIhmqCQXu+wWL1UF4E+Km+v6uyRN0QXowatYmxkTHQgFe8Vt5ep5xYy0b9lgbSYRO+kbxz8y6pBMknH/R2W8qtzgoj4xTElhP2r76cDbkKZ8mgm42uUc2oQiWrwjMAWltHi9Ox4BcvBCmsjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563744; c=relaxed/simple;
	bh=yU0L8hd1qTtVIidU9yDSM5GnDT4YcJLlrVytBk3QuD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=bAgBY904i9IqZ+gwcMjpraclD6gRw9rdP9FxB2ee9h2SUungn0yg/5qZi8mI4fmQd6hhQPFYecedEYK32xuKCzitvzfzXOjn+o1Rel5dovMtOypgk1DCeg/5zk6diljNt9eTV8PfN7zm92XIjlD007eajnfbW+BgNS8qAaEUGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=ZHVlouOf reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZiUMtmAN3sFzFkSH6GXbbDKqYCyaXiS81zeG68633VI=; b=Z
	HVlouOfyIn+NDo0NCVjps7lzw/RKen8MnLEvwzB3XJvR+RIrdZ9qx+MIXWCsdeHW
	TqzINoIYvx+Wxu+yOczDZumQGBzsJltKKbPi7jDXocck8RFeZJnL9Nq8qt5gTYSP
	Q36cWaPAtqYEZUsjUOsvPQbR6++GkDkAGEDatIqOoU=
Received: from slark_xiao$163.com ( [112.97.61.84] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Fri, 28 Jun 2024 16:35:21 +0800
 (CST)
Date: Fri, 28 Jun 2024 16:35:21 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	quic_jhugo@quicinc.com, netdev@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re:Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <455cd5ee.86ad.1905df8bbab.Coremail.slark_xiao@163.com>
References: <20240628073605.1447218-1-slark_xiao@163.com>
 <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
 <455cd5ee.86ad.1905df8bbab.Coremail.slark_xiao@163.com>
X-NTES-SC: AL_Qu2aC/mdvE8p5yibZekfmk8Sg+84W8K3v/0v1YVQOpF8jBLo0w4rRVxgI2Hp/cKNLi6tlzu0ViZu0OhWXqpzZ7oofJl3jeIpx5Z9qKSrwQcHTQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <31b6372e.8805.1905dfc1c6e.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3PzbJdX5m0zQLAA--.29137W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbioxsMZGVOEH3Z8wAEs4
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMDYtMjggMTY6MzE6NDAsICJTbGFyayBYaWFvIiA8c2xhcmtfeGlhb0AxNjMuY29t
PiB3cm90ZToKPgo+QXQgMjAyNC0wNi0yOCAxNTo1MTo1NCwgIkRtaXRyeSBCYXJ5c2hrb3YiIDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IHdyb3RlOgo+Pk9uIEZyaSwgSnVuIDI4LCAyMDI0
IGF0IDAzOjM2OjA1UE0gR01ULCBTbGFyayBYaWFvIHdyb3RlOgo+Pj4gQWxpZ24gd2l0aCBRY29t
IFNEWDcyLCBhZGQgcmVhZHkgdGltZW91dCBpdGVtIGZvciBGb3hjb25uIFNEWDcyLgo+Pj4gQW5k
IGFsc28sIGFkZCBmaXJlaG9zZSBzdXBwb3J0IHNpbmNlIFNEWDcyLgo+Pj4gCj4+PiBTaWduZWQt
b2ZmLWJ5OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4+PiAtLS0KPj4+IHYyOiAo
MSkuIFVwZGF0ZSB0aGUgZWRsIGZpbGUgcGF0aCBhbmQgbmFtZSAoMikuIFNldCBTRFg3MiBzdXBw
b3J0Cj4+PiB0cmlnZ2VyIGVkbCBtb2RlIGJ5IGRlZmF1bHQKPj4+IHYzOiBEaXZpZGUgaW50byAy
IHBhcnRzIGZvciBGb3hjb25uIHNkeDcyIHBsYXRmb3JtCj4+Cj4+R2VuZXJpYyBjb21tZW50OiBw
bGVhc2Ugc2VuZCBhbGwgdGhlIHBhdGNoZXMgdXNpbmcgYSBzaW5nbGUKPj5naXQtc2VuZC1lbWFp
bCBjb21tYW5kLiBUaGlzIHdheSBpdCB3aWxsIHRocmVhZCB0aGVtIHByb3Blcmx5LCBzbyB0aGF0
Cj4+dGhleSBmb3JtIGEgc2luZ2xlIHBhdGNoc2VyaWVzIGluIGRldmVsb3BlcnMncyBtYWlsIGNs
aWVudHMuIE9yIHlvdSBjYW4KPj5qdXN0IHVzZSAnYjQnIHRvb2wgdG8gbWFuYWdlIGFuZCBzZW5k
IHRoZSBwYXRjaHNldC4KPj4KPgo+U2VuZCBhZ2FpbiB3aXRoIGNvbW1hbmQgImdpdCBzZW5kLWVt
YWlsIHYzLSoucGF0Y2ggLi4uIi4gUGxlYXNlIHRha2UgYSB2aWV3IG9uIHRoYXQuCj5UaGFua3Mu
Cj4KClNlZW1zIG5vIGRpZmZlcmVuY2UgaW4gbXkgc2lkZS4gQW55IGRpZmZlcmVuY2UgaW4geW91
ciBzaWRlPwoKPj4+IC0tLQo+Pj4gIGRyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKQo+Pj4gCj4+Cj4+Cj4+LS0gCj4+V2l0aCBiZXN0IHdpc2hlcwo+PkRt
aXRyeQo=

