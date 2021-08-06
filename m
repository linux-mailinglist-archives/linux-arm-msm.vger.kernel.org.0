Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4703B3E2270
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 06:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhHFEUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 00:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhHFEUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 00:20:41 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3785BC061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 21:20:25 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 94B48806B5
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 16:20:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1628223620;
        bh=GmIG1g254fWl3us7arRBDuxbp9RwD/O2JOa93HVpKG0=;
        h=From:To:Subject:Date;
        b=HdZASylq2TMk2rEDXMko0rri0f6VbOLgLKmAM62gYGyjgM3lDqVfa0e07wki3awc+
         7E8AOdVNeE0AvUlL3yuIBfvAonAbl8Tdo5UnmqH0nrRhT7yHE18VntlQUQHtgBP9FG
         N+wCk5LsJ7PUKA0fAhybt7FGXdby4onTnR1HRMZ6qVWUV/Qw1PAahK7IiAlR+es2fn
         D2eZhvt+YawXuYjnJe6MB6UXuV04dY9Y38sqbh2MjlwcDAfPqc5c04bhDM0KkHwNA5
         Kw16hef3pfEDeGS9JSI/wBKhCvWECrcH20lJH6zV933NE7ez5XgynJLpFe7sJyUho4
         /qczGFtoN2tJw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B610cb8840000>; Fri, 06 Aug 2021 16:20:20 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 6 Aug 2021 16:20:20 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Fri, 6 Aug 2021 16:20:20 +1200
From:   Paul Davey <Paul.Davey@alliedtelesis.co.nz>
To:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: bus: mhi: parse_xfer_event running transfer completion callbacks more
 than once for a given buffer
Thread-Topic: mhi: parse_xfer_event running transfer completion callbacks more
 than once for a given buffer
Thread-Index: AQHXinpdrX7hotkcVUS4ayEOxKCytg==
Date:   Fri, 6 Aug 2021 04:20:19 +0000
Message-ID: <9a6a00acc60c676f39f89a8ce2989416bed1b24d.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:902a:2b83:fa41:f783]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7C4678A2F1862479D1D5156CD232302@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=dvql9Go4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=MhDmnRu9jo8A:10 a=sBgCyHtZn0QAu0gE2X4A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgbGludXgtYXJtLW1zbSBsaXN0LA0KDQpXZSBoYXZlIGJlZW4gdXNpbmcgdGhlIG1oaSBkcml2
ZXIgd2l0aCBhIFNpZXJyYSBFTTkxOTEgNUcgbW9kZW0gbW9kdWxlDQphbmQgaGF2ZSBzZWVuIGFu
IG9jY2FzaW9uYWwgaXNzdWUgd2hlcmUgdGhlIGtlcm5lbCB3b3VsZCBjcmFzaCB3aXRoDQptZXNz
YWdlcyBzaG93aW5nICJCVUc6IEJhZCBwYWdlIHN0YXRlIiB3aGljaCB3ZSBkZWJ1Z2dlZCBmdXJ0
aGVyIGFuZA0KZm91bmQgaXQgd2FzIGR1ZSB0byBtaGlfbmV0X3VsX2NhbGxiYWNrIGZyZWVpbmcg
dGhlIHNhbWUgc2tiIG11bHRpcGxlDQp0aW1lcywgZnVydGhlciBkZWJ1Z2dpbmcgdHJhY2tlZCB0
aGlzIGRvd24gdG8gYSBjYXNlIHdoZXJlDQpwYXJzZV94ZmVyX2V2ZW50IGNvbXB1dGVkIGEgZGV2
X3JwIGZyb20gdGhlIHBhc3NlZCBldmVudCdzIGV2X3RyZQ0Kd2hpY2ggZG9lcyBub3QgbGllIHdp
dGhpbiB0aGUgcmVnaW9uIG9mIHZhbGlkICJpbiBmbGlnaHQiIHRyYW5zZmVycw0KZm9yIHRoZSB0
cmVfcmluZy4gIFNlZSB0aGUgcGF0Y2ggYmVsb3cgZm9yIGhvdyB0aGlzIHdhcyBkZXRlY3RlZC4N
Cg0KSSBiZWxpZXZlIHRoYXQgcmVjZWl2aW5nIHN1Y2ggYW4gZXZlbnQgcmVzdWx0cyBpbiB0aGUg
bG9vcCB3aGljaCBydW5zDQpjb21wbGV0aW9uIGV2ZW50cyBmb3IgdGhlIHRyYW5zZmVycyB0byBy
ZS1ydW4gc29tZSBjb21wbGV0aW9uDQpjYWxsYmFja3MgYXMgaXQgd2Fsa3MgYWxsIHRoZSB3YXkg
YXJvdW5kIHRoZSByaW5nIGFnYWluIHRvIHJlYWNoIHRoZQ0KaW52YWxpZCBkZXZfcnAgcG9zaXRp
b24uICANCg0KV2hhdCBjb3VsZCBjYXVzZSBwYXJzZV94ZmVyX2V2ZW50IHRvIHJlY2VpdmUgYSB0
cmFuc2ZlciBldmVudCB3aXRoIGENCnRyZSBwb2ludGVyIHdoaWNoIHdvdWxkIGJlIG91dHNpZGUg
dGhlIHJhbmdlIG9mIGluLWZsaWdodCB0cmFuc2ZlcnM/DQpGb3IgZXhhbXBsZSByZWNlaXZpbmcg
ZXZlbnRzIHdoZXJlIHRoZSB0cmUgcG9pbnRlcnMgZG8gbm90IG9ubHkNCmluY3JlYXNlIG9yIHJl
Y2VpdmUgYSBzZWNvbmQgZXZlbnQgb2YgdHlwZXMgTUhJX0VWX0NDX09WRVJGTE9XLA0KTUhJX0VW
X0NDX0VPQiwgb3IgTUhJX0VWX0NDX0VPVCBmb3IgYSBwcmV2aW91cyB0cmUuDQoNClRoZSBleGlz
dGluZyBtaGkgZHJpdmVyIGNvZGUgYXBwZWFycyB0byBhc3N1bWUgdGhhdCB0cmFuc2ZlciBldmVu
dHMNCmFyZSByZWNlaXZlZCBzdHJpY3RseSBpbiBvcmRlciBzdWNoIHRoYXQgeW91IGNhbiBuZXZl
ciByZWNlaXZlIGENCnRyYW5zZmVyIGNvbXBsZXRpb24gZXZlbnQgZm9yIGEgdHJhbnNmZXIgZGVz
Y3JpcHRvciBvdXRzaWRlIHRoZQ0KY3VycmVudCBzZXQgb2YgImluIGZsaWdodCIgdHJhbnNmZXJz
IGluIHRoZSB0cmUgcmluZyAodGhvc2UgYmV0d2Vlbg0KdGhlIHJlYWQgcG9pbnRlciBhbmQgd3Jp
dGUgcG9pbnRlcikuDQoNClRoYW5rcywNClBhdWwgRGF2ZXkNCg0KLS0tLTg8LS0tLQ0KDQoNCkZy
b20gYmYzZTM4MjFhOTBiODk3NThhMzBjZWZlZDY2MmQzMmE3OGRjYjc2NiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDENCkZyb206IFBhdWwgRGF2ZXkgPHBhdWwuZGF2ZXlAYWxsaWVkdGVsZXNpcy5j
by5uej4NCkRhdGU6IEZyaSwgNiBBdWcgMjAyMSAxNTozNjowNSArMTIwMA0KU3ViamVjdDogW1BB
VENIXSBidXM6IG1oaTogRGV0ZWN0IGludmFsaWQgeGZlciBldmVudCBkZXZfcnANCg0KU2lnbmVk
LW9mZi1ieTogUGF1bCBEYXZleSA8cGF1bC5kYXZleUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KLS0t
DQogZHJpdmVycy9idXMvbWhpL2NvcmUvbWFpbi5jIHwgMTAgKysrKysrKysrKw0KIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9taGkv
Y29yZS9tYWluLmMgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9tYWluLmMNCmluZGV4IGM2N2ZkMDAx
ZGVkMS4uMjM4Njg5YTVkZmM3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9idXMvbWhpL2NvcmUvbWFp
bi5jDQorKysgYi9kcml2ZXJzL2J1cy9taGkvY29yZS9tYWluLmMNCkBAIC01OTYsNiArNTk2LDcg
QEAgc3RhdGljIGludCBwYXJzZV94ZmVyX2V2ZW50KHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhp
X2NudHJsLA0KIAkJdm9pZCAqZGV2X3JwOw0KIAkJc3RydWN0IG1oaV9idWZfaW5mbyAqYnVmX2lu
Zm87DQogCQl1MTYgeGZlcl9sZW47DQorCQlib29sIHJwX3ZhbGlkOw0KIA0KIAkJaWYgKCFpc192
YWxpZF9yaW5nX3B0cih0cmVfcmluZywgcHRyKSkgew0KIAkJCWRldl9lcnIoJm1oaV9jbnRybC0+
bWhpX2Rldi0+ZGV2LA0KQEAgLTYwOSw2ICs2MTAsMTUgQEAgc3RhdGljIGludCBwYXJzZV94ZmVy
X2V2ZW50KHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsLA0KIAkJaWYgKGRldl9ycCA+
PSAodHJlX3JpbmctPmJhc2UgKyB0cmVfcmluZy0+bGVuKSkNCiAJCQlkZXZfcnAgPSB0cmVfcmlu
Zy0+YmFzZTsNCiANCisJCWlmICh0cmVfcmluZy0+cnAgPCB0cmVfcmluZy0+d3ApDQorCQkJcnBf
dmFsaWQgPSAoZGV2X3JwIDw9IHRyZV9yaW5nLT53cCAmJiBkZXZfcnAgPiB0cmVfcmluZy0+cnAp
Ow0KKwkJZWxzZQ0KKwkJCXJwX3ZhbGlkID0gIShkZXZfcnAgPD0gdHJlX3JpbmctPnJwICYmIGRl
dl9ycCA+IHRyZV9yaW5nLT53cCk7DQorDQorCQlXQVJOX09OKCFycF92YWxpZCk7DQorCQlpZiAo
IXJwX3ZhbGlkKQ0KKwkJCWdvdG8gZW5kX3Byb2Nlc3NfdHhfZXZlbnQ7DQorDQogCQlyZXN1bHQu
ZGlyID0gbWhpX2NoYW4tPmRpcjsNCiANCiAJCWxvY2FsX3JwID0gdHJlX3JpbmctPnJwOw0KLS0g
DQoyLjMyLjANCg0K
