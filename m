Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E2129095D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 18:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409182AbgJPQKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 12:10:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40154 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2409117AbgJPQKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 12:10:48 -0400
X-UUID: 3040316bce454d5583b021d34f7053ac-20201017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9872eUd94ykQQ/WVN7G32mKzzeWzwPylYLS7cG9NDQE=;
        b=AMKPMNgDuN1rL7kPyvAIAtlkGih9Q4Go0bLKQFsMCgGuzSzFh/S73/gTEOCR57PHqA8q+NHNYoWzg3qsFq6lTsJKDJiVL2/GEZnBqhBVS3xt/Twjpg5B2FSL5R6LdwK5ruBqLtVXdtGLpvEWVCm0CF2v5iX6NidV9G220GvrBgk=;
X-UUID: 3040316bce454d5583b021d34f7053ac-20201017
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 492432945; Sat, 17 Oct 2020 00:10:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Oct 2020 00:10:42 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Oct 2020 00:10:42 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 0/2] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date:   Sat, 17 Oct 2020 00:10:32 +0800
Message-ID: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBuZXcgU29DIE1UNjg3My84MTkyIHRvIHRoZSBz
cG1pIGRyaXZlci4NCg0KY2hhbmdlcyBzaW5jZSB2MzoNCi0gdXBkYXRlIGNvcnJlY3QgbWFpbnRh
aW5lciBvZiB0aGUgYmluZGluZyBkb2N1bWVudC4NCi0gbW9kaWZ5IGRlYnVnIG1lc3NhZ2VzIGlu
IHRoZSBtdGsgc3BtaSBwcm9iZSBmdW5jdGlvbi4NCi0gZW5hYmxlIHRoZSBzeXMgY2xrIGFuZCB0
aW1lciBjbGsgZm9yIHNwbWkgZHJpdmVyLg0KDQpIc2luLUhzaXVuZyBXYW5nICgyKToNCiAgZHQt
YmluZGluZ3M6IHNwbWk6IGRvY3VtZW50IGJpbmRpbmcgZm9yIHRoZSBNZWRpYXRlayBTUE1JIGNv
bnRyb2xsZXINCiAgc3BtaTogbWVkaWF0ZWs6IEFkZCBzdXBwb3J0IGZvciBNVDY4NzMvODE5Mg0K
DQogLi4uL2JpbmRpbmdzL3NwbWkvbXRrLHNwbWktbXRrLXBtaWYueWFtbCAgICAgIHwgIDcwICsr
Kw0KIGRyaXZlcnMvc3BtaS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSAr
DQogZHJpdmVycy9zcG1pL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsN
CiBkcml2ZXJzL3NwbWkvc3BtaS1tdGstcG1pZi5jICAgICAgICAgICAgICAgICAgfCA0OTAgKysr
KysrKysrKysrKysrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCA1NzAgaW5zZXJ0aW9ucygrKQ0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BtaS9t
dGssc3BtaS1tdGstcG1pZi55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3BtaS9z
cG1pLW10ay1wbWlmLmMNCg0KLS0gDQoyLjE4LjANCg==

