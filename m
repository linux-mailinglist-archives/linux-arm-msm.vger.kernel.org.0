Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9399169E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 07:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgBXGCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 01:02:55 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:12711 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgBXGCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 01:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1582524175; x=1614060175;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RdSQBCdhCAyLaTUzbVdmagsSqo+vY/q/C+XEYF99tFk=;
  b=TUSc5hJdOZmQtO0nb/wY6afzGhS7fc1A7szo6uZU8ncnzNWUtjFhazkm
   m8VVwnn14i7mbhNsUDDnOGytdUO3uYR7ZxO1cPxUvV8xhOKy0vV/C07JB
   RJr99Y6QwmO7Ew0NuDQpkdvBsHDFAtrpKwW0aqtbTGWQua3sj6EWLW+zt
   NLf+X+Q3Zh/mzdk1UYuPOGtFKE2oEfN3CoRTgTDOOwXXCJ2a/kSTCYqge
   MG/DcP7BznHfwOYwipMQp7MRDXuo68S8JACvZCxSlOBlGehWrtPdAubur
   LkgcVVNdtUC3JGIGdIGBd13EfZrFq2pETfresVlVB8GNumSKAtqGXBtnA
   g==;
IronPort-SDR: xwo/0jq9CPtPcsqMRgahQDRlnZ5e8+ESza0iMSVcuxc4z3DaPMb+tcmEa3wwHp/uLlQHrNhY1O
 OhtLiD4QqCxfZhaWoWFsE1q0kNhgE1slAlFUXMZnCrH2GGbPI9z75NSmcik2Mc/KNaLlGCqdeN
 3cRUICmUnpHDNbDR2ZcutTV1F2zNutvwixaBx7lLZV69617jYlLHvyJZ8VVczeCWmnQiTatKcK
 jDBch073irZJtAazulcgAqqjQl3pu5wYuSTEeq7/+lXjKQSMiTb/OFScHjt22HEmUivoWA7/5n
 5Bc=
X-IronPort-AV: E=Sophos;i="5.70,479,1574092800"; 
   d="scan'208";a="238687240"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2020 14:02:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFLI5BsIP+8pSYY2Kn+2SAioyFqURQ/MxtOSQEsRA4uxxsn4iZcu6hAVcnE1gPlIIcMykUfiPsx+Fh0DRDtMu6xI17p9P0TxMoPnL6VeHB0lE96JpWePHpBC1QDN5Um490LPoHX3J0amolCiXJKZMjCQ4MuP2nWH2Y8eb7+jerImOPu7C+7MnZ2RTFsv9J/MzoADcWQQxVxPFkE1obx51CjSFdtmwexdKt+KRHDuKul7hg257C/peCD/FHWABY9wvtBwUXeKk0eY6W0eMOkXuY5SjpL9tP8hgf02rvxyRnt+W4zDRcn0OEqO3SCxdN7M0UCf0OJL/q+TE8fKCrSDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdSQBCdhCAyLaTUzbVdmagsSqo+vY/q/C+XEYF99tFk=;
 b=Yr/LmHlgwYToN9/MNW85Zq3XKI6HNm9KPnrKEvEtzZEup83Cm4VJ3UwQDfP5TU5Gh4ns8sHfwMZfiwA/Yzh8uknToM9fhUnvyzwMUWg+C771qvS24HAMIqOFWMlH5JhpQFlOW3zuTkhBiP3QLooAwUXzZ1nQWT445X5RuSCxVi4lymEzEvgma8cRK0ZOepslrS/pDgaB9AulCIJE27R2Yli7+5YalHOCHV+W1M+Tg0basbflqn+ZE2b3t4h4xskWLhtZYERrBz3aSB3bByr7ytCVnahkl61tfSWbdWm3SbsFqHKsUihRmXJB1UJnXSkV07HaFkN3pUHb1P0m+VW8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdSQBCdhCAyLaTUzbVdmagsSqo+vY/q/C+XEYF99tFk=;
 b=KU2DfVfpHX3w1kiuP8/L8VeYAU37LFs+3IWqSY0Teq9PBP2sFrWc9MWoajUl2bUzyj6iXqSotqGbemC/Rc6KpWpLSjMol94pZtJ5yFvdX/kCeIyorQJmDtauDHchWtIN7TPrUE2LLWTSR4bd+JgU0y7LiHxaoQsuc/CNZiNtY7Q=
Received: from MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17)
 by MN2PR04MB5967.namprd04.prod.outlook.com (2603:10b6:208:da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 06:02:50 +0000
Received: from MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7]) by MN2PR04MB6991.namprd04.prod.outlook.com
 ([fe80::3885:5fac:44af:5de7%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 06:02:50 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Can Guo <cang@codeaurora.org>,
        "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
        "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
        "hongwus@codeaurora.org" <hongwus@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Evan Green <evgreen@chromium.org>,
        Bean Huo <beanhuo@micron.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] scsi: ufs-qcom: Apply QUIRK_HOST_TACTIVATE for WDC
 UFS devices
Thread-Topic: [PATCH v2 2/2] scsi: ufs-qcom: Apply QUIRK_HOST_TACTIVATE for
 WDC UFS devices
Thread-Index: AQHV6shLxOgg5dXgLkWaOqDHyNQQHKgp2lKg
Date:   Mon, 24 Feb 2020 06:02:50 +0000
Message-ID: <MN2PR04MB69918204ABD7CB0076627971FCEC0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1582517363-11536-1-git-send-email-cang@codeaurora.org>
 <1582517363-11536-3-git-send-email-cang@codeaurora.org>
In-Reply-To: <1582517363-11536-3-git-send-email-cang@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ce56f191-07ce-440f-ddd5-08d7b8ef2e34
x-ms-traffictypediagnostic: MN2PR04MB5967:
x-microsoft-antispam-prvs: <MN2PR04MB5967FFF50348F330DC477298FCEC0@MN2PR04MB5967.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(189003)(199004)(8936002)(316002)(7416002)(186003)(26005)(110136005)(54906003)(55016002)(558084003)(6506007)(33656002)(76116006)(66446008)(64756008)(66556008)(66476007)(7696005)(81166006)(2906002)(5660300002)(52536014)(86362001)(478600001)(9686003)(66946007)(71200400001)(4326008)(81156014)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR04MB5967;H:MN2PR04MB6991.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DXY8hhiHHcGBLVP+wbGZHsPKgfcuhUioIrBoRouRxWm1oxDFDO4pLjEQ0UladrDN3Hqv2gmsHnsAH1TUUSyjqkV3H/5grurvk0UohWBGhDTJE/DUW/zumaenJVEQb6tZo3Dw9Qfs8hm5gGDJRrrPx0Zjjkfztg9i0cMyOHmeleCCpOrRs561c7TlxaENlwYvVZIGngs8DgN58/BPuy3R1Bj7ThyOgChIJZ17qqfPCAsJCE5zgmgF3fOdxdyAVYbgHVqsJ/NuMjhAtdHBNxqc0FFsmbzwQn1gHlC+ahDttTiEh0eeD3JV5GtbSpi6YZuYBEJqYeks7swBj7WrL/pUd7c3NUy1qGWexW+rWqKBPbXROx43z5zJ61mSuiY4CCUKkqm7Q8MmezMyMW7FXx/p7JhH2NpgBewve5fc+fi6fK2APSE475HbcpGgTooqb8wX
x-ms-exchange-antispam-messagedata: K4bLq5xXe2gJMi0r6ghX85F7pn0ZeSIE/T2v/XzXm4oX2kCeoe2VSgyeZXp8JCL3SBCrQR+mQ7WbDBAchosZ1Qak5I9f/vZSKH08vPP7x1ttKm2stj1vNwX8ob/+C9jLcZewhtFxe2wsNj0Sfl9KJw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce56f191-07ce-440f-ddd5-08d7b8ef2e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 06:02:50.5347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEv9RIlMdeynfy3A+eR5frJW2X6OEHhq6X3IutHKU0+K1kBq9LCODeU4yPvb5u7BPocFvypkKyvyukFfTSXAMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5967
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

=20
>=20
> Western Digital UFS devices require host's PA_TACTIVATE to be lower than
> device's PA_TACTIVATE, otherwise it may get stuck during hibern8 sequence=
.
>=20
> Signed-off-by: Can Guo <cang@codeaurora.org>
Acked-by: Avri Altman <avri.altman@wdc.com>
