Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24BB36E561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 09:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239451AbhD2HB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 03:01:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:60003 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239433AbhD2HBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 03:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1619679669; x=1651215669;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8Q67YrQIKgz5h14Fp57cuNVkYLv+ahiKebn743xuu0w=;
  b=XdBZHtDEDF7dQ6BOLZv+csOfTJxu8HhukCXeY1dPZ3RN8Hw3uWPo4+oV
   n0P52psbg6Bd/CwN4XDEusRNSifkOstEm9+HNylfg3s+IK7VRGJ6G1HPp
   FFGQgIa5j45DSNzN4QNa2tLhTuCQP94y06Tbu7VZg6HKuNpVYDg02sKxy
   iDrWON1JPG23e6vJnb6LE7MJigQvQqPE7aLElEwcj2ReSFHBcO4EXjo8G
   sYKIY8f7wzQk2Urb6+ZgrCFWaknw5eCPT/X7PkFxQEZIKfPAhys9s9MMv
   NNZpT8msCaPonVik34M4RIiP5BumrHxY5b/8JcOwU92R1CRwxfGl+Xx4q
   w==;
IronPort-SDR: KIpZd4Lhn4bSgjXWaqBj3rLmKDfurpHyeBjhM4H5ZRGvd+WklG2z1wPsNQrC/EFpJ8161or4/N
 Z+POoZ5oiS4BehB/GT86opH2b8t5+PSSo5Pij7PrhHpLowwcx2nk+mbRiUoS7nGcWGZuB3+kCV
 nqP7x98M80W0Idqwf2hzoTXMB7RSHWxN/m4krzOr4xZB1aTLYb2N8JOasMh58xclOAt0iiWNnO
 3IIDRxcnQe6jbfFeM9l3+vy1+35YnSDb4vXdThle0JkehS9AUa36eXMycvBe/6p5S8dhaNVRhY
 zAY=
X-IronPort-AV: E=Sophos;i="5.82,258,1613404800"; 
   d="scan'208";a="277664560"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
  by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2021 15:01:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHQWKUrimqjeWHVsTv4XnNhEECuORSfuUpRejFa2Nnk/Q8LZxH3h5BhS88r1hGTBpPfaSCXLm8iIdCec8f5eJc6j+q+TP04jWVzPRSkiwj7UZHgDnWCoEJ9/KDa8/f+4QQjXaua0zVHbIdT7yAvYYNq2vBKYtb9a+x7BwflWODKe2WEDNL2FjqLpt3ontZO/jA9r8oEFU9NiJNumy+rZ9oKR5pXYgKEWulGNSqmnFDcmnICbWJd2islKmnqmGyOaFXNHZQR5p6wd7OR7ItWQZiOulPKOi2b9GnuJ/T6Vm0S/DBj2Ju3gWlkPZTcT7ODWYPaRnJt2UPtWGuBxiyxZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXFkZjmI5gRTbedU4oDa7QHRVk9updo2/YAbPSV2e4k=;
 b=YMmNEjO9JBbxsQPBlQWB1szYEWs2ZLJYbkclJ9MNrtcHsmQt62UwqPcHf8jN1MvipnQ2WfdZ1hWIa54FuBCldKEYxXCiJm0HmrEtGjwfI37sVuNUnwPZI/gmiskL2Ti1wp0jdkZDMbi1QKDRuD8HCILMer6gO5yoAwlEHsX0F5pATvnAei5Ab+STFiAg/ct6pVZ3sD9DlfexRNiJXlpP8KUtiQHXZAbMlqbLkiX0XhXbDdDwueEHDBPYQ9KXBjGV9ejL9ZUwsb2Ubo/R451wzs7OpJhqw1+rGFIqZlqcC5GMnZFi6H+f9x8TKJKCZyj3Bky82a74dPfi8WulOWGgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXFkZjmI5gRTbedU4oDa7QHRVk9updo2/YAbPSV2e4k=;
 b=dCe39lHjaKmOaPo1p++3DB5SO/BE6PDfeBE6Abp6M1xm+RPBZtt23G9JKKDUWRZDZ5sc9yIRyrzWZgFtBOkg/qzJDr5Itl7XpbGrgax/E+z6DTuIE8K7naN3ZdBZq/nuDWj7BtuzO88QakPpm/5Ui/k1wfiv5kCoTZPX60ApoEw=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM5PR04MB0538.namprd04.prod.outlook.com (2603:10b6:3:9f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Thu, 29 Apr 2021 07:01:04 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::ed2d:4ccc:f42b:9966]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::ed2d:4ccc:f42b:9966%6]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 07:01:04 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Asutosh Das <asutoshd@codeaurora.org>
CC:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v21 0/2] Enable power management for ufs wlun
Thread-Topic: [PATCH v21 0/2] Enable power management for ufs wlun
Thread-Index: AQHXPKVjEWq1oOWhHEiRpDekT8UeV6rLEHZQ
Date:   Thu, 29 Apr 2021 07:01:04 +0000
Message-ID: <DM6PR04MB657549AFA87A8C88058C608AFC5F9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1619223249.git.asutoshd@codeaurora.org>
 <yq1y2d1lr9m.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1y2d1lr9m.fsf@ca-mkp.ca.oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d330a05b-c31e-4e88-29a5-08d90adc8e71
x-ms-traffictypediagnostic: DM5PR04MB0538:
x-microsoft-antispam-prvs: <DM5PR04MB053886F0FDD458C8959DC98DFC5F9@DM5PR04MB0538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jhjfhjHr2GYQ7ZyYhMjqZKw1NMd945kgottVOaqu+/kChiiJ4P4iTHtcTjGSVgYmQbJoecuHzTlbyjSlF/MJTb1EYwxsge4HzBFvj4ikcAY6xzQ2HZtTqRdILaWG7fdXNbZTOxgvESw0z7N4G85ZJ6am6wlpGBHAn92Uwe/8qS8ZF8jtj7I3dwSbR7QgAd/XJZre8gUC34SXpmDG6fe9/Eiluov+V6p+4EyTtYjTPg0wZlZWOse4O+70NOyBjkVViut3rOZ1nZ/90E8aNMfXk0Cx7TivgT7B/RxS0qYRYZtBLBS+wA5GvTPWJw1aviMJcgBzTvXf/K7vpXvkzmscBhfwxNJ4oNGB1aUijGvY7BipyCbkml0HtjuTizzM7sxQBvMecHb/vS3Rd0twgEztXHANC9iq38DVFWKGcrYAbi/NgkBVR5DARl93RrXuhwdSdr/Oaz42tXBNzUsoL3Imy1f7VRNcsjVLgULHfdpCccxF+MGUGOI0xLkdiYO7czxrz4QRDWViUu2bblFuOOsDbGR4h5vRJTZcSDirSK70kKZmOhOFGmIR7d6PgN2CYzp/guQMM9WfnzXgwxK9UDLNSBivIafStZnHYOz6yCVj/HY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(66476007)(55016002)(64756008)(66446008)(6506007)(2906002)(8676002)(5660300002)(66946007)(66556008)(52536014)(186003)(71200400001)(26005)(4744005)(76116006)(478600001)(83380400001)(8936002)(54906003)(33656002)(122000001)(38100700002)(316002)(86362001)(110136005)(9686003)(7696005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?R6utYUGDjVKa2OPfWBomYVjUH7D26jGAbjDhQqhebFLh1+/8rveDiBJ6CEXH?=
 =?us-ascii?Q?GgI71rsotRE++nqBkwDhk55fzrWUnuyAa2FUFaaphvNcX89+wRvKz8BmGBFt?=
 =?us-ascii?Q?psfQvar2MiWftMMuFgT66cLDbh/hYqOcInV9TZdO6ZciZaXUw61+uL450GQA?=
 =?us-ascii?Q?hwUVBSvALIGKXE8AxryWdepoTp6H/LvY/WOivmPjEDF+Gm18QI6Mg2kGc5zS?=
 =?us-ascii?Q?Ewjc+/98k1/Da0SRNZakHyIWaX9icuEs9pgtDfEF4wsUDmqjkPT5XcW5Ok6S?=
 =?us-ascii?Q?VkrCrU7jGkghXIWG/uRC2outUOwVOWLNKWhL03M1shkTR3h4jpbz857VATqH?=
 =?us-ascii?Q?SG/tbuVTWg2UuPZJqGpROtkHVeTlISu1MP7OhAxO8Em9gGs5hj5+IOgSfiPJ?=
 =?us-ascii?Q?kdj1haqp8pNw+xtsuJdXDRrR1akySAyGGu0fx8hfOU6n8GSp767s3uJ6e4j3?=
 =?us-ascii?Q?h2QZ0z0WPFywuig0PbGcBVLVP40UecG0lHs9ievv2uczS1ZwGC8NjLnsIJXQ?=
 =?us-ascii?Q?gna3QU6zTxacplqQvKLwyg5WcK+LE70JpwnZ4EpTj/7TU8cNf0Zk6hRVH/hS?=
 =?us-ascii?Q?UjITS/sqgRrDT+EXuUF9YXfp9XXL4qgdeIX6K6B+pwXnbuOfQLrHBE0qGaIg?=
 =?us-ascii?Q?EOq1pkGV/U5EpgdVRv82nKXKVFiU4qL4dkoNNNA0FkFwu3SIaE8IdutONmHf?=
 =?us-ascii?Q?7QssP50AaKRM7mGMEB166t1BHrQtDFaCzSLNEcLyNpLSNtnjh/n2dl4K1riz?=
 =?us-ascii?Q?rawZihe3XSWNJVnMX4a+k0nPQ/V415p221K9x0pphxVz/rQEkoWA1rq5b24G?=
 =?us-ascii?Q?unizuPjZ7gnSSPs6OJpdaAfRUC4+ozKV0y96sV54c8IFNsUXRKIsdLUnvGP8?=
 =?us-ascii?Q?M0ZfPFT/4YYk7RrFuABYFlq3oS8g0wiliI4mfJG4yzqNuqtOWK20u9knIDbr?=
 =?us-ascii?Q?Y2tERjRLir7ce3kMDa6Tx2fUc1reJig/DyWYNN6NRQhe7dm8r5FdOSmElQNN?=
 =?us-ascii?Q?wduPsbl9HVpsFaejjkHrVvvjjOP7obzA4zadfkPkZz+sj2Xe0mEQlf93hdCx?=
 =?us-ascii?Q?sG/hAzSfrTL/9Dl4aoHQeFfmpRooR5yFmUTBjqBg5ujPpjY3GYaZOvBUulpE?=
 =?us-ascii?Q?y3OVaddkeVrZOGXXBNg96VD/6+QLfe5gRoTNHj7xsFUqXQOsEFPlE1egeigB?=
 =?us-ascii?Q?Fdiv9BztH/TESTFUkKhQ/rukI06zJx1ssXCX+g+sxtDs9KrYjW2R0s6GKecu?=
 =?us-ascii?Q?7/L7Wqz0nSq5jMrLcgwucVPOH2zp9suGhgTX9+5yLz+I0fu3iuQsicG9dAx8?=
 =?us-ascii?Q?KNwgMBn15jkrzLHoZMiNx3i2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d330a05b-c31e-4e88-29a5-08d90adc8e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 07:01:04.7513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7WsvCpcfvvEb/Jxo8j1eWpX8er10eSULavMtJcSeBnis834x0ytLdjWGFcx68EhXVOjDTXvtZvcJmN6y9IuZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0538
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Asutosh,
In several places there is now a reference: "Also check the description of =
__ufshcd_wl_suspend()"
But no such description is to found.
Might want to add it in a supplementary patch?

Thanks,
Avri

>=20
> > This patch attempts to fix a deadlock in ufs while sending SSU.
>=20
> Applied to 5.14/scsi-staging, thanks!
>=20
> --
> Martin K. Petersen      Oracle Linux Engineering
