Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063932938A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404940AbgJTJ5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 05:57:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36258 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404885AbgJTJ5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 05:57:33 -0400
X-UUID: 99f8cf23af424c55bc3abcdd08228555-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qfBpt2yRRSl7Y0IIx6HSJ15aOq766nROGum9UitxWik=;
        b=KoEaCBJt/RQncXupvinf8F9qXIEy6KAEm7eC0FW5e75YlBCQAWAp1OQW1nSBVWdeZrkYBW/8g62am8S+//QBW3t30xVQnL8A2FIhLF3eFuVl/QyBBrhzUbxRgJjH2cQ1kImjYlFalzhQM+sgOLuiHxvt6frfU73wkktjeIorABM=;
X-UUID: 99f8cf23af424c55bc3abcdd08228555-20201020
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 36604476; Tue, 20 Oct 2020 17:57:26 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 17:57:24 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 17:57:26 +0800
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
Subject: [PATCH v2 2/3] dt-bindings: regulator: document binding for MT6315 regulator
Date:   Tue, 20 Oct 2020 17:56:49 +0800
Message-ID: <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QWRkIGRldmljZSB0cmVlIGJpbmRpbmcgaW5mb3JtYXRpb24gZm9yIE1UNjMxNSByZWd1bGF0b3Ig
ZHJpdmVyLg0KRXhhbXBsZSBiaW5kaW5ncyBmb3IgTVQ2MzE1IGFyZSBhZGRlZC4NCg0KU2lnbmVk
LW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+
DQotLS0NCiAuLi4vcmVndWxhdG9yL210ayxtdDYzMTUtcmVndWxhdG9yLnlhbWwgICAgICAgfCA4
OCArKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9kdC1iaW5kaW5ncy9yZWd1bGF0b3IvbXRr
LG10NjMxNS5oICAgIHwgMTcgKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMo
KykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlZ3VsYXRvci9tdGssbXQ2MzE1LXJlZ3VsYXRvci55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVndWxhdG9yL210ayxtdDYzMTUuaA0KDQpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdGssbXQ2MzE1
LXJlZ3VsYXRvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3Vs
YXRvci9tdGssbXQ2MzE1LXJlZ3VsYXRvci55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5k
ZXggMDAwMDAwMDAwMDAwLi40NTc2MDY4MDBkNWINCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXRrLG10NjMxNS1yZWd1bGF0
b3IueWFtbA0KQEAgLTAsMCArMSw4OCBAQA0KKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UNCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3JlZ3VsYXRvci9tdGssbXQ2MzE1LXJlZ3VsYXRvci55
YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KKw0KK3RpdGxlOiBNZWRpYXRlayBNVDYzMTUgUmVndWxhdG9yDQorDQorbWFpbnRhaW5l
cnM6DQorICAtIEhzaW4tSHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29t
Pg0KKw0KK2Rlc2NyaXB0aW9uOiB8DQorICBUaGUgTVQ2MzE1IGlzIGEgcG93ZXIgbWFuYWdlbWVu
dCBJQyAoUE1JQykgY29uZmlndXJhYmxlIHdpdGggU1BNSS4NCisgIHRoYXQgY29udGFpbnMgNCBC
VUNLcyBvdXRwdXQgd2hpY2ggY2FuIGNvbWJpbmUgd2l0aCBlYWNoIG90aGVyDQorICBieSBkaWZm
ZXJlbnQgZWZ1c2Ugc2V0dGluZ3MuDQorDQorYWxsT2Y6DQorICAtICRyZWY6ICJyZWd1bGF0b3Iu
eWFtbCMiDQorDQorcHJvcGVydGllczoNCisgICRub2RlbmFtZToNCisgICAgcGF0dGVybjogIm10
NjMxNUBbMC05XSINCisgIGNvbXBhdGlibGU6DQorICAgIGVudW06DQorICAgICAgLSBtZWRpYXRl
ayxtdDYzMTVfMy1yZWd1bGF0b3INCisgICAgICAtIG1lZGlhdGVrLG10NjMxNV82LXJlZ3VsYXRv
cg0KKyAgICAgIC0gbWVkaWF0ZWssbXQ2MzE1XzctcmVndWxhdG9yDQorDQorICByZWc6DQorICAg
IG1heEl0ZW1zOiAxDQorDQorICByZWd1bGF0b3JzOg0KKyAgICB0eXBlOiBvYmplY3QNCisgICAg
ZGVzY3JpcHRpb246IExpc3Qgb2YgcmVndWxhdG9ycyBhbmQgaXRzIHByb3BlcnRpZXMNCisNCisg
ICAgcGF0dGVyblByb3BlcnRpZXM6DQorICAgICAgIl52YnVja1sxLTRdJCI6DQorICAgICAgICB0
eXBlOiBvYmplY3QNCisNCisgICAgICAgIHByb3BlcnRpZXM6DQorICAgICAgICAgIHJlZ3VsYXRv
ci1uYW1lOg0KKyAgICAgICAgICAgIHBhdHRlcm46ICJedmJ1Y2tbMS00XSQiDQorICAgICAgICAg
ICAgZGVzY3JpcHRpb246DQorICAgICAgICAgICAgICBzaG91bGQgYmUgInZidWNrMSIsIC4uLiwg
InZidWNrNCINCisNCisgICAgICAgICAgbXRrLGNvbWJpbmVkLXJlZ3VsYXRvcjoNCisgICAgICAg
ICAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
Ig0KKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgICAgICAgICBkZWZpbmVzIG90
aGVyIGJ1Y2tzIGNvbWJpbmVkIHdpdGggdGhpcyBidWNrLCBtdXN0IGNvbnRhaW4gdGhlIGZvbGxv
d2luZw0KKyAgICAgICAgICAgICAgdmFsdWVzIE1UNjMxNV9WQlVDSzEsIE1UNjMxNV9WQlVDSzIs
IE1UNjMxNV9WQlVDSzMsIE1UNjMxNV9WQlVDSzQNCisNCisgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIHJlZw0KKyAg
LSByZWd1bGF0b3JzDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBs
ZXM6DQorICAtIHwNCisgICAgLyogVGhpcyBleGFtcGxlIHNob3dzIHRoYXQgYnVjazIgYW5kIGJ1
Y2s0IGFyZSBjb21iaW5lZCBpbnRvIGJ1Y2sxLiAqLw0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvcmVndWxhdG9yL210ayxtdDYzMTUuaD4NCisNCisgICAgbXQ2MzE1QDYgew0KKyAgICAgIGNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzE1XzYtcmVndWxhdG9yIjsNCisgICAgICByZWcgPSA8
MHg2IDAgMHhiIDE+Ow0KKw0KKyAgICAgIHJlZ3VsYXRvcnMgew0KKyAgICAgICAgdmJ1Y2sxIHsN
CisgICAgICAgICAgcmVndWxhdG9yLWNvbXBhdGlibGUgPSAidmJ1Y2sxIjsNCisgICAgICAgICAg
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzAwMDAwPjsNCisgICAgICAgICAgcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSA8MTE5Mzc1MD47DQorICAgICAgICAgIHJlZ3VsYXRvci1lbmFibGUt
cmFtcC1kZWxheSA9IDwyNTY+Ow0KKyAgICAgICAgICByZWd1bGF0b3ItYWxsb3dlZC1tb2RlcyA9
IDwwIDEgMiA0PjsNCisgICAgICAgICAgbXRrLGNvbWJpbmVkLXJlZ3VsYXRvciA9IDxNVDYzMTVf
VkJVQ0syIE1UNjMxNV9WQlVDSzQ+Ow0KKyAgICAgICAgfTsNCisNCisgICAgICAgIHZidWNrMyB7
DQorICAgICAgICAgIHJlZ3VsYXRvci1jb21wYXRpYmxlID0gInZidWNrMyI7DQorICAgICAgICAg
IHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMwMDAwMD47DQorICAgICAgICAgIHJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDExOTM3NTA+Ow0KKyAgICAgICAgICByZWd1bGF0b3ItZW5hYmxl
LXJhbXAtZGVsYXkgPSA8MjU2PjsNCisgICAgICAgICAgcmVndWxhdG9yLWFsbG93ZWQtbW9kZXMg
PSA8MCAxIDIgND47DQorICAgICAgICB9Ow0KKyAgICAgIH07DQorICAgIH07DQpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZWd1bGF0b3IvbXRrLG10NjMxNS5oIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9yZWd1bGF0b3IvbXRrLG10NjMxNS5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
aW5kZXggMDAwMDAwMDAwMDAwLi42ZWQ5YjJiMTIxZGINCi0tLSAvZGV2L251bGwNCisrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVndWxhdG9yL210ayxtdDYzMTUuaA0KQEAgLTAsMCArMSwxNyBA
QA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCisvKg0KKyAq
IENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQorICogQXV0aG9yOiBIc2luLUhzaXVu
ZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisNCisjaWZuZGVm
IF9EVF9CSU5ESU5HU19SRUdVTEFUT1JfTVRLX01UNjMxNV9IDQorI2RlZmluZSBfRFRfQklORElO
R1NfUkVHVUxBVE9SX01US19NVDYzMTVfSA0KKw0KKy8qIFJlZ3VsYXRvciBJRCAqLw0KKyNkZWZp
bmUgTVQ2MzE1X1ZCVUNLMQkxDQorI2RlZmluZSBNVDYzMTVfVkJVQ0syCTINCisjZGVmaW5lIE1U
NjMxNV9WQlVDSzMJMw0KKyNkZWZpbmUgTVQ2MzE1X1ZCVUNLNAk0DQorI2RlZmluZSBNVDYzMTVf
VkJVQ0tfTUFYCTUNCisNCisjZW5kaWYgLyogX0RUX0JJTkRJTkdTX1JFR1VMQVRPUl9NVEtfTVQ2
MzE1X0ggKi8NCi0tIA0KMi4xOC4wDQo=

