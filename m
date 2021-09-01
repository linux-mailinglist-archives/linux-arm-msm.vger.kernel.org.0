Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6573FD2CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 07:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbhIAFSa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 01:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241375AbhIAFS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 01:18:29 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28CFC061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Aug 2021 22:17:32 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 59575806AC
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 17:17:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1630473447;
        bh=AzvxCcVKtU72Jk1rLjVSh/mjowYqASq/24W48G0yqME=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=QNMC7AjgRAkEoZKdcUql0vA8pjdOjFphCNVWQXk47M6WUzG7N3i/WPjg1T7UQ8TfM
         7S7BybMb4wuHqorKv8iMSGhVWdVQZNm8pNOjcR1XXcsAeEg9yrzBnmmeEUJMHUEY/k
         XL11wIFgSUSnPEtKX8ZehDacn2Qvlbpyxe0butGnqHhmhnRB5hB9Wfr9IRBD84rmcC
         ji17+wZBVpbuI3Ym9TuQXMm769NXjZahrt77IBmiR7xEqrht7WEeod4MKUegnKrQY5
         qJl2R95xHaaXOSSNquagVvuMQJAoytMTiB8RQuIqdWNVzJfo6MIAVxqPQ3tGapibn8
         EDRJJpaUWVuXA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B612f0ce70001>; Wed, 01 Sep 2021 17:17:27 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 1 Sep 2021 17:17:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Wed, 1 Sep 2021 17:17:26 +1200
From:   Paul Davey <Paul.Davey@alliedtelesis.co.nz>
To:     "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
        "bbhatt@codeaurora.org" <bbhatt@codeaurora.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
Thread-Topic: bus: mhi: parse_xfer_event running transfer completion callbacks
 more than once for a given buffer
Thread-Index: AQHXinpdrX7hotkcVUS4ayEOxKCytqtlcOwAgAvdnACAAy5ngIALek6AgAVP+gCAANj+gIAH4vkA
Date:   Wed, 1 Sep 2021 05:17:26 +0000
Message-ID: <bbac581950a84aef245abff92660fd7c2b977d16.camel@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
         <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
         <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
         <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
         <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
         <05e4ff6f-5118-6afb-a000-81d07e5b1078@quicinc.com>
         <79ff6d38e6ab2509a88e7ba860063790fbcbf1ec.camel@alliedtelesis.co.nz>
In-Reply-To: <79ff6d38e6ab2509a88e7ba860063790fbcbf1ec.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:111:450a:7ecc:a5ca]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAA2FE8DF241C147878D0C9927EFBCAE@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=7QKq2e-ADPsA:10 a=q_ea9_ZYDVLjUrGH4RkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDE2OjUxICsxMjAwLCBQYXVsIERhdmV5IHdyb3RlOg0KPiBP
biBUaHUsIDIwMjEtMDgtMjYgYXQgMDk6NTQgLTA2MDAsIEplZmZyZXkgSHVnbyB3cm90ZToNCj4g
PiBPbiA4LzIzLzIwMjEgMTI6NDcgQU0sIFBhdWwgRGF2ZXkgd3JvdGU6DQo+ID4gPiBIaSBIZW1h
bnQsIEplZmZlcnkNCj4gPiA+IA0KPiA+ID4gSSBoYXZlIHNvbWUgbW9yZSBpbmZvcm1hdGlvbiBh
ZnRlciBzb21lIHRlc3RpbmcuDQo+ID4gPiANCj4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhIGxvZyB3
aGljaCBwcmludHMgdGhlIFRSRSBiZWluZyBwcm9jZXNzZWQ/DQo+ID4gPiA+ID4gQmFzaWNhbGx5
IGkNCj4gPiA+ID4gPiBhbQ0KPiA+ID4gPiA+IHRyeWluZyB1bmRlcnN0YW5kIHRoaXMgOiBieSB0
aGUgdGltZSB5b3UgZ2V0IGRvdWJsZSBmcmVlDQo+ID4gPiA+ID4gaXNzdWUsDQo+ID4gPiA+ID4g
aXMNCj4gPiA+ID4gPiB0aGVyZQ0KPiA+ID4gPiA+IGFueSBwYXR0ZXJuIHdpdGggcmVzcGVjdCB0
byB0aGUgVFJFIHRoYXQgaXMgYmVpbmcgcHJvY2Vzc2VkLg0KPiA+ID4gPiA+IEZvcg0KPiA+ID4g
PiA+IGV4YW1wbGUNCj4gPiA+ID4gPiB3aGVuIGhvc3QgcHJvY2Vzc2VkIHRoZSBnaXZlbiBUUkUg
Zm9yIHRoZSBmaXJzdCB0aW1lIHdpdGgNCj4gPiA+ID4gPiBSUDEsDQo+ID4gPiA+ID4gc3RhbGUN
Cj4gPiA+ID4gPiBUUkUNCj4gPiA+ID4gPiB3YXMgcG9zdGVkIGJ5IEV2ZW50IFJQMiByaWdodCBh
ZnRlciBSUDENCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAtPlJQMSBbVFJFMV0NCj4gPiA+ID4gPiAt
PlJQMiBbVFJFMV0NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBvciBvY2N1cnJlbmNlIG9mIHN0YWxl
IFRSRSBldmVudCBpcyByYW5kb20/DQo+ID4gPiANCj4gPiA+IFsuLi5dDQo+ID4gDQo+IA0KPiBT
ZWNvbmRseSB3ZSBzYXcgdGhlIGZvbGxvd2luZyBwYXR0ZXJuIGluIGNvbXBsZXRpb24gZXZlbnRz
Og0KPiANCj4gbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2Rl
OiAyIGxlbmd0aDogNWUyIHB0cjoNCj4gN2M0MDA0ZTANCj4gbWhpIG1oaTA6IChJUF9IVzBfTUJJ
TS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUyIHB0cjoNCj4gN2M0MDA1
MjANCj4gbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAy
IGxlbmd0aDogNWUyIHB0cjoNCj4gN2M0MDA0YzANCj4gbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1V
cCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUyIHB0cjoNCj4gN2M0MDA0YjAN
Cj4gbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxl
bmd0aDogNWUyIHB0cjoNCj4gN2M0MDA0YTANCj4gDQo+IEhlcmUgd2UgY2FuIHNlZSB0aGF0IGlu
c3RlYWQgb2YgYSBjb21wbGV0aW9uIGV2ZW50IGZvciA3YzQwMDRkMCB3ZQ0KPiBoYXZlDQo+IG9u
ZSBmb3IgN2M0MDA1MjAgd2hpY2ggaXMgc2lnbmlmaWNhbnRseSBhaGVhZCBvZiB0aGUgb3RoZXIg
cG9pbnQgYW5kDQo+IGZyb20gdGhlIGxpc3Qgb2YgVFJFcyBJIHN0b3JlIGluIG1oaV9nZW5fdHJl
IEkgc3VzcGVjdCB0aGF0IDdjNDAwNTIwDQo+IGlzDQo+IHRoZSBuZXh0IFRSRSB0byBiZSB1c2Vk
IGluIHRoZSBUUkUgcmluZyBhdCB0aGlzIHRpbWUsIGFzIHRoZSBvdGhlcg0KPiBpbmZvcm1hdGlv
biBzaG93cyBpdCB3b3VsZCBiZSB0aGUgb2xkZXN0IGVudHJ5IGluIHRoYXQgbGlzdC4gIEkgYW0N
Cj4gbm90DQo+IHN1cmUgd2hhdCBjb3VsZCBoYXZlIGNhdXNlZCB0aGlzIGJ1dCB0aGlzIGlzIGEg
ZGlmZmVyZW50IGNhc2UgdG8gdGhlDQo+IG1vZGVtIHJlcGVhdGluZyB0aGUgc2FtZSBUUkUgaW4g
YSBjb21wbGV0aW9uIGV2ZW50Lg0KPiANCg0KDQpJIGhhdmUgY29uc2lkZXJlZCB0aGUgY29kZSBm
dXJ0aGVyLCBhbmQgd2hpbGUgSSBoYXZlIHNlZW4gY2FzZXMgb2YNCmlkZW50aWNhbCBUUkUgY29t
cGxldGlvbiBldmVudHMgb2NjdXJyaW5nLCBJIGRvIG5vdCB0aGluayB0aGVzZSByZXN1bHQNCmlu
IHRoZSBkb3VibGUgZnJlZSBjYXNlIGJlY2F1c2UgaWYgdGhlIGV2ZW50IGlzIGFjdHVhbGx5IHRo
ZSBzYW1lIGFzDQp0aGUgbGFzdCBvbmUgdGhlbiB0aGUgbmV3IGRldl9ycCB3aGljaCBwYXJzZV94
ZmVyX2V2ZW50IHdpbGwgYXR0ZW1wdCB0bw0KYWR2YW5jZSB0aGUgbG9jYWxfcnAgdG8gd2lsbCBh
bHJlYWR5IGJlIGVxdWFsIHRvIHRoZSBsb2NhbF9ycCBhbmQgdGhlDQp3aG9sZSBsb29wIHdpbGwg
YmUgc2tpcHBlZCBpbiB0aGUgZmlyc3QgcGxhY2UuICBUaGUgdHJvdWJsZXNvbWUNCmJlaGF2aW91
ciBjb21lcyBmcm9tIHRoZSBjYXNlIEkgZGVzY3JpYmUgYWJvdmUgd2hlcmUgYSBqdW1wIHRvIGEN
CiJmdXR1cmUiIFRSRSdzIGNvbXBsZXRpb24gZXZlbnQgc2VlbXMgdG8gb2NjdXIgZm9sbG93ZWQg
YnkgYQ0KY29udGludWF0aW9uIG9mIHRoZSBvcmRlciwgdGhpcyByZXN1bHRzIGluIHRoZSB0cmVf
cmluZyBycCBiZWluZw0KYWR2YW5jZWQgdG8gdGhhdCBmdXR1cmUgVFJFIGFuZCB0aGVuIHRoZSBu
ZXh0IGNvbXBsZXRpb24gZXZlbnQNCmZvbGxvd2luZyB0aGUgcHJldmlvdXMgb3JkZXJlZCBwYXR0
ZXJuIHdvdWxkIGJlIGJlZm9yZSB0aGF0IHJwIGxvY2F0aW9uDQphbmQgdGhlIGxvb3Agd2lsbCBy
dW4gdGhyb3VnaCB0aGUgZW50aXJlIHRyZV9yaW5nIHRvIHJlYWNoIHRoZSBuZXcgcnANCmxvY2F0
aW9uLiANCg0KDQpJIGRvIGhhdmUgYW5vdGhlciBxdWVzdGlvbiB0aG91Z2gsIHRoZSBkcml2ZXIg
Y29kZSBzZWVtcyB0byBpbiBzb21lDQpjYXNlcyB0YWtlIHRoZSBtaGlfY2hhbi0+bG9jayB3aGVu
IHVwZGF0aW5nIHRoZSBkb29yYmVsbCByZWdpc3RlciwgYnV0DQpub3Qgd2hlbiBxdWV1ZWluZyBu
ZXcgdHJhbnNmZXJzLiAgV2hhdCBpcyB0aGUgYWN0dWFsIHB1cnBvc2Ugb2YgdGhpcw0KbG9jayBh
bmQgd2h5IGRvZXMgaXQgc2VlbSBzbyBpbmNvbnNpc3RlbnRseSB1c2VkPyAgSXMgdGhlcmUgYW55
IGNoYW5jZQ0KdGhhdCBzb21lIG9mIG15IHByb2JsZW1zIG1heSBiZSB0aGUgcmVzdWx0IG9mIHF1
ZXVlaW5nIG5ldyB0cmFuc2ZlcnMNCnJhY2luZyBzb21laG93IHdpdGggY29tcGxldGlvbiBldmVu
dCBwcm9jZXNzaW5nPw0KDQpUaGFua3MsDQpQYXVsDQo=
