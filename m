Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254E029A296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 03:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504409AbgJ0COW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 22:14:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58578 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2504402AbgJ0COV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 22:14:21 -0400
X-UUID: 9029e7a3ed9345c881696fca767fdc6d-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yn+aDxe0MyCOkeF7ZShIwLI84elbg5Pk2VP2K10B4IA=;
        b=Qr12oq5HaffqklVXt0NKNJm/Ifuup7tF+1kT5ToEuQhXFOJFXsBvV/LyUbrjPK2pb52F9frhYlPD+I/gZyq26V0gaB+WrBfbLrBQAa/cGWcayuSr82g0aYHHAVg4FPz02FALD38lUK8pCLh+rX/yAmr1gRIgthQjEJpXFj/HV+I=;
X-UUID: 9029e7a3ed9345c881696fca767fdc6d-20201027
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 422591151; Tue, 27 Oct 2020 10:14:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 10:14:16 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 10:14:16 +0800
Message-ID: <1603764857.2104.6.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] scsi: ufs: Keep UFS regulators on when autobkops
 enabled
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Asutosh Das <asutoshd@codeaurora.org>
CC:     <cang@codeaurora.org>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>,
        "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Avri Altman" <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "open list" <linux-kernel@vger.kernel.org>
Date:   Tue, 27 Oct 2020 10:14:17 +0800
In-Reply-To: <6fd8e4d88eb331c9f04c74a3581593961f2caf73.1603747748.git.asutoshd@codeaurora.org>
References: <6fd8e4d88eb331c9f04c74a3581593961f2caf73.1603747748.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksDQoNCk9uIE1vbiwgMjAyMC0xMC0yNiBhdCAxNDozMSAtMDcwMCwgQXN1dG9zaCBEYXMgd3Jv
dGU6DQo+IEZyb206ICJCYW8gRC4gTmd1eWVuIiA8bmd1eWVuYkBjb2RlYXVyb3JhLm9yZz4NCj4g
DQo+IFdoZW4gYmtvcHMgaXMgZW5hYmxlZCwgdGhlIFVGUyBkZXZpY2UgbWF5IGRvIGJrb3BzIGR1
cmluZyBzdXNwZW5kLg0KPiBXaXRoIGJrb3BzIGVuYWJsZWQgZHVyaW5nIHN1c3BlbmQsIGtlZXAg
dGhlIHJlZ3VsYXRvcnMNCj4gaW4gYWN0aXZlIG9wZXJhdGlvbiBjb25maWd1cmF0aW9uLCBhbGxv
d2luZyB0aGUgZGV2aWNlIHRvIGRyYXcNCj4gaGlnaCBwb3dlciB0byBzdXBwb3J0IGJrb3BzIGFu
ZCBhdm9pZCBvdmVyIGN1cnJlbnQgZXZlbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYW8gRC4g
Tmd1eWVuIDxuZ3V5ZW5iQGNvZGVhdXJvcmEub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBBc3V0b3No
IERhcyA8YXN1dG9zaGRAY29kZWF1cm9yYS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9zY3NpL3Vm
cy91ZnNoY2QuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS91ZnMvdWZzaGNk
LmMgYi9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jDQo+IGluZGV4IDQ3YzU0NGQuLmE5NDU0M2Mg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMNCj4gKysrIGIvZHJpdmVy
cy9zY3NpL3Vmcy91ZnNoY2QuYw0KPiBAQCAtODUyMyw3ICs4NTIzLDkgQEAgc3RhdGljIGludCB1
ZnNoY2Rfc3VzcGVuZChzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBlbnVtIHVmc19wbV9vcCBwbV9vcCkN
Cj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIHNldF9kZXZfYWN0aXZlOw0KPiAgDQo+IC0JdWZzaGNk
X3ZyZWdfc2V0X2xwbShoYmEpOw0KPiArCS8qIERldmljZSBtYXkgcGVyZm9ybSBia29wcyBpZiBh
dXRvYmtvcHMgaXMgZW5hYmxlZCAqLw0KPiArCWlmICghaGJhLT5hdXRvX2Jrb3BzX2VuYWJsZWQp
DQo+ICsJCXVmc2hjZF92cmVnX3NldF9scG0oaGJhKTsNCg0KSWYgYXV0byBia29wcyBpcyBhbGxv
d2VkIGFuZCBlbmFibGVkIGR1cmluZyBydW50aW1lIHN1c3BlbmQgKGN1cnJlbnRseQ0KYXV0byBi
a29wcyBpcyBhbGxvdyBpbiBydW50aW1lIHN1c3BlbmQgb25seSwgYW5kIG5vdCBhbGxvd2VkIGlu
IHN5c3RlbQ0Kc3VzcGVuZCksIGhiYS0+ZGV2X2luZm8uYl9ycG1fZGV2X2ZsdXNoX2NhcGFibGUg
d291bGQgYmUgdHJ1ZSBhbmQga2VlcA0KdGhlIGN1cnJlbnQgZGV2aWNlIHBvd2VyIG1vZGUsIHNh
eSBBY3RpdmUgUG93ZXIgTW9kZS4gSW4gdGhpcyBjYXNlLA0KcmVndWxhdG9yIHdvdWxkIG5vdCBi
ZSBzZXQgYXMgbHBtIG1vZGUgYnkgdWZzaGNkX3ZyZWdfc2V0X2xwbSgpLg0KDQpQbGVhc2UgY29y
cmVjdCBtZSBpZiBJIHdhcyB3cm9uZy4NCg0KVGhhbmtzLA0KU3RhbmxleSBDaHUNCg0KDQo=

