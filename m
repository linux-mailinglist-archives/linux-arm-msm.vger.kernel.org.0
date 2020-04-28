Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E0B1BBD9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 14:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgD1M3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 08:29:45 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:55674 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726684AbgD1M3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 08:29:44 -0400
X-UUID: 96c3c8ec85d2473d86a4d2a61570b222-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=x82FlLAEXLzeRSBYPB5msRYu1TSUP46MR6Ng6NKD4bQ=;
        b=fuyPALxLcsRMw4yIfqMLHTANQi4nyKdZ1STTuHSyeLWdWnVqONsKGrIVq6QpkqMqJU65PXD/EUPehAcOK9ekYY6E58eLcXKb9xWi/p1fz/ZjC8UP98uYNqcSU7xmklNeZld12sJCec2ZoIiCxQyTyyWzjtbz4ETr8R5GkH6U8vs=;
X-UUID: 96c3c8ec85d2473d86a4d2a61570b222-20200428
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.mao@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 215005333; Tue, 28 Apr 2020 20:29:36 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 28 Apr
 2020 20:29:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 20:29:32 +0800
Message-ID: <1588076927.730.2.camel@mhfsdcap03>
Subject: Re: [PATCH v5 3/5] mmc: mediatek: refine msdc timeout api
From:   "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>
CC:     <mirq-linux@rere.qmqm.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
        "Al Cooper" <alcooperx@gmail.com>,
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
        "Linus Walleij" <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <kernel-team@android.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 28 Apr 2020 20:28:47 +0800
In-Reply-To: <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
         <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E01AAD61AB5BB27155A77063CBEA1604E31F717DA3D8618061EF502A15332D7C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gVHVlLCAyMDIwLTA0LTI4IGF0IDA3OjU2ICswODAwLCBDaHVuLUh1bmcgV3Ugd3JvdGU6DQo+
IEV4dHJhY3QgbXNkYyB0aW1lb3V0IGFwaSBjb21tb24gcGFydCB0byBoYXZlDQo+IGJldHRlciBj
b2RlIGFyY2hpdGVjdHVyZSBhbmQgYXZvaWQgcmVkdW5kZW50DQpwbGVhc2UgY29ycmVjdCB0aGUg
d29yZCAicmVkdW5kYW50IiBpbiBuZXh0IHZlcnNpb24NCj4gY29kZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCkFja2VkLWJ5
OiBZb25nIE1hbyA8eW9uZy5tYW9AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbW1j
L2hvc3QvbXRrLXNkLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMgYi9kcml2ZXJzL21tYy9ob3N0
L210ay1zZC5jDQo+IGluZGV4IDc3MjZkY2YuLmEyMzI4ZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMNCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYw0K
PiBAQCAtNjk5LDIxICs2OTksMjEgQEAgc3RhdGljIHZvaWQgbXNkY191bnByZXBhcmVfZGF0YShz
dHJ1Y3QgbXNkY19ob3N0ICpob3N0LCBzdHJ1Y3QgbW1jX3JlcXVlc3QgKm1ycSkNCj4gIAl9DQo+
ICB9DQo+ICANCj4gLS8qIGNsb2NrIGNvbnRyb2wgcHJpbWl0aXZlcyAqLw0KPiAtc3RhdGljIHZv
aWQgbXNkY19zZXRfdGltZW91dChzdHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1MzIgbnMsIHUzMiBj
bGtzKQ0KPiArc3RhdGljIHU2NCBtc2RjX3RpbWVvdXRfY2FsKHN0cnVjdCBtc2RjX2hvc3QgKmhv
c3QsIHU2NCBucywgdTY0IGNsa3MpDQo+ICB7DQo+IC0JdTMyIHRpbWVvdXQsIGNsa19uczsNCj4g
Kwl1NjQgdGltZW91dCwgY2xrX25zOw0KPiAgCXUzMiBtb2RlID0gMDsNCj4gIA0KPiAtCWhvc3Qt
PnRpbWVvdXRfbnMgPSBuczsNCj4gLQlob3N0LT50aW1lb3V0X2Nsa3MgPSBjbGtzOw0KPiAgCWlm
IChob3N0LT5tbWMtPmFjdHVhbF9jbG9jayA9PSAwKSB7DQo+ICAJCXRpbWVvdXQgPSAwOw0KPiAg
CX0gZWxzZSB7DQo+IC0JCWNsa19ucyAgPSAxMDAwMDAwMDAwVUwgLyBob3N0LT5tbWMtPmFjdHVh
bF9jbG9jazsNCj4gLQkJdGltZW91dCA9IChucyArIGNsa19ucyAtIDEpIC8gY2xrX25zICsgY2xr
czsNCj4gKwkJY2xrX25zICA9IDEwMDAwMDAwMDBVTEw7DQo+ICsJCWRvX2RpdihjbGtfbnMsIGhv
c3QtPm1tYy0+YWN0dWFsX2Nsb2NrKTsNCj4gKwkJdGltZW91dCA9IG5zICsgY2xrX25zIC0gMTsN
Cj4gKwkJZG9fZGl2KHRpbWVvdXQsIGNsa19ucyk7DQo+ICsJCXRpbWVvdXQgKz0gY2xrczsNCj4g
IAkJLyogaW4gMTA0ODU3NiBzY2xrIGN5Y2xlIHVuaXQgKi8NCj4gLQkJdGltZW91dCA9ICh0aW1l
b3V0ICsgKDB4MSA8PCAyMCkgLSAxKSA+PiAyMDsNCj4gKwkJdGltZW91dCA9IERJVl9ST1VORF9V
UCh0aW1lb3V0LCAoMHgxIDw8IDIwKSk7DQo+ICAJCWlmIChob3N0LT5kZXZfY29tcC0+Y2xrX2Rp
dl9iaXRzID09IDgpDQo+ICAJCQlzZHJfZ2V0X2ZpZWxkKGhvc3QtPmJhc2UgKyBNU0RDX0NGRywN
Cj4gIAkJCQkgICAgICBNU0RDX0NGR19DS01PRCwgJm1vZGUpOw0KPiBAQCAtNzIzLDkgKzcyMywy
MSBAQCBzdGF0aWMgdm9pZCBtc2RjX3NldF90aW1lb3V0KHN0cnVjdCBtc2RjX2hvc3QgKmhvc3Qs
IHUzMiBucywgdTMyIGNsa3MpDQo+ICAJCS8qRERSIG1vZGUgd2lsbCBkb3VibGUgdGhlIGNsayBj
eWNsZXMgZm9yIGRhdGEgdGltZW91dCAqLw0KPiAgCQl0aW1lb3V0ID0gbW9kZSA+PSAyID8gdGlt
ZW91dCAqIDIgOiB0aW1lb3V0Ow0KPiAgCQl0aW1lb3V0ID0gdGltZW91dCA+IDEgPyB0aW1lb3V0
IC0gMSA6IDA7DQo+IC0JCXRpbWVvdXQgPSB0aW1lb3V0ID4gMjU1ID8gMjU1IDogdGltZW91dDsN
Cj4gIAl9DQo+IC0Jc2RyX3NldF9maWVsZChob3N0LT5iYXNlICsgU0RDX0NGRywgU0RDX0NGR19E
VE9DLCB0aW1lb3V0KTsNCj4gKwlyZXR1cm4gdGltZW91dDsNCj4gK30NCj4gKw0KPiArLyogY2xv
Y2sgY29udHJvbCBwcmltaXRpdmVzICovDQo+ICtzdGF0aWMgdm9pZCBtc2RjX3NldF90aW1lb3V0
KHN0cnVjdCBtc2RjX2hvc3QgKmhvc3QsIHU2NCBucywgdTY0IGNsa3MpDQo+ICt7DQo+ICsJdTY0
IHRpbWVvdXQ7DQo+ICsNCj4gKwlob3N0LT50aW1lb3V0X25zID0gbnM7DQo+ICsJaG9zdC0+dGlt
ZW91dF9jbGtzID0gY2xrczsNCj4gKw0KPiArCXRpbWVvdXQgPSBtc2RjX3RpbWVvdXRfY2FsKGhv
c3QsIG5zLCBjbGtzKTsNCj4gKwlzZHJfc2V0X2ZpZWxkKGhvc3QtPmJhc2UgKyBTRENfQ0ZHLCBT
RENfQ0ZHX0RUT0MsDQo+ICsJCSAgICAgICh1MzIpKHRpbWVvdXQgPiAyNTUgPyAyNTUgOiB0aW1l
b3V0KSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIG1zZGNfZ2F0ZV9jbG9jayhzdHJ1Y3Qg
bXNkY19ob3N0ICpob3N0KQ0KDQo=

