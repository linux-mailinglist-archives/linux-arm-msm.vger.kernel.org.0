Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB69724D184
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgHUJbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 05:31:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13938 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728183AbgHUJbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 05:31:19 -0400
X-UUID: 626ae51aeba74277803e6874ca859e38-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=haCYnoHCPkglnHc4N5LtZZz1NiOL98ENM7S1VazhVSg=;
        b=Y/6ZGn7FdmLti5GqqdYZT6b0f+6N7pWts6l6P2UKgR/UPGGv65Uy4xOSZLyMJuOftI9zkjbUPEWhMSMn0GQYN3oOT0AdxSmworrnDxmaWs9+1z/jE56qekpkNaVVRftRP5UYu5gupwW/fw1Qu8dees7HddCSfuY/xbIYXFgofxI=;
X-UUID: 626ae51aeba74277803e6874ca859e38-20200821
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 364629569; Fri, 21 Aug 2020 17:31:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 17:31:02 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 17:31:02 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH 2/2] spmi: mediatek: Add support for MT6873/8192
Date:   Fri, 21 Aug 2020 17:31:00 +0800
Message-ID: <1598002260-12724-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1598002260-12724-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

YWRkIHNwbWkgc3VwcG9ydCBmb3IgTVQ2ODczLzgxOTIuDQoNClNpZ25lZC1vZmYtYnk6IEhzaW4t
SHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVy
cy9zcG1pL0tjb25maWcgICAgICAgICB8ICAgOSArDQogZHJpdmVycy9zcG1pL01ha2VmaWxlICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9zcG1pL3NwbWktbXRrLXBtaWYuYyB8IDQ3OSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA0
ODkgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NwbWkvc3BtaS1t
dGstcG1pZi5jDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwbWkvS2NvbmZpZyBiL2RyaXZlcnMv
c3BtaS9LY29uZmlnDQppbmRleCBhNTNiYWQ1Li40MTg4NDg4IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9zcG1pL0tjb25maWcNCisrKyBiL2RyaXZlcnMvc3BtaS9LY29uZmlnDQpAQCAtMjUsNCArMjUs
MTMgQEAgY29uZmlnIFNQTUlfTVNNX1BNSUNfQVJCDQogCSAgVGhpcyBpcyByZXF1aXJlZCBmb3Ig
Y29tbXVuaWNhdGluZyB3aXRoIFF1YWxjb21tIFBNSUNzIGFuZA0KIAkgIG90aGVyIGRldmljZXMg
dGhhdCBoYXZlIHRoZSBTUE1JIGludGVyZmFjZS4NCiANCitjb25maWcgU1BNSV9NVEtfUE1JRg0K
Kwl0cmlzdGF0ZSAiTWVkaWF0ZWsgU1BNSSBDb250cm9sbGVyIChQTUlDIEFyYml0ZXIpIg0KKwlo
ZWxwDQorCSAgSWYgeW91IHNheSB5ZXMgdG8gdGhpcyBvcHRpb24sIHN1cHBvcnQgd2lsbCBiZSBp
bmNsdWRlZCBmb3IgdGhlDQorCSAgYnVpbHQtaW4gU1BNSSBQTUlDIEFyYml0ZXIgaW50ZXJmYWNl
IG9uIE1lZGlhdGVrIGZhbWlseQ0KKwkgIHByb2Nlc3NvcnMuDQorDQorCSAgVGhpcyBpcyByZXF1
aXJlZCBmb3IgY29tbXVuaWNhdGluZyB3aXRoIE1lZGlhdGVrIFBNSUNzIGFuZA0KKwkgIG90aGVy
IGRldmljZXMgdGhhdCBoYXZlIHRoZSBTUE1JIGludGVyZmFjZS4NCiBlbmRpZg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3BtaS9NYWtlZmlsZSBiL2RyaXZlcnMvc3BtaS9NYWtlZmlsZQ0KaW5kZXgg
NTVhOTRjYS4uOTFmMzAzYjkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NwbWkvTWFrZWZpbGUNCisr
KyBiL2RyaXZlcnMvc3BtaS9NYWtlZmlsZQ0KQEAgLTUsMyArNSw0IEBADQogb2JqLSQoQ09ORklH
X1NQTUkpCSs9IHNwbWkubw0KIA0KIG9iai0kKENPTkZJR19TUE1JX01TTV9QTUlDX0FSQikJKz0g
c3BtaS1wbWljLWFyYi5vDQorb2JqLSQoQ09ORklHX1NQTUlfTVRLX1BNSUYpCSs9IHNwbWktbXRr
LXBtaWYubw0KXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcG1pL3NwbWktbXRrLXBtaWYuYyBiL2RyaXZlcnMvc3BtaS9zcG1pLW10ay1wbWlmLmMNCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi43ZTkwMzkwDQotLS0gL2Rldi9udWxs
DQorKysgYi9kcml2ZXJzL3NwbWkvc3BtaS1tdGstcG1pZi5jDQpAQCAtMCwwICsxLDQ3OSBAQA0K
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLy8NCisvLyBDb3B5cmlnaHQg
KGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KKw0KKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCisjaW5j
bHVkZSA8bGludXgvaW9wb2xsLmg+DQorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KKyNpbmNs
dWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+DQorI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0K
KyNpbmNsdWRlIDxsaW51eC9zcG1pLmg+DQorDQorI2RlZmluZSBTV0lORl9JRExFCTB4MDANCisj
ZGVmaW5lIFNXSU5GX1dGVkxEQ0xSCTB4MDYNCisNCisjZGVmaW5lIEdFVF9TV0lORih4KQkoKCh4
KSA+PiAxKSAmIDB4NykNCisNCisjZGVmaW5lIFBNSUZfQ01EX1JFR18wCQkwDQorI2RlZmluZSBQ
TUlGX0NNRF9SRUcJCTENCisjZGVmaW5lIFBNSUZfQ01EX0VYVF9SRUcJMg0KKyNkZWZpbmUgUE1J
Rl9DTURfRVhUX1JFR19MT05HCTMNCisNCisjZGVmaW5lIFBNSUZfREVMQVlfVVMgICAxMA0KKyNk
ZWZpbmUgUE1JRl9USU1FT1VUICAgICgxMCAqIDEwMDApDQorDQorI2RlZmluZSBQTUlGX0NIQU5f
T0ZGU0VUIDB4NQ0KKw0KKyNkZWZpbmUgU1BNSV9PUF9TVF9CVVNZIDENCisNCitzdHJ1Y3QgY2hf
cmVnIHsNCisJdTMyIGNoX3N0YTsNCisJdTMyIHdkYXRhOw0KKwl1MzIgcmRhdGE7DQorCXUzMiBj
aF9zZW5kOw0KKwl1MzIgY2hfcmR5Ow0KK307DQorDQorc3RydWN0IHBtaWYgew0KKwl2b2lkIF9f
aW9tZW0JKmJhc2U7DQorCWNvbnN0IHUzMgkqcmVnczsNCisJdm9pZCBfX2lvbWVtCSpzcG1pbXN0
X2Jhc2U7DQorCWNvbnN0IHUzMgkqc3BtaW1zdF9yZWdzOw0KKwl1MzIJCXNvY19jaGFuOw0KKwlp
bnQJCWdycGlkOw0KKwlyYXdfc3BpbmxvY2tfdAlsb2NrOw0KKwlzdHJ1Y3QgY2xrCSpwbWlmX3N5
c19jazsNCisJc3RydWN0IGNsawkqcG1pZl90bXJfY2s7DQorCXN0cnVjdCBjbGsJKnNwbWltc3Rf
Y2xrX211eDsNCisJc3RydWN0IGNoX3JlZyBjaGFuOw0KK307DQorDQorZW51bSBwbWlmX3JlZ3Mg
ew0KKwlQTUlGX0lOSVRfRE9ORSwNCisJUE1JRl9JTkZfRU4sDQorCVBNSUZfQVJCX0VOLA0KKwlQ
TUlGX0NNRElTU1VFX0VOLA0KKwlQTUlGX1RJTUVSX0NUUkwsDQorCVBNSUZfU1BJX01PREVfQ1RS
TCwNCisJUE1JRl9JUlFfRVZFTlRfRU5fMCwNCisJUE1JRl9JUlFfRkxBR18wLA0KKwlQTUlGX0lS
UV9DTFJfMCwNCisJUE1JRl9JUlFfRVZFTlRfRU5fMSwNCisJUE1JRl9JUlFfRkxBR18xLA0KKwlQ
TUlGX0lSUV9DTFJfMSwNCisJUE1JRl9JUlFfRVZFTlRfRU5fMiwNCisJUE1JRl9JUlFfRkxBR18y
LA0KKwlQTUlGX0lSUV9DTFJfMiwNCisJUE1JRl9JUlFfRVZFTlRfRU5fMywNCisJUE1JRl9JUlFf
RkxBR18zLA0KKwlQTUlGX0lSUV9DTFJfMywNCisJUE1JRl9JUlFfRVZFTlRfRU5fNCwNCisJUE1J
Rl9JUlFfRkxBR180LA0KKwlQTUlGX0lSUV9DTFJfNCwNCisJUE1JRl9XRFRfRVZFTlRfRU5fMCwN
CisJUE1JRl9XRFRfRkxBR18wLA0KKwlQTUlGX1dEVF9FVkVOVF9FTl8xLA0KKwlQTUlGX1dEVF9G
TEFHXzEsDQorCVBNSUZfU1dJTkZfMF9TVEEsDQorCVBNSUZfU1dJTkZfMF9XREFUQV8zMV8wLA0K
KwlQTUlGX1NXSU5GXzBfUkRBVEFfMzFfMCwNCisJUE1JRl9TV0lORl8wX0FDQywNCisJUE1JRl9T
V0lORl8wX1ZMRF9DTFIsDQorCVBNSUZfU1dJTkZfMV9TVEEsDQorCVBNSUZfU1dJTkZfMV9XREFU
QV8zMV8wLA0KKwlQTUlGX1NXSU5GXzFfUkRBVEFfMzFfMCwNCisJUE1JRl9TV0lORl8xX0FDQywN
CisJUE1JRl9TV0lORl8xX1ZMRF9DTFIsDQorCVBNSUZfU1dJTkZfMl9TVEEsDQorCVBNSUZfU1dJ
TkZfMl9XREFUQV8zMV8wLA0KKwlQTUlGX1NXSU5GXzJfUkRBVEFfMzFfMCwNCisJUE1JRl9TV0lO
Rl8yX0FDQywNCisJUE1JRl9TV0lORl8yX1ZMRF9DTFIsDQorCVBNSUZfU1dJTkZfM19TVEEsDQor
CVBNSUZfU1dJTkZfM19XREFUQV8zMV8wLA0KKwlQTUlGX1NXSU5GXzNfUkRBVEFfMzFfMCwNCisJ
UE1JRl9TV0lORl8zX0FDQywNCisJUE1JRl9TV0lORl8zX1ZMRF9DTFIsDQorfTsNCisNCitzdGF0
aWMgY29uc3QgdTMyIG10Njg3M19yZWdzW10gPSB7DQorCVtQTUlGX0lOSVRfRE9ORV0gPQkweDAw
MDAsDQorCVtQTUlGX0lORl9FTl0gPQkJMHgwMDI0LA0KKwlbUE1JRl9BUkJfRU5dID0JCTB4MDE1
MCwNCisJW1BNSUZfQ01ESVNTVUVfRU5dID0JMHgwM0I0LA0KKwlbUE1JRl9USU1FUl9DVFJMXSA9
CTB4MDNFMCwNCisJW1BNSUZfU1BJX01PREVfQ1RSTF0gPQkweDA0MDAsDQorCVtQTUlGX0lSUV9F
VkVOVF9FTl8wXSA9CTB4MDQxOCwNCisJW1BNSUZfSVJRX0ZMQUdfMF0gPQkweDA0MjAsDQorCVtQ
TUlGX0lSUV9DTFJfMF0gPQkweDA0MjQsDQorCVtQTUlGX0lSUV9FVkVOVF9FTl8xXSA9CTB4MDQy
OCwNCisJW1BNSUZfSVJRX0ZMQUdfMV0gPQkweDA0MzAsDQorCVtQTUlGX0lSUV9DTFJfMV0gPQkw
eDA0MzQsDQorCVtQTUlGX0lSUV9FVkVOVF9FTl8yXSA9CTB4MDQzOCwNCisJW1BNSUZfSVJRX0ZM
QUdfMl0gPQkweDA0NDAsDQorCVtQTUlGX0lSUV9DTFJfMl0gPQkweDA0NDQsDQorCVtQTUlGX0lS
UV9FVkVOVF9FTl8zXSA9CTB4MDQ0OCwNCisJW1BNSUZfSVJRX0ZMQUdfM10gPQkweDA0NTAsDQor
CVtQTUlGX0lSUV9DTFJfM10gPQkweDA0NTQsDQorCVtQTUlGX0lSUV9FVkVOVF9FTl80XSA9CTB4
MDQ1OCwNCisJW1BNSUZfSVJRX0ZMQUdfNF0gPQkweDA0NjAsDQorCVtQTUlGX0lSUV9DTFJfNF0g
PQkweDA0NjQsDQorCVtQTUlGX1dEVF9FVkVOVF9FTl8wXSA9CTB4MDQ2QywNCisJW1BNSUZfV0RU
X0ZMQUdfMF0gPQkweDA0NzAsDQorCVtQTUlGX1dEVF9FVkVOVF9FTl8xXSA9CTB4MDQ3NCwNCisJ
W1BNSUZfV0RUX0ZMQUdfMV0gPQkweDA0NzgsDQorCVtQTUlGX1NXSU5GXzBfQUNDXSA9CTB4MEMw
MCwNCisJW1BNSUZfU1dJTkZfMF9XREFUQV8zMV8wXSA9CTB4MEMwNCwNCisJW1BNSUZfU1dJTkZf
MF9SREFUQV8zMV8wXSA9CTB4MEMxNCwNCisJW1BNSUZfU1dJTkZfMF9WTERfQ0xSXSA9CTB4MEMy
NCwNCisJW1BNSUZfU1dJTkZfMF9TVEFdID0JMHgwQzI4LA0KKwlbUE1JRl9TV0lORl8xX0FDQ10g
PQkweDBDNDAsDQorCVtQTUlGX1NXSU5GXzFfV0RBVEFfMzFfMF0gPQkweDBDNDQsDQorCVtQTUlG
X1NXSU5GXzFfUkRBVEFfMzFfMF0gPQkweDBDNTQsDQorCVtQTUlGX1NXSU5GXzFfVkxEX0NMUl0g
PQkweDBDNjQsDQorCVtQTUlGX1NXSU5GXzFfU1RBXSA9CTB4MEM2OCwNCisJW1BNSUZfU1dJTkZf
Ml9BQ0NdID0JMHgwQzgwLA0KKwlbUE1JRl9TV0lORl8yX1dEQVRBXzMxXzBdID0JMHgwQzg0LA0K
KwlbUE1JRl9TV0lORl8yX1JEQVRBXzMxXzBdID0JMHgwQzk0LA0KKwlbUE1JRl9TV0lORl8yX1ZM
RF9DTFJdID0JMHgwQ0E0LA0KKwlbUE1JRl9TV0lORl8yX1NUQV0gPQkweDBDQTgsDQorCVtQTUlG
X1NXSU5GXzNfQUNDXSA9CTB4MENDMCwNCisJW1BNSUZfU1dJTkZfM19XREFUQV8zMV8wXSA9CTB4
MENDNCwNCisJW1BNSUZfU1dJTkZfM19SREFUQV8zMV8wXSA9CTB4MENENCwNCisJW1BNSUZfU1dJ
TkZfM19WTERfQ0xSXSA9CTB4MENFNCwNCisJW1BNSUZfU1dJTkZfM19TVEFdID0JMHgwQ0U4LA0K
K307DQorDQorZW51bSBzcG1pX3JlZ3Mgew0KKwlTUE1JX09QX1NUX0NUUkwsDQorCVNQTUlfR1JQ
X0lEX0VOLA0KKwlTUE1JX09QX1NUX1NUQSwNCisJU1BNSV9NU1RfU0FNUEwsDQorCVNQTUlfTVNU
X1JFUV9FTiwNCisJU1BNSV9SRUNfQ1RSTCwNCisJU1BNSV9SRUMwLA0KKwlTUE1JX1JFQzEsDQor
CVNQTUlfUkVDMiwNCisJU1BNSV9SRUMzLA0KKwlTUE1JX1JFQzQsDQorCVNQTUlfTVNUX0RCRywN
Cit9Ow0KKw0KK3N0YXRpYyBjb25zdCB1MzIgbXQ2ODczX3NwbWlfcmVnc1tdID0gew0KKwlbU1BN
SV9PUF9TVF9DVFJMXSA9CTB4MDAwMCwNCisJW1NQTUlfR1JQX0lEX0VOXSA9CTB4MDAwNCwNCisJ
W1NQTUlfT1BfU1RfU1RBXSA9CTB4MDAwOCwNCisJW1NQTUlfTVNUX1NBTVBMXSA9CTB4MDAwYywN
CisJW1NQTUlfTVNUX1JFUV9FTl0gPQkweDAwMTAsDQorCVtTUE1JX1JFQ19DVFJMXSA9CTB4MDA0
MCwNCisJW1NQTUlfUkVDMF0gPQkJMHgwMDQ0LA0KKwlbU1BNSV9SRUMxXSA9CQkweDAwNDgsDQor
CVtTUE1JX1JFQzJdID0JCTB4MDA0YywNCisJW1NQTUlfUkVDM10gPQkJMHgwMDUwLA0KKwlbU1BN
SV9SRUM0XSA9CQkweDAwNTQsDQorCVtTUE1JX01TVF9EQkddID0JMHgwMGZjLA0KK307DQorDQor
c3RhdGljIHUzMiBwbWlmX3JlYWRsKHN0cnVjdCBwbWlmICphcmIsIGVudW0gcG1pZl9yZWdzIHJl
ZykNCit7DQorCXJldHVybiByZWFkbChhcmItPmJhc2UgKyBhcmItPnJlZ3NbcmVnXSk7DQorfQ0K
Kw0KK3N0YXRpYyB2b2lkIHBtaWZfd3JpdGVsKHN0cnVjdCBwbWlmICphcmIsIHUzMiB2YWwsIGVu
dW0gcG1pZl9yZWdzIHJlZykNCit7DQorCXdyaXRlbCh2YWwsIGFyYi0+YmFzZSArIGFyYi0+cmVn
c1tyZWddKTsNCit9DQorDQorc3RhdGljIHUzMiBtdGtfc3BtaV9yZWFkbChzdHJ1Y3QgcG1pZiAq
YXJiLCBlbnVtIHNwbWlfcmVncyByZWcpDQorew0KKwlyZXR1cm4gcmVhZGwoYXJiLT5zcG1pbXN0
X2Jhc2UgKyBhcmItPnNwbWltc3RfcmVnc1tyZWddKTsNCit9DQorDQorc3RhdGljIHZvaWQgbXRr
X3NwbWlfd3JpdGVsKHN0cnVjdCBwbWlmICphcmIsIHUzMiB2YWwsIGVudW0gc3BtaV9yZWdzIHJl
ZykNCit7DQorCXdyaXRlbCh2YWwsIGFyYi0+c3BtaW1zdF9iYXNlICsgYXJiLT5zcG1pbXN0X3Jl
Z3NbcmVnXSk7DQorfQ0KKw0KK3N0YXRpYyBib29sIHBtaWZfaXNfZnNtX3ZsZGNscihzdHJ1Y3Qg
cG1pZiAqYXJiKQ0KK3sNCisJdTMyIHJlZ19yZGF0YTsNCisNCisJcmVnX3JkYXRhID0gcG1pZl9y
ZWFkbChhcmIsIGFyYi0+Y2hhbi5jaF9zdGEpOw0KKwlyZXR1cm4gR0VUX1NXSU5GKHJlZ19yZGF0
YSkgPT0gU1dJTkZfV0ZWTERDTFI7DQorfQ0KKw0KK3N0YXRpYyBpbnQgcG1pZl9hcmJfY21kKHN0
cnVjdCBzcG1pX2NvbnRyb2xsZXIgKmN0cmwsIHU4IG9wYywgdTggc2lkKQ0KK3sNCisJc3RydWN0
IHBtaWYgKmFyYiA9IHNwbWlfY29udHJvbGxlcl9nZXRfZHJ2ZGF0YShjdHJsKTsNCisJdTMyIHJk
YXRhOw0KKwl1OCBjbWQ7DQorCWludCByZXQ7DQorDQorCS8qIENoZWNrIHRoZSBvcGNvZGUgKi8N
CisJaWYgKG9wYyA9PSBTUE1JX0NNRF9SRVNFVCkNCisJCWNtZCA9IDA7DQorCWVsc2UgaWYgKG9w
YyA9PSBTUE1JX0NNRF9TTEVFUCkNCisJCWNtZCA9IDE7DQorCWVsc2UgaWYgKG9wYyA9PSBTUE1J
X0NNRF9TSFVURE9XTikNCisJCWNtZCA9IDI7DQorCWVsc2UgaWYgKG9wYyA9PSBTUE1JX0NNRF9X
QUtFVVApDQorCQljbWQgPSAzOw0KKwllbHNlDQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJbXRr
X3NwbWlfd3JpdGVsKGFyYiwgKGNtZCA8PCAweDQpIHwgc2lkLCBTUE1JX09QX1NUX0NUUkwpOw0K
KwlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKGFyYi0+c3BtaW1zdF9iYXNlICsgYXJi
LT5zcG1pbXN0X3JlZ3NbU1BNSV9PUF9TVF9TVEFdLA0KKwkJCQkJcmRhdGEsIChyZGF0YSAmIFNQ
TUlfT1BfU1RfQlVTWSkgPT0gU1BNSV9PUF9TVF9CVVNZLA0KKwkJCQkJUE1JRl9ERUxBWV9VUywg
UE1JRl9USU1FT1VUKTsNCisJaWYgKHJldCA8IDApDQorCQlkZXZfbm90aWNlKCZjdHJsLT5kZXYs
ICJbJXNdOnRpbWVvdXQsIGVyciA9ICVkXHJcbiIsIHJldCk7DQorDQorCXJldHVybiByZXQ7DQor
fQ0KKw0KK3N0YXRpYyBpbnQgcG1pZl9zcG1pX3JlYWRfY21kKHN0cnVjdCBzcG1pX2NvbnRyb2xs
ZXIgKmN0cmwsIHU4IG9wYywgdTggc2lkLA0KKwkJCSAgICAgIHUxNiBhZGRyLCB1OCAqYnVmLCBz
aXplX3QgbGVuKQ0KK3sNCisJc3RydWN0IHBtaWYgKmFyYiA9IHNwbWlfY29udHJvbGxlcl9nZXRf
ZHJ2ZGF0YShjdHJsKTsNCisJc3RydWN0IGNoX3JlZyAqaW5mX3JlZyA9IE5VTEw7DQorCWludCBy
ZXQ7DQorCXUzMiBkYXRhID0gMDsNCisJdTggYmMgPSBsZW4gLSAxOw0KKwl1bnNpZ25lZCBsb25n
IGZsYWdzOw0KKw0KKwkvKiBDaGVjayBmb3IgYXJndW1lbnQgdmFsaWRhdGlvbi4gKi8NCisJaWYg
KHNpZCAmIH4oMHhmKSkNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KKwlpZiAoIWFyYikNCisJCXJl
dHVybiAtRUlOVkFMOw0KKw0KKwlpbmZfcmVnID0gJmFyYi0+Y2hhbjsNCisJLyogQ2hlY2sgdGhl
IG9wY29kZSAqLw0KKwlpZiAob3BjID49IDB4NjAgJiYgb3BjIDw9IDB4N2YpDQorCQlvcGMgPSBQ
TUlGX0NNRF9SRUc7DQorCWVsc2UgaWYgKG9wYyA+PSAweDIwICYmIG9wYyA8PSAweDJmKQ0KKwkJ
b3BjID0gUE1JRl9DTURfRVhUX1JFR19MT05HOw0KKwllbHNlIGlmIChvcGMgPj0gMHgzOCAmJiBv
cGMgPD0gMHgzZikNCisJCW9wYyA9IFBNSUZfQ01EX0VYVF9SRUdfTE9ORzsNCisJZWxzZQ0KKwkJ
cmV0dXJuIC1FSU5WQUw7DQorDQorCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmYXJiLT5sb2NrLCBm
bGFncyk7DQorCS8qIFdhaXQgZm9yIFNvZnR3YXJlIEludGVyZmFjZSBGU00gc3RhdGUgdG8gYmUg
SURMRS4gKi8NCisJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhhcmItPmJhc2UgKyBh
cmItPnJlZ3NbaW5mX3JlZy0+Y2hfc3RhXSwNCisJCQkJCWRhdGEsIEdFVF9TV0lORihkYXRhKSA9
PSBTV0lORl9JRExFLA0KKwkJCQkJUE1JRl9ERUxBWV9VUywgUE1JRl9USU1FT1VUKTsNCisJaWYg
KHJldCA8IDApIHsNCisJCS8qIHNldCBjaGFubmVsIHJlYWR5IGlmIHRoZSBkYXRhIGhhcyB0cmFu
c2ZlcnJlZCAqLw0KKwkJaWYgKHBtaWZfaXNfZnNtX3ZsZGNscihhcmIpKQ0KKwkJCXBtaWZfd3Jp
dGVsKGFyYiwgMSwgaW5mX3JlZy0+Y2hfcmR5KTsNCisJCXJhd19zcGluX3VubG9ja19pcnFyZXN0
b3JlKCZhcmItPmxvY2ssIGZsYWdzKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJLyogU2Vu
ZCB0aGUgY29tbWFuZC4gKi8NCisJcG1pZl93cml0ZWwoYXJiLA0KKwkJICAgIChvcGMgPDwgMzAp
IHwgKHNpZCA8PCAyNCkgfCAoYmMgPDwgMTYpIHwgYWRkciwNCisJCSAgICBpbmZfcmVnLT5jaF9z
ZW5kKTsNCisNCisJLyogV2FpdCBmb3IgU29mdHdhcmUgSW50ZXJmYWNlIEZTTSBzdGF0ZSB0byBi
ZSBXRlZMRENMUiwNCisJICoNCisJICogcmVhZCB0aGUgZGF0YSBhbmQgY2xlYXIgdGhlIHZhbGlk
IGZsYWcuDQorCSAqLw0KKwlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKGFyYi0+YmFz
ZSArIGFyYi0+cmVnc1tpbmZfcmVnLT5jaF9zdGFdLA0KKwkJCQkJZGF0YSwgR0VUX1NXSU5GKGRh
dGEpID09IFNXSU5GX1dGVkxEQ0xSLA0KKwkJCQkJUE1JRl9ERUxBWV9VUywgUE1JRl9USU1FT1VU
KTsNCisJaWYgKHJldCA8IDApIHsNCisJCXJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZhcmIt
PmxvY2ssIGZsYWdzKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJZGF0YSA9IHBtaWZfcmVh
ZGwoYXJiLCBpbmZfcmVnLT5yZGF0YSk7DQorCW1lbWNweShidWYsICZkYXRhLCAoYmMgJiAzKSAr
IDEpOw0KKwlwbWlmX3dyaXRlbChhcmIsIDEsIGluZl9yZWctPmNoX3JkeSk7DQorCXJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZhcmItPmxvY2ssIGZsYWdzKTsNCisNCisJcmV0dXJuIDA7DQor
fQ0KKw0KK3N0YXRpYyBpbnQgcG1pZl9zcG1pX3dyaXRlX2NtZChzdHJ1Y3Qgc3BtaV9jb250cm9s
bGVyICpjdHJsLCB1OCBvcGMsIHU4IHNpZCwNCisJCQkgICAgICAgdTE2IGFkZHIsIGNvbnN0IHU4
ICpidWYsIHNpemVfdCBsZW4pDQorew0KKwlzdHJ1Y3QgcG1pZiAqYXJiID0gc3BtaV9jb250cm9s
bGVyX2dldF9kcnZkYXRhKGN0cmwpOw0KKwlzdHJ1Y3QgY2hfcmVnICppbmZfcmVnID0gTlVMTDsN
CisJaW50IHJldDsNCisJdTMyIGRhdGEgPSAwOw0KKwl1OCBiYyA9IGxlbiAtIDE7DQorCXVuc2ln
bmVkIGxvbmcgZmxhZ3MgPSAwOw0KKw0KKwkvKiBDaGVjayBmb3IgYXJndW1lbnQgdmFsaWRhdGlv
bi4gKi8NCisJaWYgKHNpZCAmIH4oMHhmKSkNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KKwlpZiAo
IWFyYikNCisJCXJldHVybiAtRUlOVkFMOw0KKw0KKwlpbmZfcmVnID0gJmFyYi0+Y2hhbjsNCisN
CisJLyogQ2hlY2sgdGhlIG9wY29kZSAqLw0KKwlpZiAob3BjID49IDB4NDAgJiYgb3BjIDw9IDB4
NUYpDQorCQlvcGMgPSBQTUlGX0NNRF9SRUc7DQorCWVsc2UgaWYgKG9wYyA8PSAweDBGKQ0KKwkJ
b3BjID0gUE1JRl9DTURfRVhUX1JFR19MT05HOw0KKwllbHNlIGlmIChvcGMgPj0gMHgzMCAmJiBv
cGMgPD0gMHgzNykNCisJCW9wYyA9IFBNSUZfQ01EX0VYVF9SRUdfTE9ORzsNCisJZWxzZSBpZiAo
b3BjID49IDB4ODApDQorCQlvcGMgPSBQTUlGX0NNRF9SRUdfMDsNCisJZWxzZQ0KKwkJcmV0dXJu
IC1FSU5WQUw7DQorDQorCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmYXJiLT5sb2NrLCBmbGFncyk7
DQorCS8qIFdhaXQgZm9yIFNvZnR3YXJlIEludGVyZmFjZSBGU00gc3RhdGUgdG8gYmUgSURMRS4g
Ki8NCisJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhhcmItPmJhc2UgKyBhcmItPnJl
Z3NbaW5mX3JlZy0+Y2hfc3RhXSwNCisJCQkJCWRhdGEsIEdFVF9TV0lORihkYXRhKSA9PSBTV0lO
Rl9JRExFLA0KKwkJCQkJUE1JRl9ERUxBWV9VUywgUE1JRl9USU1FT1VUKTsNCisJaWYgKHJldCA8
IDApIHsNCisJCS8qIHNldCBjaGFubmVsIHJlYWR5IGlmIHRoZSBkYXRhIGhhcyB0cmFuc2ZlcnJl
ZCAqLw0KKwkJaWYgKHBtaWZfaXNfZnNtX3ZsZGNscihhcmIpKQ0KKwkJCXBtaWZfd3JpdGVsKGFy
YiwgMSwgaW5mX3JlZy0+Y2hfcmR5KTsNCisJCXJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZh
cmItPmxvY2ssIGZsYWdzKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJLyogU2V0IHRoZSB3
cml0ZSBkYXRhLiAqLw0KKwltZW1jcHkoJmRhdGEsIGJ1ZiwgKGJjICYgMykgKyAxKTsNCisJcG1p
Zl93cml0ZWwoYXJiLCBkYXRhLCBpbmZfcmVnLT53ZGF0YSk7DQorDQorCS8qIFNlbmQgdGhlIGNv
bW1hbmQuICovDQorCXBtaWZfd3JpdGVsKGFyYiwNCisJCSAgICAob3BjIDw8IDMwKSB8IEJJVCgy
OSkgfCAoc2lkIDw8IDI0KSB8IChiYyA8PCAxNikgfCBhZGRyLA0KKwkJICAgIGluZl9yZWctPmNo
X3NlbmQpOw0KKwlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYXJiLT5sb2NrLCBmbGFncyk7
DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgc3RydWN0IHBtaWYgbXQ2ODczX3BtaWZf
YXJiW10gPSB7DQorCXsNCisJCS5yZWdzID0gbXQ2ODczX3JlZ3MsDQorCQkuc3BtaW1zdF9yZWdz
ID0gbXQ2ODczX3NwbWlfcmVncywNCisJCS5zb2NfY2hhbiA9IDIsDQorCX0sDQorfTsNCisNCitz
dGF0aWMgaW50IG10a19zcG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQor
ew0KKwlzdHJ1Y3QgcG1pZiAqYXJiOw0KKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCisJc3RydWN0
IHNwbWlfY29udHJvbGxlciAqY3RybDsNCisJaW50IGVyciA9IDA7DQorDQorCWN0cmwgPSBzcG1p
X2NvbnRyb2xsZXJfYWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCphcmIpKTsNCisJaWYgKCFjdHJs
KQ0KKwkJcmV0dXJuIC1FTk9NRU07DQorDQorCWN0cmwtPmNtZCA9IHBtaWZfYXJiX2NtZDsNCisJ
Y3RybC0+cmVhZF9jbWQgPSBwbWlmX3NwbWlfcmVhZF9jbWQ7DQorCWN0cmwtPndyaXRlX2NtZCA9
IHBtaWZfc3BtaV93cml0ZV9jbWQ7DQorDQorCS8qIHJlLWFzc2lnbiBvZl9pZC0+ZGF0YSAqLw0K
KwlzcG1pX2NvbnRyb2xsZXJfc2V0X2RydmRhdGEoY3RybCwgKHZvaWQgKilvZl9kZXZpY2VfZ2V0
X21hdGNoX2RhdGEoJnBkZXYtPmRldikpOw0KKwlhcmIgPSBzcG1pX2NvbnRyb2xsZXJfZ2V0X2Ry
dmRhdGEoY3RybCk7DQorDQorCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRl
diwgSU9SRVNPVVJDRV9NRU0sICJwbWlmIik7DQorCWFyYi0+YmFzZSA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOw0KKwlpZiAoSVNfRVJSKGFyYi0+YmFzZSkpIHsNCisJ
CWVyciA9IFBUUl9FUlIoYXJiLT5iYXNlKTsNCisJCWdvdG8gZXJyX3B1dF9jdHJsOw0KKwl9DQor
DQorCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9N
RU0sICJzcG1pbXN0Iik7DQorCWFyYi0+c3BtaW1zdF9iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKCZwZGV2LT5kZXYsIHJlcyk7DQorCWlmIChJU19FUlIoYXJiLT5zcG1pbXN0X2Jhc2UpKSB7
DQorCQllcnIgPSBQVFJfRVJSKGFyYi0+c3BtaW1zdF9iYXNlKTsNCisJCXJldHVybiBlcnJfcHV0
X2N0cmw7DQorCX0NCisNCisJYXJiLT5wbWlmX3N5c19jayA9IGRldm1fY2xrX2dldCgmcGRldi0+
ZGV2LCAicG1pZl9zeXNfY2siKTsNCisJaWYgKElTX0VSUihhcmItPnBtaWZfc3lzX2NrKSkgew0K
KwkJZGV2X2VycigmcGRldi0+ZGV2LCAiW1BNSUZdOmZhaWxlZCB0byBnZXQgYXAgY2xvY2s6ICVs
ZFxuIiwNCisJCQlQVFJfRVJSKGFyYi0+cG1pZl9zeXNfY2spKTsNCisJCWdvdG8gZXJyX3B1dF9j
dHJsOw0KKwl9DQorDQorCWFyYi0+cG1pZl90bXJfY2sgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRl
diwgInBtaWZfdG1yX2NrIik7DQorCWlmIChJU19FUlIoYXJiLT5wbWlmX3Rtcl9jaykpIHsNCisJ
CWRldl9lcnIoJnBkZXYtPmRldiwgIltQTUlGXTpmYWlsZWQgdG8gZ2V0IHRtciBjbG9jazogJWxk
XG4iLA0KKwkJCVBUUl9FUlIoYXJiLT5wbWlmX3Rtcl9jaykpOw0KKwkJZ290byBlcnJfcHV0X2N0
cmw7DQorCX0NCisNCisJYXJiLT5zcG1pbXN0X2Nsa19tdXggPSBkZXZtX2Nsa19nZXQoJnBkZXYt
PmRldiwgInNwbWltc3RfY2xrX211eCIpOw0KKwlpZiAoSVNfRVJSKGFyYi0+c3BtaW1zdF9jbGtf
bXV4KSkgew0KKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiW1NQTUlNU1RdOmZhaWxlZCB0byBnZXQg
Y2xvY2s6ICVsZFxuIiwNCisJCQlQVFJfRVJSKGFyYi0+c3BtaW1zdF9jbGtfbXV4KSk7DQorCQln
b3RvIGVycl9wdXRfY3RybDsNCisJfQ0KKw0KKwllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoYXJi
LT5zcG1pbXN0X2Nsa19tdXgpOw0KKwlpZiAoZXJyKSB7DQorCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJbUE1JRl06ZmFpbGVkIHRvIGVuYWJsZSBzcG1pIG1hc3RlciBjbGsuXG4iKTsNCisJCWdvdG8g
ZXJyX3B1dF9jdHJsOw0KKwl9DQorDQorCWFyYi0+Y2hhbi5jaF9zdGEgPSBQTUlGX1NXSU5GXzBf
U1RBICsgKFBNSUZfQ0hBTl9PRkZTRVQgKiBhcmItPnNvY19jaGFuKTsNCisJYXJiLT5jaGFuLndk
YXRhID0gUE1JRl9TV0lORl8wX1dEQVRBXzMxXzAgKyAoUE1JRl9DSEFOX09GRlNFVCAqIGFyYi0+
c29jX2NoYW4pOw0KKwlhcmItPmNoYW4ucmRhdGEgPSBQTUlGX1NXSU5GXzBfUkRBVEFfMzFfMCAr
IChQTUlGX0NIQU5fT0ZGU0VUICogYXJiLT5zb2NfY2hhbik7DQorCWFyYi0+Y2hhbi5jaF9zZW5k
ID0gUE1JRl9TV0lORl8wX0FDQyArIChQTUlGX0NIQU5fT0ZGU0VUICogYXJiLT5zb2NfY2hhbik7
DQorCWFyYi0+Y2hhbi5jaF9yZHkgPSBQTUlGX1NXSU5GXzBfVkxEX0NMUiArIChQTUlGX0NIQU5f
T0ZGU0VUICogYXJiLT5zb2NfY2hhbik7DQorDQorCXJhd19zcGluX2xvY2tfaW5pdCgmYXJiLT5s
b2NrKTsNCisNCisJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY3RybCk7DQorDQorCWVyciA9
IHNwbWlfY29udHJvbGxlcl9hZGQoY3RybCk7DQorCWlmIChlcnIpDQorCQlnb3RvIGVycl9kb21h
aW5fcmVtb3ZlOw0KKw0KKwlyZXR1cm4gMDsNCisNCitlcnJfZG9tYWluX3JlbW92ZToNCisJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGFyYi0+c3BtaW1zdF9jbGtfbXV4KTsNCitlcnJfcHV0X2N0cmw6
DQorCXNwbWlfY29udHJvbGxlcl9wdXQoY3RybCk7DQorCXJldHVybiBlcnI7DQorfQ0KKw0KK3N0
YXRpYyBpbnQgbXRrX3NwbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQor
ew0KKwlzdHJ1Y3Qgc3BtaV9jb250cm9sbGVyICpjdHJsID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7DQorDQorCXNwbWlfY29udHJvbGxlcl9yZW1vdmUoY3RybCk7DQorCXNwbWlfY29udHJv
bGxlcl9wdXQoY3RybCk7DQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtdGtfc3BtaV9tYXRjaF90YWJsZVtdID0gew0KKwl7DQorCQkuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDY4NzMtc3BtaSIsDQorCQkuZGF0YSA9ICZtdDY4NzNfcG1pZl9h
cmIsDQorCX0sIHsNCisJCS8qIHNlbnRpbmVsICovDQorCX0sDQorfTsNCitNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBtdGtfc3BtaV9tYXRjaF90YWJsZSk7DQorDQorc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbXRrX3NwbWlfZHJpdmVyID0gew0KKwkuZHJpdmVyCQk9IHsNCisJCS5uYW1l
CT0gInNwbWktbXRrIiwNCisJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtdGtfc3Bt
aV9tYXRjaF90YWJsZSksDQorCX0sDQorCS5wcm9iZQkJPSBtdGtfc3BtaV9wcm9iZSwNCisJLnJl
bW92ZQkJPSBtdGtfc3BtaV9yZW1vdmUsDQorfTsNCittb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10
a19zcG1pX2RyaXZlcik7DQorDQorTU9EVUxFX0FVVEhPUigiSHNpbi1Ic2l1bmcgV2FuZyA8aHNp
bi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Iik7DQorTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRp
YVRlayBTUE1JIERyaXZlciIpOw0KK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCi0tIA0KMi42LjQN
Cg==

