Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C93612CBC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 02:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfL3B62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Dec 2019 20:58:28 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:31391 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726343AbfL3B62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Dec 2019 20:58:28 -0500
X-UUID: 5b596ee3d2d14837b6ce8d059778b654-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/lpQkAv3iCwWOkWgJJE5MaCHaqTpfO0sf9t+VBFhKO0=;
        b=GTjlAmp0bUzhzZ0gAq4CejELM4MMdAWNVRWicb93uz0IRUHzH073haBzaUpl//g5fxEa2dj1cjoWyuI5HBsDgCqp26l/bZNJ75FBrDDOTBbo3qPy3NnkMs1Y7JAWjeW0pCKN1FiiFXdPhWq1oxG9zVWIXCoTiFK7kpeAHjtlTQc=;
X-UUID: 5b596ee3d2d14837b6ce8d059778b654-20191230
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1975550861; Mon, 30 Dec 2019 09:58:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 09:57:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 09:58:42 +0800
Message-ID: <1577671100.8160.0.camel@mtksdaap41>
Subject: Re: [PATCH 04/13] mailbox: mediatek: cmdq: convert to
 devm_platform_ioremap_resource
From:   CK Hu <ck.hu@mediatek.com>
To:     Yangtao Li <tiny.windzz@gmail.com>
CC:     <jassisinghbrar@gmail.com>, <nsaenzjulienne@suse.de>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <lftan@altera.com>, <matthias.bgg@gmail.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <nios2-dev@lists.rocketboards.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-tegra@vger.kernel.org>
Date:   Mon, 30 Dec 2019 09:58:20 +0800
In-Reply-To: <20191228183538.26189-4-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
         <20191228183538.26189-4-tiny.windzz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SGksIFlhbmd0YW86DQoNCk9uIFNhdCwgMjAxOS0xMi0yOCBhdCAxODozNSArMDAwMCwgWWFuZ3Rh
byBMaSB3cm90ZToNCj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNp
bXBsaWZ5IGNvZGUuDQo+IA0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDx0aW55LndpbmR6ekBnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDQgKy0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IDlhNmNlOWY1YTdkYi4uN2Y5ZTM0
YjAyMWM4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
DQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAgLTQ1OCw3
ICs0NTgsNiBAQCBzdGF0aWMgc3RydWN0IG1ib3hfY2hhbiAqY21kcV94bGF0ZShzdHJ1Y3QgbWJv
eF9jb250cm9sbGVyICptYm94LA0KPiAgc3RhdGljIGludCBjbWRxX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4gLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gIAlzdHJ1Y3QgY21kcSAqY21kcTsN
Cj4gIAlpbnQgZXJyLCBpOw0KPiAgDQo+IEBAIC00NjYsOCArNDY1LDcgQEAgc3RhdGljIGludCBj
bWRxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJaWYgKCFjbWRxKQ0K
PiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IC0JY21kcS0+YmFzZSA9IGRldm1faW9yZW1h
cF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ICsJY21kcS0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gIAlpZiAoSVNfRVJSKGNtZHEtPmJhc2UpKSB7DQo+
ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGlvcmVtYXAgZ2NlXG4iKTsNCj4gIAkJcmV0dXJu
IFBUUl9FUlIoY21kcS0+YmFzZSk7DQoNCg==

