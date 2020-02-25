Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140D816BF35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 11:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgBYK6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 05:58:45 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49056 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbgBYK6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 05:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1582628359; x=1614164359;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0caPqlLnk0S4BsGB658NMoi7C1yOhbzWuJp7ilwMPnI=;
  b=arIit3tRB+v6pnzrKauMKTEwt2Bzsy6BLh1YWLy8lr+mkvKUh5Bd7AkJ
   EiMgwl4Dwrp+AkcIM6kHzIMvtppFqzqVU51GqpQRn+XkJZYbnpvJJhz23
   xD0amyuRZsPy08m/mF/dcGCw5rypS1FCp0W2x9/A0oldyrOKrR+jecNeg
   WU4t6Uz8Ee//DxMhCglqJEvoIgTsCbIf9Pzgh+MeC75GwyH/nHhhUkwsv
   UNvwO+nyE2eGtQ15nKCAXZI5rRYNIJujGdoZ3umJwGHtPL19vxWqX9IUD
   RYc0OWLOgb4OLMMAlodFNBxHGgpSdc6s7D2+o6AoNOLsTszvrDDV9CFal
   g==;
IronPort-SDR: tYM99LBzqYvCshp/O1R0soYpgBUg5g/Vuni4nNckUXjuRSxaRYxt/rklYiwXfPBjZuI/GK7vEv
 ZrK3S2h6vzHzouZ31cjc0NUsFipQC5lcHYNbaCwXZmdVAfOnHYllJjQ+N5OcUTe8y24F6Lp5il
 eMg8Oq1aMT68lSx3CVTtSkzoTB2Vwwfh7uM+cPlH1HS34y7hQXD9u3aLXse/sTlVkPmq1u/weq
 638lrNoJ1hnw4q1kwmi6GINsVKV0RtYHItmMS5270WzNdOUI2fS206SlWl6iMfGeSAKvJ/M5BS
 JCo=
X-IronPort-AV: E=Sophos;i="5.70,483,1574092800"; 
   d="scan'208";a="232576694"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2020 18:59:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhy4Q7gqhyU2sbfVEJgDPvMpRif+/0Sf9x76ekuJaOAiVmr3iL1NURBQ712RlGYiYjpvyXLx6Ry/DlAW62man4gTOPYoDYTUiKZ8QRNYQFC3QcrTTHfeIj7JhdFEVVwL3peEJ5w9Ud36jxcNBByp7eFSqV4V/dYN/xxBKikmBMC1Wsg4z+WKYjBYApdFVnJDw4w2jMOb9ycGoxdSlMlqchrgpyve8VlQauTYl837a75QXLOruBsWlYhfnXpSHPjH/R8thB2LO63H6MXVAPkcBvcH9ztpbcNtHcM+PjCWU/hHIObaWC8Jd9OkOTDD7LtKmeL5FM+IJgjZKnc2dLyK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0caPqlLnk0S4BsGB658NMoi7C1yOhbzWuJp7ilwMPnI=;
 b=hIfTUdIP5tYdY3UvUtiUmmxZkBBwYjAOFXnG4F8DdKhiWNzo2JhBLaqVq0OC3cUbHHaVXs0B6eb1QyyxvjpJ0EdSyPGhdQW9AIOnzUg48rHKjSwSlU/DYZuMVAqNPEBd8QwSkAM8065NOgLjnl5LoxzQrJEPe1B+ctMLwFwdbl55meluvQdOWc33a47yoZHT13Jedk5CdzhSVNzBP+JSBXFYAbpYTrVFPcAq1aiImAGikqVbV5WIIy+z5YjMsd/v0OwsDfCPq5p9gMMvUH1iLJTVNzXe1X8xGDypAUgWRyIRZun58hYiH7agTR3qbVfy6s7bhRlyH37p/GCgf2llIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0caPqlLnk0S4BsGB658NMoi7C1yOhbzWuJp7ilwMPnI=;
 b=qqQpDeRnHpDpvRRF5KcqrreIZtJ4MEFpsCFDM6leLVfB5PxiOuoMfC2RmZs1jRxQ9Ue9CAPPMZ1PbiUQeMwStBQYVcALdJqxU+O/tKGYrY9dL5Dt3DcpTiZPKMSQi25+50LIcrRQ8tBLOK85qCSLocNPXlprP00U6nZdGmCy8WI=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 by MN2PR04MB6976.namprd04.prod.outlook.com (2603:10b6:208:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 10:58:40 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 10:58:40 +0000
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
Thread-Index: AQHV6Rh2ZTwBYaR27UCCKm4Ugks9U6grwt/g
Date:   Tue, 25 Feb 2020 10:58:40 +0000
Message-ID: <MN2PR04MB69918182A787BA86A275A59CFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: ff613d95-e32b-4985-132b-08d7b9e1ac10
x-ms-traffictypediagnostic: MN2PR04MB6976:
x-microsoft-antispam-prvs: <MN2PR04MB69761014A34364E9CC422523FCED0@MN2PR04MB6976.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(8676002)(8936002)(81166006)(76116006)(54906003)(66476007)(66446008)(110136005)(64756008)(5660300002)(66946007)(7416002)(2906002)(66556008)(4326008)(316002)(33656002)(6506007)(478600001)(26005)(71200400001)(52536014)(186003)(81156014)(7696005)(86362001)(55016002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB6976;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hlx87HYb34+ejErvO2OXQRXI/+OCDpw6GdQyksst3OXw2JM/uXWIcfKtuNqjjRdQEfXyOKeV7dRKEFpjSyQ+7WmG9wngctEQjJrAuMn9zgjXtF9ZYSHtQLCVjnDsMcCXkzRYTAoGk8LVFmADu6v7VMEC2IxxWfVdBLCd6odlRzTPpKp1XloMmp5iO1Ut9A4TZhNf9//yZXNrTvSLuy9WivMdqiJ1vkWy66aiKitLTj3XrAg5yQfAFUj/RnSqrFM2FLVATQxKSmtRLdgTi7UyQlmFy3bomsMZ+ZkM+BTITUXv8QilxEbqxYKVyihZcFRmGxrribIgeLC7cgCsBpLUEMAU284XFtSEA1FFFUR4UUqPI579XcmAog5Gr+v4mpyLz+4yvdO746LE3GyRzU2SGFeQ0X+NdVCIuMWkH3Mj7Lg0hHZI/gmO8xkNfvWthWZN
x-ms-exchange-antispam-messagedata: 0g/dueCZ9GfWTpU4ZS2nd0SrzItU8xcChQR1PHfFXCy81jINSKP2oAIEyRtbZs9gp8N/T3Rvy2RUnMu3psoXHNaY7c3r/v6Drw6e9EDsHca1JXNliuTaZF1408zQCmGn+g40ErKb6awV/hGxofI71w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff613d95-e32b-4985-132b-08d7b9e1ac10
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 10:58:40.0584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wAwOCrXf5NY99sgl8BO6O1JwsrZ+qYsk8A+5z/siEZwDOKrzEq/82O7gElQZZDi9yO43F6CBR9ow3ESWcdXWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6976
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DQoNCj4gKyAgICAgICAvKiBFbmFibGUgV0Igb25seSBmb3IgVUZTLTMuMSBPUiBpZiBkZXNjIGxl
biA+PSAweDU5ICovDQpZb3UgZG9uJ3QgcmVhbGx5IGNoZWNrIHRoYXQgdGhlIGRlc2NyaXB0b3Ig
c2l6ZSBpcyBsYXJnZSBlbm91Z2gNCg0KPiArICAgICAgIGlmIChkZXZfaW5mby0+d3NwZWN2ZXJz
aW9uID49IDB4MzEwKSB7DQo+ICsgICAgICAgICAgICAgICBoYmEtPmRldl9pbmZvLmRfZXh0X3Vm
c19mZWF0dXJlX3N1cCA9DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRlc2NfYnVmW0RFVklD
RV9ERVNDX1BBUkFNX0VYVF9VRlNfRkVBVFVSRV9TVVBdDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8PCAyNCB8DQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGRlc2NfYnVmW0RFVklDRV9ERVNDX1BBUkFNX0VYVF9VRlNf
RkVBVFVSRV9TVVAgKyAxXQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPDwgMTYgfA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBkZXNjX2J1ZltERVZJQ0VfREVTQ19QQVJBTV9FWFRfVUZTX0ZFQVRVUkVfU1VQICsgMl0N
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDw8IDggfA0KPiArICAgICAgICAgICAgICAgICAgICAgICBkZXNjX2J1ZltERVZJ
Q0VfREVTQ19QQVJBTV9FWFRfVUZTX0ZFQVRVUkVfU1VQICsgM107DQo+ICsNCj4gKyAgICAgICAg
ICAgICAgIGhiYS0+ZGV2X2luZm8uYl93Yl9idWZmZXJfdHlwZSA9DQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGRlc2NfYnVmW0RFVklDRV9ERVNDX1BBUkFNX1dCX1RZUEVdOw0KPiArDQo+ICsg
ICAgICAgICAgICAgICBpZiAoaGJhLT5kZXZfaW5mby5iX3diX2J1ZmZlcl90eXBlKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIHNraXBfdW5pdF9kZXNjOw0KPiArDQo+ICsgICAgICAg
ICAgICAgICBoYmEtPmRldl9pbmZvLndiX2NvbmZpZ19sdW4gPSBmYWxzZTsNCj4gKyAgICAgICAg
ICAgICAgIGZvciAobHVuID0gMDsgbHVuIDwgVUZTX1VQSVVfTUFYX0dFTkVSQUxfTFVOOyBsdW4r
Kykgew0KWW91IGZvcmdvdCB0byBzZXQgDQp1OCB3Yl9idWZbNF0gPSB7fTsNCg0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBtZW1zZXQod2JfYnVmLCAwLCBzaXplb2Yod2JfYnVmKSk7DQpOb3Qg
bmVlZGVkDQoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gdWZzaGNkX2dldF93Yl9h
bGxvY191bml0cyhoYmEsIGx1biwgd2JfYnVmKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGVycikNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gKw0K
PiArICAgICAgICAgICAgICAgICAgICAgICByZXMgPSB3Yl9idWZbMF0gPDwgMjQgfCB3Yl9idWZb
MV0gPDwgMTYgfA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdiX2J1ZlsyXSA8
PCA4IHwgd2JfYnVmWzNdOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmVzKSB7DQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGJhLT5kZXZfaW5mby53Yl9jb25maWdf
bHVuID0gdHJ1ZTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAg
IH0NCj4gKw0KDQpUaGFua3MsDQpBdnJpDQo=
