Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC1B24287D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 13:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHLLB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 07:01:56 -0400
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:57732
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726698AbgHLLBz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 07:01:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQoOuLKQZnDLpj5nPckerL7GnOPf4PmguQNaqBxNCy7bwrW2Jk2PK2P/YkiJzqxGGiGxLvSK5N8WIEp94HBGN6d1srlOXIGPLE31fFdUO9202fa/eG4nHT2umHuwehbviReqTMyz6TzK1JRc9JQX7ZAhneiSD5R+3es0ta7t5IYXe+M2PvlogCndvmQL+HMnEUxgI2eYkrb+NV5Rc5oH6aKJusVyktyADiyZsx3AXKRnrubDjoXxzQmxLtWIFl+ek023zmkOI66b9CuzMF3uCHNzZ5j1XRe2BX2TcUANw/eOFvNO8VNeknoUTU6jQPw6MtENTpRxBzXgy+Jlf+B1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxqRbgqKm2XKjrl5bfpySiwJyTlm/kKLI4WIyrmGMnQ=;
 b=hEGSINrki42cq36C/KNE7+f4naHG+nFIguJBZpHrc29Oyf2coDoqkiGp5B4L8ytZs02r5J4jFu3ToVtzw4c4y57LSQY/SFoJMnqb345svIAH3JY1SdfvrqzOLS9eFEB/eo/N8npK1TBuLi87mVQHQMEZyS9nusGpGKoDbwq/X1wmah7BDZ2FEDBrZnAuom4NRzB5rdv2nuzc0+Kx5r3ucHqAuUhRWtZd9iqCKnn9caARV8eGxYzBy+HpSlrAhpogTxBMxxn4aXlEfuosMNqr3aeaRATxays+qCd/edDcjcjJlChIrdf6ZRi5svaUn0BbG9bJfIiOFCrO9NCmmeFyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxqRbgqKm2XKjrl5bfpySiwJyTlm/kKLI4WIyrmGMnQ=;
 b=qTYzXqogyh5FyPbI5pyDls7XvHdMR6ruRpJoZlTYtiYqQvKBiJkpURvCWkr0C6fFLurHO4u0fbXPLiO4UTihNDCUDFe8ck+/XzZv4Nd+iSui2Qmro9MI75gpteR2UJYz5OjtOuSmp4QYAXwiKRXeil/V8Xbtj1dfrwVbOiMCPPE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6038.eurprd04.prod.outlook.com (2603:10a6:20b:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Wed, 12 Aug
 2020 11:01:50 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 11:01:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Peter Chen <hzpeterchen@gmail.com>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: RE: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Topic: [RFC v4 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Thread-Index: AQHWSc87byU7iOasIkijiJXYgKAteqk0CyuAgABNvICAADToIA==
Date:   Wed, 12 Aug 2020 11:01:50 +0000
Message-ID: <AM7PR04MB7157E57CA693586D6C6F96BE8B420@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200624022848.7765-1-wcheng@codeaurora.org>
 <20200624022848.7765-2-wcheng@codeaurora.org>
 <CAL411-qvuCTib1VBV9uRwL-rEHkefFLm1x-WLLP4kYzcNtQd_g@mail.gmail.com>
 <47f1568e-ba8f-b7f2-9f67-a891c0e06541@codeaurora.org>
In-Reply-To: <47f1568e-ba8f-b7f2-9f67-a891c0e06541@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.64.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba787484-ff59-4b52-1cb8-08d83eaf1d3d
x-ms-traffictypediagnostic: AM6PR04MB6038:
x-microsoft-antispam-prvs: <AM6PR04MB60381E74D9ABC70D1784225C8B420@AM6PR04MB6038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ef7JVVd0sqatsx8o385Vpi1ZgsNXTs8nVOs0AXu4Zz7sTZDdUwvhRX0HeWjct5PESevnKapuMWZmGH56UE5UCItwN3EcX2sp8CiIOU7TA5z/KJVP1BU7Vdhn1VWblj2d/kPfIV2/tNse7+SBT9ZcPYLLj9CcaoJGZ2s88nRspnRsYY5Bx4J/xiEmm27J+mRQU3Q+P0rsKa4uKhFoqvT/N8E8IeCbID0WndW+3gVCWUw6Cc8tGXQ83o7iB5vG8oLc0sP4QclyesO9qlNbcCabJYMuCjFYZb0/vdRWOSz3rYHAvoa0sGb3Oj8c8fBbQV2dP0TEqKewE72o8FKi8qRWDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(4326008)(186003)(55016002)(316002)(9686003)(6506007)(86362001)(8676002)(478600001)(110136005)(54906003)(8936002)(26005)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(5660300002)(2906002)(7696005)(44832011)(52536014)(7416002)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: PCq5u5ngG4X5bjXdXPpiTjkFCexTX5ANWyT0EjUVTjXgCVx2k1s2/9gu2KQs4kz6+QB0G1lGfB4GwpJD2cm7Jpxcryu0d+oQIhEWCW0FKfk809kxL+oSHKLs83cl5p42qq6RLGtiFmXlHRUEnCPH/EPq0kxfXvy0AiR4atNHdcMlhoH5Xq1IThxD1kk/TAkWi+rj0I0erne9kGTNYn55YTsOR9KK9lsbK62UNIRq+COYsDeEafZK0b20kMyNnlkFo0DHfT6WWWC/kFR9UmEPjozimtiLe6Hlno4fG2BAU0E7Fh2bDaumh4zmZrHW4Nxy/iGDgMbPjm7xkbetfTjJG9yHr/TA7U1sa6HY3zjUcdSHor2KgxArkjYwD4bK37NeJVIZx6mvFgYUnZLOki9w7R8tAGexcOV1HN/ljrH0zPG40tfzKcWoTFpCz6CuLzWdqSjSsiX8GkOZAUC6SfqqsZ5I3ZX2nq4Nj34C8DBdN0aQrCLl8PhZo6eUlT9frd7ZQKzeRx4uOkCqnmTi0W1ocJ5yyk0R0pnkyXTdMEZPWVxV8QkATw4Eps4EXAXlQTLa4yO48ZmKFD9hYKQh4Gi9eoEhhMDUs+RZSROyUIqEkmh1zJoqaiRDSIOWIft+F/VvmOm1+wTY4MX9dhtN/WJfBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba787484-ff59-4b52-1cb8-08d83eaf1d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 11:01:50.3200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVPwb2GVQ6VxII0nUXXSWvOATRWcomk1RITrjyuh6OsLIb1Iyi5/n7exP97ApUhE9cug1CmbX22sOMNf/WCqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6038
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IA0KIA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGlucHV0LiAgSSd2ZSBhY3R1YWxseSBjb25z
aWRlcmVkIGRvaW5nIHNvbWUgbWF0Y2hpbmcvcmVzaXppbmcgaW4NCj4gdGhlIC5tYXRjaF9lcCBy
b3V0ZSBhcyB3ZWxsLCBidXQgaXQgZG9lc24ndCB3b3JrIHdlbGwgZm9yIHNpdHVhdGlvbnMgd2hl
cmUgbXVsdGlwbGUNCj4gY29uZmlndXJhdGlvbnMgYXJlIGluIHBsYXkuIFRoZSByZWFzb24gYmVp
bmcgdGhhdCBpZiB5b3UgbG9vayBhdCB0aGUgZXBhdXRvY29uZiBBUElzLA0KPiB0aGUgY29uZmln
ZnMgZHJpdmVyIHdpbGwgdXNlIHRoZSB1c2JfZXBfYXV0b2NvbmZpZ19yZXNldCgpIHRvIHJlc2V0
IHRoZSBlbmRwb2ludHMNCj4gY2xhaW1lZCBiZXR3ZWVuIGluaXRpYWxpemF0aW9uIG9mIGVhY2gg
Y29uZmlndXJhdGlvbi4gIFRoaXMgbWVhbnMgdGhhdCB0aGUNCj4gZXBhdXRvY29uZiBkcml2ZXIg
ZXhwZWN0cyB0byByZS11c2UgdGhlIHVzYl9lbmRwb2ludHM6DQo+IA0KPiBzdGF0aWMgaW50IGNv
bmZpZ2ZzX2NvbXBvc2l0ZV9iaW5kKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnYWRnZXQsDQo+IAlzdHJ1
Y3QgdXNiX2dhZGdldF9kcml2ZXIgKmdkcml2ZXIpDQo+IHsNCj4gLi4uDQo+IA0KPiAvKiBHbyB0
aHJvdWdoIGFsbCBjb25maWdzLCBhdHRhY2ggYWxsIGZ1bmN0aW9ucyAqLyBsaXN0X2Zvcl9lYWNo
X2VudHJ5KGMsICZnaS0NCj4gPmNkZXYuY29uZmlncywgbGlzdCkgeyAuLi4NCj4gbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKGYsIHRtcCwgJmNmZy0+ZnVuY19saXN0LCBsaXN0KSB7DQo+IAlsaXN0
X2RlbCgmZi0+bGlzdCk7DQo+IAlyZXQgPSB1c2JfYWRkX2Z1bmN0aW9uKGMsIGYpOw0KPiAJaWYg
KHJldCkgew0KPiAJCWxpc3RfYWRkKCZmLT5saXN0LCAmY2ZnLT5mdW5jX2xpc3QpOw0KPiAJCWdv
dG8gZXJyX3B1cmdlX2Z1bmNzOw0KPiAJfQ0KPiB9DQo+IHVzYl9lcF9hdXRvY29uZmlnX3Jlc2V0
KGNkZXYtPmdhZGdldCk7DQo+IH0NCj4gDQo+IFNvIGluIHRoaXMgc2l0dWF0aW9uLCBJIHdvdWxk
bid0IHdhbnQgdGhlIGR3YzMgZ2FkZ2V0IGRyaXZlciB0byBhc3NpZ24gYSBkaWZmZXJlbnQNCj4g
ZHdjMyBlcCBmb3IgZW5kcG9pbnRzIGluIGVhY2ggY29uZmlndXJhdGlvbiwgd2hlbiB3ZSBrbm93
IHRoYXQgb25seSBvbmUgc2V0IG9mDQo+IEVQcyB3aWxsIGJlIGFjdGl2ZSB3aGVuIHRoZSBob3N0
IGNob29zZXMuICBJIGhvcGUgSSB1bmRlcnN0b29kIHlvdXIgZmVlZGJhY2sNCj4gY29ycmVjdGx5
LCBhbmQgZGVmaW5pdGVseSBhcHByZWNpYXRlIHRoZSBpbnB1dCENCj4gDQogDQpUaGFua3MgZm9y
IG1lbnRpb24gdGhhdCwgd2UgZGlkbid0IGNvbnNpZGVyIG11bHRpcGxlIGNvbmZpZ3VyYXRpb25z
IHVzZSBjYXNlLCBpdCBuZWVkcw0KdGhlIFVEQyBkcml2ZXIgdG8gcmVjb3JkIHRoZSBjb25maWd1
cmF0aW9uIGluZm9ybWF0aW9uLCBpdCBpcyB0b28gY29tcGxleCBhdCBjdXJyZW50IGZyYW1ld29y
ay4NCg0KSSB0aGluayB5b3VyIHNvbHV0aW9uIGlzIE9LLCByZXNlcnZpbmcgb25lIHBhY2tldCBm
b3IgZWFjaCBJTiBlbmRwb2ludCB0byBhdm9pZCBydW5uaW5nIG91dCBvZg0KRklGTyBmb3IgbGF0
ZXIgZW5kcG9pbnRzIGFuZCBmaXQgdGhlIGZpcnN0IGVuZHBvaW50cyB3aXRoIGxhcmdlciBGSUZP
IHJvb20gdG8gZ2V0IHRoZSBiZXN0DQpwZXJmb3JtYW5jZSwgaXQgY291bGQgdXNlIGFzIG1hbnkg
YXMgRklGT3MgdGhlIGRldmljZSBvd25zLg0KDQpQZXRlcg0KDQo=
