Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C233F453A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 08:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhHWGry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 02:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbhHWGrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 02:47:52 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1B7C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Aug 2021 23:47:09 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CA128891B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 18:47:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1629701224;
        bh=reS793eIZFUoQo6/wH9ttJIaUcd/9R5XIZoIesci/5s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=KGn9q0hWUplJYhaWoJ/ApZ8Nw3NytyUh3njMU/FOAgYYHTjBVeKEHefXgREyQIUoj
         WZ9cdNJdl7CV+0hrTtSJt5OFUdHQoyOk5fl5LR+1nK/QK44i/ratZqrJI85UEgjKsE
         vrXhpIUkWL7KGuOF/Y3Fewask3vX+0jQy6NlLQ5mGeSuOXpUVL1xKqPT9UWEhnU2jI
         18aS+cAGEHvujFyDdVhUFeIPG39goI+KOBMrOaG8SPRRbZlwALUwUBI0z3nDijDijM
         +zZ/za6v5N380o4TKOv7dYM7e2ovV9PCUS1E20oKeQjV7y618xCThgAcKeBuZE5Hi3
         Ks7em09F0WrDA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B612344680001>; Mon, 23 Aug 2021 18:47:04 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 23 Aug 2021 18:47:04 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Mon, 23 Aug 2021 18:47:04 +1200
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
Thread-Index: AQHXinpdrX7hotkcVUS4ayEOxKCytqtlcOwAgAvdnACAAy5ngIALek6A
Date:   Mon, 23 Aug 2021 06:47:03 +0000
Message-ID: <2b1cbecf50a57a229e30d1bff060d0e241e2841a.camel@alliedtelesis.co.nz>
References: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
         <CAMZdPi812vx7cjvLXpj_NnbZPOmcierQMFikVHwsUd9gYawHVw@mail.gmail.com>
         <544b3db2-b135-d870-8dd8-ec4450576cb7@codeaurora.org>
         <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
In-Reply-To: <ce8082f8ecd6bea2961d8841ea6eb1c14b5a34dd.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:7cfb:f7a7:819b:4876]
Content-Type: text/plain; charset="utf-8"
Content-ID: <00EF91596B9A1640A1F1DE2C78EA9DCC@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=MhDmnRu9jo8A:10 a=crBNQxI-BiHzfVMVJFMA:9 a=c2Lwq3evFRdXmCzD:21 a=T-q2_jlfSSxW7IkV:21 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgSGVtYW50LCBKZWZmZXJ5DQoNCkkgaGF2ZSBzb21lIG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIg
c29tZSB0ZXN0aW5nLg0KDQo+ID4gRG8geW91IGhhdmUgYSBsb2cgd2hpY2ggcHJpbnRzIHRoZSBU
UkUgYmVpbmcgcHJvY2Vzc2VkPyBCYXNpY2FsbHkgaQ0KPiA+IGFtIA0KPiA+IHRyeWluZyB1bmRl
cnN0YW5kIHRoaXMgOiBieSB0aGUgdGltZSB5b3UgZ2V0IGRvdWJsZSBmcmVlIGlzc3VlLCBpcw0K
PiA+IHRoZXJlIA0KPiA+IGFueSBwYXR0ZXJuIHdpdGggcmVzcGVjdCB0byB0aGUgVFJFIHRoYXQg
aXMgYmVpbmcgcHJvY2Vzc2VkLiBGb3INCj4gPiBleGFtcGxlDQo+ID4gd2hlbiBob3N0IHByb2Nl
c3NlZCB0aGUgZ2l2ZW4gVFJFIGZvciB0aGUgZmlyc3QgdGltZSB3aXRoIFJQMSwNCj4gPiBzdGFs
ZQ0KPiA+IFRSRSANCj4gPiB3YXMgcG9zdGVkIGJ5IEV2ZW50IFJQMiByaWdodCBhZnRlciBSUDEN
Cj4gPiANCj4gPiAtPlJQMSBbVFJFMV0NCj4gPiAtPlJQMiBbVFJFMV0NCj4gPiANCj4gPiBvciBv
Y2N1cnJlbmNlIG9mIHN0YWxlIFRSRSBldmVudCBpcyByYW5kb20/DQo+IA0KSSBoYXZlIG5vdyBj
b2xsZWN0ZWQgc29tZSBpbmZvcm1hdGlvbiBieSBhZGRpbmcgYnVmZmVycyB3aGljaCByZWNvcmQN
CnNvbWUgb2YgdGhlIGluZm9ybWF0aW9uIGRlc2lyZWQgYW5kIHNlYXJjaGluZyBvciBwcmludGlu
ZyB0aGlzDQppbmZvcm1hdGlvbiBvbmx5IHdoZW4gdGhlIGlzc3VlIGlzIGRldGVjdGVkIGluIG9y
ZGVyIHRvIGF2b2lkIGNvbnN0YW50DQp2ZXJib3NlIGRlYnVnIGluZm9ybWF0aW9uIGFuZCBwb3Rl
bnRpYWwgc2xvd2Rvd25zLg0KDQpGcm9tIHRoaXMgaW5mb3JtYXRpb24gSSBjYW4gcmVwb3J0IHRo
YXQgd2hlbiB0aGlzIGlzc3VlIGhhcHBlbnMgdHdvDQpjb25zZWN1dGl2ZSB0cmFuc2ZlciBjb21w
bGV0aW9uIGV2ZW50cyBvY2N1ciB3aXRoIHRoZSBzYW1lIFRSRSBwb2ludGVyDQppbiB0aGVtLCBJ
IGRpZCBub3QgcmVjb3JkIGV2ZW50cyB3aGljaCBhcmUgbm90IHRyYW5zZmVyIGNvbXBsZXRpb24N
CmV2ZW50cyBvciB0aGUgZXZlbnQgcmluZyBSUCBkdXJpbmcgcHJvY2Vzc2luZy4NCg0KU28gdGhl
IGV2ZW50IGlzIGFzIGZvbGxvd3M6DQoNCm1oaSBtaGkwOiAoSVBfSFcwX01CSU0tVXApIENvbXBs
ZXRpb24gRXZlbnQgY29kZTogMiBsZW5ndGg6IDVlMiBwdHI6DQo3N2M5NDc4MA0KbWhpIG1oaTA6
IChJUF9IVzBfTUJJTS1VcCkgQ29tcGxldGlvbiBFdmVudCBjb2RlOiAyIGxlbmd0aDogNWUyIHB0
cjoNCjc3Yzk0NzgwDQoNCldoZXJlIHRoZSBwdHIgdmFsdWUgaW4gdGhlIGV2ZW50IGJlaW5nIHBh
cnNlZCBpcyB0aGlzIHZhbHVlLiANCg0KSSBoYXZlIGFsc28gc2VlbiBhIGNhc2Ugd2hlcmUgYSBj
b21wbGV0aW9uIGV2ZW50IHdvdWxkIGF0dGVtcHQgdG8gcnVuDQpwb3NzaWJseSBtb3JlIHRoYW4g
b25jZSBidXQgaXMgbm90IGNhdWdodCBieSB0aGUgY2hlY2sgSSBwb3N0ZWQgaW4gbXkNCmluaXRp
YWwgcXVlc3Rpb24uIA0KDQpJIGFkZGVkIGNvZGUgdG8gemVybyBvdXQgc29tZSBidWZfaW5mbyBm
aWVsZHMgd2hlbiBwcm9jZXNzaW5nDQpjb21wbGV0aW9uIGV2ZW50cyBhbmQgcHJvZHVjZSBsb2dz
IGlmIHRoZSBjYl9idWYgdGhhdCB3b3VsZCBiZSBwYXNzZWQNCnRvIHRoZSBjb21wbGV0aW9uIGNh
bGxiYWNrIGlzIE5VTEwuICANCg0KSSBhbSBpbnZlc3RpZ2F0aW5nIHRoaXMgZnVydGhlciBhbmQg
d2lsbCBjb2xsZWN0IHNpbWlsYXIgaW5mb3JtYXRpb24gYXMNCnByb3ZpZGVkIGFib3ZlIGZvciB0
aGlzIGNhc2UuDQoNCj4gDQo+ID4gSWYgeW91IGNhbiBsb2cgYWxsIHRoZSBldmVudHMgeW91IGFy
ZSBwcm9jZXNzaW5nLCBzbyB0aGF0IHdlIGNhbg0KPiA+IGNoZWNrIA0KPiA+IHdoZW4gc2Vjb25k
IGV2ZW50IGFycml2ZXMgZm9yIGFscmVhZHkgcHJvY2Vzc2VkIFRSRSwgaXMgdGhlDQo+ID4gdHJh
bnNmZXIgDQo+ID4gbGVuZ3RoIHNhbWUgYXMgb3JpZ2luYWxseSBwcm9jZXNzZWQgVFJFIG9yIGl0
IGlzIGRpZmZlcmVudC4gSW4gY2FzZQ0KPiA+IGl0IA0KPiA+IGlzIGRpZmZlcmVudCBsZW5ndGgs
IGlzIHRoZSBsZW5ndGggbWF0Y2hpbmcgdG8gdGhlIFRSRSB3aGljaCB3YXMNCj4gPiBxdWV1ZSAN
Cj4gPiBidXQgbm90IHByb2Nlc3NlZCB5ZXQuIFlvdSBjYW4gcHJpbnQgdGhlIG1oaV9xdWV1ZV9z
a2IgVFJFIGNvbnRlbnQNCj4gPiB3aGlsZSANCj4gPiBxdWV1aW5nIHNrYi4gSG93IGVhc3kgdG8g
cmVwcm9kdWNlIHRoaXMgaXNzdWUgPyBJcyB0aGlzIHNob3dpbmcgdXANCj4gPiBpbiANCj4gPiBo
aWdoIHRocm91Z2hwdXQgdXNlIGNhc2Ugb3IgaXQgaXMgcmFuZG9tPyBhbnkgc3BlY2lmaWMgc3Rl
cCB0bw0KPiA+IHJlcHJvZHVjZSANCj4gPiB0aGlzIGlzc3VlPw0KDQpUaGlzIFRSRSBhZGRyZXNz
IG1hdGNoZXMgb25lIGluIHRoZSBidWZmZXIgb2YgVFJFcyBhZGRlZCBpbiBnZW5fdHJlOg0KDQpt
aGkgbWhpMDogKElQX0hXMF9NQklNLVVwKSBFdmVudCBUUkUgYWRkcjogODAwMDAwMDA3N2M5NDc4
MCwgZXZfbGVuOg0KNWUyLCB0cmVfbGVuOiA1ZTINCg0KQW5kIGhlcmUgd2Ugc2VlIHRoZSBsZW5n
dGgncyBtYXRjaCBiZXR3ZWVuIHRoZXNlLg0KDQo+IEkgd291bGQgd29uZGVyLCB3aGF0IGlzIHRo
ZSBjb2RlYmFzZSBiZWluZyB0ZXN0aW5nPyAgQXJlIHRoZSBsYXRlc3QNCj4gTUhJIA0KPiBwYXRj
aGVzIGluY2x1ZGVkPyAgV2hlbiB3ZSBzYXcgc29tZXRoaW5nIHNpbWlsYXIgb24gQUlDMTAwLCBp
dCB3YXMgDQo+IGFkZHJlc3NlZCBieSB0aGUgc2FuaXR5IGNoZWNrIGNoYW5nZXMgSSB1cHN0cmVh
bWVkLg0KDQpUaGlzIGlzIGEgYml0IGNvbXBsaWNhdGVkIHRvIGFuc3dlciwgdGhlIGNvZGViYXNl
IGJlaW5nIHRlc3RlZCBpcyBvdXINCmtlcm5lbCwgYmFzZWQgb2ZmIDUuNy4xOSB3aXRoIHRoZSBt
aGkgZHJpdmVycyBiZWluZyB1cGRhdGVkIHRvIHRoZQ0KdXBzdHJlYW0gbWFpbmxpbmUga2VybmVs
IHN0YXRlIGFzIG9mIGFyb3VuZCBsYXRlIEp1bmUgdGhpcyB5ZWFyIGJ5DQpjaGVycnktcGlja2lu
ZyBhbGwgY29tbWl0cyB0byByZWxldmFudCBwYXRocy4gIEFkZGl0aW9uYWxseSB0aGUgY2hhbmdl
DQpJIHN1Ym1pdHRlZCB0byB0aGlzIGxpc3QgZm9yIG1ha2luZyB0aGUgZHJpdmVyIGZ1bmN0aW9u
IG9uIGJpZyBlbmRpYW4NCnN5c3RlbXMgYW5kIGNoYW5nZXMgdG8gdGhlIFBDSSBkcml2ZXIgdG8g
Y3VzdG9taXplIHRoZSBjaGFubmVscyB0byB0aGUNCkVNOTE5MSBtb2R1bGUgYW5kIHNvbWUgY2hh
bmdlcyB0byB0aGUgTUJJTSBuZXQgZHJpdmVyIE1SVSBmb3INCnBlcmZvcm1hbmNlIHJlYXNvbnMu
ICBBZGRpdGlvbmFsbHkgSSBoYXZlIGFkZGVkIG9uZSBjaGFuZ2UgdG8gaW5jcmVhc2UNCnRoZSB0
aW1lIHRoYXQgaXMgd2FpdGVkIGF0IHBvd2Vyb24gZm9yIHRoZSBtb2RlbSB0byBlbnRlciByZWFk
eSBzdGF0ZQ0Kd2l0aG91dCBpbmNyZWFzaW5nIHRoZSB0aW1lb3V0IGFzIHRoaXMgaW50ZXJmZXJl
ZCB3aXRoIGxhdGVuY3kgYXQNCnNodXRkb3duIGJ1dCBJIHN1c3BlY3QgdXNpbmcgdGhlIHVwc3Ry
ZWFtIHBhdGNoIHRvIHJlc29sdmUgdGhlIHNodXRkb3duDQpsYXRlbmN5IHdpbGwgcmVtb3ZlIHRo
ZSBuZWVkIGZvciB0aGlzIGFuZCB3ZSBjYW4ganVzdCBpbmNyZWFzZSB0aGUNCnRpbWVvdXQgbGlt
aXQgZm9yIHRoZSBtb2RlbS4NCg0KSSBjYW4gY29uZmlybSB0aGF0IHRoZSB0ZXN0ZWQgY29kZWJh
c2UgaGFzIHRoZSBmb2xsb3dpbmcgY29tbWl0DQppbmNsdWRlZDoNCmVjMzIzMzJkZjc2NCBidXM6
IG1oaTogY29yZTogU2FuaXR5IGNoZWNrIHZhbHVlcyBmcm9tIHJlbW90ZSBkZXZpY2UNCmJlZm9y
ZSB1c2UNCg0KVGhhbmtzLA0KUGF1bA0KDQo=
