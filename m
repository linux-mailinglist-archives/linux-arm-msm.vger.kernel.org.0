Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F241A44609F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 09:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhKEI2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 04:28:17 -0400
Received: from m13129.mail.163.com ([220.181.13.129]:41880 "EHLO
        m13129.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbhKEI2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 04:28:15 -0400
X-Greylist: delayed 910 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Nov 2021 04:28:13 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=TYmsT
        PMh1S1uZPE8+HxVwSC8u/rKKcdbz/7ZGfwVB80=; b=RY/pKRcMMSkB5nmp3w0B5
        MtIZeG97Pvf+C6DEasZ3jMiJLU69PqpZk+l2tYoInCgpcHt2dO/q/4B5xhdBbQmT
        7wo6Lr31/vSr3UIE8BQwrBjC+9jVkVjN4y8/E7n1VwCFGhV8evKGS7/hqnmrnIsw
        cnRUrXkqPVAOjpxbsneC/E=
Received: from slark_xiao$163.com ( [112.97.59.196] ) by
 ajax-webmail-wmsvr129 (Coremail) ; Fri, 5 Nov 2021 16:10:16 +0800 (CST)
X-Originating-IP: [112.97.59.196]
Date:   Fri, 5 Nov 2021 16:10:16 +0800 (CST)
From:   "Slark Xiao" <slark_xiao@163.com>
To:     "Manivannan Sadhasivam" <mani@kernel.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2] bus: mhi: pci_generic: Add new device ID support
 for T99W175
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <20211102035632.GA5646@thinkpad>
References: <20211029104918.3976-1-slark_xiao@163.com>
 <20211102035632.GA5646@thinkpad>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <3baf9d54.30a5.17cef25fd60.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gcGowAB3EPro5oRhCknaAA--.48034W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbivxs-ZFWBwOEAhgACsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CgpBdCAyMDIxLTExLTAyIDExOjU2OjMyLCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIEZyaSwgT2N0IDI5LCAyMDIxIGF0IDA2OjQ5OjE4UE0gKzA4
MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IEFkZCBuZXcgZGV2aWNlIElEIDB4ZTBiZiBmb3IgVDk5
VzE3NS4KPj4gVGhpcyBkZXZpY2UgSUQgaXMgY3JlYXRlZCBiZWNhdXNlIGl0IGlzIHVzaW5nIFF1
YWxjb21tIFNEWDU1IG5ldyBiYXNlIGxpbmUuCj4+IAo+PiBUZXN0IGV2aWRlbmNlIGFzIGJlbG93
Ogo+PiByb290QGpiZC1UaGlua1BhZC1QMS1HZW4tNDovZGV2IyBsc3BjaSAtbm4gfCBncmVwIEZv
eGNvbm4KPj4gMDAwMDowODowMC4wIFdpcmVsZXNzIGNvbnRyb2xsZXIgWzBkNDBdOiBGb3hjb25u
IEludGVybmF0aW9uYWwsIEluYy4gRGV2aWNlIFsxMDViOmUwYmZdCj4+IHJvb3RAamJkLVRoaW5r
UGFkLVAxLUdlbi00Oi9kZXYjIGNhdCB3d2FuMGF0MCAmIGVjaG8gLW5lICJhdGlcciIgPiB3d2Fu
MGF0MAo+PiBbMl0gMjk3Nwo+PiByb290QGpiZC1UaGlua1BhZC1QMS1HZW4tNDovZGV2IyBhdGkK
Pj4gTWFudWZhY3R1cmVyOiBRdWFsY29tbQo+PiBNb2RlbDogVDk5VzE3NQo+PiBSZXZpc2lvbjog
VDk5VzE3NS5GMC42LjAuMC42LkNDLjAwNSAgMSAgW09jdCAyMSAyMDIxIDEwOjAwOjAwXQo+PiBJ
TUVJOgo+PiArR0NBUDogK0NHU00KPj4gCj4+IE9LCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBTbGFy
ayBYaWFvIDxzbGFya194aWFvQDE2My5jb20+Cj4KPlJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4KPgo+VGhhbmtzLAo+TWFuaQo+CkhpIE1hbmksCiAg
ICBXaGF0J3Mgb3VyIG5leHQgc3RlcD8gSSBkaWRuJ3Qgc2VlIGFueSByZWplY3Qgb3IgY29uZmly
bSBlbWFpbC4KICAgQ291bGQgeW91IGhlbHAgYXBwbHkgaXQgaWYgdGhlcmUgaXMgbm8gY29uY2Vy
bj8KClRoYW5rcwpTbGFyawo+PiAtLS0KPj4gCj4+IHYyOiBBZGQgZGVzY3JpcHRpb25zIGFib3V0
IHRoZSBkZmlpZmVyZW5jZSBiZXR3ZWVuIDB4ZTBhYiBhbmQgMHhlb2JmLgo+PiAtLS0KPj4gIGRy
aXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJpYy5jIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvcGNpX2dl
bmVyaWMuYyBiL2RyaXZlcnMvYnVzL21oaS9wY2lfZ2VuZXJpYy5jCj4+IGluZGV4IDU5YTQ4OTZh
ODAzMC4uOTRkOGFhOWMyZWFlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvcGNpX2dl
bmVyaWMuYwo+PiArKysgYi9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYwo+PiBAQCAtNDIz
LDYgKzQyMyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBtaGlfcGNpX2lk
X3RhYmxlW10gPSB7Cj4+ICAJLyogRFc1OTMwZSAoc2R4NTUpLCBOb24tZVNJTSwgSXQncyBhbHNv
IFQ5OVcxNzUgKi8KPj4gIAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAweGUw
YjEpLAo+PiAgCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94Y29ubl9z
ZHg1NV9pbmZvIH0sCj4+ICsJLyogVDk5VzE3NSAoc2R4NTUpLCBCYXNlZCBvbiBRdWFsY29tbSBu
ZXcgYmFzZWxpbmUgKi8KPj4gKwl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9GT1hDT05OLCAw
eGUwYmYpLAo+PiArCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfZm94Y29u
bl9zZHg1NV9pbmZvIH0sCj4+ICAJLyogTVYzMS1XIChDaW50ZXJpb24pICovCj4+ICAJeyBQQ0lf
REVWSUNFKDB4MTI2OSwgMHgwMGIzKSwKPj4gIAkJLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9u
Z190KSAmbWhpX212MzFfaW5mbyB9LAo+PiAtLSAKPj4gMi4yNS4xCj4+IAo=
