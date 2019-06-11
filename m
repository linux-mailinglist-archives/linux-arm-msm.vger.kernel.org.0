Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9E3D1BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 18:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391603AbfFKQIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 12:08:46 -0400
Received: from mail-eopbgr790045.outbound.protection.outlook.com ([40.107.79.45]:57165
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391474AbfFKQIp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 12:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+jgxQFFBIc7gNBrsosdoX6A+SVQRPB0FawYEKAddtA=;
 b=b1/AIrMiXtCvyI5wzaCEPYZvxHiPrpxR2IsQ8HJcw5j1XCkNmIUNA0jqq+AnJbYCwtJ79fru4Q4icOM3qlln98NRQKE4BKnOtNLSMKHpXNpT1mQdPADlod25nMGt/BuAr77EfKxGgYZOIJRr2GyoEx1B/mBJmvOEqur7NCAwyZk=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.31.141) by
 BN7PR08MB4817.namprd08.prod.outlook.com (20.176.27.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 11 Jun 2019 16:08:41 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::499a:3dda:4c08:f586]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::499a:3dda:4c08:f586%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 16:08:41 +0000
From:   "Bean Huo (beanhuo)" <beanhuo@micron.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Andy Gross <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Thread-Topic: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Thread-Index: AQHVHbe9gqV+6xhol06/1xHsxtXml6aWopCw
Date:   Tue, 11 Jun 2019 16:08:41 +0000
Message-ID: <BN7PR08MB56848AB3CC413CBEC211130EDBED0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
 <20190608050450.12056-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190608050450.12056-3-bjorn.andersson@linaro.org>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.80.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc887df5-1339-4115-8f2d-08d6ee871243
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR08MB4817;
x-ms-traffictypediagnostic: BN7PR08MB4817:|BN7PR08MB4817:
x-microsoft-antispam-prvs: <BN7PR08MB481710C9622C93EC81FA8324DBED0@BN7PR08MB4817.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(39860400002)(366004)(346002)(13464003)(199004)(189003)(8936002)(229853002)(99286004)(6506007)(55236004)(102836004)(66556008)(66476007)(64756008)(66946007)(66446008)(73956011)(76176011)(71190400001)(3846002)(6436002)(54906003)(110136005)(68736007)(7696005)(76116006)(74316002)(7416002)(14454004)(6116002)(33656002)(71200400001)(256004)(14444005)(5024004)(478600001)(26005)(186003)(2906002)(476003)(486006)(446003)(11346002)(316002)(4326008)(55016002)(5660300002)(7736002)(305945005)(25786009)(6246003)(81166006)(53936002)(8676002)(66066001)(81156014)(52536014)(9686003)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR08MB4817;H:BN7PR08MB5684.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iIg7KALhJLdm2TeFYjDDOodD5A3OJ93m5bpp0vrfILUy3C8yfWzehQuQnvETCxUCPW+Uk4WQsbwBszLoAX150IfA32anCo3x89+6tyTEyUjuyNnWJRk+lqxv/6gl5ZhEixjFn4nYT2lJiq9/ELC20n1ZHUir4XEJO/mpCZT4DFyA3Ax9YEwib96AfgkNu7YFIxDsOAqLKAwwMga6EiWNb1nYRhFTemMhy144nRl1YHF+QgABg6ub/XEYNQ+vnNRxnAJszDjlcafLfVgVyYDH3FNwWsDW8vWIuRZAFDQ8rLsPmY0tMO2OsE6FUUGpUJ4ip6yHmALzprPP0yKCOjyC07wz9hBBsnAwqQtDrW8tE0HiMrkeX2sORpQO2iywgET0buOq4qaHzj0+pAMD1efhTmPdKYYseAGoxrlEouJVD6s=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc887df5-1339-4115-8f2d-08d6ee871243
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 16:08:41.1888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beanhuo@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4817
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Bjorn
This HW reset is dedicated to QUALCOMM based platform case.
how about adding a SW reset as to be default reset routine if platform does=
n't support HW reset?

>-----Original Message-----
>From: linux-scsi-owner@vger.kernel.org <linux-scsi-owner@vger.kernel.org>
>On Behalf Of Bjorn Andersson
>Sent: Saturday, June 8, 2019 7:05 AM
>To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
><mark.rutland@arm.com>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>Altman <avri.altman@wdc.com>; Pedro Sousa
><pedrom.sousa@synopsys.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
>Martin K. Petersen <martin.petersen@oracle.com>
>Cc: Andy Gross <agross@kernel.org>; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
>scsi@vger.kernel.org
>Subject: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
>
>The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
>through the GPIO framework. Acquire the device-reset GPIO and use this to
>implement the device_reset vops, to allow resetting the attached memory.
>
>Based on downstream support implemented by Subhash Jadavani
><subhashj@codeaurora.org>.
>
>Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>---
>
>Changes since v2:
>- Moved implementation to Qualcomm driver
>
> .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
> drivers/scsi/ufs/ufs-qcom.c                   | 32 +++++++++++++++++++
> drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
> 3 files changed, 38 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>index a74720486ee2..d562d8b4919c 100644
>--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>@@ -54,6 +54,8 @@ Optional properties:
> 			  PHY reset from the UFS controller.
> - resets            : reset node register
> - reset-names       : describe reset node register, the "rst" corresponds=
 to
>reset the whole UFS IP.
>+- device-reset-gpios	: A phandle and gpio specifier denoting the GPIO
>connected
>+			  to the RESET pin of the UFS memory device.
>
> Note: If above properties are not defined it can be assumed that the supp=
ly
>regulators or clocks are always on.
>diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c ind=
ex
>ea7219407309..efaf57ba618a 100644
>--- a/drivers/scsi/ufs/ufs-qcom.c
>+++ b/drivers/scsi/ufs/ufs-qcom.c
>@@ -16,6 +16,7 @@
> #include <linux/of.h>
> #include <linux/platform_device.h>
> #include <linux/phy/phy.h>
>+#include <linux/gpio/consumer.h>
> #include <linux/reset-controller.h>
>
> #include "ufshcd.h"
>@@ -1141,6 +1142,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> 		goto out_variant_clear;
> 	}
>
>+	host->device_reset =3D devm_gpiod_get_optional(dev, "device-reset",
>+						     GPIOD_OUT_HIGH);
>+	if (IS_ERR(host->device_reset)) {
>+		err =3D PTR_ERR(host->device_reset);
>+		if (err !=3D -EPROBE_DEFER)
>+			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
>+		goto out_variant_clear;
>+	}
>+
> 	err =3D ufs_qcom_bus_register(host);
> 	if (err)
> 		goto out_variant_clear;
>@@ -1546,6 +1556,27 @@ static void ufs_qcom_dump_dbg_regs(struct
>ufs_hba *hba)
> 	usleep_range(1000, 1100);
> }
>
>+/**
>+ * ufs_qcom_device_reset() - toggle the (optional) device reset line
>+ * @hba: per-adapter instance
>+ *
>+ * Toggles the (optional) reset line to reset the attached device.
>+ */
>+static void ufs_qcom_device_reset(struct ufs_hba *hba) {
>+	struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
>+
>+	/*
>+	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
>+	 * be on the safe side.
>+	 */
>+	gpiod_set_value_cansleep(host->device_reset, 1);
>+	usleep_range(10, 15);
>+
>+	gpiod_set_value_cansleep(host->device_reset, 0);
>+	usleep_range(10, 15);
>+}
>+
> /**
>  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>  *
>@@ -1566,6 +1597,7 @@ static struct ufs_hba_variant_ops
>ufs_hba_qcom_vops =3D {
> 	.suspend		=3D ufs_qcom_suspend,
> 	.resume			=3D ufs_qcom_resume,
> 	.dbg_register_dump	=3D ufs_qcom_dump_dbg_regs,
>+	.device_reset		=3D ufs_qcom_device_reset,
> };
>
> /**
>diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h ind=
ex
>68a880185752..b96ffb6804e4 100644
>--- a/drivers/scsi/ufs/ufs-qcom.h
>+++ b/drivers/scsi/ufs/ufs-qcom.h
>@@ -204,6 +204,8 @@ struct ufs_qcom_testbus {
> 	u8 select_minor;
> };
>
>+struct gpio_desc;
>+
> struct ufs_qcom_host {
> 	/*
> 	 * Set this capability if host controller supports the QUniPro mode
>@@ -241,6 +243,8 @@ struct ufs_qcom_host {
> 	struct ufs_qcom_testbus testbus;
>
> 	struct reset_controller_dev rcdev;
>+
>+	struct gpio_desc *device_reset;
> };
>
> static inline u32
>--
>2.18.0

