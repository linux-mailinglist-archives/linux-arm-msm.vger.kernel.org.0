Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A806E16BF7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 12:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbgBYLV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 06:21:58 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:38590 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgBYLV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1582629718; x=1614165718;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6rsYUU8oQKRKh87HLt7l9Y6VknSWE8Ep42q7AwgVnsE=;
  b=BVKzaof3qnLtZsbrkYphEHCvbapRaOx16xcKFdJxdgOxvjxJxxOt1oCv
   OzfjglBksaHzOhx8DsT7kZD/1kJV3GDknwKH8Vq85ANPbFpDvIXlWgTqF
   dwUkvAxIxLs4jyJQsRrtFRiulFHDvOESrCKnLNEevWMPJs8SDKVQedaX1
   YUsDX7+f3+uFrgUHQRjfHEf1/3GfNnPit+i+Dla49NaLqkiLAAlicBHAf
   Lql1SqFuOs9rUcYHzKr498S8caQXPv1LOTtHmLv19dgz50zTcrFNMMJpk
   Hs/oVt8SMxv0oxONSM584rMzC66Nbm+xg8HX+WkxNFlvG8KWvJdT4pjcl
   Q==;
IronPort-SDR: MbUbqbnzFM59JRmXGKVWgbVZFWUpeCcoch/kmBil6dw3BkVBp+cQm5Atc1I/1vexUel8nU0Kdr
 MJI7tK+MiXi76YBwlgwFQUJXvbQiqy+hZZtZIG052roKtENmKX/dmW3F6K4xDHhEhsYJVDVbZB
 dzSLX+J3MJ18+HCvsRcqLz7NNcExwsmanlOjTHLqyV/gAEQh1zx6cP+twJUn/rrIc/7TQf/HV9
 TFasUuY9H+zJAgm7hKHU09JbDTzMIGf24WhPRBw5pfcwui7vkwT7NJPl41L8cl+Fr0wVpfUt1h
 MR0=
X-IronPort-AV: E=Sophos;i="5.70,483,1574092800"; 
   d="scan'208";a="131200336"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
  by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2020 19:21:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S99z+Edlb7e7rxX0IZmVhdbnJ5M1f/dWDdNr8RoNP7Y6jShP6bU3ujoMNFAS44PAHWOhtGim3GleSilM5WhuyRTQDsl3M/d8pzEH5Bo7hgtQE+dR/ljiGxEW6mvx2Yv2Rpe+5NWwZGIT58rVy7ezJUR0FGxknZ1cj7psfGzKN6mFzTtML3pVzt42xR1QO94K3xCvVkk6nf5L/wjQnLrT5124tPUneyYmoVk3721DuNGTUF4giqMT+9TUN+LaPgcM2L/cC8hYqxMpo7LFBTZuBM1DvylEubgo7GgHv9IXA4AHiSizWPyJ24EIyki33E6XV6jBlN5MVctgY/kx7ypbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rsYUU8oQKRKh87HLt7l9Y6VknSWE8Ep42q7AwgVnsE=;
 b=BIHH6rI3jQDcMdwnLm8EYx44l5+iXs4xtOLSuvdG3bDqA9yF/ZmVtv+WoRbkUktPYdG77jhREpN+6X2q6TKGQsVS7/fN1N5quW56uYDQBmv7Or2omsahAKPZ2iCsBJuIBXj20vI7Ois4TiS96osWa9VSQjSR6yHGx/okg8R0OX+FTJb0SK0hILNUHo8pBIQ9IeB/t3xqzt9yntIXhwxJiIpwdrbbt4+k1qnD1j6GXM4bGZMddiqD7cMxlXeGnzL5+ccgPEMOss1DgdCz1JhQtGjIH8I+akJvAOCHqyugoF3NV+8BmcWp9Ya2syBdNTPAL1L0RawGaUtE6xf6OMsO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rsYUU8oQKRKh87HLt7l9Y6VknSWE8Ep42q7AwgVnsE=;
 b=LdoVsVqEb/lQNsiHhi5KR657TWyZWdmiBGNkZ0ocBK7GV+nbE+BairwrQ+DrsS8liRaa9iWQiFxpXbaUY/HZkH6ASPkL1jYcm3L3MAiUNtqGVY56NzKPw/4E0imslzoy7w2+3lpqNkXnWvXyRVtPRthCLlkCxh+7KqYBeWwssMs=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 by MN2PR04MB6463.namprd04.prod.outlook.com (2603:10b6:208:1a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 11:21:53 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 11:21:53 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "subhashj@codeaurora.org" <subhashj@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "vinholikatti@gmail.com" <vinholikatti@gmail.com>,
        "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [<RFC PATCH v1> 1/2] scsi: ufs: add write booster feature support
Thread-Topic: [<RFC PATCH v1> 1/2] scsi: ufs: add write booster feature
 support
Thread-Index: AQHV6Rh2ZTwBYaR27UCCKm4Ugks9U6grwt/ggAAGNqA=
Date:   Tue, 25 Feb 2020 11:21:53 +0000
Message-ID: <MN2PR04MB6991F821F0613DE77AA18A15FCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <cover.1582330473.git.asutoshd@codeaurora.org>
 <0eb182e6731bc4ce0c1d6a97f102155d7186520f.1582330473.git.asutoshd@codeaurora.org>
 <MN2PR04MB69918182A787BA86A275A59CFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB69918182A787BA86A275A59CFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c574dcc6-4455-48d1-9726-08d7b9e4ea94
x-ms-traffictypediagnostic: MN2PR04MB6463:
x-microsoft-antispam-prvs: <MN2PR04MB6463283B4FCF0CB8576F0185FCED0@MN2PR04MB6463.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(189003)(199004)(71200400001)(316002)(7416002)(55016002)(66446008)(64756008)(76116006)(9686003)(7696005)(66556008)(5660300002)(52536014)(33656002)(66476007)(6506007)(186003)(2906002)(2940100002)(4326008)(86362001)(81156014)(26005)(66946007)(54906003)(110136005)(8676002)(478600001)(8936002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB6463;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dsoBlg5gQWFvTQ4d6ZXQM+MaVUBHvhHR6Y1mqFqFbkU1OIreFmsKU/3LBFnoit9xO/9WA/LhCT/bWfpQ67OppQjfU1gVYlGj0jv0IIq1EDuHEZb98IyqsmQ5r4EOtnONwQL/7hwdSWbhg7dVHKRkMDUfTtCqojCXSZz/vMf9ldIAEgIp5W9f0wQrFum/qWqFnZNNgK+QKV60OXyGiSSIhpC8OIHb48pIeaL/q0CHolxlp8WdsvQZDiU2EKHHeT6k3CZmIXaVikGmdTjXr7dzv60GhwwSAaB8XlyTwBPT1PCkZ84Gb4sQyrlC2izHoU0eaeUkFombJx4SYBR3rlA3ShnRpGHoywXm03PnQEXKieF5qwQnQAFBxb87TS0YW490t29VeQSlMy7zITLu29yUi05An4Bf0I0D0zhWRduZU5D1iz/87BGB5Q3fOL/Vi83y
x-ms-exchange-antispam-messagedata: tGS1y3F0zA7yUbU7m2DEiE/vxNt39aa3/vluTylu3xVLEw99nLK14aDWN3CNsDEZ/6RyNGobJDWtvLgPDN/kM23neaygK/aUTl5as5uNF0cMWlHY0C2txFXZ1wtv0ldS3mP7kwg7thrhzhIp/wzSBA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c574dcc6-4455-48d1-9726-08d7b9e4ea94
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 11:21:53.4393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYpkrwpVhl2Sk8YrcNyeiEW75oWv564lzDLxSTLSdsZo+llMUDt2qLhm+Xty7pQrkn5C0Lu/pSmDZmSRP1GTUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6463
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiA+ICsgICAgICAgLyogRW5hYmxlIFdCIG9ubHkgZm9yIFVGUy0zLjEgT1IgaWYgZGVzYyBsZW4g
Pj0gMHg1OSAqLw0KPiBZb3UgZG9uJ3QgcmVhbGx5IGNoZWNrIHRoYXQgdGhlIGRlc2NyaXB0b3Ig
c2l6ZSBpcyBsYXJnZSBlbm91Z2gNCj4gDQo+ID4gKyAgICAgICBpZiAoZGV2X2luZm8tPndzcGVj
dmVyc2lvbiA+PSAweDMxMCkgew0KPiA+ICsgICAgICAgICAgICAgICBoYmEtPmRldl9pbmZvLmRf
ZXh0X3Vmc19mZWF0dXJlX3N1cCA9DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGVzY19i
dWZbREVWSUNFX0RFU0NfUEFSQU1fRVhUX1VGU19GRUFUVVJFX1NVUF0NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDwg
MjQgfA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRlc2NfYnVmW0RFVklDRV9ERVNDX1BB
UkFNX0VYVF9VRlNfRkVBVFVSRV9TVVAgKw0KPiAxXQ0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8PCAxNiB8DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgZGVzY19idWZbREVWSUNFX0RFU0NfUEFSQU1fRVhUX1VG
U19GRUFUVVJFX1NVUCArDQo+IDJdDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw8IDggfA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRlc2NfYnVmW0RFVklDRV9ERVNDX1BBUkFNX0VYVF9VRlNfRkVBVFVSRV9T
VVAgKw0KPiAzXTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGhiYS0+ZGV2X2luZm8uYl93
Yl9idWZmZXJfdHlwZSA9DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGVzY19idWZbREVW
SUNFX0RFU0NfUEFSQU1fV0JfVFlQRV07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBpZiAo
aGJhLT5kZXZfaW5mby5iX3diX2J1ZmZlcl90eXBlKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gc2tpcF91bml0X2Rlc2M7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBoYmEt
PmRldl9pbmZvLndiX2NvbmZpZ19sdW4gPSBmYWxzZTsNCj4gPiArICAgICAgICAgICAgICAgZm9y
IChsdW4gPSAwOyBsdW4gPCBVRlNfVVBJVV9NQVhfR0VORVJBTF9MVU47IGx1bisrKSB7DQpBbHNv
IGx1biBub3QgZGVmaW5lZA0KDQo+IFlvdSBmb3Jnb3QgdG8gc2V0DQo+IHU4IHdiX2J1Zls0XSA9
IHt9Ow0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBtZW1zZXQod2JfYnVmLCAwLCBz
aXplb2Yod2JfYnVmKSk7DQo+IE5vdCBuZWVkZWQNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZXJyID0gdWZzaGNkX2dldF93Yl9hbGxvY191bml0cyhoYmEsIGx1biwgd2JfYnVmKTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJlcyA9IHdiX2J1ZlswXSA8PCAyNCB8IHdiX2J1ZlsxXSA8PCAxNiB8DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB3Yl9idWZbMl0gPDwgOCB8IHdiX2J1ZlszXTsNCkFu
ZCByZXMgbm90IGRlZmluZWQgYXMgd2VsbC4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmIChyZXMpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhiYS0+ZGV2
X2luZm8ud2JfY29uZmlnX2x1biA9IHRydWU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAg
ICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gPiArDQo+IA0KPiBUaGFua3MsDQo+IEF2cmkN
Cg==
