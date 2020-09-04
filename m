Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABFC25CF1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 03:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbgIDBj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 21:39:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7618 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728271AbgIDBjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 21:39:25 -0400
X-UUID: 2c78e0d0a30c4bd8b18cf8cdcbc393fe-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6O1iHbBViAgePOu3OYwhs8x0LzhIsz23f1rpfuw7ynQ=;
        b=doQnZxUY5fa+9faNqVoxZIQMofTzvUHJ88LX4FngqG1bZRg2lCtZW+m54kzzGj/yMbEqHcMiw+N1UHMsY0xM74/lLcgm5/+kbseOrkyXUQrtzlTI1wQw51kuQF6umYLiSfDAnxbZUMdeO3hfBQeyUh/qkTkxTAb4t4zlN2NK3sw=;
X-UUID: 2c78e0d0a30c4bd8b18cf8cdcbc393fe-20200904
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 225059213; Fri, 04 Sep 2020 09:39:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 09:39:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 09:39:14 +0800
Message-ID: <1599183556.10649.24.camel@mtkswgap22>
Subject: RE: [PATCH v1 1/1] scsi: ufshcd: Allow zero value setting to
 Auto-Hibernate Timer
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Avri Altman <Avri.Altman@wdc.com>
CC:     "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Alim Akhtar" <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Fri, 4 Sep 2020 09:39:16 +0800
In-Reply-To: <BY5PR04MB67058266FB01737736CFC978FC2F0@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <b141cfcd7998b8933635828b56fbb64f8ad4d175.1598661071.git.nguyenb@codeaurora.org>
         <BY5PR04MB6705177184FC1A0E5F7710FDFC530@BY5PR04MB6705.namprd04.prod.outlook.com>
         <96e34a8d7d52dfbc47738f04d2a127c2@codeaurora.org>
         <BY5PR04MB67058266FB01737736CFC978FC2F0@BY5PR04MB6705.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gV2VkLCAyMDIwLTA5LTAyIGF0IDA1OjEwICswMDAwLCBBdnJpIEFsdG1hbiB3cm90ZToNCj4g
PiANCj4gPiBPbiAyMDIwLTA4LTI5IDAwOjMyLCBBdnJpIEFsdG1hbiB3cm90ZToNCj4gPiA+Pg0K
PiA+ID4+IFRoZSB6ZXJvIHZhbHVlIEF1dG8tSGliZXJuYXRlIFRpbWVyIGlzIGEgdmFsaWQgc2V0
dGluZywgYW5kIGl0DQo+ID4gPj4gaW5kaWNhdGVzIHRoZSBBdXRvLUhpYmVybmF0ZSBmZWF0dXJl
IGJlaW5nIGRpc2FibGVkLiBDb3JyZWN0bHkNCj4gPiA+IFJpZ2h0LiBTbyAiIHVmc2hjZF9hdXRv
X2hpYmVybjhfZW5hYmxlIiBpcyBubyBsb25nZXIgYW4gYXBwcm9wcmlhdGUNCj4gPiA+IG5hbWUu
DQo+ID4gPiBNYXliZSB1ZnNoY2RfYXV0b19oaWJlcm44X3NldCBpbnN0ZWFkPw0KPiA+IFRoYW5r
cyBmb3IgeW91ciBjb21tZW50LiBJIGFtIG9rIHdpdGggdGhlIG5hbWUgY2hhbmdlIHN1Z2dlc3Rp
b24uDQo+ID4gPg0KPiA+ID4gQWxzbywgZGlkIHlvdSB2ZXJpZmllZCB0aGF0IG5vIG90aGVyIHBs
YXRmb3JtIHJlbGllcyBvbiBpdHMgbm9uLXplcm8NCj4gPiA+IHZhbHVlPw0KPiA+IEkgb25seSB0
ZXN0ZWQgdGhlIGNoYW5nZSBvbiBRdWFsY29tbSdzIHBsYXRmb3JtLiBJIGRvIG5vdCBoYXZlIG90
aGVyDQo+ID4gcGxhdGZvcm1zIHRvIGRvIHRoZSB0ZXN0Lg0KPiA+IFRoZSBVRlMgaG9zdCBjb250
cm9sbGVyIHNwZWMgSkVTRDIyMEUsIFNlY3Rpb24gNS4yLjUgc2F5cw0KPiA+ICJTb2Z0d2FyZSB3
cml0ZXMg4oCcMOKAnSB0byBkaXNhYmxlIEF1dG8tSGliZXJuYXRlIElkbGUgVGltZXIiLiBTbyB0
aGUgc3BlYw0KPiA+IHN1cHBvcnRzIHRoaXMgemVybyB2YWx1ZS4NCj4gPiBTb21lIG9wdGlvbnM6
DQo+ID4gLSBXZSBjb3VsZCBhZGQgYSBoYmEtPmNhcHMgc28gdGhhdCB3ZSBvbmx5IGFwcGx5IHRo
ZSBjaGFuZ2UgZm9yDQo+ID4gUXVhbGNvbW0ncyBwbGF0Zm9ybXMuDQo+ID4gVGhpcyBpcyBub3Qg
cHJlZmVycmVkIGJlY2F1c2UgaXQgaXMgZm9sbG93aW5nIHRoZSBzcGVjIGltcGxlbWVudGF0aW9u
cy4NCj4gPiAtIE9yIG90aGVyIHBsYXRmb3JtcyB0aGF0IGRvIG5vdCBzdXBwb3J0IHRoZSB6ZXJv
IHZhbHVlIG5lZWRzIGEgY2Fwcy4NCj4gWWVhaCwgSSBkb24ndCB0aGluayBhbm90aGVyIGNhcHMg
aXMgcmVxdWlyZWQsDQo+IE1heWJlIGp1c3QgYW4gYWNrIGZyb20gU3RhbmxleS4NCg0KTG9va3Mg
Z29vZCB0byBtZS4NCg0KQWNrZWQtYnk6IFN0YW5sZXkgQ2h1IDxzdGFubGV5LmNodUBtZWRpYXRl
ay5jb20+DQoNCj4gDQo+IFRoYW5rcywNCj4gQXZyaQ0KDQo=

