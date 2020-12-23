Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EDB2E1A8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 10:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgLWJeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 04:34:11 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:50962 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727823AbgLWJeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 04:34:11 -0500
X-UUID: b6f541f005474e5abe27c413f415f52c-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FCTr7Meo/1gfNbE3HTrp4APnGU2TY3DudOiD1TClv6w=;
        b=HXqQPQP6amc9CvIp1zGwUIyLapW+Lk0dIi35u+l8PQOsZUHkywDIFwN/6uNR7w/gy/pSe3LV/PF7vX1dXCL5Gsbfd8DN6RKB2/Lje7a7Ehqlc8dRHnsAphrhRDb36bm9CkWwmAYKD5itneSWtj1yqP9md5LiW/NBxaDYdvaqcNg=;
X-UUID: b6f541f005474e5abe27c413f415f52c-20201223
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1221856157; Wed, 23 Dec 2020 17:33:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 17:33:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 17:33:18 +0800
Message-ID: <1608715998.14045.8.camel@mtkswgap22>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Ziqi Chen <ziqichen@codeaurora.org>
CC:     <asutoshd@codeaurora.org>, <nguyenb@codeaurora.org>,
        <cang@codeaurora.org>, <hongwus@codeaurora.org>,
        <rnayak@codeaurora.org>, <vinholikatti@gmail.com>,
        <jejb@linux.vnet.ibm.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <kernel-team@android.com>,
        <saravanak@google.com>, <salyzyn@google.com>,
        <kwmad.kim@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Satya Tangirala" <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 23 Dec 2020 17:33:18 +0800
In-Reply-To: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2E82613DAED4FA8FF2D640B8A13FCC1CB8454CFBFE82D18528678A7423E615532000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gVHVlLCAyMDIwLTEyLTIyIGF0IDIxOjQ5ICswODAwLCBaaXFpIENoZW4gd3JvdGU6DQo+IEFz
IHBlciBzcGVjcywgZS5nLCBKRVNEMjIwRSBjaGFwdGVyIDcuMiwgd2hpbGUgcG93ZXJpbmcNCj4g
b2ZmL29uIHRoZSB1ZnMgZGV2aWNlLCBSU1RfTiBzaWduYWwgYW5kIFJFRl9DTEsgc2lnbmFsDQo+
IHNob3VsZCBiZSBiZXR3ZWVuIFZTUyhHcm91bmQpIGFuZCBWQ0NRL1ZDQ1EyLg0KPiANCj4gVG8g
ZmxleGlibHkgY29udHJvbCBkZXZpY2UgcmVzZXQgbGluZSwgcmVmYWN0b3IgdGhlIGZ1bmN0aW9u
DQo+IHVmc2NoZF92b3BzX2RldmljZV9yZXNldChzdHVyY3QgdWZzX2hiYSAqaGJhKSB0byB1ZnNo
Y2RfDQo+IHZvcHNfZGV2aWNlX3Jlc2V0KHN0dXJjdCB1ZnNfaGJhICpoYmEsIGJvb2wgYXNzZXJ0
ZWQpLiBUaGUNCj4gbmV3IHBhcmFtZXRlciAiYm9vbCBhc3NlcnRlZCIgaXMgdXNlZCB0byBzZXBh
cmF0ZSBkZXZpY2UgcmVzZXQNCj4gbGluZSBwdWxsaW5nIGRvd24gZnJvbSBwdWxsaW5nIHVwLg0K
PiANCj4gQ2M6IEtpd29vbmcgS2ltIDxrd21hZC5raW1Ac2Ftc3VuZy5jb20+DQo+IENjOiBTdGFu
bGV5IENodSA8c3RhbmxleS5jaHVAbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaaXFp
IENoZW4gPHppcWljaGVuQGNvZGVhdXJvcmEub3JnPg0KDQpUaGFua3MgZm9yIHRoaXMgZml4IGlu
Y2x1ZGluZyB1ZnMtbWVkaWF0ZWsgY2hhbmdlIGFzIHdlbGwuDQoNClJldmlld2VkLWJ5OiBTdGFu
bGV5IENodSA8c3RhbmxleS5jaHVAbWVkaWF0ZWsuY29tPg0KVGVzdGVkLWJ5OiBTdGFubGV5IENo
dSA8c3RhbmxleS5jaHVAbWVkaWF0ZWsuY29tPg0KDQoNCg0K

