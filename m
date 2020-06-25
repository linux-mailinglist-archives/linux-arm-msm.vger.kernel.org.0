Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50ECB2098C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 05:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389457AbgFYD3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 23:29:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48767 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388470AbgFYD33 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 23:29:29 -0400
X-UUID: f498513048ee4020b3433167c376d291-20200625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fENOmocMCM9mBEK5ON5YZH5NV6oEQvRnIxeaSBkgVCI=;
        b=IfIPZ6PQ5A7++3XjqWHG9l/8AuET2XF7hYLHV2B05fR/IM2rGyJMKUAjijG7kxdEER7oVxFSUupXU1066e2+wD8uqDCnHeqhA0jwVIFaO73Dei8V5U45/Hg+qQs6QWxGJ01UL9JfqEbwZCGl7e6pGkS8xf0azVOj82uo8JVf9Vo=;
X-UUID: f498513048ee4020b3433167c376d291-20200625
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2081894202; Thu, 25 Jun 2020 11:29:26 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Jun 2020 11:29:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Jun
 2020 11:29:22 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Jun 2020 11:29:22 +0800
Message-ID: <1593055764.3278.5.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Steev Klimaszewski <steev@kali.org>
CC:     Kyuho Choi <chlrbgh0@gmail.com>, Avri Altman <Avri.Altman@wdc.com>,
        "Rob Clark" <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        "Bart Van Assche" <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Thu, 25 Jun 2020 11:29:24 +0800
In-Reply-To: <cd531342-cf8a-b3c1-0672-1101f7e4cb52@kali.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
         <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
         <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
         <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
         <20200621075539.GK128451@builder.lan>
         <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
         <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
         <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
         <CAP2JTQKu77risdNFBy5zwHoRU3qZw2dMi5Hxfi5Tyf6b9GB3XQ@mail.gmail.com>
         <9d3afac3-c245-a746-b029-77aa66c93f9d@kali.org>
         <1592963601.3278.1.camel@mtkswgap22>
         <cd531342-cf8a-b3c1-0672-1101f7e4cb52@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgU3RlZXYsDQoNCk9uIFdlZCwgMjAyMC0wNi0yNCBhdCAxMToxNSAtMDUwMCwgU3RlZXYgS2xp
bWFzemV3c2tpIHdyb3RlOg0KPiBPbiA2LzIzLzIwIDg6NTMgUE0sIFN0YW5sZXkgQ2h1IHdyb3Rl
Og0KPiA+IEhpIFN0ZWV2LA0KPiA+DQo+ID4gUGxlYXNlIGhlbHAgdHJ5IGJlbG93IHNpbXBsZSBw
YXRjaCB0byBzZWUgaWYgYWJvdmUgV3JpdGVCb29zdGVyIG1lc3NhZ2VzDQo+ID4gY2FuIGJlIGVs
aW1pbmF0ZWQuDQo+ID4NCj4gPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3Njc2kvdWZzL3Vmc2hj
ZC5jIHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYyBiL2RyaXZlcnMvc2NzaS91
ZnMvdWZzaGNkLmMNCj4gPiBpbmRleCBmMTczYWQxYmQ3OWYuLjA4OWMwNzg1ZjBiMyAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jDQo+ID4gKysrIGIvZHJpdmVycy9z
Y3NpL3Vmcy91ZnNoY2QuYw0KPiA+IEBAIC02OTg1LDYgKzY5ODUsOCBAQCBzdGF0aWMgaW50IHVm
c19nZXRfZGV2aWNlX2Rlc2Moc3RydWN0IHVmc19oYmENCj4gPiAqaGJhKQ0KPiA+ICAJICAgIGRl
dl9pbmZvLT53c3BlY3ZlcnNpb24gPT0gMHgyMjAgfHwNCj4gPiAgCSAgICAoaGJhLT5kZXZfcXVp
cmtzICYgVUZTX0RFVklDRV9RVUlSS19TVVBQT1JUX0VYVEVOREVEX0ZFQVRVUkVTKSkNCj4gPiAg
CQl1ZnNoY2Rfd2JfcHJvYmUoaGJhLCBkZXNjX2J1Zik7DQo+ID4gKwllbHNlDQo+ID4gKwkJaGJh
LT5jYXBzICY9IH5VRlNIQ0RfQ0FQX1dCX0VOOw0KPiA+ICANCj4gPiAgCS8qDQo+ID4gIAkgKiB1
ZnNoY2RfcmVhZF9zdHJpbmdfZGVzYyByZXR1cm5zIHNpemUgb2YgdGhlIHN0cmluZw0KPiANCj4g
SGkgU3RhbmxleSwNCj4gDQo+IFRoYXQgd29ya2VkLg0KPiANCj4gDQo+ICAxLg0KPiAgICAgWyAg
ICAwLjcwNDc3NV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3BvcHVsYXRlX3Zy
ZWc6DQo+ICAgICBVbmFibGUgdG8gZmluZCB2ZGQtaGJhLXN1cHBseSByZWd1bGF0b3IsIGFzc3Vt
aW5nIGVuYWJsZWQNCj4gIDIuDQo+ICAgICBbICAgIDAuNzA0NzgxXSB1ZnNoY2QtcWNvbSAxZDg0
MDAwLnVmc2hjOiB1ZnNoY2RfcG9wdWxhdGVfdnJlZzoNCj4gICAgIFVuYWJsZSB0byBmaW5kIHZj
Y3Etc3VwcGx5IHJlZ3VsYXRvciwgYXNzdW1pbmcgZW5hYmxlZA0KPiAgMy4NCj4gICAgIFsgICAg
MC43MDQ3ODNdIHVmc2hjZC1xY29tIDFkODQwMDAudWZzaGM6IHVmc2hjZF9wb3B1bGF0ZV92cmVn
Og0KPiAgICAgVW5hYmxlIHRvIGZpbmQgdmNjcTItc3VwcGx5IHJlZ3VsYXRvciwgYXNzdW1pbmcg
ZW5hYmxlZA0KPiAgNC4NCj4gICAgIFsgICAgMC43MDU2MThdIHVmc2hjZC1xY29tIDFkODQwMDAu
dWZzaGM6IEZvdW5kIFFDIElubGluZSBDcnlwdG8NCj4gICAgIEVuZ2luZSAoSUNFKSB2My4xLjc1
DQo+ICA1Lg0KPiAgICAgWyAgICAwLjcwNzQ5Nl0gc2NzaSBob3N0MDogdWZzaGNkDQo+ICA2Lg0K
PiAgICAgWyAgICAwLjcyMDQxNV0gQUxTQSBkZXZpY2UgbGlzdDoNCj4gIDcuDQo+ICAgICBbICAg
IDAuNzIwNDIyXSAgIE5vIHNvdW5kY2FyZHMgZm91bmQuDQo+ICA4Lg0KPiAgICAgWyAgICAwLjcz
NDI0NV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3ByaW50X3B3cl9pbmZvOltS
WCwNCj4gICAgIFRYXTogZ2Vhcj1bMSwgMV0sIGxhbmVbMSwgMV0sIHB3cltTTE9XQVVUT19NT0RF
LCBTTE9XQVVUT19NT0RFXSwNCj4gICAgIHJhdGUgPSAwDQo+ICA5Lg0KPiAgICAgWyAgICAwLjg0
NTE1OV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3ByaW50X3B3cl9pbmZvOltS
WCwNCj4gICAgIFRYXTogZ2Vhcj1bMywgM10sIGxhbmVbMiwgMl0sIHB3cltGQVNUIE1PREUsIEZB
U1QgTU9ERV0sIHJhdGUgPSAyDQo+IDEwLg0KPiAgICAgWyAgICAwLjg0NjM5OV0gdWZzaGNkLXFj
b20gMWQ4NDAwMC51ZnNoYzoNCj4gICAgIHVmc2hjZF9maW5kX21heF9zdXBfYWN0aXZlX2ljY19s
ZXZlbDogUmVndWxhdG9yIGNhcGFiaWxpdHkgd2FzIG5vdA0KPiAgICAgc2V0LCBhY3R2SWNjTGV2
ZWw9MA0KPiAxMS4NCj4gICAgIFsgICAgMC44NDkyNThdIHNjc2kgMDowOjA6NDk0ODg6IFdlbGwt
a25vd24gTFVOICAgIFNBTVNVTkcNCj4gICAgICBLTFVERzRVMUVBLUIwQzEgIDA1MDAgUFE6IDAg
QU5TSTogNg0KPiAxMi4NCj4gICAgIFsgICAgMC44NTMzNzJdIHNjc2kgMDowOjA6NDk0NzY6IFdl
bGwta25vd24gTFVOICAgIFNBTVNVTkcNCj4gICAgICBLTFVERzRVMUVBLUIwQzEgIDA1MDAgUFE6
IDAgQU5TSTogNg0KPiAxMy4NCj4gICAgIFsgICAgMC44NTUxMzVdIHNjc2kgMDowOjA6NDk0NTY6
IFdlbGwta25vd24gTFVOICAgIFNBTVNVTkcNCj4gICAgICBLTFVERzRVMUVBLUIwQzEgIDA1MDAg
UFE6IDAgQU5TSTogNg0KPiAxNC4NCj4gICAgIFsgICAgMC44NTcwNTBdIHNjc2kgMDowOjA6MDog
RGlyZWN0LUFjY2VzcyAgICAgU0FNU1VORw0KPiAgICAgIEtMVURHNFUxRUEtQjBDMSAgMDUwMCBQ
UTogMCBBTlNJOiA2DQo+IDE1Lg0KPiAgICAgWyAgICAwLjg1ODI5N10gc2QgMDowOjA6MDogUG93
ZXItb24gb3IgZGV2aWNlIHJlc2V0IG9jY3VycmVkDQo+IDE2Lg0KPiAgICAgWyAgICAwLjg1OTk4
NV0gc2NzaSAwOjA6MDoxOiBEaXJlY3QtQWNjZXNzICAgICBTQU1TVU5HDQo+ICAgICAgS0xVREc0
VTFFQS1CMEMxICAwNTAwIFBROiAwIEFOU0k6IDYNCj4gMTcuDQo+ICAgICBbICAgIDAuODYwNzAy
XSBzZCAwOjA6MDowOiBbc2RhXSAyOTc2NTYzMiA0MDk2LWJ5dGUgbG9naWNhbCBibG9ja3M6DQo+
ICAgICAoMTIyIEdCLzExNCBHaUIpDQo+IA0KPiAoZnVsbCBkbWVzZyBvdXRwdXQgYXQgaHR0cHM6
Ly9wYXN0ZWJpbi5jb20vUHZmcWU0MlAgKQ0KPiANCj4gSSBndWVzcyB5b3UgY2FuIHRocm93IG15
IFRlc3RlZC1ieSBvbiB0aGVyZS4NCj4gDQoNClRoYW5rcyBzbyBtdWNoIGZvciB0aGUgdGVzdCEN
CkkgaGF2ZSByZS1zZW50IHRoZSBwYXRjaCB3aXRoIHlvdXIgIlRlc3RlZC1CeSIgdGFnIDogKQ0K
DQpUaGFua3MgYSBsb3QsDQpTdGFubGV5IENodQ0KDQoNCg==

