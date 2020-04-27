Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3971BB258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgD0X5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:57:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:64043 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726508AbgD0X5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:57:24 -0400
X-UUID: 178f777f09244bc28e223dc678b09c1f-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ka1VpXu+0E+Smr9pkPy8HfDlYfiuvLYEfO8kgaZYtQM=;
        b=mgUtCl3BylwJRMmKRwok4zYhDEqkV1+Ink18Ev18ic75DJdJVo1sz3p9p9fGDf0mnCKfu6gTJUntIloujK2YkZKppgCg5qjpsxjN0lzc2wcjCbeYZW4Ja1+2gOHVLcianuAt/0YSLXI8eRxKC8xwiVvv9wI/CiceGG4cxkDifnc=;
X-UUID: 178f777f09244bc28e223dc678b09c1f-20200428
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chun-hung.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 36155996; Tue, 28 Apr 2020 07:57:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 07:57:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 07:57:13 +0800
From:   Chun-Hung Wu <chun-hung.wu@mediatek.com>
To:     <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        Yong Mao <yong.mao@mediatek.com>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v5 4/5] mmc: mediatek: command queue support
Date:   Tue, 28 Apr 2020 07:56:07 +0800
Message-ID: <1588031768-23677-5-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

U3VwcG9ydCBjb21tYW5kIHF1ZXVlIGZvciBtdDY3NzkgcGxhdGZvcm0uDQphLiBBZGQgbXNkY19z
ZXRfYnVzeV90aW1lb3V0KCkgdG8gY2FsY3VsYXRlIGVtbWMgd3JpdGUgdGltZW91dA0KYi4gQ29u
bmVjdCBtdGsgbXNkYyBkcml2ZXIgdG8gY3FoY2kgZHJpdmVyIHRocm91Z2gNCiAgIGhvc3QtPmNx
X2hvc3QtPm9wcyA9ICZtc2RjX2NtZHFfb3BzOw0KYy4gbXNkY19jbWRxX2lycSgpIHdpbGwgbGlu
ayB1cCB3aXRoIGNxY2hpX2lycSgpLiBCZXNpZGVzLCBpdCBwcm92aWRlcw0KICAgbW9yZSBpcnEg
ZXJyb3IgbWVzc2FnZXMgbGlrZSBSU1BDUkNFUlIvQ01EVE8vREFUQUNSQ0VSUi9EQVRUTU8uDQpk
LiBVc2UgdGhlIG9wdGlvbnMgYmVsb3cgdG8gc2VwYXJhdGUgc3VwcG9ydCBmb3IgQ1FIQ0kgb3Ig
bm90LCBiZWNhdXNlDQogICBzb21lIG9mIG91ciBwbGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IENR
SENJIGhlbmNlIG5vIGtlcm5lbCBvcHRpb246DQogICBDT05GSUdfTU1DX0NRSENJLg0KICAgI2lm
IElTX0VOQUJMRUQoQ09ORklHX01NQ19DUUhDSSkNCiAgIFhYWCAvL1N1cHBvcnQgQ1FIQ0kNCiAg
ICNlbHNlDQogICBYWFggLy9Ob3Qgc3VwcG9ydCBDUUhDSQ0KICAgI2VuZGlmDQoNClNpZ25lZC1v
ZmYtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMgfCAxMTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZlcnMvbW1jL2hv
c3QvbXRrLXNkLmMNCmluZGV4IGEyMzI4ZmIuLjg1MTY4ODggMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L21tYy9ob3N0L210ay1zZC5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQpAQCAt
MzEsNiArMzEsOCBAQA0KICNpbmNsdWRlIDxsaW51eC9tbWMvc2Rpby5oPg0KICNpbmNsdWRlIDxs
aW51eC9tbWMvc2xvdC1ncGlvLmg+DQogDQorI2luY2x1ZGUgImNxaGNpLmgiDQorDQogI2RlZmlu
ZSBNQVhfQkRfTlVNICAgICAgICAgIDEwMjQNCiANCiAvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8NCkBA
IC0xNTEsNiArMTUzLDcgQEANCiAjZGVmaW5lIE1TRENfSU5UX0RNQV9CRENTRVJSICAgICgweDEg
PDwgMTcpCS8qIFcxQyAqLw0KICNkZWZpbmUgTVNEQ19JTlRfRE1BX0dQRENTRVJSICAgKDB4MSA8
PCAxOCkJLyogVzFDICovDQogI2RlZmluZSBNU0RDX0lOVF9ETUFfUFJPVEVDVCAgICAoMHgxIDw8
IDE5KQkvKiBXMUMgKi8NCisjZGVmaW5lIE1TRENfSU5UX0NNRFEgICAgICAgICAgICgweDEgPDwg
MjgpCS8qIFcxQyAqLw0KIA0KIC8qIE1TRENfSU5URU4gbWFzayAqLw0KICNkZWZpbmUgTVNEQ19J
TlRFTl9NTUNJUlEgICAgICAgKDB4MSA8PCAwKQkvKiBSVyAqLw0KQEAgLTE4MSw2ICsxODQsNyBA
QA0KIC8qIFNEQ19DRkcgbWFzayAqLw0KICNkZWZpbmUgU0RDX0NGR19TRElPSU5UV0tVUCAgICAg
KDB4MSA8PCAwKQkvKiBSVyAqLw0KICNkZWZpbmUgU0RDX0NGR19JTlNXS1VQICAgICAgICAgKDB4
MSA8PCAxKQkvKiBSVyAqLw0KKyNkZWZpbmUgU0RDX0NGR19XUkRUT0MgICAgICAgICAgKDB4MWZm
ZiAgPDwgMikgIC8qIFJXICovDQogI2RlZmluZSBTRENfQ0ZHX0JVU1dJRFRIICAgICAgICAoMHgz
IDw8IDE2KQkvKiBSVyAqLw0KICNkZWZpbmUgU0RDX0NGR19TRElPICAgICAgICAgICAgKDB4MSA8
PCAxOSkJLyogUlcgKi8NCiAjZGVmaW5lIFNEQ19DRkdfU0RJT0lERSAgICAgICAgICgweDEgPDwg
MjApCS8qIFJXICovDQpAQCAtMjI5LDYgKzIzMyw3IEBADQogI2RlZmluZSBNU0RDX1BBVENIX0JJ
VF9ERUNSQ1RNTyAgICgweDEgPDwgMzApCS8qIFJXICovDQogDQogI2RlZmluZSBNU0RDX1BBVENI
X0JJVDFfQ01EVEEgICAgICgweDcgPDwgMykgICAgLyogUlcgKi8NCisjZGVmaW5lIE1TRENfUEIx
X0JVU1lfQ0hFQ0tfU0VMICAgKDB4MSA8PCA3KSAgICAvKiBSVyAqLw0KICNkZWZpbmUgTVNEQ19Q
QVRDSF9CSVQxX1NUT1BfRExZICAoMHhmIDw8IDgpICAgIC8qIFJXICovDQogDQogI2RlZmluZSBN
U0RDX1BBVENIX0JJVDJfQ0ZHUkVTUCAgICgweDEgPDwgMTUpICAgLyogUlcgKi8NCkBAIC00MzIs
NiArNDM3LDcgQEAgc3RydWN0IG1zZGNfaG9zdCB7DQogCXN0cnVjdCBtc2RjX3NhdmVfcGFyYSBz
YXZlX3BhcmE7IC8qIHVzZWQgd2hlbiBnYXRlIEhDTEsgKi8NCiAJc3RydWN0IG1zZGNfdHVuZV9w
YXJhIGRlZl90dW5lX3BhcmE7IC8qIGRlZmF1bHQgdHVuZSBzZXR0aW5nICovDQogCXN0cnVjdCBt
c2RjX3R1bmVfcGFyYSBzYXZlZF90dW5lX3BhcmE7IC8qIHR1bmUgcmVzdWx0IG9mIENNRDIxL0NN
RDE5ICovDQorCXN0cnVjdCBjcWhjaV9ob3N0ICpjcV9ob3N0Ow0KIH07DQogDQogc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfbW1jX2NvbXBhdGlibGUgbXQ4MTM1X2NvbXBhdCA9IHsNCkBAIC01Mjgs
NiArNTM0LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tY19jb21wYXRpYmxlIG10NzYy
MF9jb21wYXQgPSB7DQogCS51c2VfaW50ZXJuYWxfY2QgPSB0cnVlLA0KIH07DQogDQorc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfbW1jX2NvbXBhdGlibGUgbXQ2Nzc5X2NvbXBhdCA9IHsNCisJLmNs
a19kaXZfYml0cyA9IDEyLA0KKwkuaHM0MDBfdHVuZSA9IGZhbHNlLA0KKwkucGFkX3R1bmVfcmVn
ID0gTVNEQ19QQURfVFVORTAsDQorCS5hc3luY19maWZvID0gdHJ1ZSwNCisJLmRhdGFfdHVuZSA9
IHRydWUsDQorCS5idXN5X2NoZWNrID0gdHJ1ZSwNCisJLnN0b3BfY2xrX2ZpeCA9IHRydWUsDQor
CS5lbmhhbmNlX3J4ID0gdHJ1ZSwNCisJLnN1cHBvcnRfNjRnID0gdHJ1ZSwNCit9Ow0KKw0KIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1zZGNfb2ZfaWRzW10gPSB7DQogCXsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTM1LW1tYyIsIC5kYXRhID0gJm10ODEzNV9jb21wYXR9
LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1tbWMiLCAuZGF0YSA9ICZtdDgx
NzNfY29tcGF0fSwNCkBAIC01MzcsNiArNTU1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbXNkY19vZl9pZHNbXSA9IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDc2MjItbW1jIiwgLmRhdGEgPSAmbXQ3NjIyX2NvbXBhdH0sDQogCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4NTE2LW1tYyIsIC5kYXRhID0gJm10ODUxNl9jb21wYXR9LA0KIAl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMC1tbWMiLCAuZGF0YSA9ICZtdDc2MjBfY29tcGF0fSwN
CisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NzktbW1jIiwgLmRhdGEgPSAmbXQ2Nzc5
X2NvbXBhdH0sDQogCXt9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtc2RjX29mX2lk
cyk7DQpAQCAtNzQwLDYgKzc1OSwxNSBAQCBzdGF0aWMgdm9pZCBtc2RjX3NldF90aW1lb3V0KHN0
cnVjdCBtc2RjX2hvc3QgKmhvc3QsIHU2NCBucywgdTY0IGNsa3MpDQogCQkgICAgICAodTMyKSh0
aW1lb3V0ID4gMjU1ID8gMjU1IDogdGltZW91dCkpOw0KIH0NCiANCitzdGF0aWMgdm9pZCBtc2Rj
X3NldF9idXN5X3RpbWVvdXQoc3RydWN0IG1zZGNfaG9zdCAqaG9zdCwgdTY0IG5zLCB1NjQgY2xr
cykNCit7DQorCXU2NCB0aW1lb3V0Ow0KKw0KKwl0aW1lb3V0ID0gbXNkY190aW1lb3V0X2NhbCho
b3N0LCBucywgY2xrcyk7DQorCXNkcl9zZXRfZmllbGQoaG9zdC0+YmFzZSArIFNEQ19DRkcsIFNE
Q19DRkdfV1JEVE9DLA0KKwkJICAgICAgKHUzMikodGltZW91dCA+IDgxOTEgPyA4MTkxIDogdGlt
ZW91dCkpOw0KK30NCisNCiBzdGF0aWMgdm9pZCBtc2RjX2dhdGVfY2xvY2soc3RydWN0IG1zZGNf
aG9zdCAqaG9zdCkNCiB7DQogCWNsa19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5zcmNfY2xrX2Nn
KTsNCkBAIC0xNDI2LDYgKzE0NTQsMzYgQEAgc3RhdGljIHZvaWQgbXNkY19lbmFibGVfc2Rpb19p
cnEoc3RydWN0IG1tY19ob3N0ICptbWMsIGludCBlbmIpDQogCQlwbV9ydW50aW1lX3B1dF9ub2lk
bGUoaG9zdC0+ZGV2KTsNCiB9DQogDQorI2lmIElTX0VOQUJMRUQoQ09ORklHX01NQ19DUUhDSSkN
CitzdGF0aWMgaXJxcmV0dXJuX3QgbXNkY19jbWRxX2lycShzdHJ1Y3QgbXNkY19ob3N0ICpob3N0
LCB1MzIgaW50c3RzKQ0KK3sNCisJaW50IGNtZF9lcnIgPSAwLCBkYXRfZXJyID0gMDsNCisNCisJ
aWYgKGludHN0cyAmIE1TRENfSU5UX1JTUENSQ0VSUikgew0KKwkJY21kX2VyciA9ICh1bnNpZ25l
ZCBpbnQpLUVJTFNFUTsNCisJCWRldl9lcnIoaG9zdC0+ZGV2LCAiJXM6IENNRCBDUkMgRVJSIiwg
X19mdW5jX18pOw0KKwl9IGVsc2UgaWYgKGludHN0cyAmIE1TRENfSU5UX0NNRFRNTykgew0KKwkJ
Y21kX2VyciA9ICh1bnNpZ25lZCBpbnQpLUVUSU1FRE9VVDsNCisJCWRldl9lcnIoaG9zdC0+ZGV2
LCAiJXM6IENNRCBUSU1FT1VUIEVSUiIsIF9fZnVuY19fKTsNCisJfQ0KKw0KKwlpZiAoaW50c3Rz
ICYgTVNEQ19JTlRfREFUQ1JDRVJSKSB7DQorCQlkYXRfZXJyID0gKHVuc2lnbmVkIGludCktRUlM
U0VROw0KKwkJZGV2X2Vycihob3N0LT5kZXYsICIlczogREFUQSBDUkMgRVJSIiwgX19mdW5jX18p
Ow0KKwl9IGVsc2UgaWYgKGludHN0cyAmIE1TRENfSU5UX0RBVFRNTykgew0KKwkJZGF0X2VyciA9
ICh1bnNpZ25lZCBpbnQpLUVUSU1FRE9VVDsNCisJCWRldl9lcnIoaG9zdC0+ZGV2LCAiJXM6IERB
VEEgVElNRU9VVCBFUlIiLCBfX2Z1bmNfXyk7DQorCX0NCisNCisJaWYgKGNtZF9lcnIgfHwgZGF0
X2Vycikgew0KKwkJZGV2X2Vycihob3N0LT5kZXYsICJjbWRfZXJyID0gJWQsIGRhdF9lcnIgPSVk
LCBpbnRzdHMgPSAweCV4IiwNCisJCQljbWRfZXJyLCBkYXRfZXJyLCBpbnRzdHMpOw0KKwl9DQor
DQorCXJldHVybiBjcWhjaV9pcnEoaG9zdC0+bW1jLCAwLCBjbWRfZXJyLCBkYXRfZXJyKTsNCit9
DQorI2VuZGlmDQorDQogc3RhdGljIGlycXJldHVybl90IG1zZGNfaXJxKGludCBpcnEsIHZvaWQg
KmRldl9pZCkNCiB7DQogCXN0cnVjdCBtc2RjX2hvc3QgKmhvc3QgPSAoc3RydWN0IG1zZGNfaG9z
dCAqKSBkZXZfaWQ7DQpAQCAtMTQ2Miw2ICsxNTIwLDE2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBt
c2RjX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQogCQlpZiAoIShldmVudHMgJiAoZXZlbnRf
bWFzayAmIH5NU0RDX0lOVF9TRElPSVJRKSkpDQogCQkJYnJlYWs7DQogDQorI2lmIElTX0VOQUJM
RUQoQ09ORklHX01NQ19DUUhDSSkNCisJCWlmICgoaG9zdC0+bW1jLT5jYXBzMiAmIE1NQ19DQVAy
X0NRRSkgJiYNCisJCSAgICAoZXZlbnRzICYgTVNEQ19JTlRfQ01EUSkpIHsNCisJCQltc2RjX2Nt
ZHFfaXJxKGhvc3QsIGV2ZW50cyk7DQorCQkJLyogY2xlYXIgaW50ZXJydXB0cyAqLw0KKwkJCXdy
aXRlbChldmVudHMsIGhvc3QtPmJhc2UgKyBNU0RDX0lOVCk7DQorCQkJcmV0dXJuIElSUV9IQU5E
TEVEOw0KKwkJfQ0KKyNlbmRpZg0KKw0KIAkJaWYgKCFtcnEpIHsNCiAJCQlkZXZfZXJyKGhvc3Qt
PmRldiwNCiAJCQkJIiVzOiBNUlE9TlVMTDsgZXZlbnRzPSUwOFg7IGV2ZW50X21hc2s9JTA4WFxu
IiwNCkBAIC0yMTQ2LDYgKzIyMTQsMzYgQEAgc3RhdGljIGludCBtc2RjX2dldF9jZChzdHJ1Y3Qg
bW1jX2hvc3QgKm1tYykNCiAJCXJldHVybiAhdmFsOw0KIH0NCiANCitzdGF0aWMgdm9pZCBtc2Rj
X2NxZV9lbmFibGUoc3RydWN0IG1tY19ob3N0ICptbWMpDQorew0KKwlzdHJ1Y3QgbXNkY19ob3N0
ICpob3N0ID0gbW1jX3ByaXYobW1jKTsNCisNCisJLyogZW5hYmxlIGNtZHEgaXJxICovDQorCXdy
aXRlbChNU0RDX0lOVF9DTURRLCBob3N0LT5iYXNlICsgTVNEQ19JTlRFTik7DQorCS8qIGVuYWJs
ZSBidXN5IGNoZWNrICovDQorCXNkcl9zZXRfYml0cyhob3N0LT5iYXNlICsgTVNEQ19QQVRDSF9C
SVQxLCBNU0RDX1BCMV9CVVNZX0NIRUNLX1NFTCk7DQorCS8qIGRlZmF1bHQgd3JpdGUgZGF0YSAv
IGJ1c3kgdGltZW91dCAyMHMgKi8NCisJbXNkY19zZXRfYnVzeV90aW1lb3V0KGhvc3QsIDIwICog
MTAwMDAwMDAwMFVMTCwgMCk7DQorCS8qIGRlZmF1bHQgcmVhZCBkYXRhIHRpbWVvdXQgMXMgKi8N
CisJbXNkY19zZXRfdGltZW91dChob3N0LCAxMDAwMDAwMDAwVUxMLCAwKTsNCit9DQorDQordm9p
ZCBtc2RjX2NxZV9kaXNhYmxlKHN0cnVjdCBtbWNfaG9zdCAqbW1jLCBib29sIHJlY292ZXJ5KQ0K
K3sNCisJc3RydWN0IG1zZGNfaG9zdCAqaG9zdCA9IG1tY19wcml2KG1tYyk7DQorDQorCS8qIGRp
c2FibGUgY21kcSBpcnEgKi8NCisJc2RyX2Nscl9iaXRzKGhvc3QtPmJhc2UgKyBNU0RDX0lOVEVO
LCBNU0RDX0lOVF9DTURRKTsNCisJLyogZGlzYWJsZSBidXN5IGNoZWNrICovDQorCXNkcl9jbHJf
Yml0cyhob3N0LT5iYXNlICsgTVNEQ19QQVRDSF9CSVQxLCBNU0RDX1BCMV9CVVNZX0NIRUNLX1NF
TCk7DQorDQorCWlmIChyZWNvdmVyeSkgew0KKwkJc2RyX3NldF9maWVsZChob3N0LT5iYXNlICsg
TVNEQ19ETUFfQ1RSTCwNCisJCQkgICAgICBNU0RDX0RNQV9DVFJMX1NUT1AsIDEpOw0KKwkJbXNk
Y19yZXNldF9odyhob3N0KTsNCisJfQ0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1tY19o
b3N0X29wcyBtdF9tc2RjX29wcyA9IHsNCiAJLnBvc3RfcmVxID0gbXNkY19wb3N0X3JlcSwNCiAJ
LnByZV9yZXEgPSBtc2RjX3ByZV9yZXEsDQpAQCAtMjE2Miw2ICsyMjYwLDExIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbW1jX2hvc3Rfb3BzIG10X21zZGNfb3BzID0gew0KIAkuaHdfcmVzZXQgPSBt
c2RjX2h3X3Jlc2V0LA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBjcWhjaV9ob3N0X29w
cyBtc2RjX2NtZHFfb3BzID0gew0KKwkuZW5hYmxlICAgICAgICAgPSBtc2RjX2NxZV9lbmFibGUs
DQorCS5kaXNhYmxlICAgICAgICA9IG1zZGNfY3FlX2Rpc2FibGUsDQorfTsNCisNCiBzdGF0aWMg
dm9pZCBtc2RjX29mX3Byb3BlcnR5X3BhcnNlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
DQogCQkJCSAgIHN0cnVjdCBtc2RjX2hvc3QgKmhvc3QpDQogew0KQEAgLTIzMTIsNiArMjQxNSwy
MiBAQCBzdGF0aWMgaW50IG1zZGNfZHJ2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQogCQlob3N0LT5kbWFfbWFzayA9IERNQV9CSVRfTUFTSygzMik7DQogCW1tY19kZXYobW1j
KS0+ZG1hX21hc2sgPSAmaG9zdC0+ZG1hX21hc2s7DQogDQorI2lmIElTX0VOQUJMRUQoQ09ORklH
X01NQ19DUUhDSSkNCisJaWYgKG1tYy0+Y2FwczIgJiBNTUNfQ0FQMl9DUUUpIHsNCisJCWhvc3Qt
PmNxX2hvc3QgPSBkZXZtX2t6YWxsb2MoaG9zdC0+bW1jLT5wYXJlbnQsDQorCQkJCQkgICAgIHNp
emVvZigqaG9zdC0+Y3FfaG9zdCksDQorCQkJCQkgICAgIEdGUF9LRVJORUwpOw0KKwkJaG9zdC0+
Y3FfaG9zdC0+Y2FwcyB8PSBDUUhDSV9UQVNLX0RFU0NfU1pfMTI4Ow0KKwkJaG9zdC0+Y3FfaG9z
dC0+bW1pbyA9IGhvc3QtPmJhc2UgKyAweDgwMDsNCisJCWhvc3QtPmNxX2hvc3QtPm9wcyA9ICZt
c2RjX2NtZHFfb3BzOw0KKwkJY3FoY2lfaW5pdChob3N0LT5jcV9ob3N0LCBtbWMsIHRydWUpOw0K
KwkJbW1jLT5tYXhfc2VncyA9IDEyODsNCisJCS8qIGNxaGNpIDE2Yml0IGxlbmd0aCAqLw0KKwkJ
LyogMCBzaXplLCBtZWFucyA2NTUzNiBzbyB3ZSBkb24ndCBoYXZlIHRvIC0xIGhlcmUgKi8NCisJ
CW1tYy0+bWF4X3NlZ19zaXplID0gNjQgKiAxMDI0Ow0KKwl9DQorI2VuZGlmDQorDQogCWhvc3Qt
PnRpbWVvdXRfY2xrcyA9IDMgKiAxMDQ4NTc2Ow0KIAlob3N0LT5kbWEuZ3BkID0gZG1hX2FsbG9j
X2NvaGVyZW50KCZwZGV2LT5kZXYsDQogCQkJCTIgKiBzaXplb2Yoc3RydWN0IG10X2dwZG1hX2Rl
c2MpLA0KLS0gDQoyLjYuNA0K

