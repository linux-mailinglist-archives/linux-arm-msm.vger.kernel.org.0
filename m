Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD96C16C153
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 13:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbgBYMul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 07:50:41 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:3580 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbgBYMul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 07:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1582635040; x=1614171040;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jj0wWiqnRQNU+OxXGly2oKOwDF5aqQmDo+2QCrRDBow=;
  b=ZskxV+n/0cQMGHjaoFJ2EymHiOmR4YmxEosX3jEMy3sExjZrIMtPWHiu
   X7dkD92bB4dk5nLNzHPjTNxCrAky6h/Blhh5LvX5RYGak/Ihyr6nG5x7Y
   mlIFd3BUV9QMLYdV7JW+cTrc10omfNj2gPybnTWzd02LQtLf8HXBUfRPn
   NJ7eJTHcv1rlt6A7qEPNds6QhwuT4MzKsI7ULNoF3YDOBmDxvIzAqlyw5
   lhItblmBN0/ejK5aHtdCqgxqC+UTRmgeXejylwkevVxz1+f8/ib392XWR
   3OZW/8eNnYo3rT7SOA8sEAho7sXbcDPsAAB9U1h6aq8FFcMWXg9tcpPEs
   w==;
IronPort-SDR: yO2TH44/kB0GKt/CRolqwevDwy5XhhySp5MJcnjw/YU48iTPZjddZls/h9b5dEnWbF6DJ/9rKZ
 Q4KkXtGzxX5SKLphTXMtDQDGtTxg66QR7qLVqr+4QXDiTIc8zU3XlvzBAy9nmfRxTXkhq/s0z6
 GaepEcNRvv2jXtmS1RUd5IOqmzQEk0816zn8clS+BjwCQ/h6IOiDtSpi931N9pSVj+ld3hpv68
 gie2piVdCkf+S6HHdSDQd7gb3zmGahrIR614LzJ/wUZTaVJcDiA7s4GfzyKN2+JpmfbJo7FIhd
 xYQ=
X-IronPort-AV: E=Sophos;i="5.70,484,1574092800"; 
   d="scan'208";a="132129169"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
  by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2020 20:50:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIJRdHzm9Z7RGYx6GuG5GYhkuFMJxKg+uArEaXZB8GhNG6bcI1uwJhR3mQ8esiDjlsRYRzs0CfAivR2PSfOjgJUSZwf5vOLB4cNKXTuNvln+oq6kuWmuTek/rL/mNmwBKZ3+eWjyb2kfthsD7zZzagV2r5yivCprcPs3MXxsi1bzOu/nI2d1GxPqdN4XihK1h5zhXAPq+y3saQ2n/1B2nqcvOtPSSpT33NtW4VYD8/XTIQpzZr5jx/jaijcF+eI5zHPqxVOo/cXPJ65xkC/lt/zCuA+d4xGzxYJNIxd4eCH5h1ArjARlXU5iWtb7iqui+CheyW14jDSn2HPjicFC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj0wWiqnRQNU+OxXGly2oKOwDF5aqQmDo+2QCrRDBow=;
 b=bV9Utxsh5G/fw6QJf1R8K9cLFNMIr64WVc6RCb3BI8yGqK4eEgN01t+CiLL/7QSUtjAwtnXEOe/Io4MqeEkBzwzk9MdOvPZhAgplFbhBWcibXwt40mT9AIyQ5fFEZnVibmWU66IBGIynzAXvN/CvYd8AhI7YWFxSCbM0bj5VOqfQ7vofTry7t7JS8yMvmIXQbvgVpa0FoAKP8Z0yeoTO26rJhhhR0hxftMxmpRGszLDGJ0liV0adLvFwqqdmKZ+KscdaDrmEG0I8e4aWK5P446EFg4bnFZhhhu3J1GyrKAt2pFYqGSlXe1rZzpXhWes5x166f5tu2DLY+f0e1q7xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj0wWiqnRQNU+OxXGly2oKOwDF5aqQmDo+2QCrRDBow=;
 b=yOS/Vul80p81Q+HCuqPQUUQ3QRChRFYz2Q0/33ijXNTunfO0ynhLvtjdyvr7ZNUC5n8nnsLzItcx8Y1BThC5pnWMy53uG73gwqhfLC1g1Uq341a+fw17+hu4yjCN7yOYp68hvdXsURIJibzNPeq1lEjQ+P6i7fajILZqCQOvU/E=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 by MN2PR04MB6975.namprd04.prod.outlook.com (2603:10b6:208:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 12:50:36 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 12:50:36 +0000
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
Thread-Index: AQHV6Rh2ZTwBYaR27UCCKm4Ugks9U6gr4iXQ
Date:   Tue, 25 Feb 2020 12:50:36 +0000
Message-ID: <MN2PR04MB699133FA7E3B2B7A4F1450FAFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <cover.1582330473.git.asutoshd@codeaurora.org>
 <0eb182e6731bc4ce0c1d6a97f102155d7186520f.1582330473.git.asutoshd@codeaurora.org>
In-Reply-To: <0eb182e6731bc4ce0c1d6a97f102155d7186520f.1582330473.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69b54d8d-b462-47e9-00e2-08d7b9f14f38
x-ms-traffictypediagnostic: MN2PR04MB6975:
x-microsoft-antispam-prvs: <MN2PR04MB697500C03D21B23DF918AD46FCED0@MN2PR04MB6975.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(5660300002)(81166006)(81156014)(2906002)(7416002)(4326008)(316002)(478600001)(6506007)(71200400001)(55016002)(8676002)(33656002)(7696005)(66446008)(26005)(54906003)(110136005)(66946007)(9686003)(8936002)(76116006)(186003)(66476007)(52536014)(64756008)(86362001)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB6975;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +hDE2dp3H1WmRcMX80JIS6/YQ6Ic+Q/LVMH8gju0aQlY+lcK6xRmjjQx9FeYls18VlvGBKTiC4WWC9I+m6iXPZli3ujxYPfzIMVMYeoI7LS6cSXxLYSA9jBuR6kGtJ3onGH0Y3XYiyvMl6cBMC2ToS0R1OAey4UeJZI5FQvDGBdeZw6m44XH3d/Ghgw+bXrAtmOKDsTECR3GueW19ftrZ0jh8dX4iyJiWfHyyB+eDv3m7canCuvKPIzuTHZ01IxucImd8fR50W+zJ871rb7kBAfFzZExHJOC3I8DMl+Mp8gNIrfteYo10K/5cWxA56DJwnaRumiOogOZGFCvssFRfi00LVVgUZliX9yATUrS+XxVhiZ/SfR4sqVoJU25NanzN9LLf12jsi+/AyEZNO3V+tlfXMTDsFI1H9qUr+671bxtXvlYhxBBkICgVXolK24C
x-ms-exchange-antispam-messagedata: mOq1GXTaVcuu3awVnKDUDAl/LaQEFFBjkF9EgQ9wldAIEkASGWQe4ZpDHZsRAZK072+wU32Agc6Rq3LyeVCfwugwT2RBtQcwphwEPl3ja3Kzoc1jDS7UCNEPRTzuVkbks5cpkMR//MYgmR2XNN7COQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b54d8d-b462-47e9-00e2-08d7b9f14f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 12:50:36.2929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxan5ru6vaTDb9QjPx+KZjyIYC0AvqGCWye8DODR8OmDUS73WS6i/F4nYdroU8Ga+NAmGCf+LNBWvEv7JEciaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6975
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiArLyoNCj4gKyAqIHVmc2hjZF9nZXRfd2JfYWxsb2NfdW5pdHMgLSByZXR1cm5zDQo+ICJkTFVO
dW1Xcml0ZUJvb3N0ZXJCdWZmZXJBbGxvY1VuaXRzIg0KPiArICogQGhiYTogcGVyLWFkYXB0ZXIg
aW5zdGFuY2UNCj4gKyAqIEBsdW46IFVGUyBkZXZpY2UgbHVuIGlkDQo+ICsgKiBAZF9sdW5fd2Ji
X2F1OiBwb2ludGVyIHRvIGJ1ZmZlciB0byBob2xkIHRoZSBMVSdzIGFsbG9jIHVuaXRzIGluZm8N
Cj4gKyAqDQo+ICsgKiBSZXR1cm5zIDAgaW4gY2FzZSBvZiBzdWNjZXNzIGFuZCBkX2x1bl93YmJf
YXUgd291bGQgYmUgcmV0dXJuZWQNCj4gKyAqIFJldHVybnMgLUVOT1RTVVBQIGlmIHJlYWRpbmcg
ZF9sdW5fd2JiX2F1IGlzIG5vdCBzdXBwb3J0ZWQuDQo+ICsgKiBSZXR1cm5zIC1FSU5WQUwgaW4g
Y2FzZSBvZiBpbnZhbGlkIHBhcmFtZXRlcnMgcGFzc2VkIHRvIHRoaXMgZnVuY3Rpb24uDQo+ICsg
Ki8NCj4gK3N0YXRpYyBpbnQgdWZzaGNkX2dldF93Yl9hbGxvY191bml0cyhzdHJ1Y3QgdWZzX2hi
YSAqaGJhLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggbHVuLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTggKmRfbHVuX3diYl9hdSkNCj4gK3sNCj4gKyAgICAgICBp
bnQgcmV0Ow0KPiArDQo+ICsgICAgICAgaWYgKCFkX2x1bl93YmJfYXUpDQo+ICsgICAgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAgLyogV0IgY2FuIGJlIHN1cHBvcnRl
ZCBvbmx5IGZyb20gTFUwLi5MVTcgKi8NCj4gKyAgICAgICBlbHNlIGlmIChsdW4gPj0gVUZTX1VQ
SVVfTUFYX0dFTkVSQUxfTFVOKQ0KPiArICAgICAgICAgICAgICAgcmV0ID0gLUVOT1RTVVBQOw0K
PiArICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgIHJldCA9IHVmc2hjZF9yZWFkX3VuaXRf
ZGVzY19wYXJhbShoYmEsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGx1biwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVU5J
VF9ERVNDX1BBUkFNX1dCX0JVRl9BTExPQ19VTklUUywNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZF9sdW5fd2JiX2F1LA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKmRfbHVuX3diYl9hdSkpOw0KWW91IGFyZSBy
ZWFkaW5nIGhlcmUgYSBzaW5nbGUgYnl0ZSwgaW5zdGVhZCBvZiA0DQoNCj4gKyAgICAgICByZXR1
cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICAvKioNCj4gICAqIHVmc2hjZF9nZXRfbHVfcG93ZXJfb25f
d3Bfc3RhdHVzIC0gZ2V0IExVJ3MgcG93ZXIgb24gd3JpdGUgcHJvdGVjdA0KPiAgICogc3RhdHVz
DQo+IEBAIC01MTk0LDYgKzUyNjcsMTY1IEBAIHN0YXRpYyB2b2lkDQo+IHVmc2hjZF9ia29wc19l
eGNlcHRpb25fZXZlbnRfaGFuZGxlcihzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBlcnIpOw0KPiAgfQ0KPiANCj4gK3N0YXRp
YyBib29sIHVmc2hjZF93Yl9zdXAoc3RydWN0IHVmc19oYmEgKmhiYSkNCj4gK3sNCj4gKyAgICAg
ICByZXR1cm4gKChoYmEtPmRldl9pbmZvLmRfZXh0X3Vmc19mZWF0dXJlX3N1cCAmDQo+ICsgICAg
ICAgICAgICAgICAgICBVRlNfREVWX1dSSVRFX0JPT1NURVJfU1VQKSAmJg0KRG9uJ3QgeW91IHdh
bnQgdG8gaGF2ZSBhIHZlbmRvciBjYXAgYXMgd2VsbCwNCnRvIGFsbG93IHRoZSBwbGF0Zm9ybSB2
ZW5kb3IgdG8gY29udHJvbCB0aGlzIGZlYXR1cmU/DQoNCj4gKyAgICAgICAgICAgICAgICAgKGhi
YS0+ZGV2X2luZm8uYl93Yl9idWZmZXJfdHlwZQ0KPiArICAgICAgICAgICAgICAgICAgfHwgaGJh
LT5kZXZfaW5mby53Yl9jb25maWdfbHVuKSk7DQo+ICt9DQo+ICsNCj4gKw0KDQoNCg0KPiArc3Rh
dGljIGJvb2wgdWZzaGNkX3diX2lzX2J1Zl9mbHVzaF9uZWVkZWQoc3RydWN0IHVmc19oYmEgKmhi
YSkNCj4gK3sNCj4gKyAgICAgICBpbnQgcmV0Ow0KPiArICAgICAgIHUzMiBjdXJfYnVmLCBzdGF0
dXMsIGF2YWlsX2J1ZjsNCj4gKw0KPiArICAgICAgIGlmICghdWZzaGNkX3diX3N1cChoYmEpKQ0K
PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsgICAgICAgcmV0ID0gdWZz
aGNkX3F1ZXJ5X2F0dHJfcmV0cnkoaGJhLA0KPiBVUElVX1FVRVJZX09QQ09ERV9SRUFEX0FUVFIs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUVVFUllfQVRUUl9JRE5f
QVZBSUxfV0JfQlVGRl9TSVpFLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDAsIDAsICZhdmFpbF9idWYpOw0KPiArICAgICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAg
ICAgICAgIGRldl93YXJuKGhiYS0+ZGV2LCAiJXMgZEF2YWlsYWJsZVdyaXRlQm9vc3RlckJ1ZmZl
clNpemUgcmVhZA0KPiBmYWlsZWQgJWRcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBf
X2Z1bmNfXywgcmV0KTsNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICAg
ICB9DQo+ICsNCj4gKyAgICAgICByZXQgPSB1ZnNoY2Rfdm9wc19nZXRfdXNlcl9jYXBfbW9kZSho
YmEpOw0KPiArICAgICAgIGlmIChyZXQgPD0gMCkgew0KPiArICAgICAgICAgICAgICAgZGV2X2Ri
ZyhoYmEtPmRldiwgIkdldCB1c2VyLWNhcCByZWR1Y3Rpb24gbW9kZTogZmFpbGVkOiAlZFxuIiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0KTsNCj4gKyAgICAgICAgICAgICAgIC8qIE1v
c3QgY29tbW9ubHkgdXNlZCAqLw0KPiArICAgICAgICAgICAgICAgcmV0ID0gVUZTX1dCX0JVRkZf
UFJFU0VSVkVfVVNFUl9TUEFDRTsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICBoYmEtPmRl
dl9pbmZvLmtlZXBfdmNjX29uID0gZmFsc2U7DQo+ICsgICAgICAgaWYgKHJldCA9PSBVRlNfV0Jf
QlVGRl9VU0VSX1NQQUNFX1JFRF9FTikgew0KPiArICAgICAgICAgICAgICAgaWYgKGF2YWlsX2J1
ZiA8PSBVRlNfV0JfMTBfUEVSQ0VOVF9CVUZfUkVNQUlOKSB7DQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGhiYS0+ZGV2X2luZm8ua2VlcF92Y2Nfb24gPSB0cnVlOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICAgICB9IGVsc2UgaWYgKHJldCA9PSBVRlNfV0Jf
QlVGRl9QUkVTRVJWRV9VU0VSX1NQQUNFKSB7DQo+ICsgICAgICAgICAgICAgICByZXQgPSB1ZnNo
Y2RfcXVlcnlfYXR0cl9yZXRyeShoYmEsDQo+IFVQSVVfUVVFUllfT1BDT0RFX1JFQURfQVRUUiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFFVRVJZX0FU
VFJfSUROX0NVUlJfV0JfQlVGRl9TSVpFLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCwgMCwgJmN1cl9idWYpOw0KPiArICAgICAgICAgICAgICAgaWYg
KHJldCkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGhiYS0+ZGV2LCAiJXMg
ZEN1cldyaXRlQm9vc3RlckJ1ZmZlclNpemUgcmVhZCBmYWlsZWQNCj4gJWRcbiIsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCByZXQpOw0KPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsgICAgICAgICAgICAgICB9DQo+ICsNCj4g
KyAgICAgICAgICAgICAgIGlmICghY3VyX2J1Zikgew0KPiArICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfaW5mbyhoYmEtPmRldiwgImRDdXJXQkJ1ZjogJWQgV0IgZGlzYWJsZWQgdW50aWwgZnJl
ZS0NCj4gc3BhY2UgaXMgYXZhaWxhYmxlXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjdXJfYnVmKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Ow0KPiArICAgICAgICAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgICAgICAgICByZXQgPSB1ZnNo
Y2RfZ2V0X2VlX3N0YXR1cyhoYmEsICZzdGF0dXMpOw0KPiArICAgICAgICAgICAgICAgaWYgKHJl
dCkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGhiYS0+ZGV2LCAiJXM6IGZh
aWxlZCB0byBnZXQgZXhjZXB0aW9uIHN0YXR1cyAlZFxuIiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgcmV0KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGF2YWlsX2J1ZiA8IFVGU19XQl80MF9QRVJDRU5UX0JVRl9SRU1BSU4pIHsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBoYmEtPmRldl9pbmZvLmtlZXBfdmNjX29uID0gdHJ1
ZTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7DQo+ICsgICAgICAgICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgICAgIHN0YXR1
cyAmPSBoYmEtPmVlX2N0cmxfbWFzazsNCj4gKw0KPiArICAgICAgICAgICAgICAgaWYgKChzdGF0
dXMgJiBNQVNLX0VFX1VSR0VOVF9CS09QUykgfHwNClNvIHlvdSBhcmUgZ2V0dGluZyB0aGUgc3Rh
dHVzLCBidXQgbm90IHRoZSBia29wcyBsZXZlbC4NCkFuZCB3aGF0IGFib3V0IFdSSVRFQk9PU1RF
Ul9FVkVOVF9FTj8gQWZ0ZXIgYWxsIGl0IHdhcyBpbnZlbnRlZCBzcGVjaWZpY2FsbHkgZm9yIFdC
Li4uDQoNCj4gKyAgICAgICAgICAgICAgICAgICAoYXZhaWxfYnVmIDwgVUZTX1dCXzQwX1BFUkNF
TlRfQlVGX1JFTUFJTikpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGJhLT5kZXZfaW5m
by5rZWVwX3ZjY19vbiA9IHRydWU7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0
cnVlOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0NCj4gKyAgICAgICByZXR1cm4g
ZmFsc2U7DQo+ICt9DQoNClRoYW5rcywNCkF2cmkNCg==
