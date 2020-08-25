Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61278250E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 04:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgHYCEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 22:04:49 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:32601 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725781AbgHYCEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 22:04:47 -0400
X-UUID: 2eb7ef2190a543d9aec1941ac9b7cfbc-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7b50htfKegwBuO1CDPzSAHxdaD+p7o4BKhO7e2hNWOo=;
        b=uTsKeUpTe5HI4RVEfiF8X11jMQDFrMvnDNS1pmDo9EKflMTOH79uUkZ9KObe1orvpcNNTGE0g7IvXVu2phrOxQQHMDXK24yI9+ZMu1ZFiWEaXr/pSs6vi4027lTfV3XpUKfzKBBR4p1eIWz8rhxngs4DG+fvW6fTfe3OKhZ3cW8=;
X-UUID: 2eb7ef2190a543d9aec1941ac9b7cfbc-20200825
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 2000139337; Tue, 25 Aug 2020 10:04:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:40 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
CC:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Bharat Gooty <bharat.gooty@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 4/6] phy: phy-qcom-apq8064-sata: convert to readl_relaxed_poll_timeout()
Date:   Tue, 25 Aug 2020 10:03:05 +0800
Message-ID: <1598320987-25518-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A5EAD1C8FD2955FE87DADAE9B2E41C9C6E073672D0E9B9753269DF5A26EC82042000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VXNlIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KCkgdG8gc2ltcGxpZnkgY29kZSwgcmVuYW1l
IGxvY2FsIGZ1bmN0aW9uDQpyZWFkX3BvbGxfdGltZW91dCgpIGFzIHBvbGxfdGltZW91dCgpIHRv
IGF2b2lkIHJlcGVhdGVkIGRlZmluaXRpb24NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVu
IDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9waHkvcXVhbGNvbW0v
cGh5LXFjb20tYXBxODA2NC1zYXRhLmMgfCAyMSArKysrKysrKy0tLS0tLS0tLS0tLS0NCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGh5L3F1YWxjb21tL3BoeS1xY29tLWFwcTgwNjQtc2F0YS5jIGIvZHJpdmVy
cy9waHkvcXVhbGNvbW0vcGh5LXFjb20tYXBxODA2NC1zYXRhLmMNCmluZGV4IGZlYmUwYWUuLmNl
OTFhZTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BoeS9xdWFsY29tbS9waHktcWNvbS1hcHE4MDY0
LXNhdGEuYw0KKysrIGIvZHJpdmVycy9waHkvcXVhbGNvbW0vcGh5LXFjb20tYXBxODA2NC1zYXRh
LmMNCkBAIC00LDYgKzQsNyBAQA0KICAqLw0KIA0KICNpbmNsdWRlIDxsaW51eC9pby5oPg0KKyNp
bmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KQEAgLTcyLDE4
ICs3MywxMiBAQCBzdHJ1Y3QgcWNvbV9hcHE4MDY0X3NhdGFfcGh5IHsNCiB9Ow0KIA0KIC8qIEhl
bHBlciBmdW5jdGlvbiB0byBkbyBwb2xsIGFuZCB0aW1lb3V0ICovDQotc3RhdGljIGludCByZWFk
X3BvbGxfdGltZW91dCh2b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBtYXNrKQ0KK3N0YXRpYyBpbnQg
cG9sbF90aW1lb3V0KHZvaWQgX19pb21lbSAqYWRkciwgdTMyIG1hc2spDQogew0KLQl1bnNpZ25l
ZCBsb25nIHRpbWVvdXQgPSBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcyhUSU1FT1VUX01TKTsN
CisJdTMyIHZhbDsNCiANCi0JZG8gew0KLQkJaWYgKHJlYWRsX3JlbGF4ZWQoYWRkcikgJiBtYXNr
KQ0KLQkJCXJldHVybiAwOw0KLQ0KLQkJdXNsZWVwX3JhbmdlKERFTEFZX0lOVEVSVkFMX1VTLCBE
RUxBWV9JTlRFUlZBTF9VUyArIDUwKTsNCi0JfSB3aGlsZSAoIXRpbWVfYWZ0ZXIoamlmZmllcywg
dGltZW91dCkpOw0KLQ0KLQlyZXR1cm4gKHJlYWRsX3JlbGF4ZWQoYWRkcikgJiBtYXNrKSA/IDAg
OiAtRVRJTUVET1VUOw0KKwlyZXR1cm4gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQoYWRkciwg
dmFsLCAodmFsICYgbWFzayksDQorCQkJCQlERUxBWV9JTlRFUlZBTF9VUywgVElNRU9VVF9NUyAq
IDEwMDApOw0KIH0NCiANCiBzdGF0aWMgaW50IHFjb21fYXBxODA2NF9zYXRhX3BoeV9pbml0KHN0
cnVjdCBwaHkgKmdlbmVyaWNfcGh5KQ0KQEAgLTEzNywyMSArMTMyLDIxIEBAIHN0YXRpYyBpbnQg
cWNvbV9hcHE4MDY0X3NhdGFfcGh5X2luaXQoc3RydWN0IHBoeSAqZ2VuZXJpY19waHkpDQogCXdy
aXRlbF9yZWxheGVkKDB4MDUsIGJhc2UgKyBVTklQSFlfUExMX0xLREVUX0NGRzIpOw0KIA0KIAkv
KiBQTEwgTG9jayB3YWl0ICovDQotCXJldCA9IHJlYWRfcG9sbF90aW1lb3V0KGJhc2UgKyBVTklQ
SFlfUExMX1NUQVRVUywgVU5JUEhZX1BMTF9MT0NLKTsNCisJcmV0ID0gcG9sbF90aW1lb3V0KGJh
c2UgKyBVTklQSFlfUExMX1NUQVRVUywgVU5JUEhZX1BMTF9MT0NLKTsNCiAJaWYgKHJldCkgew0K
IAkJZGV2X2VycihwaHktPmRldiwgInBvbGwgdGltZW91dCBVTklQSFlfUExMX1NUQVRVU1xuIik7
DQogCQlyZXR1cm4gcmV0Ow0KIAl9DQogDQogCS8qIFRYIENhbGlicmF0aW9uICovDQotCXJldCA9
IHJlYWRfcG9sbF90aW1lb3V0KGJhc2UgKyBTQVRBX1BIWV9UWF9JTUNBTF9TVEFULCBTQVRBX1BI
WV9UWF9DQUwpOw0KKwlyZXQgPSBwb2xsX3RpbWVvdXQoYmFzZSArIFNBVEFfUEhZX1RYX0lNQ0FM
X1NUQVQsIFNBVEFfUEhZX1RYX0NBTCk7DQogCWlmIChyZXQpIHsNCiAJCWRldl9lcnIocGh5LT5k
ZXYsICJwb2xsIHRpbWVvdXQgU0FUQV9QSFlfVFhfSU1DQUxfU1RBVFxuIik7DQogCQlyZXR1cm4g
cmV0Ow0KIAl9DQogDQogCS8qIFJYIENhbGlicmF0aW9uICovDQotCXJldCA9IHJlYWRfcG9sbF90
aW1lb3V0KGJhc2UgKyBTQVRBX1BIWV9SWF9JTUNBTF9TVEFULCBTQVRBX1BIWV9SWF9DQUwpOw0K
KwlyZXQgPSBwb2xsX3RpbWVvdXQoYmFzZSArIFNBVEFfUEhZX1JYX0lNQ0FMX1NUQVQsIFNBVEFf
UEhZX1JYX0NBTCk7DQogCWlmIChyZXQpIHsNCiAJCWRldl9lcnIocGh5LT5kZXYsICJwb2xsIHRp
bWVvdXQgU0FUQV9QSFlfUlhfSU1DQUxfU1RBVFxuIik7DQogCQlyZXR1cm4gcmV0Ow0KLS0gDQox
LjkuMQ0K

