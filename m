Return-Path: <linux-arm-msm+bounces-20035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FC8C97A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 03:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8951C20C72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 01:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653024C83;
	Mon, 20 May 2024 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KgU8ndk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADC04C65;
	Mon, 20 May 2024 01:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716168166; cv=none; b=nyal7CHxBSLEarkKYX6rZontm4Bz73lk7M1LR5Cc39XE/EsF0P5oWRiEEElmHw9/nWS6SSutkQOmYupVSwiyUNu57+hiAMue+MUTvsv4+qjsjG2LIQZJgjcZXALBmarj98854Kh5Y7FH4mPloID63TeA3AuoqocYEsJSkDMhycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716168166; c=relaxed/simple;
	bh=IxUizn3MSEbGXqlAe8iRTlgnMGH5kgVKxx8StPuqtHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=pRSCLK5fr5NcExavcNd5Yw8qEVxsMHjWgGSj3ZBGGTGvAZ+zUUliSAJKM9zRyJjXPxNpJooelI6IwZNMscMSY1NcjFTUD2McOimyzZ0BWlx6jNrN6iZDcNPj60l+etoF9sqpA2yaSlHxD6hVFTSDQFKR+7G35kKNCEwG/HH3jTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KgU8ndk4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=IxUizn3MSEbGXqlAe8iRTlgnMGH5kgVKxx8StPuqtHI=; b=K
	gU8ndk428Mcw/56tWO0FBQdKJaexwwDdQRN41xMTrpouharcZy8gvWNczYPmcsim
	aV7dFLFjfmia3o19VjATXeyUAc9a49JmQk68P7DlNOVAxjPMl51hMQ3KJ2ulchI1
	eUzEB9Yn5y+WphmEB0SQR7MCwlRELInOxYzIh2GOa4=
Received: from slark_xiao$163.com ( [223.160.225.67] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Mon, 20 May 2024 09:21:16 +0800
 (CST)
Date: Mon, 20 May 2024 09:21:16 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, loic.poulain@linaro.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com
Subject: Re:Re: Re:Re: Re: Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72
 related support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240517104947.GA41015@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
 <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>
 <20240515115239.GD4488@thinkpad>
 <58fb648d.ab03.18f7c2f90bd.Coremail.slark_xiao@163.com>
 <20240516142346.GA6922@thinkpad>
 <20b11ca1.101c.18f8418706b.Coremail.slark_xiao@163.com>
 <6f6143b2.9e05.18f85fda5f9.Coremail.slark_xiao@163.com>
 <20240517104947.GA41015@thinkpad>
X-NTES-SC: AL_Qu2aBP2dt0gs4CiQZ+lSzDJ0+4xYBZ7O34lsmcIsWP8snATS0SQcVnZRPUbK9+YfEy2BEJG/AuD9M2sq2Vd/
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4c4eb491.13b6.18f9396ae58.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD332eMpUpmQj4yAA--.14107W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiow7iZGVODcRgVAADs+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI0LTA1LTE3IDE4OjQ5OjQ3LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaXZh
bm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlOgo+T24gRnJpLCBNYXkgMTcsIDIwMjQg
YXQgMDU6NTk6MDNQTSArMDgwMCwgU2xhcmsgWGlhbyB3cm90ZToKPj4gCj4+IEF0IDIwMjQtMDUt
MTcgMDk6MDk6MDUsICJTbGFyayBYaWFvIiA8c2xhcmtfeGlhb0AxNjMuY29tPiB3cm90ZToKPj4g
Pgo+PiA+QXQgMjAyNC0wNS0xNiAyMjoyMzo0NiwgIk1hbml2YW5uYW4gU2FkaGFzaXZhbSIgPG1h
bml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPj4gPj5PbiBXZWQsIE1heSAx
NSwgMjAyNCBhdCAwODoxNzoyM1BNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiA+Pj4gCj4+
ID4+PiAKPj4gPj4+IEF0IDIwMjQtMDUtMTUgMTk6NTI6MzksICJNYW5pdmFubmFuIFNhZGhhc2l2
YW0iIDxtYW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Pj4gPk9uIFdlZCwgTWF5IDE1LCAyMDI0
IGF0IDA0OjAxOjM3UE0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+ID4+PiA+PiAKPj4gPj4+
ID4+IEF0IDIwMjQtMDUtMTUgMTU6NDE6MTksICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5p
dmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj4+ID4+PiA+PiA+KyBRaWFuZwo+
PiA+Pj4gPj4gPgo+PiA+Pj4gPj4gPk9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0IDA5OjI5OjIwQU0g
KzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+ID4+PiA+PiA+PiBBdCAyMDI0LTA1LTE0IDIyOjM3
OjQxLCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFy
by5vcmc+IHdyb3RlOgo+PiA+Pj4gPj4gPj4gPk9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0IDExOjI2
OjU3QU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+ID4+PiA+PiA+PiA+PiBBbGlnbiB3aXRo
IFFjb20gU0RYNzIsIGFkZCByZWFkeSB0aW1lb3V0IGl0ZW0gZm9yIEZveGNvbm4gU0RYNzIuCj4+
ID4+PiA+PiA+PiA+PiBBbmQgYWxzbywgYWRkIGZpcmVob3NlIHN1cHBvcnQgc2luY2UgU0RYNzIu
Cj4+ID4+PiA+PiA+PiA+PiAKPj4gPj4+ID4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IFNsYXJrIFhp
YW8gPHNsYXJrX3hpYW9AMTYzLmNvbT4KPj4gPj4+ID4+ID4+ID4+IC0tLQo+PiA+Pj4gPj4gPj4g
Pj4gIGRyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMgfCAzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4gPj4+ID4+ID4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQo+PiA+Pj4gPj4gPj4gPj4gCj4+ID4+PiA+PiA+PiA+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9idXMvbWhpL2hvc3QvcGNpX2dlbmVyaWMuYyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0
L3BjaV9nZW5lcmljLmMKPj4gPj4+ID4+ID4+ID4+IGluZGV4IDA4ODQ0ZWU3OTY1NC4uMGZkOTRj
MTkzZmM2IDEwMDY0NAo+PiA+Pj4gPj4gPj4gPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYwo+PiA+Pj4gPj4gPj4gPj4gKysrIGIvZHJpdmVycy9idXMvbWhpL2hvc3Qv
cGNpX2dlbmVyaWMuYwo+PiA+Pj4gPj4gPj4gPj4gQEAgLTM5OSw2ICszOTksOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG1oaV9jaGFubmVsX2NvbmZpZyBtaGlfZm94Y29ubl9zZHg1NV9jaGFubmVs
c1tdID0gewo+PiA+Pj4gPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfREwoMTMsICJNQklN
IiwgMzIsIDApLAo+PiA+Pj4gPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfVUwoMzIsICJE
VU4iLCAzMiwgMCksCj4+ID4+PiA+PiA+PiA+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgzMywg
IkRVTiIsIDMyLCAwKSwKPj4gPj4+ID4+ID4+ID4+ICsJTUhJX0NIQU5ORUxfQ09ORklHX1VMX0ZQ
KDM0LCAiRklSRUhPU0UiLCAzMiwgMCksCj4+ID4+PiA+PiA+PiA+PiArCU1ISV9DSEFOTkVMX0NP
TkZJR19ETF9GUCgzNSwgIkZJUkVIT1NFIiwgMzIsIDApLAo+PiA+Pj4gPj4gPj4gPgo+PiA+Pj4g
Pj4gPj4gPlRoaXMgbWVhbnMgU0RYNTUgaXMgYWxzbyBzdXBwb3J0aW5nIEZJUkVIT1NFIGNoYW5u
ZWxzLCB3aGljaCBpcyBub3QgdHJ1ZSBJCj4+ID4+PiA+PiA+PiA+YmVsaWV2ZS4KPj4gPj4+ID4+
ID4+IEFjdHVhbGx5LCBJIGp1c3QgdmVyaWZpZWQgaXQgd2l0aCBteSBzZHg1NSBhbmQgdGhlIGFu
c3dlciBpcyBZZXMuIFRoZXNlIGNoYW5uZWxzCj4+ID4+PiA+PiA+PiBhcmUgY29tbW9uIHNldHRp
bmdzIGZvciBRY29tIGRldmljZSB3aGljaCBzdXBwb3J0IFBDSWUgbW9kZS4gQlRXLCB0aGUKPj4g
Pj4+ID4+ID4+IGRlZmF1bHQgc2V0dGluZ3Mgb2YgUWNvbSBhbmQgUXVlY3RlbCBzdXBwb3J0IGZp
cmVob3NlIGZvciB0aGVpciBzZHg1NSBwcm9kdWN0cy4KPj4gPj4+ID4+ID4KPj4gPj4+ID4+ID5R
aWFuZywgY2FuIHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IFNEWDU1IHN1cHBvcnRzIEZJUkVIT1NF
IGNoYW5uZWxzPwo+PiA+Pj4gPj4gPgo+PiA+Pj4gPj4gPj4gPgo+PiA+Pj4gPj4gPj4gPj4gIAlN
SElfQ0hBTk5FTF9DT05GSUdfSFdfVUwoMTAwLCAiSVBfSFcwX01CSU0iLCAxMjgsIDIpLAo+PiA+
Pj4gPj4gPj4gPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfSFdfREwoMTAxLCAiSVBfSFcwX01CSU0i
LCAxMjgsIDMpLAo+PiA+Pj4gPj4gPj4gPj4gIH07Cj4+ID4+PiA+PiA+PiA+PiBAQCAtNDE5LDYg
KzQyMSwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2Rl
bV9mb3hjb25uX3NkeDU1X2NvbmZpZyA9IHsKPj4gPj4+ID4+ID4+ID4+ICAJLmV2ZW50X2NmZyA9
IG1oaV9mb3hjb25uX3NkeDU1X2V2ZW50cywKPj4gPj4+ID4+ID4+ID4+ICB9Owo+PiA+Pj4gPj4g
Pj4gPj4gIAo+PiA+Pj4gPj4gPj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWhpX2NvbnRyb2xs
ZXJfY29uZmlnIG1vZGVtX2ZveGNvbm5fc2R4NzJfY29uZmlnID0gewo+PiA+Pj4gPj4gPj4gPj4g
KwkubWF4X2NoYW5uZWxzID0gMTI4LAo+PiA+Pj4gPj4gPj4gPj4gKwkudGltZW91dF9tcyA9IDIw
MDAwLAo+PiA+Pj4gPj4gPj4gPj4gKwkucmVhZHlfdGltZW91dF9tcyA9IDUwMDAwLAo+PiA+Pj4g
Pj4gPj4gPj4gKwkubnVtX2NoYW5uZWxzID0gQVJSQVlfU0laRShtaGlfZm94Y29ubl9zZHg1NV9j
aGFubmVscyksCj4+ID4+PiA+PiA+PiA+PiArCS5jaF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9j
aGFubmVscywKPj4gPj4+ID4+ID4+ID4+ICsJLm51bV9ldmVudHMgPSBBUlJBWV9TSVpFKG1oaV9m
b3hjb25uX3NkeDU1X2V2ZW50cyksCj4+ID4+PiA+PiA+PiA+PiArCS5ldmVudF9jZmcgPSBtaGlf
Zm94Y29ubl9zZHg1NV9ldmVudHMsCj4+ID4+PiA+PiA+PiA+PiArfTsKPj4gPj4+ID4+ID4+ID4+
ICsKPj4gPj4+ID4+ID4+ID4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8g
bWhpX2ZveGNvbm5fc2R4MjRfaW5mbyA9IHsKPj4gPj4+ID4+ID4+ID4+ICAJLm5hbWUgPSAiZm94
Y29ubi1zZHgyNCIsCj4+ID4+PiA+PiA+PiA+PiAgCS5jb25maWcgPSAmbW9kZW1fZm94Y29ubl9z
ZHg1NV9jb25maWcsCj4+ID4+PiA+PiA+PiA+PiBAQCAtNDQ4LDYgKzQ2MCwxNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4NjVfaW5mbyA9IHsK
Pj4gPj4+ID4+ID4+ID4+ICAJLnNpZGViYW5kX3dha2UgPSBmYWxzZSwKPj4gPj4+ID4+ID4+ID4+
ICB9Owo+PiA+Pj4gPj4gPj4gPj4gIAo+PiA+Pj4gPj4gPj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgbWhpX3BjaV9kZXZfaW5mbyBtaGlfZm94Y29ubl9zZHg3Ml9pbmZvID0gewo+PiA+Pj4gPj4g
Pj4gPj4gKwkubmFtZSA9ICJmb3hjb25uLXNkeDcyIiwKPj4gPj4+ID4+ID4+ID4+ICsJLmVkbCA9
ICJxY29tL3NkeDcybS94Ymxfc19kZXZwcmdfbnMubWVsZiIsCj4+ID4+PiA+PiA+PiA+Cj4+ID4+
PiA+PiA+PiA+V2hhdCBpcyAnLm1lbGYnPyBJcyB0aGUgZmlybXdhcmUgYXZhaWxhYmxlIHNvbWV3
aGVyZT8gRGlkIHlvdSBwbGFuIHRvIHVwc3RyZWFtCj4+ID4+PiA+PiA+PiA+aXQgdG8gbGludXgt
ZmlybXdhcmU/Cj4+ID4+PiA+PiA+PiA+Cj4+ID4+PiA+PiA+PiBUaGlzIGZpbGUgc2ltaWxhciB3
aXRoICJlZGwubWJuIi4gSW4gU0RYNzIgcHJvZHVjdCwgdGhlIGRlZmF1bHQgImVkbCIgZmlsZSBu
YW1lIGlzCj4+ID4+PiA+PiA+PiAieGJsX3NfZGV2cHJnX25zLm1lbGYiLiBDdXJyZW50bHkgd2Ug
ZG9uJ3QgcGxhbiB0byB1cHN0cmVhbSBpdCB0byBsaW51eC1maXJtd2FyZQo+PiA+Pj4gPj4gPj4g
c2luY2UgMiByZWFzb25zOiAxOiB3ZSBzaGFyZSB0aGUgc2FtZSBmb2xkIG5hbWUgc2R4NzJtIHdp
dGggcWNvbSBvciBvdGhlciB2ZW5kb3JzCj4+ID4+PiA+PiA+PiAyOiB0aGlzIGZpbGUgbWF5IGJl
IGNoYW5nZWQgc2luY2Ugc2R4NzIgcHJvZHVjdCBzdGlsbCB1bmRlciBkZXZlbG9waW5nIGluIG91
ciBzaWRlLiB3ZQo+PiA+Pj4gPj4gPj4gbWF5IGNoYW5nZSB0aGUgYmFzZSBsaW5lIGFjY29yZGlu
ZyB0byBRQ09NIHJlbGVhc2UuCj4+ID4+PiA+PiA+Cj4+ID4+PiA+PiA+VGhlbiBJIHdvdWxkIGFz
ayB5b3UgdG8gYWRkIHN1cHBvcnQgd2hlbiB5b3UgaGF2ZSBhIHN0YWJsZSBmaXJtd2FyZS4gSSBk
byBub3QKPj4gPj4+ID4+ID53YW50IHRvIGNoYW5nZSB0aGUgZmlybXdhcmUgbmFtZSBhZnRlciBz
b21lIHRpbWUgYXMgaXQgd2lsbCBjb25mdXNlIHVzZXJzLgo+PiA+Pj4gPj4gPgo+PiA+Pj4gPj4g
Pi0gTWFuaQo+PiA+Pj4gPj4gSWYgYSBzdGFibGUgZmlybXdhcmUgbXVzdCBiZSBwcm92aWRlZCwg
SSB0aGluayBJIHNoYWxsIGNoYW5nZSB0aGUgZm9sZGVyIG5hbWUgZnJvbSBxY29tIHRvCj4+ID4+
PiA+PiBmb3gsIGRvIHlvdSBhZ3JlZSB0aGlzPwo+PiA+Pj4gPgo+PiA+Pj4gPkV2ZW4gaW4gdGhh
dCBjYXNlLCB3aGVyZSBjYW4gdGhlIHVzZXIgZmluZCB0aGUgZmlybXdhcmU/Cj4+ID4+PiA+Cj4+
ID4+PiBJIHRoaW5rIHRoaXMgZWRsIGZpbGUgY291bGQgaGVscCB1c2VyIGxldCBkZXZpY2UgZW50
ZXIgaW50byBlZGwgbW9kZSh3d2FuMGZpcmVob3NlMCkuCj4+ID4+PiBGb3IgUENJRSBkZXZpY2Us
IHRoZXJlIGlzIG5vIG9wZW5zb3VyY2UgdG9vbCB0byBzdXBwb3J0IFBDSUUgZWRsIGRvd25sb2Fk
LiBJZiB1c2VyCj4+ID4+PiBjb3VsZCBnZXQgdGhlIHRvb2wgdG8gZG8gdGhlIGZpcmVob3NlIGRv
d25sb2FkLCBJIHRoaW5rIGl0J3Mgbm90IGhhcmQgdG8gZ2V0IGNvbXBsZXRlIGZpcm13YXJlCj4+
ID4+PiBmcm9tIFBDIHZlbmRvciBvciBzb21ld2hlcmUgZWxzZS4KPj4gPj4KPj4gPj5JIHdhcyB0
b2xkIHRoYXQgUWNvbSB3aWxsIHVwc3RyZWFtIHRoZSBQQ0kgc3VwcG9ydCBmb3IgUURMIGluIHRo
ZSBjb21pbmcgd2Vla3MuCj4+ID4+T25jZSB0aGF0IGhhcHBlbnMgKGV2ZW4gaWYgYSBQUiksIEkn
bGwgc2hhcmUgdGhhdCB3aXRoIHlvdS4gUGxlYXNlIHRlc3QgaXQgYW5kCj4+ID4+bGV0IG1lIGtu
b3cgaWYgdGhhdCB3b3JrcyBvciBub3QuCj4+ID4+Cj4+ID5TdXJlLiBCdXQgSSB0aGluayB0aGlz
IHNoYWxsIG5vdCB0aGUgYmxvY2sgY2F1c2UgZm9yIG1lcmdpbmcgdGhpcyBwYXRjaCwgcmlnaHQ/
Cj4+ID5CZWZvcmUgdGhhdCBQUiwgd2UgaGF2ZSB2ZXJpZmllZCB0aGUgZmlyZWhvc2UgZnVuY3Rp
b24gaW4gb3VyIGxvY2FsIHdpdGggb3VyCj4+ID5maXJlaG9zZSB0b29sIHdoaWNoIGlzIG5vdCBv
cGVuLiAKPgo+WWVhaCwgUURMIGlzIG5vdCBhIGJsb2NrZXIgZm9yIHRoaXMgZGV2aWNlLgpJZiB0
aGVyZSBpcyBubyBvdGhlciBpc3N1ZSwgSSB3aWxsIHJlbGVhc2UgYSBWMiB2ZXJzaW9uIGJhc2Vk
IG9uIHRoZSBlZGwgZmlsZSBwYXRoIGFuZCBuYW1lLgpBbHNvLCBJIHdpbGwgYWRkIHRoZSAiLmVk
bF90cmlnZ2VyPXRydWUiIGZvciBteSBzZHg3MiBkZXZpY2VzLgpGb3IgcHJldmlvdXMgc2R4NTUg
YW5kIHNkeDY1IGZpcmVob3NlIHN1cHBvcnQsIEkgdGhpbmsgYSBuZXcgY29tbWl0IHdvdWxkIGJl
IGJldHRlciAKdG8gY292ZXIgdGhhdC4KPgo+PiA+PkFuZCBmb3IgZW50ZXJpbmcgRURMIG1vZGUs
IHdlIGhhdmUgcmVjZW50bHkgYWRkZWQgc3VwcG9ydCB0byB0cmlnZ2VyIEVETCBtb2RlCj4+ID4+
ZnJvbSBob3N0IFsxXS4gQ291bGQgeW91IGFsc28gdGVzdCB0aGF0PyBZb3UganVzdCBuZWVkIHRv
IGFkZCBgZWRsX3RyaWdnZXIgPQo+PiA+PnRydWVgIHRvIHRoZSBgbWhpX3BjaV9kZXZfaW5mb2Ag
c3RydWN0IG9mIFNEWDcyIGFuZCB0cmlnZ2VyIEVETCBtb2RlIGZyb20gaG9zdAo+PiA+PmJ5Ogo+
PiA+Pgo+PiA+PmVjaG8gMSA+IC9zeXMvYnVzL21oaS9kZXZpY2VzLy4uLi90cmlnZ2VyX2VkbAo+
PiA+Pgo+PiA+RG8geW91IHJlbWVtYmVyIHRoYXQgSSB0b2xkIHlvdSBJIHdhbnQgdG8gbWVyZ2Ug
c3VjaCBmdW5jdGlvbiBmcm9tIHF1YWxjb21tIGRyaXZlcgo+PiA+aW4gbGFzdCB5ZWFyPyBJIG1l
cmdlIHRoZSBjb21taXQgZnJvbSBRVUQgZHJpdmVyIGluIG15IGxvY2FsLiBBY3R1YWxseSBpdCdz
IHNhbWUgYXMgdGhlCj4+ID5jb21taXQgWzFdLCBpdCdzIGNhbGxlZCAiZm9yY2VfZWRsIi4gQW5k
IHN1cmUsIHRoZSByZXN1bHQgaXMgeWVzLCBpdCB3b3JrcyB3ZWxsLgo+PiA+Cj4+IExhdGVzdCB0
ZXN0LCBpdCBkb2Vzbid0IHdvcmsgaW4gTGludXggVjYuOSBzaW5jZSB0aGVyZSBpcyBhIHBhdGNo
IG1pc3NpbmcuIEluIG15IGxvY2FsIHByZXZpb3VzCj4+IHRlc3QsIHRoZXJlIGlzIG5vIG1oaV9j
bnRybC0+ZWRsX3RyaWdnZXIgY29uZGl0aW9uIHRvIHNldCB1cCBkZXZfYXR0cl90cmlnZ2VyX2Vk
bC4KPj4gU2VlbXMgcGF0Y2ggWzJdIGlzIG1pc3NlZC4KPj4gCj4+IFsyXS1odHRwczovL2xvcmUu
a2VybmVsLm9yZy9taGkvMTcxMzkyODkxNS0xODIyOS00LWdpdC1zZW5kLWVtYWlsLXF1aWNfcWlh
bnl1QHF1aWNpbmMuY29tLwo+Cj5Zb3UgbmVlZCB0byBhcHBseSB0aGUgd2hvbGUgc2VyaWVzLiBC
dXQgYW55d2F5LCB0aGFua3MgZm9yIHRlc3RpbmcgaXQgb3V0Lgo+Cj4+ID4+PiA+PiBCVFcsIEkg
bmVlZCB0byBjaGVjayBpZiBpdCB3b3JrcyBhZnRlciB1cGRhdGluZyAnZWRsIGZ3JyBmcm9tICB4
Ymxfc19kZXZwcmdfbnMubWVsZiB0bwo+PiA+Pj4gPj4gZWRsLm1ibi4gCj4+ID4+PiAKPj4gPj4+
ID4KPj4gPj4+ID5Pa2F5LiBJTU8sIHdlIHNob3VsZCB1cHN0cmVhbSB0aGUgcHJvZHVjdCBzdXBw
b3J0IG9ubHkgYWZ0ZXIgYSBzdGFibGUgZmlybXdhcmUKPj4gPj4+ID5yZWxlYXNlICh3ZWxsIHN0
YWJsZSBpbiB0aGUgc2Vuc2UgYSBzdGFibGUgbmFtZSBhdCBsZWFzdCkuCj4+ID4+PiA+Cj4+ID4+
PiA+LSBNYW5pCj4+ID4+PiBUaGUgY2hlY2sgcmVzdWx0IGlzIHdlIGNhbiByZW5hbWUgaXQgdG8g
YWxpZ24gd2l0aCBwcmV2aW91cyBmb3JtYXQuIFVudGlsIG5vdywgCj4+ID4+PiBJIGRpZG4ndCBz
ZWUgYW55IG1oaSBkZXZpY2UgaGFzIHVwc3RyZWFtIHRoZWlyIGZpcm13YXJlIHRvIC9saWIvZmly
bXdhcmUvcWNvbSBmb2xkZXIuCj4+ID4+Cj4+ID4+SXQgaXMgbm90IG1hbmRhdG9yeSwgYnV0IGl0
IGlzIGEgYmVzdCBwcmFjdGlzZSB0aGF0IEkgcmVjZW50bHkgc3RhcnRlZCBhc2tpbmcKPj4gPj5m
b3IuCj4+ID4+Cj4+ID4+PiBJZiBpdCdzIGEgbXVzdCwgSSB0aGluayB3ZSBjYW4gdXBzdHJlYW0g
dGhlIGVkbCBmaWxlIGxhdGVyLiAgQW55d2F5LCB3ZSBob3BlIHdlIGNhbgo+PiA+Pj4gbWVyZ2Ug
dGhpcyBzZHg3MiBzdXBwb3J0IGludG8gNi4xMCBzaW5jZSBjdXN0b21lcihEZWxsKSB3b3VsZCB1
c2UgdGhpcyBrZXJuZWwgZm9yIG9mZmljaWFsCj4+ID4+PiByZWxlYXNlLiBCdXQgbm8gd29ycnks
IHdlIGNhbiBtYWtlIHN1cmUgdGhpcyBmaXJlaG9zZSBkb3dubG9hZCBtZXRob2Qgd29ya3Mgd2Vs
bCBpbgo+PiA+Pj4gIG91ciBsb2NhbCBzaWRlLgo+PiA+Pj4gQW5kIGFsc28sIHBsZWFzZSBoZWxw
IGEgcmV2aWV3IGFib3V0IG15IHByZXZpb3VzIGVtYWlsIGFib3V0IGZpeCBzZHg3MiBwaW5nIGZh
aWx1cmUgaXNzdWUuCj4+ID4+PiBUaGVyZSBpcyBhIGZpeCBzb2x1dGlvbiBmcm9tIHVzLiAKPj4g
Pj4+IAo+PiA+Pgo+PiA+PlFpYW5nIGlzIHdvcmtpbmcgb24gdGhhdC4KPj4gPkdvb2QgdG8gaGVh
ciB0aGF0LiBCVFcsIG1heSBJIGtub3cgdGhlIGZlYXR1cmUgbWVyZ2Ugd2luZG93IGluIFY2LjEw
PyBJIGRvbid0IHdvcnJ5IGFib3V0Cj4+ID5tZXJnZSB3aW5kb3cgb2YgdGhlIG5ldHdvcmsgZml4
IGNvbW1pdCwgc2luY2UgaXQncyBhIGZpeCB3aXRoIGhpZ2hlciBwcmlvcml0eS4gQnV0IEkgd2Fu
dCB0bwo+PiA+bWVyZ2UgdGhlIGJhc2ljIHN1cHBvcnQgb2YgbXkgU0RYNzIgYmVmb3JlIG1lcmdl
IHdpbmRvdyBjbG9zZS4gVGhpcyBpcyBpbXBvcnRhbnQgZm9yIHVzLgo+PiA+Cj4KPk1ISSB0cmVl
IGlzIGNsb3NlZCBkdXJpbmcgLXJjNiwgc28gdGhlcmUgaXMgbm8gd2F5IHRoaXMgcGF0Y2ggY2Fu
IG1ha2UgNi4xMC4KSSBzYXcgeW91IHRhZyBtaGktZm9yLTYuMTAgd2hpY2ggd2FzIGNyZWF0ZWQg
aW4gNC8yNSwgIGJlZm9yZSBsaW51eCA2LjktUkM2LgpCdXQgVjYuOSB3YXMganVzdCByZWxlYXNl
ZCBpbiA1LzEzLCBhbmQgdGhlcmUgaXMgYSBsb3Qgb2YgdGltZSBiZWZvcmUgVjYuMTAuCldoeSBj
bG9zZSB0aGUgbWVyZ2Ugd2luZG93IGZvciBWNi4xMCBzbyBlYXJseT8KPgo+LSBNYW5pCj4KPi0t
IAo+4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQo=


