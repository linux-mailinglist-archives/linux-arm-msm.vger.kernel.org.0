Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CFA2938A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 11:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404899AbgJTJ5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 05:57:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36248 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404842AbgJTJ5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 05:57:33 -0400
X-UUID: 84b68f903f7f4d7f980a327c9e2f2129-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d/NOO1/ZvVrjHEZtoazU2Jh5NKFcbgFkHExmk+6HUCk=;
        b=NVTTB2ddjtLmuBLQJwAB147m+gIixhx+krjzHzIrNn4Jhq/Nlovx6VI2xKUVVh/n0RhWIye22NNhWWnWX9+6V5mYZQmAfalnLkf7S0jfSVcC6xHNP+ZfWpP8fgGuEQK81WbtrADv7RJ++oDEgL3t99sbjL3KYUxNw2KLJufwrKw=;
X-UUID: 84b68f903f7f4d7f980a327c9e2f2129-20201020
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1209825171; Tue, 20 Oct 2020 17:57:26 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 17:57:25 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v2 0/3] Add support for MT6315 regulator
Date:   Tue, 20 Oct 2020 17:56:47 +0800
Message-ID: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIE1lZGlhVGVrIFBNSUMgTVQ2MzE1IHJl
Z3VsYXRvciBkcml2ZXIsDQp3aGljaCBhZGRzIE1UNjMxNSByZWxhdGVkIGJ1Y2sgdm9sdGFnZSBk
YXRhIHRvIHRoZSBkcml2ZXIuDQoNCmNoYW5nZXMgc2luY2UgdjE6DQotIHVwZGF0ZSBiaW5kaW5n
IGRvY3VtZW50IGluIERUIHNjaGVtYSBmb3JtYXQuDQotIGFkZCBtdGssY29tYmluZWQtcmVndWxh
dG9yIHByb3Blcml0eSB0byBzaG93IHRoZSByZWxhdGlvbnNoaXAgb2YgTVQ2MzE1IGJ1Y2tzLg0K
LSBpZ25vcmUgdGhlIHJlZ3VsYXRvciByZWdpc3RyYXRpb24gb2YgY29tYmluZWQgYnVjayBpbiBw
cm9iZS4NCg0KSHNpbi1Ic2l1bmcgV2FuZyAoMyk6DQogIHNwbWk6IEFkZCBkcml2ZXIgc2h1dGRv
d24gc3VwcG9ydA0KICBkdC1iaW5kaW5nczogcmVndWxhdG9yOiBkb2N1bWVudCBiaW5kaW5nIGZv
ciBNVDYzMTUgcmVndWxhdG9yDQogIHJlZ3VsYXRvcjogbXQ2MzE1OiBBZGQgc3VwcG9ydCBmb3Ig
TVQ2MzE1IHJlZ3VsYXRvcg0KDQogLi4uL3JlZ3VsYXRvci9tdGssbXQ2MzE1LXJlZ3VsYXRvci55
YW1sICAgICAgIHwgIDg4ICsrKysrDQogZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgIHwgIDEwICsNCiBkcml2ZXJzL3JlZ3VsYXRvci9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0b3Iu
YyAgICAgICAgICB8IDM2NCArKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL3NwbWkvc3BtaS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKw0KIGluY2x1ZGUvZHQtYmluZGluZ3Mv
cmVndWxhdG9yL210ayxtdDYzMTUuaCAgICB8ICAxNyArDQogaW5jbHVkZS9saW51eC9yZWd1bGF0
b3IvbXQ2MzE1LXJlZ3VsYXRvci5oICAgIHwgIDM3ICsrDQogaW5jbHVkZS9saW51eC9zcG1pLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiA4IGZpbGVzIGNoYW5nZWQsIDUyNyBp
bnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXRrLG10NjMxNS1yZWd1bGF0b3IueWFtbA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3JlZ3VsYXRvci9tdDYzMTUtcmVndWxhdG9yLmMNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZWd1bGF0b3IvbXRrLG10NjMxNS5oDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0
b3IuaA0KDQotLSANCjIuMTguMA0K

