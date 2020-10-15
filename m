Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127E328F2CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgJOM7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 08:59:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48002 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726121AbgJOM7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 08:59:16 -0400
X-UUID: 7ebbcc4d24df4cc0aaaaf8e598c67591-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Vc9yRjmF6mmhFDNgrymdNyS1AdEmPVc2ANX+0u/1G8s=;
        b=udZW8GqPFWUf5n/3jNO410Wqip+96jfw2ogYtdb2FlBsa6UI8/yd+MjofnnYT4ppcOdQllT6qLAb79sgxiX8DxYhdj/JybYeIapXimowlH11ndOsZOfdnR1bSNo/QAKBDZ2kxjAMA33RBM93UnO/ChDzmFmrvqCBDFXaKWj0Hzk=;
X-UUID: 7ebbcc4d24df4cc0aaaaf8e598c67591-20201015
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1949178758; Thu, 15 Oct 2020 20:59:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 20:59:09 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Oct 2020 20:59:09 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 0/2] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date:   Thu, 15 Oct 2020 20:59:06 +0800
Message-ID: <1602766748-25490-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBuZXcgU29DIE1UNjg3My84MTkyIHRvIHRoZSBz
cG1pIGRyaXZlci4NCg0KY2hhbmdlcyBzaW5jZSB2MjoNCi0gdXBkYXRlIGJpbmRpbmcgZG9jdW1l
bnQgaW4gRFQgc2NoZW1hIGZvcm1hdC4NCg0KSHNpbi1Ic2l1bmcgV2FuZyAoMik6DQogIGR0LWJp
bmRpbmdzOiBzcG1pOiBkb2N1bWVudCBiaW5kaW5nIGZvciB0aGUgTWVkaWF0ZWsgU1BNSSBjb250
cm9sbGVyDQogIHNwbWk6IG1lZGlhdGVrOiBBZGQgc3VwcG9ydCBmb3IgTVQ2ODczLzgxOTINCg0K
IC4uLi9iaW5kaW5ncy9zcG1pL3NwbWktbXRrLXBtaWYueWFtbCAgICAgICAgICB8ICA3MSArKysN
CiBkcml2ZXJzL3NwbWkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKw0K
IGRyaXZlcnMvc3BtaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQog
ZHJpdmVycy9zcG1pL3NwbWktbXRrLXBtaWYuYyAgICAgICAgICAgICAgICAgIHwgNDc0ICsrKysr
KysrKysrKysrKysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNTU1IGluc2VydGlvbnMoKykNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwbWkvc3Bt
aS1tdGstcG1pZi55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3BtaS9zcG1pLW10
ay1wbWlmLmMNCg0KLS0gDQoyLjE4LjANCg==

