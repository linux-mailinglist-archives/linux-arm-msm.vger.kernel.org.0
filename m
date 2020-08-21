Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE89D24D182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 11:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbgHUJbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 05:31:11 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13938 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728095AbgHUJbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 05:31:10 -0400
X-UUID: 83b53a14f7754a96856088b893ad0d04-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SAJZUx4zLi2MX2DElRX0q99dr5GWJ9MVZVXGhpyhDh4=;
        b=d3HdPs75+1bnNVjF58ScLFubO7g+Ydqum2tHHUgMzs4YpUuzCfcGolwEvuJWn6xJqXNhAhcQfhHJ7NUZeU7t61KPeFQ9+3KK5zScErjuYDFl9pdcoSttPRCCI2ZnQrJBCwQDsNc9ej3Rouh+5CGX2k9zYsqAOI87ndowdvs8eJk=;
X-UUID: 83b53a14f7754a96856088b893ad0d04-20200821
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 167034325; Fri, 21 Aug 2020 17:31:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 17:31:01 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 17:31:01 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 0/2] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date:   Fri, 21 Aug 2020 17:30:58 +0800
Message-ID: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
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
cG1pIGRyaXZlci4NCg0KSHNpbi1Ic2l1bmcgV2FuZyAoMik6DQogIGR0LWJpbmRpbmdzOiBzcG1p
OiBkb2N1bWVudCBiaW5kaW5nIGZvciB0aGUgTWVkaWF0ZWsgU1BNSSBjb250cm9sbGVyDQogIHNw
bWk6IG1lZGlhdGVrOiBBZGQgc3VwcG9ydCBmb3IgTVQ2ODczLzgxOTINCg0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwbWkvc3BtaS1tdGstcG1pZi50eHQgICAgIHwgIDMzICsrDQogZHJpdmVy
cy9zcG1pL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKw0KIGRy
aXZlcnMvc3BtaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsN
CiBkcml2ZXJzL3NwbWkvc3BtaS1tdGstcG1pZi5jICAgICAgICAgICAgICAgICAgICAgICB8IDQ3
OSArKysrKysrKysrKysrKysrKysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDUyMiBpbnNlcnRpb25z
KCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zcG1pL3NwbWktbXRrLXBtaWYudHh0DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3Bt
aS9zcG1pLW10ay1wbWlmLmMNCg0KLS0gDQoyLjYuNA0K

