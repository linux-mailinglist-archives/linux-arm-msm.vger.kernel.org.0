Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A623B262557
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 04:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgIICoz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 22:44:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:20870 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728584AbgIICot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 22:44:49 -0400
X-UUID: ccbc6fc3f2734fae9e1af17c079dd564-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KnlunEIZPJSAevHwEXlWcgiUgHwh3n6Mc+pcg4rLANE=;
        b=cBquiHz0epDUS0Vkcb2xmaLJMoow8PRtHX0wa0rC2s+uCZSiWBdbDY+hgE+nnZCfvhCrPdBuzTIOItUwCSp8gd+dP5f/ZuATOGsaBXRvk/b95U8Tl0M+r9s0PGPtfnct7v2XHeZeWSRoXWm7dHvYQ910fSFXl599yuNMAW0AOPI=;
X-UUID: ccbc6fc3f2734fae9e1af17c079dd564-20200909
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1341309525; Wed, 09 Sep 2020 10:44:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 10:44:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 10:44:45 +0800
Message-ID: <1599619486.8380.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date:   Wed, 9 Sep 2020 10:44:46 +0800
In-Reply-To: <20200908204950.GA893759@bogus>
References: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20200908204950.GA893759@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMC0wOS0wOCBhdCAxNDo0OSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIEZyaSwgQXVnIDIxLCAyMDIwIGF0IDA2OjQ0OjM2UE0gKzA4MDAsIEhzaW4tSHNp
dW5nIFdhbmcgd3JvdGU6DQo+ID4gVGhpcyBhZGRzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTUE1J
IGNvbnRyb2xsZXIgZm91bmQgb24gTWVkaWF0ZWsgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1wbWlmLnR4
dCAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
MyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1wbWlmLnR4dA0KPiANCj4gQmluZGluZ3Mg
YXJlIGluIERUIHNjaGVtYSBmb3JtYXQgbm93LiBQbGVhc2UgY29udmVydCB0aGlzLg0KPiANCj4g
Um9iDQoNClRoYW5rcywgSSB3aWxsIHVwZGF0ZSBpdCB3aXRoIGNvcnJlY3QgZm9ybWF0IGluIG5l
eHQgcGF0Y2guDQo=

