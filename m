Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CC6206A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 04:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbgFXCt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 22:49:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:9009 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387970AbgFXCt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 22:49:26 -0400
X-UUID: 95d3616d012e43d7bc2cd4f79b8319ef-20200624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BGcODz/VQpVMqvScb6YTesfIZ3fiOmFPZSAAtZlz7Hw=;
        b=In2ePKl3Qen7UuPIi4qBalqm6U8cD0J5qfoH0JR3lgeALUebt3svYhSBGUmos/8mnAtXNS0h4RElDx/RJ+vWuxAZvL7z+sZXhdTAyR5sfTPXGLkw+FiLCiUfHawIOjCjefXz/rBMP+7z1FpSOzz7bSq8ctusQwV7OHBBK47I/OY=;
X-UUID: 95d3616d012e43d7bc2cd4f79b8319ef-20200624
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 338377957; Wed, 24 Jun 2020 10:49:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Jun 2020 10:49:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Jun 2020 10:49:15 +0800
Message-ID: <1592966957.3278.2.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Kyuho Choi <chlrbgh0@gmail.com>
CC:     Steev Klimaszewski <steev@kali.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        "Tomas Winkler" <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Wed, 24 Jun 2020 10:49:17 +0800
In-Reply-To: <CAP2JTQ+kaQKcyaxG8dj_NuB60TwmhhaMkD+gcA+erL7vAOufQA@mail.gmail.com>
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
         <CAP2JTQ+kaQKcyaxG8dj_NuB60TwmhhaMkD+gcA+erL7vAOufQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGkgS3l1aG8sDQoNCk9uIFdlZCwgMjAyMC0wNi0yNCBhdCAxMTowNiArMDkwMCwgS3l1aG8gQ2hv
aSB3cm90ZToNCj4gSGkgU3RhbmxleSwNCj4gDQo+IE9uIDYvMjQvMjAsIFN0YW5sZXkgQ2h1IDxz
dGFubGV5LmNodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IEhpIFN0ZWV2LA0KPiA+DQo+ID4g
T24gVHVlLCAyMDIwLTA2LTIzIGF0IDIwOjEwIC0wNTAwLCBTdGVldiBLbGltYXN6ZXdza2kgd3Jv
dGU6DQo+ID4+IE9uIDYvMjMvMjAgMTo1MSBBTSwgS3l1aG8gQ2hvaSB3cm90ZToNCj4gPj4gPiBI
aSBBdnJpLA0KPiA+PiA+DQo+ID4+ID4gT24gNi8yMy8yMCwgQXZyaSBBbHRtYW4gPEF2cmkuQWx0
bWFuQHdkYy5jb20+IHdyb3RlOg0KPiA+PiA+Pj4gQUZBSUssIHRoaXMgZGV2aWNlIGFyZSB1ZnMg
Mi4xLiBJdCdzIG5vdCBzdXBwb3J0IHdyaXRlYm9vc3Rlci4NCj4gPj4gPj4+DQo+ID4+ID4+PiBJ
J2QgY2hlY2sgbGF0ZXN0IGxpbnV4IHNjc2kgYnJhbmNoIGFuZCB1ZnNoY2Rfd2JfY29uZmlnIGZ1
bmN0aW9uJ3MNCj4gPj4gPj4+IGNhbGxlZCB3aXRob3V0IGRldmljZSBjYXBhYmlsaXR5IGNoZWNr
Lg0KPiA+PiA+PiBQbGVhc2UgZ3JlcCB1ZnNoY2Rfd2JfcHJvYmUuDQo+ID4+ID4+DQo+ID4+ID4g
SSBnb3QgeW91ciBwb2ludCwgYnV0IGFzIEkgbWVudGlvbmVkLCB0aGlzIGRldmljZSBub3Qgc3Vw
cG9ydCB3YiwgdGhpcw0KPiA+PiA+IGlzIG9sZCBwcm9kdWN0cy4NCj4gPj4gPg0KPiA+PiA+IEkn
bSBub3Qgc3VyZSB1ZnNoY2Rfd2JfcHJvYmUgYXJlIGNhbGxlZCBvciBub3QgaW4gUm9iIGFuZCBT
dGVldidzDQo+ID4+ID4gcGxhdGZvcm0uDQo+ID4+ID4gSWYgaXQncyBjYWxsZWQsIGhiYS0+Y2Fw
cyBhcmUgc2V0dGVkIHdpdGggd2IgZGlhYmxlIGFuZCB0aGlzIGVycm9yIG5vdA0KPiA+PiA+IG9j
Y3VyZWQuDQo+ID4+ID4gQnV0IChpdCBsb29rcykgbm90IGNhbGxlZCwgc2FtZSBxdWVyeSBlcnJv
ciB3aWxsIGJlIG9jY3VyZWQgaW4NCj4gPj4gPiB1ZnNoY2Rfd2JfY29uZmlnL2N0cmwuDQo+ID4+
ID4NCj4gPj4gPiBCUiwNCj4gPj4gPiBLeXVobyBDaG9pDQo+ID4+DQo+ID4+IEkgZG8gc2hvdyB1
ZnNoY2Rfd2JfcHJvYmUgaW4gbXkgc291cmNlcyAtIEknbSBiYXNlZCBvbiA1LjgtcmMyIHdpdGgg
YQ0KPiA+PiBmZXcgZXh0cmEgcGF0Y2hlcyBmb3IgdGhlIGM2MzAsIGFuZCB0aGUgaW5saW5lIGVu
Y3J5cHRpb24gcGF0Y2hlcy4NCj4gPj4NCj4gPj4gSSB0aGlzIGlzIHRoZSBvdXRwdXQgdGhhdCBJ
IHNlZSAtDQo+ID4+DQo+ID4+ICAxLg0KPiA+PiAgICAgWyAgICAwLjcwMjUwMV0gdWZzaGNkLXFj
b20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3BvcHVsYXRlX3ZyZWc6DQo+ID4+ICAgICBVbmFibGUg
dG8gZmluZCB2ZGQtaGJhLXN1cHBseSByZWd1bGF0b3IsIGFzc3VtaW5nIGVuYWJsZWQNCj4gPj4g
IDIuDQo+ID4+ICAgICBbICAgIDAuNzAyNTA2XSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1
ZnNoY2RfcG9wdWxhdGVfdnJlZzoNCj4gPj4gICAgIFVuYWJsZSB0byBmaW5kIHZjY3Etc3VwcGx5
IHJlZ3VsYXRvciwgYXNzdW1pbmcgZW5hYmxlZA0KPiA+PiAgMy4NCj4gPj4gICAgIFsgICAgMC43
MDI1MDhdIHVmc2hjZC1xY29tIDFkODQwMDAudWZzaGM6IHVmc2hjZF9wb3B1bGF0ZV92cmVnOg0K
PiA+PiAgICAgVW5hYmxlIHRvIGZpbmQgdmNjcTItc3VwcGx5IHJlZ3VsYXRvciwgYXNzdW1pbmcg
ZW5hYmxlZA0KPiA+PiAgNC4NCj4gPj4gICAgIFsgICAgMC43MDMyOTZdIHVmc2hjZC1xY29tIDFk
ODQwMDAudWZzaGM6IEZvdW5kIFFDIElubGluZSBDcnlwdG8NCj4gPj4gICAgIEVuZ2luZSAoSUNF
KSB2My4xLjc1DQo+ID4+ICA1Lg0KPiA+PiAgICAgWyAgICAwLjcwNTEyMV0gc2NzaSBob3N0MDog
dWZzaGNkDQo+ID4+ICA2Lg0KPiA+PiAgICAgWyAgICAwLjcyMDE2M10gQUxTQSBkZXZpY2UgbGlz
dDoNCj4gPj4gIDcuDQo+ID4+ICAgICBbICAgIDAuNzIwMTcxXSAgIE5vIHNvdW5kY2FyZHMgZm91
bmQuDQo+ID4+ICA4Lg0KPiA+PiAgICAgWyAgICAwLjczMTM5M10gdWZzaGNkLXFjb20gMWQ4NDAw
MC51ZnNoYzogdWZzaGNkX3ByaW50X3B3cl9pbmZvOltSWCwNCj4gPj4gICAgIFRYXTogZ2Vhcj1b
MSwgMV0sIGxhbmVbMSwgMV0sIHB3cltTTE9XQVVUT19NT0RFLCBTTE9XQVVUT19NT0RFXSwNCj4g
Pj4gICAgIHJhdGUgPSAwDQo+ID4+ICA5Lg0KPiA+PiAgICAgWyAgICAwLjg5MzczOF0gdWZzaGNk
LXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3ByaW50X3B3cl9pbmZvOltSWCwNCj4gPj4gICAg
IFRYXTogZ2Vhcj1bMywgM10sIGxhbmVbMiwgMl0sIHB3cltGQVNUIE1PREUsIEZBU1QgTU9ERV0s
IHJhdGUgPSAyDQo+ID4+IDEwLg0KPiA+PiAgICAgWyAgICAwLjg5NDcwM10gdWZzaGNkLXFjb20g
MWQ4NDAwMC51ZnNoYzoNCj4gPj4gICAgIHVmc2hjZF9maW5kX21heF9zdXBfYWN0aXZlX2ljY19s
ZXZlbDogUmVndWxhdG9yIGNhcGFiaWxpdHkgd2FzIG5vdA0KPiA+PiAgICAgc2V0LCBhY3R2SWNj
TGV2ZWw9MA0KPiA+PiAxMS4NCj4gPj4gICAgIFsgICAgMC44OTYwMzJdIHVmc2hjZC1xY29tIDFk
ODQwMDAudWZzaGM6IHVmc2hjZF9xdWVyeV9mbGFnOiBTZW5kaW5nDQo+ID4+ICAgICBmbGFnIHF1
ZXJ5IGZvciBpZG4gMTQgZmFpbGVkLCBlcnIgPSAyNTMNCj4gPj4gMTIuDQo+ID4+ICAgICBbICAg
IDAuODk2OTE5XSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNoY2RfcXVlcnlfZmxhZzog
U2VuZGluZw0KPiA+PiAgICAgZmxhZyBxdWVyeSBmb3IgaWRuIDE0IGZhaWxlZCwgZXJyID0gMjUz
DQo+ID4+IDEzLg0KPiA+PiAgICAgWyAgICAwLjg5Nzc5OF0gdWZzaGNkLXFjb20gMWQ4NDAwMC51
ZnNoYzogdWZzaGNkX3F1ZXJ5X2ZsYWc6IFNlbmRpbmcNCj4gPj4gICAgIGZsYWcgcXVlcnkgZm9y
IGlkbiAxNCBmYWlsZWQsIGVyciA9IDI1Mw0KPiA+PiAxNC4NCj4gPj4gICAgIFsgICAgMC44OTgy
MjddIHVmc2hjZC1xY29tIDFkODQwMDAudWZzaGM6IHVmc2hjZF9xdWVyeV9mbGFnX3JldHJ5Og0K
PiA+PiAgICAgcXVlcnkgYXR0cmlidXRlLCBvcGNvZGUgNiwgaWRuIDE0LCBmYWlsZWQgd2l0aCBl
cnJvciAyNTMgYWZ0ZXIgMw0KPiA+PiByZXRpcmVzDQo+ID4+IDE1Lg0KPiA+PiAgICAgWyAgICAw
Ljg5ODc5OF0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3diX2N0cmwgd3JpdGUN
Cj4gPj4gICAgIGJvb3N0ZXIgZW5hYmxlIGZhaWxlZCAyNTMNCj4gPj4gMTYuDQo+ID4+ICAgICBb
ICAgIDAuODk5MTUwXSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNoY2Rfd2JfY29uZmln
OiBFbmFibGUNCj4gPj4gICAgIFdCIGZhaWxlZDogMjUzDQo+ID4+IDE3Lg0KPiA+PiAgICAgWyAg
ICAwLjg5OTkxOF0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3F1ZXJ5X2ZsYWc6
IFNlbmRpbmcNCj4gPj4gICAgIGZsYWcgcXVlcnkgZm9yIGlkbiAxNiBmYWlsZWQsIGVyciA9IDI1
Mw0KPiA+PiAxOC4NCj4gPj4gICAgIFsgICAgMC45MDA0NDhdIHVmc2hjZC1xY29tIDFkODQwMDAu
dWZzaGM6IHVmc2hjZF9xdWVyeV9mbGFnOiBTZW5kaW5nDQo+ID4+ICAgICBmbGFnIHF1ZXJ5IGZv
ciBpZG4gMTYgZmFpbGVkLCBlcnIgPSAyNTMNCj4gPj4gMTkuDQo+ID4+ICAgICBbICAgIDAuOTAx
MjkwXSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNoY2RfcXVlcnlfZmxhZzogU2VuZGlu
Zw0KPiA+PiAgICAgZmxhZyBxdWVyeSBmb3IgaWRuIDE2IGZhaWxlZCwgZXJyID0gMjUzDQo+ID4+
IDIwLg0KPiA+PiAgICAgWyAgICAwLjkwMTc0OV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzog
dWZzaGNkX3F1ZXJ5X2ZsYWdfcmV0cnk6DQo+ID4+ICAgICBxdWVyeSBhdHRyaWJ1dGUsIG9wY29k
ZSA2LCBpZG4gMTYsIGZhaWxlZCB3aXRoIGVycm9yIDI1MyBhZnRlciAzDQo+ID4+IHJldGlyZXMN
Cj4gPj4gMjEuDQo+ID4+ICAgICBbICAgIDAuOTAyMjg1XSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVm
c2hjOiB1ZnNoY2Rfd2JfY29uZmlnOiBFbiBXQg0KPiA+PiAgICAgZmx1c2ggZHVyaW5nIEg4OiBm
YWlsZWQ6IDI1Mw0KPiA+PiAyMi4NCj4gPj4gICAgIFsgICAgMC45MDMxMDVdIHVmc2hjZC1xY29t
IDFkODQwMDAudWZzaGM6IHVmc2hjZF9xdWVyeV9mbGFnOiBTZW5kaW5nDQo+ID4+ICAgICBmbGFn
IHF1ZXJ5IGZvciBpZG4gMTUgZmFpbGVkLCBlcnIgPSAyNTMNCj4gPj4gMjMuDQo+ID4+ICAgICBb
ICAgIDAuOTAzOTg4XSB1ZnNoY2QtcWNvbSAxZDg0MDAwLnVmc2hjOiB1ZnNoY2RfcXVlcnlfZmxh
ZzogU2VuZGluZw0KPiA+PiAgICAgZmxhZyBxdWVyeSBmb3IgaWRuIDE1IGZhaWxlZCwgZXJyID0g
MjUzDQo+ID4+IDI0Lg0KPiA+PiAgICAgWyAgICAwLjkwNDg2Nl0gdWZzaGNkLXFjb20gMWQ4NDAw
MC51ZnNoYzogdWZzaGNkX3F1ZXJ5X2ZsYWc6IFNlbmRpbmcNCj4gPj4gICAgIGZsYWcgcXVlcnkg
Zm9yIGlkbiAxNSBmYWlsZWQsIGVyciA9IDI1Mw0KPiA+PiAyNS4NCj4gPj4gICAgIFsgICAgMC45
MDUyOTRdIHVmc2hjZC1xY29tIDFkODQwMDAudWZzaGM6IHVmc2hjZF9xdWVyeV9mbGFnX3JldHJ5
Og0KPiA+PiAgICAgcXVlcnkgYXR0cmlidXRlLCBvcGNvZGUgNiwgaWRuIDE1LCBmYWlsZWQgd2l0
aCBlcnJvciAyNTMgYWZ0ZXIgMw0KPiA+PiByZXRpcmVzDQo+ID4+IDI2Lg0KPiA+PiAgICAgWyAg
ICAwLjkwNTg1OV0gdWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogdWZzaGNkX3diX2J1Zl9mbHVz
aF9lbmFibGUNCj4gPj4gICAgIFdCIC0gYnVmIGZsdXNoIGVuYWJsZSBmYWlsZWQgMjUzDQo+ID4N
Cj4gPiBQbGVhc2UgaGVscCB0cnkgYmVsb3cgc2ltcGxlIHBhdGNoIHRvIHNlZSBpZiBhYm92ZSBX
cml0ZUJvb3N0ZXIgbWVzc2FnZXMNCj4gPiBjYW4gYmUgZWxpbWluYXRlZC4NCj4gPg0KPiA+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMgfCAyICsrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3Njc2kvdWZzL3Vmc2hjZC5jIGIvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYw0KPiA+IGluZGV4
IGYxNzNhZDFiZDc5Zi4uMDg5YzA3ODVmMGIzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc2Nz
aS91ZnMvdWZzaGNkLmMNCj4gPiArKysgYi9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jDQo+ID4g
QEAgLTY5ODUsNiArNjk4NSw4IEBAIHN0YXRpYyBpbnQgdWZzX2dldF9kZXZpY2VfZGVzYyhzdHJ1
Y3QgdWZzX2hiYQ0KPiA+ICpoYmEpDQo+ID4gIAkgICAgZGV2X2luZm8tPndzcGVjdmVyc2lvbiA9
PSAweDIyMCB8fA0KPiA+ICAJICAgIChoYmEtPmRldl9xdWlya3MgJiBVRlNfREVWSUNFX1FVSVJL
X1NVUFBPUlRfRVhURU5ERURfRkVBVFVSRVMpKQ0KPiA+ICAJCXVmc2hjZF93Yl9wcm9iZShoYmEs
IGRlc2NfYnVmKTsNCj4gPiArCWVsc2UNCj4gPiArCQloYmEtPmNhcHMgJj0gflVGU0hDRF9DQVBf
V0JfRU47DQo+IA0KPiBJTU8sIGhiYS0+Y2FwcyBhYm91dCBXQl9FTiBpcyBhbHJlYWR5IHNldCBp
biB1ZnMtdmVuZG9yLmMuIFNvIGZvcg0KPiB3cml0ZWJvb3N0ZXIgZGlkbid0IHN1cHBvcnQgdWZz
IGRldmljZXMsIG5lZWQgdG8gY2xlYXIgdGhpcyBjYXBzLg0KPiANCj4gPg0KDQpUaGFua3MgZm9y
IHRoZSBhY2suIFRoZW4gSSdsbCBzZW5kIGl0IGFzIGEgZm9ybWFsIHBhdGNoLg0KDQpUaGFuayB5
b3UsDQpTdGFubGV5IENodQ0KDQoNCg0K

