Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9F22ADEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgGWLm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:42:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:2096 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727916AbgGWLm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:42:56 -0400
X-UUID: 7db24b25b9f24ff7bbf4afc1d034ac47-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=srHmaeIaH4DgL6zlUDjHL1vTY6xXkzLRF2s0x4GmvL0=;
        b=ot3KeEtyOwiGwPGloafiMsSvS8FwL1+nz1Qhp7G7CgRZNrGpj2ZI0zRG/fLjymbtfs9WkkCkPxnGXXnwhNxoG4mUK5z17uCGLqCxH0qLJFDpBjlw2euf9Wv0DYRxwGoC3tYv+DY02u87hFeu0/N8CgOfIfPMkKmD7GBy831A5+I=;
X-UUID: 7db24b25b9f24ff7bbf4afc1d034ac47-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 546230821; Thu, 23 Jul 2020 19:42:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:42:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:42:49 +0800
Message-ID: <1595504571.31289.4.camel@mtkswgap22>
Subject: Re: [PATCH v3 3/4] irqchip/mtk-sysirq: Convert to a platform driver
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Saravana Kannan <saravanak@google.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        "John Stultz" <john.stultz@linaro.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        "Loda Chou" <loda.chou@mediatek.com>
Date:   Thu, 23 Jul 2020 19:42:51 +0800
In-Reply-To: <20200718000637.3632841-4-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
         <20200718000637.3632841-4-saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1D931836E2A244EF5C10FC64AFF0902903C48F59E64BF33879AEA552E426CC712000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTE3IGF0IDE3OjA2IC0wNzAwLCBTYXJhdmFuYSBLYW5uYW4gd3JvdGU6
DQo+IFRoaXMgZHJpdmVyIGNhbiB3b3JrIGFzIGEgcGxhdGZvcm0gZHJpdmVyLiBTbyBjb3ZlcnQg
aXQgdG8gYSBwbGF0Zm9ybQ0KPiBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXJhdmFu
YSBLYW5uYW4gPHNhcmF2YW5ha0Bnb29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaXJxY2hp
cC9pcnEtbXRrLXN5c2lycS5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L2lycS1tdGstc3lzaXJxLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLW10ay1zeXNpcnEuYw0KPiBp
bmRleCA2ZmY5OGI4N2U1YzAuLjcyOTljNWFiNGQxMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1tdGstc3lzaXJxLmMNCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1tdGst
c3lzaXJxLmMNCj4gQEAgLTIzMSw0ICsyMzEsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtdGtfc3lz
aXJxX29mX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLA0KPiAgCWtmcmVlKGNoaXBfZGF0
YSk7DQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gLUlSUUNISVBfREVDTEFSRShtdGtfc3lzaXJx
LCAibWVkaWF0ZWssbXQ2NTc3LXN5c2lycSIsIG10a19zeXNpcnFfb2ZfaW5pdCk7DQo+ICtJUlFD
SElQX1BMQVRGT1JNX0RSSVZFUl9CRUdJTihtdGtfc3lzaXJxKQ0KPiArSVJRQ0hJUF9NQVRDSCgi
bWVkaWF0ZWssbXQ2NTc3LXN5c2lycSIsIG10a19zeXNpcnFfb2ZfaW5pdCkNCj4gK0lSUUNISVBf
UExBVEZPUk1fRFJJVkVSX0VORChtdGtfc3lzaXJxKQ0KDQoNCkhpIFNhcmF2YW5hLA0KDQpMb29r
cyBnb29kIGZvciBtZSB0byBjb252ZXJ0IGl0IHRvIGEgcGxhdGZvcm0uDQoNClRoYW5rIHlvdSBm
b3IgeW91ciBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IEhhbmtzIENoZW4gPGhhbmtzLmNoZW5AbWVk
aWF0ZWsuY29tPg0KDQoNCkhhbmtzIENoZW4NCg0KDQoNCg==

