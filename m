Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59103075EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhA1MXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 07:23:20 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:35576 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhA1MWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 07:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611836559; x=1643372559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6P2ThNw0JbvZoHkZG2G7okaregURi7WeTFP/hsYf2fQ=;
  b=OciKUcjhJ2qlqE5ScK58fbRY+EledRUoIsu8jrmaU47FU+b5P9I3Eq4j
   Ulia1QH4dai7pC2ubc8tyDS+qUsczxlMjTkq36oDzxSIiNOATlHcGgsSb
   3vtQ57qchK77HEFqgnwllozOZltJZChxJcCznaEg5g72EJZ1yiDuxtlkU
   RK5iQRLKjS0oBVRxPpPSyCpNcz3upz/PX4E5XFgZAC7N+i2GmKe0jOcgS
   2tRzJ1dquRUSLnm2ScWPj7hW6WcLjT/0kwGPFnPAhCVx0u2gdJCJ7XHGo
   rKxZlTg7mJvATLsn5G3fcN850RDfHJ1vWbv7xzpOxiX9Ud2XvqBgSPvTc
   g==;
IronPort-SDR: MrTnzUi8gb3tcuwBRluydLuKpaqDnLzz6NXtoyzR5PQfX+vOLv+P/fPeNRwNKudj/juXYHcn3g
 UnupTKWL83tqbuxRJqhLW6AXb1qouWE/JLMRLNAPiybYF7r0EL77S+OQZB7+Rvxs3VCGSG60ON
 xQVuoTNI4DN1hNC0BLolzZ5kMo4FQ7f0kVlJ/qjFxY0sIOGU64F++G05op/f5UOzivECTS+xQJ
 6PF0ehH4l8wToggy8kNEA1Fsyh8QKGaADcRl4tToPuPgme70L3O6mMqQfn8r2op+hTyglEDLWU
 lYk=
X-IronPort-AV: E=Sophos;i="5.79,382,1602518400"; 
   d="scan'208";a="268914623"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
  by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 20:21:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8ralkhUP7KYemwGToQPEsNWWURGZqk0Mrl+J61Yad8xmSA+tfdZdtcVpZ5OhjL50rYo94mRxVCLEnWgwFU7KwuBQXJTirpJwsCZoPNXnqJN7k78OjOfUiF9J4hKptMGA3vUHAbBvZkLjQJs4Mn/YyOhmOul+QbaHo0SAS8u6AxrXa6JR9pQPDH4dhJQIAMViowikWvCwWCnmOf3AEA76U/rdHj8D7rlpcu555qDb1fwl5Z99SdJaYksWFZYEBm0MfhShxkqIBFhY4WIYqlWgZybNmwXxpAORHEqrbZ91VgTfJiWxpPK68uLUOBSesDlwm5PykiU5ZyefFaW6OIjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P2ThNw0JbvZoHkZG2G7okaregURi7WeTFP/hsYf2fQ=;
 b=i7bzv2JpOBpuh5C9WIOkKgOcCwBW1jcfK2V3y3A0I0iNcA6vSTyGSEHEi+0/wOKJeedgfYVe5WZrSVZt6b6BacPzCsMLdCN8U39KD5jHNbe7LpqMl9DqznTVOrdNfZOVKe+E/c32iauPfgM4z84ZjlbgYL9oMWCHho5/44M0Dmp4dFQrBB2TaWAblcosJjdpfobbw4aHhKl1O1RiT0MwF8ajUQCfTc1ztmhuxV8r8r6Y0KPzzBw+MO5MDguRGlfkDTOdM9Ja0MqXdwDWqNJUogDcGdkldR2LxVydcUhfy+d/hMYGB+VDlCD0s2ecyzTuPGyYw7BLiGHFKu4Cc0xkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P2ThNw0JbvZoHkZG2G7okaregURi7WeTFP/hsYf2fQ=;
 b=UAcZy6DiSR5EL8rvS+Oq80vsnTMdj4/CkfO3x8Xulq5MXVkuitJMRLMTQYq2dRAiKm7XS5QDkHOg6E9vRrtceVc65s6jWH+2a+0R1qYtgjzRIo9dTkmbPz6yBqgfIRchkjbpRo3gp10PfF4nLi0e+HKALSKHzMhvlgIVT8SXTck=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6795.namprd04.prod.outlook.com (2603:10b6:5:24f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Thu, 28 Jan 2021 12:21:32 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::e824:f31b:38cf:ef66%3]) with mapi id 15.20.3805.019; Thu, 28 Jan 2021
 12:21:32 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v2 2/2] scsi: ufs: Fix deadlock while suspending ufs
 host
Thread-Topic: [RFC PATCH v2 2/2] scsi: ufs: Fix deadlock while suspending ufs
 host
Thread-Index: AQHW9SVweaqjl0C7LEyqYSs5saNG4ao89QUA
Date:   Thu, 28 Jan 2021 12:21:32 +0000
Message-ID: <DM6PR04MB657577E28BEDC95DC5FFCA96FCBA9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <b1db5394aa3f6cf44cd9adb9c8d569caa0c9e4f5.1611803264.git.asutoshd@codeaurora.org>
 <d50e7620c47109ea7664dd9ca4144fc0c7c8502d.1611803264.git.asutoshd@codeaurora.org>
In-Reply-To: <d50e7620c47109ea7664dd9ca4144fc0c7c8502d.1611803264.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27a6edaa-bd7b-4e5c-1e3e-08d8c3873f73
x-ms-traffictypediagnostic: DM6PR04MB6795:
x-microsoft-antispam-prvs: <DM6PR04MB6795C5BB0BD6C5079335C7EFFCBA9@DM6PR04MB6795.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vgiGC2n7+XPiXn6yXqCp8Sxr4SMs6F7S4TGnh1ZHImU3DNLDIZifVorCGkYrvGmf4aw1QFWDwIZO+v1SohxCEyiMw/3ECqbFHNRJiDif1JDrXDCU1v+2zrazaObOmjW4Fxl5qaCSerk0eacjNeXH8gzJORL9u0mj+D4zVYKWRVaM5L7c8iMqSMlw2pbxer9GWI+03jLo2sE6T1Tm0tpUqtEtzulXjEr31i3NhGroZh1CbeXstzD1m9h1Ruflx2X1BHU5UTu/btUWRNTwTop9nNyDE8tzSFsEpMbOL8cFwXFZpNF8lRKE8WaHTwYYwjS7wlDd0Tt7yJN5L36Hm8FtN1PHoj2PpA1ysjnVSEtcMR9MwoRtbENqQPWOeKEx7K7fYd+dglQl0dLCcFR0AeMIRwqmJGFM0qH63BBxLbSYmvd2LZe9KFY8XynY12ZccoBsyOopMydmWwiDvB7AJZ2s2/YwjBlVbacTKgiEfpdjDFb2HW+puxi6e6zcUAoNpizJ9P/Yur/9qhzQZ69WM5G6yQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(478600001)(6506007)(33656002)(316002)(7416002)(5660300002)(55016002)(15650500001)(64756008)(4326008)(66476007)(9686003)(186003)(66946007)(8936002)(54906003)(52536014)(76116006)(110136005)(558084003)(83380400001)(66556008)(26005)(86362001)(2906002)(8676002)(7696005)(71200400001)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ofsR4/K42BPHnaMF2nwQGbno2sSFj4EWdxLphqZTx0Q0+r95/5Hshq00wt2x?=
 =?us-ascii?Q?rsAt9B+bfy6o3up9CRttGMyg7GhjpA1JiEfQvwPbrWva7VGredrI11DN68qo?=
 =?us-ascii?Q?nBpKHN3ho2xWVnsJI1DNctRvL3MfOnk+cQH7cU6ZtZOIrYj0w9JSkWISvOjv?=
 =?us-ascii?Q?OOGKZbaMVgrqJaaVPy+ve7n+dHGSEX2IybhVyWHwa0gIpHCpTcA7nKAvbw4D?=
 =?us-ascii?Q?1zewgiYe8ura1/yw3QmhZjYq9UtsyG0/cMeRSgEPb5Ezn6v/HUoa69zZMDUK?=
 =?us-ascii?Q?hn+N1zbb0LU5iZRuL/0Ci4Jmz+gIFf9LCht0tp6qQMHYEQSSKJwuir+RWnZs?=
 =?us-ascii?Q?zP7meZU/4gZ3S1qVmhh4LljUOYxkYA+on0etSEOtiF42nwx7hWtcApOd2GiH?=
 =?us-ascii?Q?CRYrhBFdld/NjZbRvhRIK4+gJig0YJMhIyMvXtbRk1kAGKVAym8tBNAhtp3Y?=
 =?us-ascii?Q?BMLgOd2hxMbf2itVuq/ynQ4tJ8fjCGWKFc6+IRc/Sj74qupIbtJ2X7zT2JAW?=
 =?us-ascii?Q?rp5Z300KlUDEP7zaFkckOfB0DVp5Btds/+x7hjsxJA5fMbXnGa43Dhl+XWHQ?=
 =?us-ascii?Q?nLfukzpa0z/QpVeK/h09yWK0ych8lk8B4cXhwRljKRBei1GPzhkTuECCjKui?=
 =?us-ascii?Q?lI/KkRNIYKkZPasCoir+M9YnNkpIFKaIxV3yMUciZXxwgG9uRT5OlS1J7OKn?=
 =?us-ascii?Q?Fgv6Fdysu0Nq+3YSPBxMnS5HR1JNU4x50BTOJPf9S1lGQrd2VgTLOM0cjxYk?=
 =?us-ascii?Q?CS0bNLmC1PBDiTlRDNuHahdgk4ho84+ivcpKWJELlFY8yogazPhhv+JgSTyR?=
 =?us-ascii?Q?TRpCxBB4tKSrTQTzs9lpzy8teP9THLx2Ma3mxXJ/UqPw1A8hpLPYZ98rx8xj?=
 =?us-ascii?Q?Jb2qFf4xCAvnD4kdEc5OazWPlIgkS3u6pHtIBvUHKXCvIk16Ba1YUPENB9oD?=
 =?us-ascii?Q?0yko+lNFOV3OZJFCzm64tocpj/I1XsFlxvXtzFrPBKNwtQpuKwW0SeFmST9v?=
 =?us-ascii?Q?cA/Vsg/l4Tx5VT4XdqtUqXvAl3NWSKYwsQ9RJXd4dUGdch49OBsB493h1YLH?=
 =?us-ascii?Q?lEsoc5JG?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a6edaa-bd7b-4e5c-1e3e-08d8c3873f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 12:21:32.4499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZewvBdmdAQiMJziUKPNcz+uZN4EsQJrv4Q0hJ763uW6shnX73MJwyEZ/4Eu73D00PNSPEp07iaNDaNOiytqsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6795
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU to wlun during its runtime-suspend.
Do you possible meant: "sends request-sense while clearing UAC to...."

Thanks,
Avri
