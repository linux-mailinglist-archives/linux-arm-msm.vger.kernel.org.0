Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1692138AC3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 13:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239728AbhETLgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 07:36:02 -0400
Received: from m1380.mail.163.com ([220.181.13.80]:31707 "EHLO
        m1380.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241607AbhETLdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 07:33:55 -0400
X-Greylist: delayed 938 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 May 2021 07:33:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Lvxlv
        /jbqFyHOx/iy1dvt7BdawmxAecjJiBDgIXlLmA=; b=bFATlEO229Lc5MhnJ2cWD
        bDPdDP2CBejMrQCOq1N/9lUUDhBkiYcPFKxXLHEsxLxSSJZw2LkqefKhAQaHNBba
        ZdrSnkhPHxMdW+iS5C0qspdwWoR1hkA8UqiyBNoviTzNG0aHSv3BeRnhl41yIeOY
        pb89batFAlg564f1qwgcoA=
Received: from wsj20369$163.com ( [120.197.196.176] ) by
 ajax-webmail-wmsvr80 (Coremail) ; Thu, 20 May 2021 19:16:40 +0800 (CST)
X-Originating-IP: [120.197.196.176]
Date:   Thu, 20 May 2021 19:16:40 +0800 (CST)
From:   "Shujun Wang" <wsj20369@163.com>
To:     bbhatt@codeaurora.org
Cc:     mani@kernel.org, hemantk@codeaurora.org, loic.poulain@linaro.org,
        jarvis.w.jiang@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH RESEND,v2] bus: mhi: pci_generic: T99W175: update
 channel name from AT to DUN
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <88d7754c381ba9eb927b4dd91e30ca35@codeaurora.org>
References: <20210517095415.3626-1-wsj20369@163.com>
 <88d7754c381ba9eb927b4dd91e30ca35@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <734feeda.5d5f.179897de742.Coremail.wsj20369@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: UMGowACHAzEZRaZgLrHkAA--.24290W
X-CM-SenderInfo: hzvmjiqtwzqiywtou0bp/xtbBQwaYF1++LpAUPAABs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CkF0IDIwMjEtMDUtMTggMDI6MDE6MTAsICJCaGF1bWlrIEJoYXR0IiA8YmJoYXR0QGNvZGVhdXJv
cmEub3JnPiB3cm90ZToKPk9uIDIwMjEtMDUtMTcgMDI6NTQgQU0sIFNodWp1biBXYW5nIHdyb3Rl
Ogo+PiBGcm9tOiBKYXJ2aXMgSmlhbmcgPGphcnZpcy53LmppYW5nQGdtYWlsLmNvbT4KPj4gCj4+
IEFjY29yZGluZyB0byBNSEkgdjEuMSBzcGVjaWZpY2F0aW9uLCBjaGFuZ2UgdGhlIGNoYW5uZWwg
bmFtZSBvZiBUOTlXMTc1Cj4+IGZyb20gIkFUIiB0byAiRFVOIiAoRGlhbC11cCBuZXR3b3JraW5n
KSBmb3IgYm90aCBjaGFubmVsIDMyIGFuZCAzMywKPj4gc28gdGhhdCB0aGUgY2hhbm5lbHMgY2Fu
IGJlIGJvdW5kIHRvIHRoZSBRY29tIFdXQU4gY29udHJvbCBkcml2ZXIsIGFuZAo+PiBkZXZpY2Ug
bm9kZSBzdWNoIGFzIC9kZXYvd3dhbjBwM0FUIHdpbGwgYmUgZ2VuZXJhdGVkLCB3aGljaCBpcyB2
ZXJ5IAo+PiB1c2VmdWwKPj4gZm9yIGRlYnVnZ2luZyBtb2RlbQo+PiAKPj4gRml4ZXM6IGFhYzQy
NjU2MmY1NiAoImJ1czogbWhpOiBwY2lfZ2VuZXJpYzogSW50cm9kdWNlIEZveGNvbm4gVDk5VzE3
NSAKPj4gc3VwcG9ydCIpCj4+IFNpZ25lZC1vZmYtYnk6IEphcnZpcyBKaWFuZyA8amFydmlzLncu
amlhbmdAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTaHVqdW4gV2FuZyA8d3NqMjAzNjlA
MTYzLmNvbT4KPgo+UmV2aWV3ZWQtYnk6IEJoYXVtaWsgQmhhdHQgPGJiaGF0dEBjb2RlYXVyb3Jh
Lm9yZz4KCkhpIEJoYXVtaWssCgpUaGFua3MgYSBsb3QuCgo+PiAtLS0KPj4gCj4+IHYyOiBBZGQ6
IEZpeGVzOiBhYWM0MjY1NjJmNTYKPj4gCj4+ICBkcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMu
YyB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYyAK
Pj4gYi9kcml2ZXJzL2J1cy9taGkvcGNpX2dlbmVyaWMuYwo+PiBpbmRleCA3YzgxMGYwMmEyZWYu
LjhjN2Y2NTc2ZTQyMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmlj
LmMKPj4gKysrIGIvZHJpdmVycy9idXMvbWhpL3BjaV9nZW5lcmljLmMKPj4gQEAgLTMxMSw4ICsz
MTEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jaGFubmVsX2NvbmZpZwo+PiBtaGlfZm94
Y29ubl9zZHg1NV9jaGFubmVsc1tdID0gewo+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19ETCg1LCAi
RElBRyIsIDMyLCAxKSwKPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfVUwoMTIsICJNQklNIiwgMzIs
IDApLAo+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgxMywgIk1CSU0iLCAzMiwgMCksCj4+IC0J
TUhJX0NIQU5ORUxfQ09ORklHX1VMKDMyLCAiQVQiLCAzMiwgMCksCj4+IC0JTUhJX0NIQU5ORUxf
Q09ORklHX0RMKDMzLCAiQVQiLCAzMiwgMCksCj4+ICsJTUhJX0NIQU5ORUxfQ09ORklHX1VMKDMy
LCAiRFVOIiwgMzIsIDApLAo+PiArCU1ISV9DSEFOTkVMX0NPTkZJR19ETCgzMywgIkRVTiIsIDMy
LCAwKSwKPj4gIAlNSElfQ0hBTk5FTF9DT05GSUdfSFdfVUwoMTAwLCAiSVBfSFcwX01CSU0iLCAx
MjgsIDIpLAo+PiAgCU1ISV9DSEFOTkVMX0NPTkZJR19IV19ETCgxMDEsICJJUF9IVzBfTUJJTSIs
IDEyOCwgMyksCj4+ICB9Owo+Cj5UaGFua3MsCj5CaGF1bWlrCj4tLS0KPlRoZSBRdWFsY29tbSBJ
bm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgCj5G
b3J1bSwKPmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QK
