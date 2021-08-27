Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B13B3F93CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 06:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhH0EwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 00:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhH0EwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 00:52:11 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F200EC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 21:51:21 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 94D29806AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 16:51:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1630039876;
        bh=EY3PuP++QJ4tl5iKSQid2Chin075uSmBKC3JNVaTcx4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=cmZXnNifD/bZtvUBWKarCrfq39VJR6vYJeEIkuKNzYWXW6aH6KoFaKPz07EQbRZ5K
         Z5Ud+CWAS81yAZejTsv8D9xm+6jvEIsP/4Q6ybFpRVRYlGNbSEL7GDDbul7BrZKVKB
         1R8xO72obGyrIxy45H6Vkb3hL/hJJ+cNJ07Mk2EJNHhNGCXL7j0WG/56LzeZ1HTgO7
         xpNl6ChD3+1HFG8g7th4fy+cyR0o9GknVcYZegFYoAaTIPQr/1T2GSZ2qI1dpE0LKj
         Q91cIYoLySIyf9uJABwjwjHYr+aUroHTigKAhT3y5oWWFzNqTG/N86ztNw0LmXaKCz
         /fVInWIYDUyUg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61286f440001>; Fri, 27 Aug 2021 16:51:16 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 27 Aug 2021 16:51:16 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Fri, 27 Aug 2021 16:51:16 +1200
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
Thread-Index: AQHXinpdrX7hotkcVUS4ayEOxKCytqtlcOwAgAvdnACAAy5ngIALek6AgAVP+gCAANj+gA==
Date:   Fri, 27 Aug 2021 04:51:15 +0000
Message-ID: <79ff6d38e6ab2509a88e7ba860063790fbcbf1ec.camel@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
         <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
         <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
         <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
         <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
         <05e4ff6f-5118-6afb-a000-81d07e5b1078@quicinc.com>
In-Reply-To: <05e4ff6f-5118-6afb-a000-81d07e5b1078@quicinc.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:ac16:c0a2:6fd3:4a65]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FB1E9F2DD585140B97DD27967BCC5C3@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=MhDmnRu9jo8A:10 a=z7qhJCorfuT0w6HoUqkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gVGh1LCAyMDIxLTA4LTI2IGF0IDA5OjU0IC0wNjAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6DQo+
IE9uIDgvMjMvMjAyMSAxMjo0NyBBTSwgUGF1bCBEYXZleSB3cm90ZToNCj4gPiBIaSBIZW1hbnQs
IEplZmZlcnkNCj4gPiANCj4gPiBJIGhhdmUgc29tZSBtb3JlIGluZm9ybWF0aW9uIGFmdGVyIHNv
bWUgdGVzdGluZy4NCj4gPiANCj4gPiA+ID4gRG8geW91IGhhdmUgYSBsb2cgd2hpY2ggcHJpbnRz
IHRoZSBUUkUgYmVpbmcgcHJvY2Vzc2VkPw0KPiA+ID4gPiBCYXNpY2FsbHkgaQ0KPiA+ID4gPiBh
bQ0KPiA+ID4gPiB0cnlpbmcgdW5kZXJzdGFuZCB0aGlzIDogYnkgdGhlIHRpbWUgeW91IGdldCBk
b3VibGUgZnJlZSBpc3N1ZSwNCj4gPiA+ID4gaXMNCj4gPiA+ID4gdGhlcmUNCj4gPiA+ID4gYW55
IHBhdHRlcm4gd2l0aCByZXNwZWN0IHRvIHRoZSBUUkUgdGhhdCBpcyBiZWluZyBwcm9jZXNzZWQu
DQo+ID4gPiA+IEZvcg0KPiA+ID4gPiBleGFtcGxlDQo+ID4gPiA+IHdoZW4gaG9zdCBwcm9jZXNz
ZWQgdGhlIGdpdmVuIFRSRSBmb3IgdGhlIGZpcnN0IHRpbWUgd2l0aCBSUDEsDQo+ID4gPiA+IHN0
YWxlDQo+ID4gPiA+IFRSRQ0KPiA+ID4gPiB3YXMgcG9zdGVkIGJ5IEV2ZW50IFJQMiByaWdodCBh
ZnRlciBSUDENCj4gPiA+ID4gDQo+ID4gPiA+IC0+UlAxIFtUUkUxXQ0KPiA+ID4gPiAtPlJQMiBb
VFJFMV0NCj4gPiA+ID4gDQo+ID4gPiA+IG9yIG9jY3VycmVuY2Ugb2Ygc3RhbGUgVFJFIGV2ZW50
IGlzIHJhbmRvbT8NCj4gPiANCj4gPiBJIGhhdmUgbm93IGNvbGxlY3RlZCBzb21lIGluZm9ybWF0
aW9uIGJ5IGFkZGluZyBidWZmZXJzIHdoaWNoDQo+ID4gcmVjb3JkDQo+ID4gc29tZSBvZiB0aGUg
aW5mb3JtYXRpb24gZGVzaXJlZCBhbmQgc2VhcmNoaW5nIG9yIHByaW50aW5nIHRoaXMNCj4gPiBp
bmZvcm1hdGlvbiBvbmx5IHdoZW4gdGhlIGlzc3VlIGlzIGRldGVjdGVkIGluIG9yZGVyIHRvIGF2
b2lkDQo+ID4gY29uc3RhbnQNCj4gPiB2ZXJib3NlIGRlYnVnIGluZm9ybWF0aW9uIGFuZCBwb3Rl
bnRpYWwgc2xvd2Rvd25zLg0KPiA+IA0KPiA+ICBGcm9tIHRoaXMgaW5mb3JtYXRpb24gSSBjYW4g
cmVwb3J0IHRoYXQgd2hlbiB0aGlzIGlzc3VlIGhhcHBlbnMNCj4gPiB0d28NCj4gPiBjb25zZWN1
dGl2ZSB0cmFuc2ZlciBjb21wbGV0aW9uIGV2ZW50cyBvY2N1ciB3aXRoIHRoZSBzYW1lIFRSRQ0K
PiA+IHBvaW50ZXINCj4gPiBpbiB0aGVtLCBJIGRpZCBub3QgcmVjb3JkIGV2ZW50cyB3aGljaCBh
cmUgbm90IHRyYW5zZmVyIGNvbXBsZXRpb24NCj4gPiBldmVudHMgb3IgdGhlIGV2ZW50IHJpbmcg
UlAgZHVyaW5nIHByb2Nlc3NpbmcuDQo+ID4gDQo+ID4gU28gdGhlIGV2ZW50IGlzIGFzIGZvbGxv
d3M6DQo+ID4gDQo+ID4gbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVu
dCBjb2RlOiAyIGxlbmd0aDogNWUyDQo+ID4gcHRyOg0KPiA+IDc3Yzk0NzgwDQo+ID4gbWhpIG1o
aTA6IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUy
DQo+ID4gcHRyOg0KPiA+IDc3Yzk0NzgwDQo+IA0KPiBUaGlzIGlzbid0IGdvb2QuICBJIHdvdWxk
IHN1c3BlY3QgdGhhdCB0aGUgZGV2aWNlIGlzIGdsaXRjaGluZyB0aGVuLCANCj4gd2hpY2ggc2hv
dWxkIGJlIGZpeGVkIG9uIHRoZSBkZXZpY2Ugc2lkZSwgYnV0IHRoYXQgZG9lc24ndCBoZWxwIHlv
dQ0KPiBoZXJlIA0KPiBhbmQgbm93Lg0KPiANCj4gSSdtIHRoaW5raW5nIHlvdXIgY2hhbmdlIGlz
IHByb2JhYmx5IGEgZ29vZCBpZGVhIGJhc2VkIG9uIHRoaXMsIGJ1dA0KPiBJIA0KPiBoYXZlIGFk
ZGl0aW9uYWwgcXVlc3Rpb25zLg0KPiANCj4gQ2FuIHlvdSBjaGVjayB0aGUgYWRkcmVzcyBvZiB0
aGUgY29tcGxldGlvbiBldmVudHMgaW4gdGhlIHNoYXJlZA0KPiBtZW1vcnkgDQo+IChiYXNpY2Fs
bHkgdGhlIGV2ZW50IHJpbmcpIHdoZW4geW91IHNlZSB0aGlzPyAgSSB3YW50IHRvIHJ1bGUgb3V0
DQo+IHRoZSANCj4gcG9zc2liaWxpdHkgdGhhdCBob3N0IGlzIGRvdWJsZSBwcm9jZXNzaW5nIHRo
ZSBzYW1lIGV2ZW50LCBhbmQgdGhpcw0KPiBpcyANCj4gdHJ1bHkgYSBjYXNlIG9mIHRoZSBkZXZp
Y2UgZHVwbGljYXRpbmcgYW4gZXZlbnQuDQo+IA0KPiBJIGhvcGUgdGhhdCBtYWtlcyBzZW5zZSB0
byB5b3UuDQoNCkkgaGF2ZSBhZGRlZCByZWNvcmRpbmcgb2YgdGhlIGV2ZW50IHRyZSBhZGRyZXNz
IGluIG15IGRlYnVnIGNvbGxlY3RpbmcNCnNvIHRoYXQgc2hvdWxkIGFuc3dlciB0aGlzIHF1ZXN0
aW9uIHdoZW4gdGhlIHJlc3VsdHMgZnJvbSB0aGF0IHRlc3QNCmNvbWUgYmFjaywgd2hpY2ggd2ls
bCBydW4gb3ZlciB0aGUgd2Vla2VuZC4NCg0KQWRkaXRpb25hbGx5IEkgaGF2ZSBhbm90aGVyIHVw
ZGF0ZSB3aXRoIHNvbWUgcmVzdWx0cyB0aGF0IG9jY3VycmVkDQpzaW5jZSBteSBsYXN0IG1haWwu
DQoNClR3byBpbmNpZGVudHMgb2NjdXJyZWQgYnV0IEkgYW0gbm90IHN1cmUgYWJvdXQgdGhlaXIg
cmVsYXRpdmUgdGltaW5nDQp0aGUgVFJFIGFkZHJlc3NlcyBzdWdnZXN0IHRoZXkgYXJlIG5vdCBp
bW1lZGlhdGVseSBhZnRlciBlYWNob3RoZXIuDQoNCkZpcnN0IG15IGNoZWNrIGZvciBjYl9idWYg
aW4gYnVmX2luZm8gaXMgTlVMTCB3ZW50IG9mZiBidXQgbm90aGluZw0Kb3RoZXJ3aXNlIHVudG93
YXJkIHNlZW1lZCB0byBiZSBoYXBwZW5pbmcuICBJIGhhdmUgYWRkZWQgYSBjaGVjayB0bw0KcGFy
c2VfeGZlcl9ldmVudCB0byBjaGVjayBpZiB0aGUgd3AgaW4gdGhlIGJ1Zl9pbmZvIG1hdGNoZXMg
dGhlIFRSRQ0KYWRkcmVzcyBiZWluZyBwcm9jZXNzZWQgdG8gdHJ5IGFuZCBjYXRjaCB0aGUgcmlu
Z3Mgc29tZWhvdyBnZXR0aW5nIG91dA0Kb2Ygc3luYyBidXQgYXNpZGUgZnJvbSB0aGF0IEkgY2Fu
IG9ubHkgdGhpbmsgb2YgY29uY3VycmVuY3kgcmVsYXRlZA0KaXNzdWVzIGNhdXNpbmcgdGhpcyBw
cm9ibGVtLiAgUGVyaGFwcyBJIHNob3VsZCBjaGVjayBpZiB0aGUgcmluZyBpbg0KcXVlc3Rpb24g
aXMgZnVsbCBvciBzb21ldGhpbmcgdG8gZ2l2ZSBhbnkgaW5zaWdodCBpbnRvIHRoaXMuDQoNClNl
Y29uZGx5IHdlIHNhdyB0aGUgZm9sbG93aW5nIHBhdHRlcm4gaW4gY29tcGxldGlvbiBldmVudHM6
DQoNCm1oaSBtaGkwOiAoSVBfSFcwX01CSU0tVXApIENvbXBsZXRpb24gRXZlbnQgY29kZTogMiBs
ZW5ndGg6IDVlMiBwdHI6DQo3YzQwMDRlMA0KbWhpIG1oaTA6IChJUF9IVzBfTUJJTS1VcCkgQ29t
cGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUyIHB0cjoNCjdjNDAwNTIwDQptaGkgbWhp
MDogKElQX0hXMF9NQklNLVVwKSBDb21wbGV0aW9uIEV2ZW50IGNvZGU6IDIgbGVuZ3RoOiA1ZTIg
cHRyOg0KN2M0MDA0YzANCm1oaSBtaGkwOiAoSVBfSFcwX01CSU0tVXApIENvbXBsZXRpb24gRXZl
bnQgY29kZTogMiBsZW5ndGg6IDVlMiBwdHI6DQo3YzQwMDRiMA0KbWhpIG1oaTA6IChJUF9IVzBf
TUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUyIHB0cjoNCjdjNDAw
NGEwDQoNCkhlcmUgd2UgY2FuIHNlZSB0aGF0IGluc3RlYWQgb2YgYSBjb21wbGV0aW9uIGV2ZW50
IGZvciA3YzQwMDRkMCB3ZSBoYXZlDQpvbmUgZm9yIDdjNDAwNTIwIHdoaWNoIGlzIHNpZ25pZmlj
YW50bHkgYWhlYWQgb2YgdGhlIG90aGVyIHBvaW50IGFuZA0KZnJvbSB0aGUgbGlzdCBvZiBUUkVz
IEkgc3RvcmUgaW4gbWhpX2dlbl90cmUgSSBzdXNwZWN0IHRoYXQgN2M0MDA1MjAgaXMNCnRoZSBu
ZXh0IFRSRSB0byBiZSB1c2VkIGluIHRoZSBUUkUgcmluZyBhdCB0aGlzIHRpbWUsIGFzIHRoZSBv
dGhlcg0KaW5mb3JtYXRpb24gc2hvd3MgaXQgd291bGQgYmUgdGhlIG9sZGVzdCBlbnRyeSBpbiB0
aGF0IGxpc3QuICBJIGFtIG5vdA0Kc3VyZSB3aGF0IGNvdWxkIGhhdmUgY2F1c2VkIHRoaXMgYnV0
IHRoaXMgaXMgYSBkaWZmZXJlbnQgY2FzZSB0byB0aGUNCm1vZGVtIHJlcGVhdGluZyB0aGUgc2Ft
ZSBUUkUgaW4gYSBjb21wbGV0aW9uIGV2ZW50Lg0KDQpUaGFua3MsDQpQYXVsDQoNCg0KDQo=
