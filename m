Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108DA23A159
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 10:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgHCI5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 04:57:42 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21093 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726585AbgHCI5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 04:57:41 -0400
X-UUID: a1976ea1b8f542379a9e99ec10c28d85-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vVxk1mPm0UvUElUUsRqFd2ieDTCtTuX+2gn/JyVMCiU=;
        b=oWC/ALzobzkxun/Oj6gLmEkTd7BTAGZlJaJqRyZUEBhZjSZIJ0EJ/4Cii+gkgakt4VlOkZSZmRwAYyKLVXJBX4pD20URfhj5R6QdePQ7MdJJa/LrQKYpf3nZcIU5zrqvAHXvawzb45DZ6ClF3PhOSKuVhSd5qciLCtSySIu85+0=;
X-UUID: a1976ea1b8f542379a9e99ec10c28d85-20200803
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 537542150; Mon, 03 Aug 2020 16:57:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 16:57:35 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 0/3] Add support for MT6315 regulator
Date:   Mon, 3 Aug 2020 16:57:24 +0800
Message-ID: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIE1lZGlhVGVrIFBNSUMgTVQ2MzE1IHJl
Z3VsYXRvciBkcml2ZXIsDQp3aGljaCBhZGRzIE1UNjMxNSByZWxhdGVkIGJ1Y2sgdm9sdGFnZSBk
YXRhIHRvIHRoZSBkcml2ZXIuDQoNCkhzaW4tSHNpdW5nIFdhbmcgKDMpOg0KICBzcG1pOiBBZGQg
ZHJpdmVyIHNodXRkb3duIHN1cHBvcnQNCiAgcmVndWxhdG9yOiBiaW5kaW5nczogQWRkIGRvY3Vt
ZW50IGZvciBNVDYzMTUgcmVndWxhdG9yDQogIHJlZ3VsYXRvcjogbXQ2MzE1OiBBZGQgc3VwcG9y
dCBmb3IgTVQ2MzE1IHJlZ3VsYXRvcg0KDQogLi4uL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYzMTUt
cmVndWxhdG9yLnR4dCAgICAgICAgfCAgNDUgKysrDQogZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KIGRyaXZlcnMvcmVndWxhdG9yL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL3JlZ3VsYXRv
ci9tdDYzMTUtcmVndWxhdG9yLmMgICAgICAgICAgICAgICB8IDM2NyArKysrKysrKysrKysrKysr
KysrKysNCiBkcml2ZXJzL3NwbWkvc3BtaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxMiArDQogaW5jbHVkZS9saW51eC9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRvci5oICAg
ICAgICAgfCAgNDUgKysrDQogaW5jbHVkZS9saW51eC9zcG1pLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKw0KIDcgZmlsZXMgY2hhbmdlZCwgNDgxIGluc2VydGlvbnMoKykN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
Z3VsYXRvci9tdDYzMTUtcmVndWxhdG9yLnR4dA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3JlZ3VsYXRvci9tdDYzMTUtcmVndWxhdG9yLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9saW51eC9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRvci5oDQoNCi0tIA0KMi42LjQNCg==

