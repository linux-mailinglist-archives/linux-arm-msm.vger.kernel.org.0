Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C83529A268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 02:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504185AbgJ0Bxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 21:53:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:36872 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2504182AbgJ0Bxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 21:53:44 -0400
X-UUID: 226aefd4c30841cfa359834994fff7be-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wwWUNMKywSAbaJtNHiIr+Yim+MEAyDNc5pgDqalR8Nw=;
        b=fXWq64A18BTKXdrN3xUh0Uo3oqS3k7fFJB6y98ExxS2eWW9KCQJKSDcgquqprMJI1xkvk9aKcJDOW3GgAgnh/v3NBkkLsB8h9GaNm6T8psPSeyjsMvDVNJwm665NITtUysgIM8C9YBLmHktN5l2aazn/0usP6xagvtSHZQLpNkw=;
X-UUID: 226aefd4c30841cfa359834994fff7be-20201027
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <stanley.chu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 85215013; Tue, 27 Oct 2020 09:53:41 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 09:53:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Oct 2020 09:53:40 +0800
Message-ID: <1603763620.2104.0.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/2] scsi: ufs: Put hba into LPM during clk gating
From:   Stanley Chu <stanley.chu@mediatek.com>
To:     Asutosh Das <asutoshd@codeaurora.org>
CC:     <cang@codeaurora.org>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        "Bart Van Assche" <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
Date:   Tue, 27 Oct 2020 09:53:40 +0800
In-Reply-To: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
References: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

T24gTW9uLCAyMDIwLTEwLTI2IGF0IDE2OjMwIC0wNzAwLCBBc3V0b3NoIERhcyB3cm90ZToNCj4g
RnJvbTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3JhLm9yZz4NCj4gDQo+IER1cmluZyBjbG9jayBn
YXRpbmcsIGFmdGVyIGNsb2NrcyBhcmUgZGlzYWJsZWQsDQo+IHB1dCBoYmEgaW50byBMUE0gdG8g
c2F2ZSBtb3JlIHBvd2VyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2Rl
YXVyb3JhLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogQXN1dG9zaCBEYXMgPGFzdXRvc2hkQGNvZGVh
dXJvcmEub3JnPg0KDQpBY2tlZC1ieTogU3RhbmxleSBDaHUgPHN0YW5sZXkuY2h1QG1lZGlhdGVr
LmNvbT4NCg0KDQo=

