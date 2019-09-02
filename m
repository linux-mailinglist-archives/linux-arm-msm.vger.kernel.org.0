Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6698AA51F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 10:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbfIBIjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 04:39:17 -0400
Received: from mail-eopbgr710055.outbound.protection.outlook.com ([40.107.71.55]:60799
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730155AbfIBIjQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 04:39:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfV3mq42xWciAZ6XYZokDky1YARkBta2o1J6lT6TSIVAP7/TazYGlkziY/L4hDUM12/2WKC+clDTewJfyxPd+8aMd2WQT398r53DjvqMNqFotd2WXlz3uw/FGC64RsOUmV2KioqaufkoOHMyROx5g1E/ASMRLfxLY5orWWAs/o8YmyIXIA8FclEqYH54ZbwniE4ZZZLnQdRV0k5t+cZWks/q/3PmFe7pWY4g2Td32qI1IvEO2JbnjxX/WSiV88+kftoWrRl7H6jGe2akvDR7mVH9Q8gfyz73EnfqDPGdneS/GgQq3JEh0En+fm+MXKtPLCioqEoCOolp1bBxeTdS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajzl+po9rLpeRV4D8+FDnTseMsOMZuK19i+zrkhwYbc=;
 b=jTGMB1UcsMXTYTYc1GKh09aFKG9aJKti0Zxa4rLh0EiNkGwJRMh0Cz6GNhckcHFElNZj8VszVH8G6e4Oj7BdG+aNuX/6xX9NVACX/2dU8LVyGn+TiGpGy8/9k5ej+UqrYUaFsmYyM58X+JyemCD3rLt4G7tJM/TV7a3o5Y7U+4nDGQ0fnjHOAmzy0T2DIfJiPysDkdNdads6FLKyoUtc9/aAoNj80dlXIoHg9gSkpD9eaG8Dmuh3o/Hzfvx4tEHaBElFVEjXYjf9O5gNtzUm5C3xRAcZC/AsiDrhyRY9RZAOOB97ShsESE0Ml6ZICGEJDyvghSfjAyYbXJzUPXOLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajzl+po9rLpeRV4D8+FDnTseMsOMZuK19i+zrkhwYbc=;
 b=bYOhCRQAW8K81WpgEEnzUbPjVtN9lMj+kZDitPlQ8y0CUhlkmz3F45dI17V4EJA+St7t3DHKK7zSykJADOmKppe95o30sGbnhQtbSg8UpdTcBSy+cQQ4f89XJ7UO0PsF/4gAXDQLjdpCZI9MoeaH2bTz0XKeTM6qgJnCiDVf89I=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.179.87) by
 BN7PR08MB6116.namprd08.prod.outlook.com (20.176.29.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 08:39:10 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::1c5f:b47c:d1c3:c30c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::1c5f:b47c:d1c3:c30c%7]) with mapi id 15.20.2220.021; Mon, 2 Sep 2019
 08:39:10 +0000
From:   "Bean Huo (beanhuo)" <beanhuo@micron.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: RE: [EXT] [PATCH v4 1/3] scsi: ufs: Introduce vops for resetting
 device
Thread-Topic: [EXT] [PATCH v4 1/3] scsi: ufs: Introduce vops for resetting
 device
Thread-Index: AQHVXdVTwpSMXoBF7UGihYWygcclaqcYF7yQ
Date:   Mon, 2 Sep 2019 08:39:10 +0000
Message-ID: <BN7PR08MB5684EEDE565DC4AAC9E658A3DBBE0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
 <20190828191756.24312-2-bjorn.andersson@linaro.org>
In-Reply-To: <20190828191756.24312-2-bjorn.andersson@linaro.org>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dd1d36d-c609-4f1b-40bd-08d72f810689
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR08MB6116;
x-ms-traffictypediagnostic: BN7PR08MB6116:|BN7PR08MB6116:|BN7PR08MB6116:
x-microsoft-antispam-prvs: <BN7PR08MB611680F2FAE12848DD64DAFDDBBE0@BN7PR08MB6116.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(66556008)(486006)(446003)(54906003)(7416002)(11346002)(14454004)(33656002)(6506007)(2906002)(305945005)(110136005)(55236004)(7696005)(76176011)(5660300002)(4326008)(6436002)(26005)(6246003)(3846002)(53936002)(66946007)(25786009)(9686003)(558084003)(55016002)(229853002)(66066001)(256004)(64756008)(66476007)(66446008)(102836004)(71190400001)(71200400001)(76116006)(478600001)(6116002)(186003)(7736002)(99286004)(86362001)(81156014)(8936002)(81166006)(8676002)(74316002)(316002)(476003)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR08MB6116;H:BN7PR08MB5684.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UzZHpAECDrWVRr4stDrRWdYXyJbB6jG41ZWCFdT2kABFjulEnfQLY67nVFx5WhsxkPOGkaUtxUZXuqN1AIH6pZqzCDGk+dSaP6uXtl4AttwlWAV0Tk0S7ur5fCFysrzmIRphCxlKePstbxL9Brh/ysn1JAIqMsVNTGZFnu0z/rhTovb6hPNTZntHAGvzUDgWTX0tHHdEPnWmYSoaVattHpOOC+fJzBxFmNgzutQJXst2oWM5EKDCzdJy+snpit85BJKCgZWRBdk0Fx3qYY+0SEdairsLL1XsKgXLnzTa26BY3oKPEhDXLIGY0kwPQ8wEsVL+kPE2GXLL/Jb1nhZaxfB4O4mA0p/nNSVuOZb5Sw8bvGVCb/BEvEbwakru9mjZQfEngZVN5CppJU5+Ilwt8H8CACW9s82LZp7Qx2m2ocg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd1d36d-c609-4f1b-40bd-08d72f810689
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 08:39:10.1240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf72roamKCbF1bCCV/T8qSdFueWMpctj5d/EhWDSxUgiEsPDa5kP7ye22dc+uQsc9lMRx7u6n7sIyZ8JpbQf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB6116
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>
>Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>

//Bean Huo
