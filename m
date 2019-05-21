Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A8C24BF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfEUJp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:45:29 -0400
Received: from mail-oln040092070062.outbound.protection.outlook.com ([40.92.70.62]:61924
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726259AbfEUJp2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:45:28 -0400
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (10.152.20.51) by DB5EUR03HT012.eop-EUR03.prod.protection.outlook.com
 (10.152.20.173) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16; Tue, 21 May
 2019 09:45:25 +0000
Received: from VI1PR07MB4432.eurprd07.prod.outlook.com (10.152.20.58) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Tue, 21 May 2019 09:45:25 +0000
Received: from VI1PR07MB4432.eurprd07.prod.outlook.com
 ([fe80::91f:b1bb:a60a:fdc3]) by VI1PR07MB4432.eurprd07.prod.outlook.com
 ([fe80::91f:b1bb:a60a:fdc3%7]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 09:45:25 +0000
From:   Philippe Mazenauer <philippe.mazenauer@outlook.de>
CC:     Philippe Mazenauer <philippe.mazenauer@outlook.de>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: qcom: clk-rpm: Removed unused macros/variable
Thread-Topic: [PATCH] clk: qcom: clk-rpm: Removed unused macros/variable
Thread-Index: AQHVD7nqvfOPz0/CJkmjpU+VT9xDPg==
Date:   Tue, 21 May 2019 09:45:25 +0000
Message-ID: <VI1PR07MB4432BB9A401E0202C4D7D948FD070@VI1PR07MB4432.eurprd07.prod.outlook.com>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR11CA0031.namprd11.prod.outlook.com
 (2603:10b6:300:115::17) To VI1PR07MB4432.eurprd07.prod.outlook.com
 (2603:10a6:802:67::17)
x-incomingtopheadermarker: OriginalChecksum:310B0AA0C53489E8E0DD6A09CFC6C9932C7CDC773006DD602E8A7F86ECD40E7B;UpperCasedChecksum:D50A91F7B91D695612C9D6102FF62D55E61276A06117A058356F152102463F1D;SizeAsReceived:7642;Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [mJwsZig1wxI6OQCoor7gBM2JrK8DCTQ8]
x-microsoft-original-message-id: <20190521094451.118510-1-philippe.mazenauer@outlook.de>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);SRVR:DB5EUR03HT012;
x-ms-traffictypediagnostic: DB5EUR03HT012:
x-microsoft-antispam-message-info: 5U32BXL9EPyGdsu05UExylTZED8laja3QclHayY6in+iYpHEMuRX7xrNRk3jSRPe9ArvS20lCBsupcIPk+xmvO0ut+29UjRtK7uxcXwLqr0uvlFi8hO69loRp3Adj/897Qqp1RvI2VlUrEfDQ/bWaFvNAhFUc46x16QIs0KOZ7d1RHqQiwYvHXbTRkIeheVm
Content-Type: text/plain; charset="utf-8"
Content-ID: <F14FB1E61B92604D8E4C1E0820587CD2@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1bd129-74ee-4d72-2c40-08d6ddd10c63
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 09:45:25.1370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT012
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UmVtb3ZlZCBtYWNyb3MgREVGSU5FX0NMS19SUE1fUFhPX0JSQU5DSCwgREVGSU5FX0NMS19SUE1f
Q1hPX0JSQU5DSCBhbmQNCnZhcmlhYmxlICdjbGtfcnBtX2JyYW5jaF9vcHMnLiBUaGUgbWFjcm9z
IGFuZCB2YXJpYWJsZSBhcmUgbm90IHVzZWQgaW4gdGhlDQpmaWxlLg0KDQpBcyB0aGUgdmFyaWFi
bGUsIHdoaWNoIGlzIHVzZWQgYnkgdGhlIG1hY3JvcywgaXMgZGVjbGFyZWQgc3RhdGljLCB0aGUN
Cm1hY3JvcyBjYW4ndCBiZSB1c2VkIG91dHNpZGUgdGhlIGZpbGUsIGFyZSB1bnVzZWQuDQoNCi4u
L2RyaXZlcnMvY2xrL3Fjb20vY2xrLXJwbS5jOjQ2MToyOTogd2FybmluZzog4oCYY2xrX3JwbV9i
cmFuY2hfb3Bz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZT1dDQogc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIGNsa19ycG1fYnJhbmNoX29wcyA9IHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQoNClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hemVuYXVlciA8cGhpbGlwcGUubWF6ZW5hdWVyQG91dGxvb2su
ZGU+DQotLS0NCiBkcml2ZXJzL2Nsay9xY29tL2Nsay1ycG0uYyB8IDYzIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYzIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcWNvbS9jbGstcnBtLmMgYi9kcml2ZXJzL2Ns
ay9xY29tL2Nsay1ycG0uYw0KaW5kZXggYjk0OTgxNDQ3NjY0Li41YTY2MjJiMzI3MTMgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL2Nsay9xY29tL2Nsay1ycG0uYw0KKysrIGIvZHJpdmVycy9jbGsvcWNv
bS9jbGstcnBtLmMNCkBAIC04MSw2MiArODEsNiBAQA0KIAkJfSwJCQkJCQkJICAgICAgXA0KIAl9
DQogDQotI2RlZmluZSBERUZJTkVfQ0xLX1JQTV9QWE9fQlJBTkNIKF9wbGF0Zm9ybSwgX25hbWUs
IF9hY3RpdmUsIHJfaWQsIHIpCSAgICAgIFwNCi0Jc3RhdGljIHN0cnVjdCBjbGtfcnBtIF9wbGF0
Zm9ybSMjXyMjX2FjdGl2ZTsJCQkgICAgICBcDQotCXN0YXRpYyBzdHJ1Y3QgY2xrX3JwbSBfcGxh
dGZvcm0jI18jI19uYW1lID0gewkJCSAgICAgIFwNCi0JCS5ycG1fY2xrX2lkID0gKHJfaWQpLAkJ
CQkJICAgICAgXA0KLQkJLmFjdGl2ZV9vbmx5ID0gdHJ1ZSwJCQkJCSAgICAgIFwNCi0JCS5wZWVy
ID0gJl9wbGF0Zm9ybSMjXyMjX2FjdGl2ZSwJCQkJICAgICAgXA0KLQkJLnJhdGUgPSAociksCQkJ
CQkJICAgICAgXA0KLQkJLmJyYW5jaCA9IHRydWUsCQkJCQkJICAgICAgXA0KLQkJLmh3LmluaXQg
PSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsJCQkgICAgICBcDQotCQkJLm9wcyA9ICZjbGtfcnBt
X2JyYW5jaF9vcHMsCQkJICAgICAgXA0KLQkJCS5uYW1lID0gI19uYW1lLAkJCQkJICAgICAgXA0K
LQkJCS5wYXJlbnRfbmFtZXMgPSAoY29uc3QgY2hhciAqW10peyAicHhvX2JvYXJkIiB9LCAgICAg
IFwNCi0JCQkubnVtX3BhcmVudHMgPSAxLAkJCQkgICAgICBcDQotCQl9LAkJCQkJCQkgICAgICBc
DQotCX07CQkJCQkJCQkgICAgICBcDQotCXN0YXRpYyBzdHJ1Y3QgY2xrX3JwbSBfcGxhdGZvcm0j
I18jI19hY3RpdmUgPSB7CQkJICAgICAgXA0KLQkJLnJwbV9jbGtfaWQgPSAocl9pZCksCQkJCQkg
ICAgICBcDQotCQkucGVlciA9ICZfcGxhdGZvcm0jI18jI19uYW1lLAkJCQkgICAgICBcDQotCQku
cmF0ZSA9IChyKSwJCQkJCQkgICAgICBcDQotCQkuYnJhbmNoID0gdHJ1ZSwJCQkJCQkgICAgICBc
DQotCQkuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewkJCSAgICAgIFwNCi0JCQku
b3BzID0gJmNsa19ycG1fYnJhbmNoX29wcywJCQkgICAgICBcDQotCQkJLm5hbWUgPSAjX2FjdGl2
ZSwJCQkJICAgICAgXA0KLQkJCS5wYXJlbnRfbmFtZXMgPSAoY29uc3QgY2hhciAqW10peyAicHhv
X2JvYXJkIiB9LCAgICAgIFwNCi0JCQkubnVtX3BhcmVudHMgPSAxLAkJCQkgICAgICBcDQotCQl9
LAkJCQkJCQkgICAgICBcDQotCX0NCi0NCi0jZGVmaW5lIERFRklORV9DTEtfUlBNX0NYT19CUkFO
Q0goX3BsYXRmb3JtLCBfbmFtZSwgX2FjdGl2ZSwgcl9pZCwgcikJICAgICAgXA0KLQlzdGF0aWMg
c3RydWN0IGNsa19ycG0gX3BsYXRmb3JtIyNfIyNfYWN0aXZlOwkJCSAgICAgIFwNCi0Jc3RhdGlj
IHN0cnVjdCBjbGtfcnBtIF9wbGF0Zm9ybSMjXyMjX25hbWUgPSB7CQkJICAgICAgXA0KLQkJLnJw
bV9jbGtfaWQgPSAocl9pZCksCQkJCQkgICAgICBcDQotCQkucGVlciA9ICZfcGxhdGZvcm0jI18j
I19hY3RpdmUsCQkJCSAgICAgIFwNCi0JCS5yYXRlID0gKHIpLAkJCQkJCSAgICAgIFwNCi0JCS5i
cmFuY2ggPSB0cnVlLAkJCQkJCSAgICAgIFwNCi0JCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2lu
aXRfZGF0YSl7CQkJICAgICAgXA0KLQkJCS5vcHMgPSAmY2xrX3JwbV9icmFuY2hfb3BzLAkJCSAg
ICAgIFwNCi0JCQkubmFtZSA9ICNfbmFtZSwJCQkJCSAgICAgIFwNCi0JCQkucGFyZW50X25hbWVz
ID0gKGNvbnN0IGNoYXIgKltdKXsgImN4b19ib2FyZCIgfSwgICAgICBcDQotCQkJLm51bV9wYXJl
bnRzID0gMSwJCQkJICAgICAgXA0KLQkJfSwJCQkJCQkJICAgICAgXA0KLQl9OwkJCQkJCQkJICAg
ICAgXA0KLQlzdGF0aWMgc3RydWN0IGNsa19ycG0gX3BsYXRmb3JtIyNfIyNfYWN0aXZlID0gewkJ
CSAgICAgIFwNCi0JCS5ycG1fY2xrX2lkID0gKHJfaWQpLAkJCQkJICAgICAgXA0KLQkJLmFjdGl2
ZV9vbmx5ID0gdHJ1ZSwJCQkJCSAgICAgIFwNCi0JCS5wZWVyID0gJl9wbGF0Zm9ybSMjXyMjX25h
bWUsCQkJCSAgICAgIFwNCi0JCS5yYXRlID0gKHIpLAkJCQkJCSAgICAgIFwNCi0JCS5icmFuY2gg
PSB0cnVlLAkJCQkJCSAgICAgIFwNCi0JCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0
YSl7CQkJICAgICAgXA0KLQkJCS5vcHMgPSAmY2xrX3JwbV9icmFuY2hfb3BzLAkJCSAgICAgIFwN
Ci0JCQkubmFtZSA9ICNfYWN0aXZlLAkJCQkgICAgICBcDQotCQkJLnBhcmVudF9uYW1lcyA9IChj
b25zdCBjaGFyICpbXSl7ICJjeG9fYm9hcmQiIH0sICAgICAgXA0KLQkJCS5udW1fcGFyZW50cyA9
IDEsCQkJCSAgICAgIFwNCi0JCX0sCQkJCQkJCSAgICAgIFwNCi0JfQ0KLQ0KICNkZWZpbmUgdG9f
Y2xrX3JwbShfaHcpIGNvbnRhaW5lcl9vZihfaHcsIHN0cnVjdCBjbGtfcnBtLCBodykNCiANCiBz
dHJ1Y3QgcnBtX2NjOw0KQEAgLTQ1OCwxMyArNDAyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBj
bGtfb3BzIGNsa19ycG1fb3BzID0gew0KIAkucmVjYWxjX3JhdGUJPSBjbGtfcnBtX3JlY2FsY19y
YXRlLA0KIH07DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIGNsa19ycG1fYnJhbmNo
X29wcyA9IHsNCi0JLnByZXBhcmUJPSBjbGtfcnBtX3ByZXBhcmUsDQotCS51bnByZXBhcmUJPSBj
bGtfcnBtX3VucHJlcGFyZSwNCi0JLnJvdW5kX3JhdGUJPSBjbGtfcnBtX3JvdW5kX3JhdGUsDQot
CS5yZWNhbGNfcmF0ZQk9IGNsa19ycG1fcmVjYWxjX3JhdGUsDQotfTsNCi0NCiAvKiBNU004NjYw
L0FQUTgwNjAgKi8NCiBERUZJTkVfQ0xLX1JQTShtc204NjYwLCBhZmFiX2NsaywgYWZhYl9hX2Ns
aywgUUNPTV9SUE1fQVBQU19GQUJSSUNfQ0xLKTsNCiBERUZJTkVfQ0xLX1JQTShtc204NjYwLCBz
ZmFiX2Nsaywgc2ZhYl9hX2NsaywgUUNPTV9SUE1fU1lTX0ZBQlJJQ19DTEspOw0KLS0gDQoyLjE3
LjENCg0K
