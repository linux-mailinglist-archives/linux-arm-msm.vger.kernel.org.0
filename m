Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688283ECBCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 01:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhHOXbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Aug 2021 19:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhHOXbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Aug 2021 19:31:04 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55646C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Aug 2021 16:30:33 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C33A6806AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 11:30:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1629070228;
        bh=WGiW4tTLs42hhp6/QeycCl4WRLERNE62T/xwNTMUVY4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=tqC3Sg6fTAJeQ6aLGkktEnX0P9XZOFVbOuJS/4istCCNT1XQOH2+BbB3ymfCKHAQx
         wXA6U++OiUNdrRhLMhMvZJWWCRnxxZJkyHzb2nUTVfssY5ibuEDMPPNUrhewZpLeYF
         QPLwG28KrLpnzXZ+qdaIsmCbifqfkCvHXF24MgOgMG3ApygZZlG+KZltznDjeN0Swu
         t/gzgSJTJNdNwv4fgxE30U0OEk+o2uJHK40ibQPo5E9/lEIr9KRQrolD4VslmbfTSX
         BY/1ZqN8PoH95QsEHTPVp2zBANjjs4hAisQHwSomVWbYIuDlbO67NiumQ4UScd0bnp
         aSIac78wThMww==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6119a3940001>; Mon, 16 Aug 2021 11:30:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 16 Aug 2021 11:30:28 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Mon, 16 Aug 2021 11:30:28 +1200
From:   Paul Davey <Paul.Davey@alliedtelesis.co.nz>
To:     "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
Thread-Topic: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
Thread-Index: AQHXinpdrX7hotkcVUS4ayEOxKCytqtlcOwAgAvdnACAAy5ngA==
Date:   Sun, 15 Aug 2021 23:30:28 +0000
Message-ID: <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
         <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
         <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
In-Reply-To: <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:1c57:9568:2ea3:8e91]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFAA965C7E457644848AE7E3866B5883@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=MhDmnRu9jo8A:10 a=IEEx6G3M6Y0WNMzSD4sA:9 a=4HQKhizy1-tfRn4t:21 a=U77-X3icNSKF1nbG:21 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgSGVtYW50LA0KDQpPbiBGcmksIDIwMjEtMDgtMTMgYXQgMTU6NTUgLTA3MDAsIEhlbWFudCBL
dW1hciB3cm90ZToNCj4gSGkgUGF1bCwNCj4gDQo+IE9uIDgvNi8yMDIxIDI6NDMgQU0sIExvaWMg
UG91bGFpbiB3cm90ZToNCj4gPiArIE1ISSBwZW9wbGUNCj4gPiANCj4gPiBPbiBGcmksIDYgQXVn
IDIwMjEgYXQgMDY6MjAsIFBhdWwgRGF2ZXkgPA0KPiA+IFBhdWwuRGF2ZXlAYWxsaWVkdGVsZXNp
cy5jby5uej4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IEhpIGxpbnV4LWFybS1tc20gbGlzdCwNCj4g
PiA+IA0KPiA+ID4gWy4uXQ0KPiANCj4gRG8geW91IGhhdmUgYSBsb2cgd2hpY2ggcHJpbnRzIHRo
ZSBUUkUgYmVpbmcgcHJvY2Vzc2VkPyBCYXNpY2FsbHkgaQ0KPiBhbSANCj4gdHJ5aW5nIHVuZGVy
c3RhbmQgdGhpcyA6IGJ5IHRoZSB0aW1lIHlvdSBnZXQgZG91YmxlIGZyZWUgaXNzdWUsIGlzDQo+
IHRoZXJlIA0KPiBhbnkgcGF0dGVybiB3aXRoIHJlc3BlY3QgdG8gdGhlIFRSRSB0aGF0IGlzIGJl
aW5nIHByb2Nlc3NlZC4gRm9yDQo+IGV4YW1wbGUNCj4gd2hlbiBob3N0IHByb2Nlc3NlZCB0aGUg
Z2l2ZW4gVFJFIGZvciB0aGUgZmlyc3QgdGltZSB3aXRoIFJQMSwgc3RhbGUNCj4gVFJFIA0KPiB3
YXMgcG9zdGVkIGJ5IEV2ZW50IFJQMiByaWdodCBhZnRlciBSUDENCj4gDQo+IC0+UlAxIFtUUkUx
XQ0KPiAtPlJQMiBbVFJFMV0NCj4gDQo+IG9yIG9jY3VycmVuY2Ugb2Ygc3RhbGUgVFJFIGV2ZW50
IGlzIHJhbmRvbT8NCg0KSSBoYXZlIG5vdCBsb2dnZWQgYWxsIHRoZSBUUkUgZXZlbnRzIHlldCwg
dGhlIGluY2lkZW5jZSBvZiBwcm9jZXNzaW5nDQphbiBldmVudCB3aGVyZSB0aGUgZGV2X3JwIGlu
ZmVycmVkIGZyb20gdGhlIGV2ZW50IChldl90cmUgKyAxKSBpcyBub3QNCndpdGhpbiB0aGUgc29m
dHdhcmUgdHJlX3JpbmctPnJwIGFuZCB0cmVfcmluZy0+d3Agc2VlbXMgdG8gYmUgcmFuZG9tIG9y
DQphdCBsZWFzdCBpbmNvbnNpc3RlbnQsIGJ1dCBJIHdpbGwgbmVlZCB0byBjb2xsZWN0IG1vcmUg
ZGVidWcgdG8gdGVsbA0Kd2hhdCB0aGUgc2VxdWVuY2Ugb2YgZXZlbnRzIGxvb2tzIGxpa2UuDQoN
Ckkgc3VzcGVjdCB0aGUgZG91YmxlIGZyZWUgbW9zdGx5IHN0ZW1zIGZyb20gdGhlIGZhY3QgdGhh
dCBpZiB0aGUNCmNvbXB1dGVkIGRldl9ycCBpbiB0aGlzIGZ1bmN0aW9uIGlzIG5vdCBiZXR3ZWVu
IHRyZV9yaW5nLT5ycCBhbmQNCnRyZV9yaW5nLT53cCB0aGVuIHRoZSBvbmx5IHdheSBmb3IgdGhl
IGxvb3AgdG8gcmVhY2ggdGhlIHRlcm1pbmF0aW9uDQpjYXNlIGlzIHRvIHJ1biB0aHJvdWdoIHRo
ZSB3aG9sZSByaW5nLg0KDQo+IElmIHlvdSBjYW4gbG9nIGFsbCB0aGUgZXZlbnRzIHlvdSBhcmUg
cHJvY2Vzc2luZywgc28gdGhhdCB3ZSBjYW4NCj4gY2hlY2sgDQo+IHdoZW4gc2Vjb25kIGV2ZW50
IGFycml2ZXMgZm9yIGFscmVhZHkgcHJvY2Vzc2VkIFRSRSwgaXMgdGhlIHRyYW5zZmVyIA0KPiBs
ZW5ndGggc2FtZSBhcyBvcmlnaW5hbGx5IHByb2Nlc3NlZCBUUkUgb3IgaXQgaXMgZGlmZmVyZW50
LiBJbiBjYXNlDQo+IGl0IA0KPiBpcyBkaWZmZXJlbnQgbGVuZ3RoLCBpcyB0aGUgbGVuZ3RoIG1h
dGNoaW5nIHRvIHRoZSBUUkUgd2hpY2ggd2FzDQo+IHF1ZXVlIA0KPiBidXQgbm90IHByb2Nlc3Nl
ZCB5ZXQuIFlvdSBjYW4gcHJpbnQgdGhlIG1oaV9xdWV1ZV9za2IgVFJFIGNvbnRlbnQNCj4gd2hp
bGUgDQo+IHF1ZXVpbmcgc2tiLiBIb3cgZWFzeSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSA/IElz
IHRoaXMgc2hvd2luZyB1cA0KPiBpbiANCj4gaGlnaCB0aHJvdWdocHV0IHVzZSBjYXNlIG9yIGl0
IGlzIHJhbmRvbT8gYW55IHNwZWNpZmljIHN0ZXAgdG8NCj4gcmVwcm9kdWNlIA0KPiB0aGlzIGlz
c3VlPw0KDQpJIGNhbiB0cnkgdG8gY29sbGVjdCBhIGhpc3Rvcnkgb2YgdGhlIFRSRXMgdGhhdCBj
YW4gYmUgbG9nZ2VkIHdoZW4gdGhlDQpldmVudCBvY2N1cnMuICANCg0KVGhlIGlzc3VlIHNlZW1z
IHNvbWV3aGF0IHJlc2lzdGFudCB0byByZXByb2R1Y3Rpb24gSSBhbSB1bnN1cmUgb2YgYWxsDQp0
aGUgZmFjdG9ycyByZXF1aXJlZCBmb3IgcmVwcm9kdWN0aW9uLiAgVGhpcyBpcyBkdXJpbmcgaGln
aCB0aHJvdWdocHV0DQp0ZXN0aW5nLCB3ZSBhcmUgdXNpbmcgdGhlIFNpZXJyYSBtb2R1bGUncyBk
YXRhbG9vcGJhY2sgbW9kZSB0byB0ZXN0Lg0KDQpUaGUgdGVzdCBiZWluZyB1c2VkIGlzIHNldHRp
bmcgdGhlIG1vZHVsZSBpbnRvIGRhdGFsb29wYmFjayBtb2RlIGFuZA0KdGhlbiBzZW5kaW5nIGEg
Y3JhZnRlZCBVRFAgc3RyZWFtIGludG8gYW4gZXRoZXJuZXQgaW50ZXJmYWNlIG9uIHRoZQ0KZGV2
aWNlIHdoZXJlIHRoZSBkZXN0aW5hdGlvbiBJUCBtYXRjaGVzIHRoZSBJUCBhZGRyZXNzIG9uIHRo
ZSBtaGkNCm5ldHdvcmsgaW50ZXJmYWNlIGFuZCB0aGUgc291cmNlIGFkZHJlc3MgaGFzIGEgc3Rh
dGljIEFSUCBvbiB0aGF0IGlucHV0DQppbnRlcmZhY2Ugc28gdGhlIHJldHVybmluZyB0cmFmZmlj
IHdpbGwgYmUgb3V0cHV0IGFnYWluLg0KDQoNCkEgY29sbGVhZ3VlIGhhZCBkb25lIHNvbWUgZXhw
ZXJpbWVudGF0aW9uIHRvIHNlZSBob3cgdG8gbWFrZSB0aGUgaXNzdWUNCm1vcmUgbGlrZWx5IGFu
ZCBpdCBzZWVtZWQgdGhhdCB0aGUgY29tYmluYXRpb24gb2YgdGhlIGZvbGxvd2luZyBkaWQgc286
DQoNCiAqIFNldHRpbmcgdGhlIElQX0hXMF9NQklNIGNoYW5uZWwgcmluZyBsZW5ndGhzIHRvIDMw
MDAgaW5zdGVhZCBvZiAxMjgNCiAgIHdoaWxlIGxlYXZpbmcgdGhlIGFzc29jaWF0ZWQgZXZlbnQg
cmluZ3MgYXQgbGVuZ3RoIDIwNDguDQogKiBTZXR0aW5nIHRoZSBNSElfTUJJTV9ERUZBVUxUX01S
VSB0byA3NTAwIHJhdGhlciB0aGFuIDM1MDAuDQoNCkFsc28sIHdoaWxlIEkgdGhvdWdodCB1c2lu
ZyB0aGUgY2hlY2sgZ2l2ZW4gaW4gdGhlIG9yaWdpbmFsIGVtYWlsIHRvDQphdm9pZCBwcm9jZXNz
aW5nIHhmZXIgZXZlbnRzIHdpdGggYSBkZXZfcnAgb3V0c2lkZSB0aGUgImluLWZsaWdodCINCnJl
Z2lvbiB3b3VsZCBhdm9pZCB0aGUgaXNzdWUsIHdlIGhhdmUgc2luY2Ugc2VlbiBhbiBpc3N1ZSBk
ZXNwaXRlIHRoaXMuDQoNCkluIGFkZGl0aW9uIHRvIHRoZSBhYm92ZSBJIHdhcyB6ZXJvaW5nIG91
dCBtb3N0IGZpZWxkcyBvZiB0aGUgYnVmX2luZm8NCnN0cnVjdCBmb3IgdGhlIFRSRSBiZWZvcmUg
Y2FsbGluZyB0aGUgdHJhbnNmZXIgY2FsbGJhY2sgYW5kIGNoZWNraW5nIGlmDQp0aGUgY2JfYnVm
IGFkZHIgd2FzIG5vbiBOVUxMIGJlZm9yZSBhY3R1YWxseSBjYWxsaW5nIHRoZSBjYWxsYmFjayBh
bmQNCmxvZ2dpbmcgaWYgaXQgd2FzIGV2ZXIgTlVMTC4gIFdlIGhhdmUgc2VlbiB0aGlzIGV2ZW4g
d2l0aCB0aGUgZGVmYXVsdA0KcmluZyBzaXplcyBhbmQgYW4gTVJVIG9mIDMyNzY4LiAgVGhvdWdo
IGl0IGlzIGFsd2F5cyB0aGUgdXBsb2FkIHNpZGUNCnJpbmcgdGhhdCBzZWVtcyB0byBleHBlcmll
bmNlIGl0Lg0KDQo+ID4gPiBbLi5dDQo+IA0KPiBJbiB0aGVvcnkgdGhpcyBpcyBub3Qgc3VwcG9z
ZSB0byBoYXBwZW4uIG9uY2UgYSB4ZmVyIGNvbXBsZXRpb24gZXZlbnQNCj4gaXMgDQo+IHBvc3Rl
ZCBvbiBldmVudCByaW5nIFRSRSBiZWxvbmdzIHRvIEhvc3QgTUhJLCBEZXZpY2UgaXMgbm90IHN1
cHBvc2UNCj4gdG8NCj4gd29yayBvbiB0aGlzIFRSRSBhbnkgbW9yZS4NCg0KSXMgdGhlcmUgYW55
IHdheSBpdCBjb3VsZCBwb3N0IHRoZXNlIGV2ZW50cyAib3V0IG9mIG9yZGVyIj8NCg0KPiA+ID4g
Wy4uXQ0KPiANCj4gVGhpcyBhc3N1bXB0aW9uIGlzIGFzIHBlciBNSEkgc3BlYy4NCj4gDQo+IEkg
YW0gY2hlY2tpbmcgaW50ZXJuYWxseSBpZiB0aGVyZSBpcyBhbnkga25vdyBpc3N1ZSBvbiBkZXZp
Y2Ugc2lkZS4NCj4gVGhpcyANCj4gbW9kZWwgc2VlbXMgdG8gYmUgUXVhbGNvbW3CriBTbmFwZHJh
Z29u4oSiIFg1NSA/DQo+IA0KSSBiZWxpZXZlIHRoaXMgbW9kdWxlIHVzZXMgdGhpcyBTb0MgeWVz
Lg0KDQpUaGFua3MsDQpQYXVsDQo=
