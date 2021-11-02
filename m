Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB4A4425F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 04:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhKBDTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 23:19:08 -0400
Received: from m1323.mail.163.com ([220.181.13.23]:30010 "EHLO
        m1323.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbhKBDTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 23:19:01 -0400
X-Greylist: delayed 911 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Nov 2021 23:19:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=6VATN
        KfgorcZVyE79SpdxqyJGlEBWMswbQSsraXZmLE=; b=hbN4mYiuaPOGER0QJE51v
        7EjmtpLsLCqTa9bUU/eK2mq1b7RMP5t4GbaWtieeGWBszbu/NyGSpwCHqKLrKL5t
        aacFgOgEkMfq9dG8wNKCauv/zXUxhGEazmsnfyeSMJavv/DiFzZRtNwL5jv/d1sJ
        h8m7h6K6wGBrg8iwregY04=
Received: from slark_xiao$163.com ( [112.97.61.236] ) by
 ajax-webmail-wmsvr23 (Coremail) ; Tue, 2 Nov 2021 11:01:07 +0800 (CST)
X-Originating-IP: [112.97.61.236]
Date:   Tue, 2 Nov 2021 11:01:07 +0800 (CST)
From:   "Slark Xiao" <slark_xiao@163.com>
To:     "Manivannan Sadhasivam" <mani@kernel.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re:Re: Re: [PATCH] bus: mhi: pci_generic: Add new device ID support
 for T99W175
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <20211029102526.GD4945@thinkpad>
References: <20211028034431.3563-1-slark_xiao@163.com>
 <20211029092619.GA4945@thinkpad>
 <68a1613c.3e54.17ccb7e922b.Coremail.slark_xiao@163.com>
 <20211029102526.GD4945@thinkpad>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4cfd51f8.105e.17cde97e0d3.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: F8GowADn76fzqYBhvhajAA--.37377W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNRM7ZFrPd33I4wACsP
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CgpBdCAyMDIxLTEwLTI5IDE4OjI1OjI2LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIEZyaSwgT2N0IDI5LCAyMDIxIGF0IDA2OjAwOjQyUE0gKzA4
MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IAo+PiBBdCAyMDIxLTEwLTI5IDE3OjI2OjE5LCAiTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gCj4+ID5IaSwK
Pj4gPgo+PiA+T24gVGh1LCBPY3QgMjgsIDIwMjEgYXQgMTE6NDQ6MzFBTSArMDgwMCwgU2xhcmsg
WGlhbyB3cm90ZToKPj4gPj4gQWRkIG5ldyBkZXZpY2UgSUQgMHhlMGJmIGZvciBUOTlXMTc1Lgo+
PiA+PiAKPj4gPgo+PiA+VGhhbmtzIGZvciB0aGUgcGF0Y2ghIENhbiB5b3Ugc2hhcmUgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGlzIG1vZGVtIGFuZCB0aGUKPj4gPm9uZSAoVDk5VzE3NSkgd2Ug
YWxyZWFkeSBoYXZlIHdpdGggUElEIDB4ZTBhYj8KPj4gPgo+PiA+UGxlYXNlIGluY2x1ZGUgdGhl
IHByb2R1Y3QgcGFnZSBpbiBkZXNjcmlwdGlvbiBpZiBhbnkuCj4+ID4KPj4gPlRoYW5rcywKPj4g
Pk1hbmkKPj4gPgo+PiBIaSBNYW5pLAo+PiAgICBUaGFua3MgZm9yIHRoaXMgcmV2aWV3LiAKPj4g
ICAgQWN0dWFsbHkgdGhpcyBwcm9kdWN0KFNEWDU1LzB4ZTBiZikgaXMgdXNpbmcgUXVhbGNvbW0g
U0RYNTUgbmV3IGJhc2VsaW5lKExFMS40KSwgCj4+ICBhbmQgcHJldmlvdXMgVDk5VzE3NS8weGUw
YWIgaXMgdXNpbmcgb3JpZ2luYWwgYmFzZSBsaW5lKExFMS4yKS4KPj4gICAgT3VyIGN1c3RvbWVy
IHdhbnRzIHVzIHRvIHVzZSBkaWZmZXJlbnQgZGV2aWNlIElEIHRvIHNlcGFyYXRlIGZyb20gZWFj
aCBvdGhlci4gCj4+ICAgIEN1cnJlbnRseSB3ZSBkb24ndCBoYXZlIHByb2R1Y3QgcGFnZSAgYXMg
b3VyIGN1c3RvbWVyJ3MgbmV3IHByb2R1Y3QgaXMgbm90IHJlbGVhc2VkLgo+PiAKPgo+VGhhbmtz
IGZvciB0aGUgZXhwbGFuYXRpb24uIFBsZWFzZSBzZW5kIHYyIGFkZGluZyB0aGUgYmFzZWxpbmUg
aW5mbyBpbiBjb21taXQKPmRlc2NyaXB0aW9uLgo+Cj5UaGFua3MsCj5NYW5pCj4KSGkgTWFuaSwK
ICAgSSBoYXZlIHNlbnQgVjIgc2V2ZXJhbCBkYXlzIGFnbyAuIFBsZWFzZSB0YWtlIGEgbG9vayBv
biB0aGF0LgogICBSZWYgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMTAy
OTEwNDkxOC4zOTc2LTEtc2xhcmtfeGlhb0AxNjMuY29tLwoKVGhhbmtzIQpTbGFyawo+PiA+PiBU
ZXN0IGV2aWRlbmNlIGFzIGJlbG93Ogo+PiA+PiByb290QGpiZC1UaGlua1BhZC1QMS1HZW4tNDov
ZGV2IyBsc3BjaSAtbm4gfCBncmVwIEZveGNvbm4KPj4gPj4gMDAwMDowODowMC4wIFdpcmVsZXNz
IGNvbnRyb2xsZXIgWzBkNDBdOiBGb3hjb25uIEludGVybmF0aW9uYWwsIEluYy4gRGV2aWNlIFsx
MDViOmUwYmZdCj4+ID4+IHJvb3RAamJkLVRoaW5rUGFkLVAxLUdlbi00Oi9kZXYjIGNhdCB3d2Fu
MGF0MCAmIGVjaG8gLW5lICJhdGlcciIgPiB3d2FuMGF0MAo+PiA+PiBbMl0gMjk3Nwo+PiA+PiBy
b290QGpiZC1UaGlua1BhZC1QMS1HZW4tNDovZGV2IyBhdGkKPj4gPj4gTWFudWZhY3R1cmVyOiBR
dWFsY29tbQo+PiA+PiBNb2RlbDogVDk5VzE3NQo+PiA+PiBSZXZpc2lvbjogVDk5VzE3NS5GMC42
LjAuMC42LkNDLjAwNSAgMSAgW09jdCAyMSAyMDIxIDEwOjAwOjAwXQo+PiA+PiBJTUVJOgo+PiA+
PiArR0NBUDogK0NHU00KPj4gPj4gCj4+ID4+IE9LCj4+ID4+IAo+PiA+PiBTaWduZWQtb2ZmLWJ5
OiBTbGFyayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4+ID4+IC0tLQo+PiA+PiAgZHJpdmVy
cy9idXMvbWhpL3BjaV9nZW5lcmljLmMgfCAzICsrKwo+PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQo+PiA+PiAKPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9w
Y2lfZ2VuZXJpYy5jIGIvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMKPj4gPj4gaW5kZXgg
NTlhNDg5NmE4MDMwLi41NjY0ODNkYzE1ZGIgMTAwNjQ0Cj4+ID4+IC0tLSBhL2RyaXZlcnMvYnVz
L21oaS9wY2lfZ2VuZXJpYy5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJp
Yy5jCj4+ID4+IEBAIC00MjMsNiArNDIzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2
aWNlX2lkIG1oaV9wY2lfaWRfdGFibGVbXSA9IHsKPj4gPj4gIAkvKiBEVzU5MzBlIChzZHg1NSks
IE5vbi1lU0lNLCBJdCdzIGFsc28gVDk5VzE3NSAqLwo+PiA+PiAgCXsgUENJX0RFVklDRShQQ0lf
VkVORE9SX0lEX0ZPWENPTk4sIDB4ZTBiMSksCj4+ID4+ICAJCS5kcml2ZXJfZGF0YSA9IChrZXJu
ZWxfdWxvbmdfdCkgJm1oaV9mb3hjb25uX3NkeDU1X2luZm8gfSwKPj4gPj4gKwkvKiBUOTlXMTc1
IChzZHg1NSkgKi8KPj4gPj4gKwl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAw
eGUwYmYpLAo+PiA+PiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94
Y29ubl9zZHg1NV9pbmZvIH0sCj4+ID4+ICAJLyogTVYzMS1XIChDaW50ZXJpb24pICovCj4+ID4+
ICAJeyBQQ0lfREVWSUNFKDB4MTI2OSwgMHgwMGIzKSwKPj4gPj4gIAkJLmRyaXZlcl9kYXRhID0g
KGtlcm5lbF91bG9uZ190KSAmbWhpX212MzFfaW5mbyB9LAo+PiA+PiAtLSAKPj4gPj4gMi4yNS4x
Cj4+ID4+IAo=
