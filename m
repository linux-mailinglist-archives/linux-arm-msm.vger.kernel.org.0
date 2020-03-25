Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16DC1925B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 11:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgCYKf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 06:35:29 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:36954 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgCYKf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 06:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1585132528; x=1616668528;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rrfGE4IxY3QorCLnRn3OK8tHM1DOT7w1F38wK9QZZoo=;
  b=Gyt+bSbashToXYNcgsA4VKB5lili4OgTeBN4ad/FB8x9LyoxjI0LILLf
   hYkWaXZhZz9PAbp0YozhUG82fcFEiVfwM2rcHuQfeijeR1CzjT0S8MmHj
   4n6/iVeA/lNPbyY+R5hQFwGiPVGWF9S5MROr9i66pc1c8DKUWXkLksrNB
   YjWemdyV0rTAU03t2u5zTSwSPCl8s2heTwKruU7b+6+jfoaAmtA/WVI+v
   z5twz710KPPwXA0nqi/76tl9u5MQYGWq9XlCVCQpv9B1Fj8IwUFrIkXnV
   N5upKWFKhmDlJ41cvZ54ckn8oV4e7NMESgh0btmA0lP08sVuEo7yD/m+A
   Q==;
IronPort-SDR: 028tIME4P4A91LDFA1Snoj/M5OMG3THg7Q1n+kW4VCwmm4qsoLL+Z/NdSD1H9IwSOemheuBIRU
 PeBEqLI7F+MQL20+YV1pOQRD/p9GsoAQH2gGli8J/ec7PxbIBz7kTviN4ZqmCct65pT3zEm3yp
 G6g0rt3iSOhf2XKm/Xqx3k1A1yN1Fc98cas+YJc0X0x0mocAAKl6uGBVDTZxIE35QTX0a3qqGi
 epSznSMzC+gtpxCpzE6aMwH2VQYHTP7pJCJueGVdI0XMfI1O6Ev1/cdJ+dtZeHZh35ZZ3KhRiK
 j1c=
X-IronPort-AV: E=Sophos;i="5.72,304,1580745600"; 
   d="scan'208";a="133457816"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
  by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 18:35:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ+0hZBxP5GKpoIeVPMKJCE/RFyGuDUG7DmtUyA4/ObdDFm9RBi6i0IY8PrcnXW5Gx69is7is+iCMiyBzMtT8oqRbqEnu5zLDL5uRJJcjEYHdFHhAyOw95IgrXmI/9SNkbA0Ipp13p0cSGwDLy+NtlK5Z2oJyRAw1pu8EqvtkcKLh/0AOvL4jjDRDrClwnOXRZmqzTwRErIkRssd1fRgMpzr+C6zB0hOe0DSM7Je2KM7xsk+k0lVx92UMUh91m2YUyJKAM7hZhXfTHYEXJdVeZ4oXjIXA5KC8O5bzxtvRoXov/KAxkrh90AdB1Il9Y0rWhNGAMGdkzKToazesHUYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrfGE4IxY3QorCLnRn3OK8tHM1DOT7w1F38wK9QZZoo=;
 b=nrgatWIb0OeSnClCDx2NI1jTLTD4ye5fdjU9d1nRuBXC+1JDQWSUXz4Lv6JVNwsmeLejIJXpqO2WKwHCbGyuuTc7owF7r8uIm5lI9KNLD6MUyjpRu0hTNtgeII8j1CNTqOaN/B57dKK5icH7cC0ugZqr1pl49TL4esDDXCtisPaW2OOp554lakuOlI3Quts5dkYan/f9h9WaLYVrxD5hVVMtsQ7FRZ8Mtp+KXjkhJShwkJusV5kVIRSl/HyzyrPOoT+168wlouGhwwXqqY1TS5jW52/APQYZ4oeWdPs+gM+Fznk43TZmI9iHNgPfvgfJYmPO3H+qd5Y++FbOycVR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrfGE4IxY3QorCLnRn3OK8tHM1DOT7w1F38wK9QZZoo=;
 b=b1K9pa5R1O9YmbQUq/6Ly2fOgUEYdXTL9xKiyZiMcieLBikRFTTUUj7cYFtr6bmkeMXnwD9DRQMUF42FwUMJxbdo1fdvmu2HfQp6c8e9Pa/dccxFzVdJkjRljB5BxvwR2Kv4WZcU5eOE5BKNVnIoDcp1dvSyA2QuBWBRVp6KsGU=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4205.namprd04.prod.outlook.com (2603:10b6:805:30::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.23; Wed, 25 Mar
 2020 10:35:25 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2835.021; Wed, 25 Mar 2020
 10:35:25 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     Nitin Rawat <nitirawa@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [<PATCH v1> 1/1] scsi: ufs: Resume ufs host before accessing ufs
 device
Thread-Topic: [<PATCH v1> 1/1] scsi: ufs: Resume ufs host before accessing ufs
 device
Thread-Index: AQHWAiX76v6XYayaoECpa027xlsTV6hZGZBg
Date:   Wed, 25 Mar 2020 10:35:25 +0000
Message-ID: <SN6PR04MB46402A704738FEC5C09FC140FCCE0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <f712a4f7bdb0ae32e0d83634731e7aaa1b3a6cdd.1585009663.git.asutoshd@codeaurora.org>
In-Reply-To: <f712a4f7bdb0ae32e0d83634731e7aaa1b3a6cdd.1585009663.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0e6417b1-efa2-4aa9-ad57-08d7d0a83aec
x-ms-traffictypediagnostic: SN6PR04MB4205:
x-microsoft-antispam-prvs: <SN6PR04MB4205A0994B40B4F059C5777EFCCE0@SN6PR04MB4205.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:383;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(110136005)(6506007)(54906003)(52536014)(26005)(5660300002)(316002)(33656002)(8676002)(7696005)(478600001)(81166006)(81156014)(4326008)(66556008)(9686003)(8936002)(76116006)(66476007)(55016002)(86362001)(66946007)(64756008)(66446008)(4744005)(186003)(71200400001)(7416002)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4205;H:SN6PR04MB4640.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QmDaU0ZeWDQ13xyNqARVhYdYC6r+N/looz1v2nwlSQ2sDPLUNQsPfdi3IJ9LSIB9Z5+ohG5IwPBAusVtDSOKpo20/w5zQe+yBrFjHqmlVeW/OsfSFJ0B8ZVksJ1KQ0zmPfnd/ghw1Hf3J8G/jK6oKVKJDCFI1t/o28d+aHIwiRYObqoeMTKXtBZdEus5H8i+ARJyhMr86yLvPpU23GiO3qR5rl73oHOa0h46mz6Vh38ganjG9LWQuPsDBMPE37X0+56wryjjuFXebpevv8pIt9Hd9SEnSyDTygdJ7X4rW7Ul08CVhND6A22MDiaF4pDaDVr79E/2lHIf9FdeGxTNaGVGj761y+0UKw3fiEj/UIPb46AY8Kqj379Jqobw94eiZRIqO93tMmcEmsX4JBMgXLI3Rsu0Rn52Y7vdhWcazlcx23/SUbrptcpiSVkRzDFt
x-ms-exchange-antispam-messagedata: jykmL3ax5pszMWQlypUSoewEu7h7+SX3XQXJXFPcXGInvkYg/EML8QrXMFYM6LMVR71ErlWldybS/F6U7y/M92yTtQcJkB747s9Uwe4I7deL22uPD5tEqm/pchNvaSR3S4bNVZrHeI0XdjKI3AgjPg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6417b1-efa2-4aa9-ad57-08d7d0a83aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 10:35:25.6729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s105PrPC3fAoc0mRuVwVKw9X0OjDq5/ystKIjIc2e+esQu3uifpEuuHmnDkgImbEvXr49MZJWpchOLGuF+r/Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4205
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>=20
> From: Nitin Rawat <nitirawa@codeaurora.org>
>=20
> As a part of sysfs reading of descriptors/attributes/flags,
> query commands should only be executed when hba's
> power runtime status is active.
> To guarantee this, add pm_runtime_get/put_sync()
> to those paths where query commands are sent.
>=20
> Signed-off-by: Nitin Rawat <nitirawa@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

