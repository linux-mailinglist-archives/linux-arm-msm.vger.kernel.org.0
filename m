Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5037724D300
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgHUKop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 06:44:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:2578 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726975AbgHUKoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 06:44:44 -0400
X-UUID: 164008a0783f4e10821064424e09b522-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1ocOMg8R4JEk6eqea+2BARp3pSG4ncS6Ih6Dkjd7KG0=;
        b=LOLqLiS3N0VtayjcOaoKb1oaZErp16vUXl/4AunK6fLHt9DW7GOjgy/dy3MfeFPg5qMVj/KtODFiZfip7GbfIkPaANKQJ0F5wyp85gyEmruexnFLvPEn552lsRJmg2Uh5o4sncqBv+pLwfk4ASlnq2HxgN8KDd8neq6HnX6bucc=;
X-UUID: 164008a0783f4e10821064424e09b522-20200821
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 941271437; Fri, 21 Aug 2020 18:44:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 18:44:37 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 18:44:38 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v2 0/2] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date:   Fri, 21 Aug 2020 18:44:35 +0800
Message-ID: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBuZXcgU29DIE1UNjg3My84MTkyIHRvIHRoZSBz
cG1pIGRyaXZlci4NCg0KY2hhbmdlcyBzaW5jZSB2MToNCi0gcmVtb3ZlIHVudXNlZCBmdW5jdGlv
bi4NCi0gZml4IGNvcnJlY3QgY29kaW5nIHN0eWxlIGZvciBkZWJ1ZyBtZXNzYWdlLg0KLSBmaXgg
dGhlIGJ1aWxkIGZhaWwgZm9yIHRoZSBlcnJvciByZXR1cm4gdmFsdWUuDQoNCkhzaW4tSHNpdW5n
IFdhbmcgKDIpOg0KICBkdC1iaW5kaW5nczogc3BtaTogZG9jdW1lbnQgYmluZGluZyBmb3IgdGhl
IE1lZGlhdGVrIFNQTUkgY29udHJvbGxlcg0KICBzcG1pOiBtZWRpYXRlazogQWRkIHN1cHBvcnQg
Zm9yIE1UNjg3My84MTkyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcG1pL3NwbWktbXRr
LXBtaWYudHh0ICAgICB8ICAzMyArKw0KIGRyaXZlcnMvc3BtaS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCiBkcml2ZXJzL3NwbWkvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9zcG1pL3NwbWktbXRrLXBt
aWYuYyAgICAgICAgICAgICAgICAgICAgICAgfCA0NzQgKysrKysrKysrKysrKysrKysrKysrDQog
NCBmaWxlcyBjaGFuZ2VkLCA1MTcgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9zcG1pLW10ay1wbWlmLnR4dA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NwbWkvc3BtaS1tdGstcG1pZi5jDQoNCi0tIA0K
Mi42LjQNCg==

