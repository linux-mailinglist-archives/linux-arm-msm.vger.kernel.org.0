Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8499722AE34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGWLqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:46:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39303 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726109AbgGWLqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:46:09 -0400
X-UUID: 5b019b896fde491cac7f57bf363233d3-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2q03hZrAhwWp3X4sbe3hUR79Z4qYNGIR06wj3Meeyjk=;
        b=E2ppr9m8/4KD5DUsCkxkF0z0ioJvpvqKVxsXeJQMC7f5+LDxIRPpuYt4T0e8FT3iOxw9jo2j8cLvI/pg54X622dyZhUwTly5LUsagiJUJ1+3N7GTJXBFyFKKjPKTDJj/LUO+MuVBfShvH+1N0GqaY1I4lbF2Ag26JRASe1k7Ttc=;
X-UUID: 5b019b896fde491cac7f57bf363233d3-20200723
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 229005406; Thu, 23 Jul 2020 19:46:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:46:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:46:01 +0800
Message-ID: <1595504763.31289.5.camel@mtkswgap22>
Subject: Re: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
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
Date:   Thu, 23 Jul 2020 19:46:03 +0800
In-Reply-To: <20200718000637.3632841-5-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
         <20200718000637.3632841-5-saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
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
cC9pcnEtbXRrLWNpcnEuYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9p
cnEtbXRrLWNpcnEuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbXRrLWNpcnEuYw0KPiBpbmRleCA2
OWJhOGNlM2MxNzguLjYyYTYxMjc1YWFhMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1tdGstY2lycS5jDQo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbXRrLWNpcnEuYw0K
PiBAQCAtMjk1LDQgKzI5NSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IG10a19jaXJxX29mX2luaXQo
c3RydWN0IGRldmljZV9ub2RlICpub2RlLA0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4g
LUlSUUNISVBfREVDTEFSRShtdGtfY2lycSwgIm1lZGlhdGVrLG10ay1jaXJxIiwgbXRrX2NpcnFf
b2ZfaW5pdCk7DQo+ICtJUlFDSElQX1BMQVRGT1JNX0RSSVZFUl9CRUdJTihtdGtfY2lycSkNCj4g
K0lSUUNISVBfTUFUQ0goIm1lZGlhdGVrLG10ay1jaXJxIiwgbXRrX2NpcnFfb2ZfaW5pdCkNCj4g
K0lSUUNISVBfUExBVEZPUk1fRFJJVkVSX0VORChtdGtfY2lycSkNCg0KSGkgU2FyYXZhbmEsDQoN
Ckxvb2tzIGdvb2QgZm9yIG1lIHRvIGNvbnZlcnQgY2lycSB0byBhIHBsYXRmb3JtLg0KVGhhbmsg
eW91IGZvciB5b3VyIHBhdGNoLg0KDQpSZXZpZXdlZC1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hl
bkBtZWRpYXRlay5jb20+DQoNCkhhbmtzIENoZW4NCg==

