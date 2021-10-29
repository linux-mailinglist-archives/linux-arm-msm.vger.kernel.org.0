Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FE543FA90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 12:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhJ2KS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 06:18:29 -0400
Received: from m1353.mail.163.com ([220.181.13.53]:38732 "EHLO
        m1353.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhJ2KS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 06:18:26 -0400
X-Greylist: delayed 910 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Oct 2021 06:18:25 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=rOLTh
        eprtj5UZw1gUN25Lfnp583GahQE1GPJcAvg308=; b=FBBuKz5CxBPfW8opRn5IZ
        Y5sfqaqz7Cp2xKOHYEnNaBdjBLjM/g/ojJs14AO2tFjeyh9kxqBYV7EXCpUiJjvw
        /eQWQAQR+rkDK0GfLlFeOxGVqfesSQJGYSkFnmjX9ZEfgRmFMzRUWiPEo/gQB4Hi
        W8Eppi8K4OSCSvFXrZjlGI=
Received: from slark_xiao$163.com ( [112.97.60.167] ) by
 ajax-webmail-wmsvr53 (Coremail) ; Fri, 29 Oct 2021 18:00:42 +0800 (CST)
X-Originating-IP: [112.97.60.167]
Date:   Fri, 29 Oct 2021 18:00:42 +0800 (CST)
From:   "Slark Xiao" <slark_xiao@163.com>
To:     "Manivannan Sadhasivam" <mani@kernel.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] bus: mhi: pci_generic: Add new device ID support for
 T99W175
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <20211029092619.GA4945@thinkpad>
References: <20211028034431.3563-1-slark_xiao@163.com>
 <20211029092619.GA4945@thinkpad>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <68a1613c.3e54.17ccb7e922b.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: NcGowAB3dOZKxnthSxPYAA--.38320W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbBDQo7ZFaEFsSeGAAAse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CkF0IDIwMjEtMTAtMjkgMTc6MjY6MTksICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPkhpLAo+Cj5PbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxMTo0NDoz
MUFNICswODAwLCBTbGFyayBYaWFvIHdyb3RlOgo+PiBBZGQgbmV3IGRldmljZSBJRCAweGUwYmYg
Zm9yIFQ5OVcxNzUuCj4+IAo+Cj5UaGFua3MgZm9yIHRoZSBwYXRjaCEgQ2FuIHlvdSBzaGFyZSB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgbW9kZW0gYW5kIHRoZQo+b25lIChUOTlXMTc1KSB3
ZSBhbHJlYWR5IGhhdmUgd2l0aCBQSUQgMHhlMGFiPwo+Cj5QbGVhc2UgaW5jbHVkZSB0aGUgcHJv
ZHVjdCBwYWdlIGluIGRlc2NyaXB0aW9uIGlmIGFueS4KPgo+VGhhbmtzLAo+TWFuaQo+CkhpIE1h
bmksCiAgIFRoYW5rcyBmb3IgdGhpcyByZXZpZXcuIAogICBBY3R1YWxseSB0aGlzIHByb2R1Y3Qo
U0RYNTUvMHhlMGJmKSBpcyB1c2luZyBRdWFsY29tbSBTRFg1NSBuZXcgYmFzZWxpbmUoTEUxLjQp
LCAKIGFuZCBwcmV2aW91cyBUOTlXMTc1LzB4ZTBhYiBpcyB1c2luZyBvcmlnaW5hbCBiYXNlIGxp
bmUoTEUxLjIpLgogICBPdXIgY3VzdG9tZXIgd2FudHMgdXMgdG8gdXNlIGRpZmZlcmVudCBkZXZp
Y2UgSUQgdG8gc2VwYXJhdGUgZnJvbSBlYWNoIG90aGVyLiAKICAgQ3VycmVudGx5IHdlIGRvbid0
IGhhdmUgcHJvZHVjdCBwYWdlICBhcyBvdXIgY3VzdG9tZXIncyBuZXcgcHJvZHVjdCBpcyBub3Qg
cmVsZWFzZWQuCgpUaGFua3MKU2xhcmsKPj4gVGVzdCBldmlkZW5jZSBhcyBiZWxvdzoKPj4gcm9v
dEBqYmQtVGhpbmtQYWQtUDEtR2VuLTQ6L2RldiMgbHNwY2kgLW5uIHwgZ3JlcCBGb3hjb25uCj4+
IDAwMDA6MDg6MDAuMCBXaXJlbGVzcyBjb250cm9sbGVyIFswZDQwXTogRm94Y29ubiBJbnRlcm5h
dGlvbmFsLCBJbmMuIERldmljZSBbMTA1YjplMGJmXQo+PiByb290QGpiZC1UaGlua1BhZC1QMS1H
ZW4tNDovZGV2IyBjYXQgd3dhbjBhdDAgJiBlY2hvIC1uZSAiYXRpXHIiID4gd3dhbjBhdDAKPj4g
WzJdIDI5NzcKPj4gcm9vdEBqYmQtVGhpbmtQYWQtUDEtR2VuLTQ6L2RldiMgYXRpCj4+IE1hbnVm
YWN0dXJlcjogUXVhbGNvbW0KPj4gTW9kZWw6IFQ5OVcxNzUKPj4gUmV2aXNpb246IFQ5OVcxNzUu
RjAuNi4wLjAuNi5DQy4wMDUgIDEgIFtPY3QgMjEgMjAyMSAxMDowMDowMF0KPj4gSU1FSToKPj4g
K0dDQVA6ICtDR1NNCj4+IAo+PiBPSwo+PiAKPj4gU2lnbmVkLW9mZi1ieTogU2xhcmsgWGlhbyA8
c2xhcmtfeGlhb0AxNjMuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJp
Yy5jIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4gCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYyBiL2RyaXZlcnMvYnVzL21o
aS9wY2lfZ2VuZXJpYy5jCj4+IGluZGV4IDU5YTQ4OTZhODAzMC4uNTY2NDgzZGMxNWRiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYwo+PiArKysgYi9kcml2ZXJz
L2J1cy9taGkvcGNpX2dlbmVyaWMuYwo+PiBAQCAtNDIzLDYgKzQyMyw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7Cj4+ICAJLyogRFc1
OTMwZSAoc2R4NTUpLCBOb24tZVNJTSwgSXQncyBhbHNvIFQ5OVcxNzUgKi8KPj4gIAl7IFBDSV9E
RVZJQ0UoUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAweGUwYjEpLAo+PiAgCQkuZHJpdmVyX2RhdGEg
PSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94Y29ubl9zZHg1NV9pbmZvIH0sCj4+ICsJLyogVDk5
VzE3NSAoc2R4NTUpICovCj4+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRk9YQ09OTiwg
MHhlMGJmKSwKPj4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190KSAmbWhpX2ZveGNv
bm5fc2R4NTVfaW5mbyB9LAo+PiAgCS8qIE1WMzEtVyAoQ2ludGVyaW9uKSAqLwo+PiAgCXsgUENJ
X0RFVklDRSgweDEyNjksIDB4MDBiMyksCj4+ICAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxv
bmdfdCkgJm1oaV9tdjMxX2luZm8gfSwKPj4gLS0gCj4+IDIuMjUuMQo+PiAK
