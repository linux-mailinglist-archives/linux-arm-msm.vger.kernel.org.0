Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD84F20498D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 08:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbgFWGJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 02:09:39 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:8157 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbgFWGJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 02:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1592892579; x=1624428579;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+7NH40JAXOC6U4zjefkq2Vfu/2vmsV3PMG/QnbUPNF4=;
  b=mQkR9C9ZxRFRiuRVXVx1wY3zq2O0qvl/3JIqblNztpD29YwDxdHMMB/C
   me3/TyumWtkvVdmGjB8yuDyg9iDw9hA+cZhj+4bA9gRVXPvRU0Othql0P
   2pXPdFCHMZ3DRpi1T2VVQoKD7WehPvjXtXFVToqeU9BqCxLc1e7zNlyGS
   /8U7kTU9Ajj4P3FQWu/abcyn/4fjmhm3gis8rjblwdSDCPs6T2IaPrAjH
   B3LAAY94o85bdES0BN4P325rhCNqtK7iwwazlu5701xUxvhFhm8lSVMVQ
   6e+kY/xX+7AhHaTuNNhqloz27q9MDB6GSRX8nqvHyI70TldiBpGc9IVIn
   A==;
IronPort-SDR: wqy4DR4MbivfGACvPmzt8PtoaY7C09ipROWQTG5cPkEfHGqkqtDxBeyB0et58ggVMdXqlDbONr
 gA6kbAT3Diut/SVl1Aglgpw/R60tIxnqkNYaqow3gJo5TBt67ugUJFW9Hk1l8yu1NTfquDmie8
 iI48sUq5wg2Ow2GnrzzR0Tirsev9QoVS4l0WGs69MuVA2FyNJfVFHMLEFhlYz7a8UluYlwtVxZ
 TBugFz5hfVGpOune0DqoFjOjSJCdy0v/e7/GmlSah1/l+locNZIBs4ntCHE1NkiFwVDCZWRgn8
 F0c=
X-IronPort-AV: E=Sophos;i="5.75,270,1589212800"; 
   d="scan'208";a="249877222"
Received: from mail-sn1nam04lp2052.outbound.protection.outlook.com (HELO NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.52])
  by ob1.hgst.iphmx.com with ESMTP; 23 Jun 2020 14:09:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZJ5SydG+0/gyWV40Y72m4ETPs3IdX+2YeyFC2m6ah0CBzZQc7inXkvyFlbENjKbVFtEbur75wxRTdqCQDYhUosAal7pIEJmORFG1z1tuGdXj+wb0cdP7QgRKhIIWzzFJ7rL8f9pP9bpk3BMj8rrYJS7OadGdW3eE04LkhzZZIc78E9KhID5N03Uy02ZCTEtEBvXwNyE002xc4TxZvCIL02ykAFnFVinLdiVlLxShJONSo2oQSKrGroAkGLWGC1RFbrxHvhCi2dEp59f5frWIgcRHuEw02tikGU0rMPTHZtntHhcXcYXuCt4ued3iXrdVQvSxrF21+jA0lzfzbrMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7NH40JAXOC6U4zjefkq2Vfu/2vmsV3PMG/QnbUPNF4=;
 b=Ck9y3i4CFlCofUb7U1WZgT8SF/bicVT3aRqA91Yj3mSi/t2jumCI4Q24/+YP9tuHwwgfKyCqAANDTQJkW9SfOe77YPyYj810gP557qwcifIv/TW3Jv/CK3B5geJXbpA0zglnZFsmVtPhdBhYI2tPBqouwjTgWxfumAfcsFXCWLDLyJ00+mmtNN78dh98Eua4x9Om2SZdu4XT0CfkDKBkjHWN/4LVU0KSy/Uqc/sjfi3QJPUkhEdtebirBmI0JFbKUPXaZ0ie7NEdATKl+xkPQjtUHq9wegu4SLlD343wAR9lKmmOtVD2CRbZg2n2ebR9d/oQgXaRthJ93jXjdhuNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7NH40JAXOC6U4zjefkq2Vfu/2vmsV3PMG/QnbUPNF4=;
 b=DdqgDDZy2YevS0QnXiRri/6q8dy07OAfGyumYdnmHPM33ZYPJdpSESnusA47p/A9aiaoDry3uZDVnqzRYEyVhGnQahNvD/KNj5N+KdSUXOgCA90URwUYMGJf2UXeLaJISK1gg+3dTXypuFZQDstvckne/jcxhpFugNZvnq91Zl8=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB5358.namprd04.prod.outlook.com (2603:10b6:805:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 06:09:30 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 06:09:29 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Kyuho Choi <chlrbgh0@gmail.com>, Rob Clark <robdclark@gmail.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Topic: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Index: AQHWDe+W7UlEmvGhl0KH0X2uPaojCKjic3aAgACsRFCAAAccgIAAlX+AgAJW9QCAABoVcA==
Date:   Tue, 23 Jun 2020 06:09:29 +0000
Message-ID: <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan>
 <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
 <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
In-Reply-To: <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c5cb89ce-fcc3-4e14-32bd-08d8173bfda2
x-ms-traffictypediagnostic: SN6PR04MB5358:
x-microsoft-antispam-prvs: <SN6PR04MB5358C686E49D9672C1180AFFFC940@SN6PR04MB5358.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vfz9tYpVAQ7NaDFFIbiaZLz3zMTm0DfteBXCSPNl4PVs9iWQSENvpu9Zagh2hAgjr7djKjkmynUfK3+zAgd+CgOq3/fru6NnqPmKsXpXNQqDyDHrHdtG2A9M5PK+2c3FsdbpJm8nHx9O8bKILNPF4OrQADAALvzfgNlyPgXhqFxOpfUc1mxWMjAa77EuuvLN/Dr266+pDamL/ReSwtxMxGvOAHeCgB/eXiTdcKJFSN5CfU7bnEw0DlNWGulNBoIv5uw6mXi39wxMjM81Kz7jqsP84rdPTMBLf3OIt+CP3VPqIbXqJdFLgQfGgsedg34TMRpMgkwa+nTd66rQ1PXmzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(66476007)(66556008)(64756008)(66446008)(558084003)(55016002)(86362001)(5660300002)(7696005)(52536014)(478600001)(26005)(6506007)(316002)(2906002)(110136005)(54906003)(76116006)(66946007)(186003)(7416002)(33656002)(71200400001)(8936002)(4326008)(9686003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: es83FsilnyQhwKbVX9murDvnyGnGyy85xIFgZ9yLOfpim8eVn9ynKdbkH0ZLWnDNtLri86+Av4cmIdj6rHntAVQgUpRAuzcqhURBDzfdtetAOOrvIoYIFQ4HaTeQeXJmZf6wW9Sgvw2JE0X8jn0lvp/eS1ezjlkSDE9/1J7I5cJqPHK7prWi5g5+lBOBFX7Y52Ub9T1K35mqQhI+mOqXhKyirjK4vW5Ing3fSVeL3ZNMFBikFgWhkZdOa6JyL21JBiihnHctOin/4+99m86wfwi4kGS/vu6GSE3C4abCjtAuFEkVgHyUzelSNS/pKXhI1dp7nSNdiB0kWqGt5ysHzNgSy8fedAyTvnN+i/509yYw9eR1V1swoOvOrBp9JQqROQB+3FugtPeJld5GNk8fGSEB43OwaSGy4Q4Sx9BtAbDL0MXT1pcyB0Iqxb3ekzohVZfmzEZYkcuTgz688YfHhX1DuITohrUpf7BOa4ddl9U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cb89ce-fcc3-4e14-32bd-08d8173bfda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 06:09:29.7470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FiOEl59+75mGcJvIOFBw/RQmorgMND4cQG7pTVATaFyYDE0yW01ZuLl3mXuNNXhNLqDykhC86DYyRSw6ZvUa7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5358
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PiANCj4gQUZBSUssIHRoaXMgZGV2aWNlIGFyZSB1ZnMgMi4xLiBJdCdzIG5vdCBzdXBwb3J0IHdy
aXRlYm9vc3Rlci4NCj4gDQo+IEknZCBjaGVjayBsYXRlc3QgbGludXggc2NzaSBicmFuY2ggYW5k
IHVmc2hjZF93Yl9jb25maWcgZnVuY3Rpb24ncw0KPiBjYWxsZWQgd2l0aG91dCBkZXZpY2UgY2Fw
YWJpbGl0eSBjaGVjay4NClBsZWFzZSBncmVwIHVmc2hjZF93Yl9wcm9iZS4NCg==
