Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CD12BC086
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 17:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgKUQXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 11:23:20 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:41062 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726365AbgKUQXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 11:23:20 -0500
X-UUID: c9ac944a3fd845ee8b6450e96da9aa93-20201122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VbMi1WMHImE1SxNiZjVKLJQZc4OmqG02VCrT3cQlEEc=;
        b=j9twDA628JpFJemsxszvHinXPFQtcKd8dCRj4yMbf2mjG4iKNXWn/bk5WBHXJfa1+nk7AwNMZHF6rTGApHkT3S0czrbGNzs3CBuiIf0WOTxPkYtAov2MM2xONFB5RR4wWDgerN3AwkssMjvYxksBcerLRO0cUOsqdlLKSW+qv/0=;
X-UUID: c9ac944a3fd845ee8b6450e96da9aa93-20201122
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1844964682; Sun, 22 Nov 2020 00:23:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Nov 2020 00:23:05 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 22 Nov 2020 00:23:05 +0800
Message-ID: <1605975787.10232.0.camel@mtkswgap22>
Subject: Re: [PATCH] scsi: ufs: Adjust logic in common ADAPT helper
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Date:   Sun, 22 Nov 2020 00:23:07 +0800
In-Reply-To: <20201121044810.507288-1-bjorn.andersson@linaro.org>
References: <20201121044810.507288-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5B95A92AAB672D92A148BD01F63A8CC1340096EC2D4807E5D0B315B5ED6BDC822000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gRnJpLCAyMDIwLTExLTIwIGF0IDIwOjQ4IC0wODAwLCBCam9ybiBBbmRlcnNzb24gd3JvdGU6
DQo+IFRoZSBpbnRyb2R1Y3Rpb24gb2YgdWZzaGNkX2RtZV9jb25maWd1cmVfYWRhcHQoKSByZWZh
Y3RvcmVkIG91dA0KPiBkdXBsaWNhdGlvbiBmcm9tIHRoZSBNZWRpYXRlayBhbmQgUXVhbGNvbW0g
ZHJpdmVycy4NCj4gDQo+IEJvdGggdGhlc2UgaW1wbGVtZW50YXRpb25zIGhhZCB0aGUgbG9naWMg
b2Y6DQo+ICAgICBnZWFyX3R4ID09IFVGU19IU19HNCA9PiBQQV9JTklUSUFMX0FEQVBUDQo+ICAg
ICBnZWFyX3R4ICE9IFVGU19IU19HNCA9PiBQQV9OT19BREFQVA0KPiANCj4gYnV0IG5vdyBib3Ro
IGltcGxlbWVudGF0aW9ucyBwYXNzIFBBX0lOSVRJQUxfQURBUFQgYXMgImFkYXB0X3ZhbCIgYW5k
IGlmDQo+IGdlYXJfdHggaXMgbm90IFVGU19IU19HNCB0aGF0IGlzIHJlcGxhY2VkIHdpdGggUEFf
SU5JVElBTF9BREFQVC4gSW4NCj4gb3RoZXIgd29yZHMsIGl0J3MgUEFfSU5JVElBTF9BREFQVCBp
biBib3RoIGFib3ZlIGNhc2VzLg0KPiANCj4gVGhlIHJlc3VsdCBpcyB0aGF0IGUuZy4gUXVhbGNv
bW0gU004MTUwIGhhcyBubyBsb25nZXIgZnVuY3Rpb25hbCBVRlMsIHNvDQo+IGFkanVzdCB0aGUg
bG9naWMgdG8gbWF0Y2ggdGhlIHByZXZpb3VzIGltcGxlbWVudGF0aW9uLg0KPiANCj4gRml4ZXM6
IGZjODVhNzRlMjhmZSAoInNjc2k6IHVmczogUmVmYWN0b3IgQURBUFQgY29uZmlndXJhdGlvbiBm
dW5jdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJz
c29uQGxpbmFyby5vcmc+DQoNClRoYW5rcyBmb3IgdGhlIGZpeC4NCg0KUmV2aWV3ZWQtYnk6IFN0
YW5sZXkgQ2h1IDxzdGFubGV5LmNodUBtZWRpYXRlay5jb20+DQo=

