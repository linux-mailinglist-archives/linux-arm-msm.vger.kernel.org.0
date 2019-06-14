Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7A645694
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 09:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbfFNHme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 03:42:34 -0400
Received: from mail-eopbgr680046.outbound.protection.outlook.com ([40.107.68.46]:7301
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725775AbfFNHmd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 03:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmCodfGIjGXI2JbyFs130LRJec6Mu4OjJEsm69mGTkE=;
 b=k/yXk8Sh6pYRZHyAVeLduBlmuXRF3TY1f0y/9UmTaOpbclT1VGkn2/LbT+hn45By4t8T5/YRME4Q/RubDy84F6Y1mwFDnw1lnDnvzPvHrpaKaRKOSdb7akg9YX/r1EgzdYEAat7vSUnLzvYnv/fgW8RQGOjIjwWKNTrgFuH3ISc=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.31.141) by
 BN7PR08MB5075.namprd08.prod.outlook.com (20.176.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Fri, 14 Jun 2019 07:42:30 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::499a:3dda:4c08:f586]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::499a:3dda:4c08:f586%5]) with mapi id 15.20.1965.017; Fri, 14 Jun 2019
 07:42:30 +0000
From:   "Bean Huo (beanhuo)" <beanhuo@micron.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Thread-Topic: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Thread-Index: AQHVHbe9gqV+6xhol06/1xHsxtXml6aWopCwgADzAICAAzRW0A==
Date:   Fri, 14 Jun 2019 07:42:29 +0000
Message-ID: <BN7PR08MB56846B54B2ED0BB4194545E2DBEE0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
 <20190608050450.12056-3-bjorn.andersson@linaro.org>
 <BN7PR08MB56848AB3CC413CBEC211130EDBED0@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20190612063143.GD22737@tuxbook-pro>
In-Reply-To: <20190612063143.GD22737@tuxbook-pro>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.80.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bfb7749-d2c9-4abf-01df-08d6f09bdaf7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR08MB5075;
x-ms-traffictypediagnostic: BN7PR08MB5075:|BN7PR08MB5075:
x-microsoft-antispam-prvs: <BN7PR08MB50756382C657BF568D27492EDBEE0@BN7PR08MB5075.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(13464003)(186003)(7696005)(81166006)(81156014)(6116002)(3846002)(8676002)(68736007)(66946007)(73956011)(66446008)(316002)(66476007)(66556008)(229853002)(64756008)(99286004)(8936002)(14454004)(76176011)(9686003)(33656002)(71200400001)(71190400001)(6916009)(6436002)(26005)(55016002)(74316002)(52536014)(5660300002)(53936002)(446003)(2906002)(76116006)(66066001)(25786009)(7416002)(6246003)(476003)(486006)(11346002)(7736002)(305945005)(4326008)(256004)(14444005)(6506007)(5024004)(55236004)(102836004)(86362001)(54906003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR08MB5075;H:BN7PR08MB5684.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k740o/3v6bCYpHPjUXUxiIonB0m51jnxhDtbRzUS+o5Nu/KJJ0eLr35gDmaWsHKMzDu9rExhtmmc4wgTzcl+Av9tBwyI/tlK9XgVNyILn8QfWz+NAF70qz/mZLZWe7ricTkcwfp48kFaXbTOJ/RNitd1j7jg8uQ5s//Fs+OpQslf+DFaecvrSfSOxjFE0J3bvOBFASZC5ma26sGt0TwL/vBQbInAPDxKhEUrMlT/Dndt7ooA7XGTb//F7S+g+v9sHoVRK7MdANzO4276QAXroulVg0ByquKhENd9qmnjV0CVDlfLkm4+28VMqi3Qzdl8AmHrd4sePmh2rAWgC+2DLqYKNJimKihjJGOHS4dOBm8bIEaOhBNRS1bUygVZtWjMQ7fKfUnL1hIRVg4sv/y6uUU89lEuDFWvNqsDZNpCEgA=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfb7749-d2c9-4abf-01df-08d6f09bdaf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 07:42:30.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beanhuo@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5075
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Bjorn
Sorry just saw your message.

You can use UIC command=1B$B!$=1B(Bthrough function ufshcd_send_uic_cmd( ) =
with UIC_CMD_DME_END_PT_RST command.

DME_ENDPOINTRESET: It is used when UFS host wants the UFS device to perform=
 a reset.

//bean

>On Tue 11 Jun 09:08 PDT 2019, Bean Huo (beanhuo) wrote:
>
>> Hi, Bjorn
>> This HW reset is dedicated to QUALCOMM based platform case.
>> how about adding a SW reset as to be default reset routine if platform
>doesn't support HW reset?
>>
>
>Can you please advice how I perform such software reset?
>
>Regards,
>Bjorn
>
>> >-----Original Message-----
>> >From: linux-scsi-owner@vger.kernel.org
>> ><linux-scsi-owner@vger.kernel.org>
>> >On Behalf Of Bjorn Andersson
>> >Sent: Saturday, June 8, 2019 7:05 AM
>> >To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
>> ><mark.rutland@arm.com>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>> >Altman <avri.altman@wdc.com>; Pedro Sousa
>> ><pedrom.sousa@synopsys.com>; James E.J. Bottomley
>> ><jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>
>> >Cc: Andy Gross <agross@kernel.org>; devicetree@vger.kernel.org;
>> >linux- kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
>> >scsi@vger.kernel.org
>> >Subject: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset
>> >vops
>> >
>> >The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and
>exposed
>> >through the GPIO framework. Acquire the device-reset GPIO and use
>> >this to implement the device_reset vops, to allow resetting the attache=
d
>memory.
>> >
>> >Based on downstream support implemented by Subhash Jadavani
>> ><subhashj@codeaurora.org>.
>> >
>> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> >---
>> >
>> >Changes since v2:
>> >- Moved implementation to Qualcomm driver
>> >
>> > .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
>> > drivers/scsi/ufs/ufs-qcom.c                   | 32 +++++++++++++++++++
>> > drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
>> > 3 files changed, 38 insertions(+)
>> >
>> >diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> >b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> >index a74720486ee2..d562d8b4919c 100644
>> >--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> >+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> >@@ -54,6 +54,8 @@ Optional properties:
>> > 			  PHY reset from the UFS controller.
>> > - resets            : reset node register
>> > - reset-names       : describe reset node register, the "rst" correspo=
nds to
>> >reset the whole UFS IP.
>> >+- device-reset-gpios	: A phandle and gpio specifier denoting the
>GPIO
>> >connected
>> >+			  to the RESET pin of the UFS memory device.
>> >
>> > Note: If above properties are not defined it can be assumed that the
>> >supply regulators or clocks are always on.
>> >diff --git a/drivers/scsi/ufs/ufs-qcom.c
>> >b/drivers/scsi/ufs/ufs-qcom.c index ea7219407309..efaf57ba618a 100644
>> >--- a/drivers/scsi/ufs/ufs-qcom.c
>> >+++ b/drivers/scsi/ufs/ufs-qcom.c
>> >@@ -16,6 +16,7 @@
>> > #include <linux/of.h>
>> > #include <linux/platform_device.h>
>> > #include <linux/phy/phy.h>
>> >+#include <linux/gpio/consumer.h>
>> > #include <linux/reset-controller.h>
>> >
>> > #include "ufshcd.h"
>> >@@ -1141,6 +1142,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>> > 		goto out_variant_clear;
>> > 	}
>> >
>> >+	host->device_reset =3D devm_gpiod_get_optional(dev, "device-reset",
>> >+						     GPIOD_OUT_HIGH);
>> >+	if (IS_ERR(host->device_reset)) {
>> >+		err =3D PTR_ERR(host->device_reset);
>> >+		if (err !=3D -EPROBE_DEFER)
>> >+			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
>> >+		goto out_variant_clear;
>> >+	}
>> >+
>> > 	err =3D ufs_qcom_bus_register(host);
>> > 	if (err)
>> > 		goto out_variant_clear;
>> >@@ -1546,6 +1556,27 @@ static void ufs_qcom_dump_dbg_regs(struct
>> >ufs_hba *hba)
>> > 	usleep_range(1000, 1100);
>> > }
>> >
>> >+/**
>> >+ * ufs_qcom_device_reset() - toggle the (optional) device reset line
>> >+ * @hba: per-adapter instance
>> >+ *
>> >+ * Toggles the (optional) reset line to reset the attached device.
>> >+ */
>> >+static void ufs_qcom_device_reset(struct ufs_hba *hba) {
>> >+	struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
>> >+
>> >+	/*
>> >+	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
>> >+	 * be on the safe side.
>> >+	 */
>> >+	gpiod_set_value_cansleep(host->device_reset, 1);
>> >+	usleep_range(10, 15);
>> >+
>> >+	gpiod_set_value_cansleep(host->device_reset, 0);
>> >+	usleep_range(10, 15);
>> >+}
>> >+
>> > /**
>> >  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>> >  *
>> >@@ -1566,6 +1597,7 @@ static struct ufs_hba_variant_ops
>> >ufs_hba_qcom_vops =3D {
>> > 	.suspend		=3D ufs_qcom_suspend,
>> > 	.resume			=3D ufs_qcom_resume,
>> > 	.dbg_register_dump	=3D ufs_qcom_dump_dbg_regs,
>> >+	.device_reset		=3D ufs_qcom_device_reset,
>> > };
>> >
>> > /**
>> >diff --git a/drivers/scsi/ufs/ufs-qcom.h
>> >b/drivers/scsi/ufs/ufs-qcom.h index
>> >68a880185752..b96ffb6804e4 100644
>> >--- a/drivers/scsi/ufs/ufs-qcom.h
>> >+++ b/drivers/scsi/ufs/ufs-qcom.h
>> >@@ -204,6 +204,8 @@ struct ufs_qcom_testbus {
>> > 	u8 select_minor;
>> > };
>> >
>> >+struct gpio_desc;
>> >+
>> > struct ufs_qcom_host {
>> > 	/*
>> > 	 * Set this capability if host controller supports the QUniPro mode
>> >@@ -241,6 +243,8 @@ struct ufs_qcom_host {
>> > 	struct ufs_qcom_testbus testbus;
>> >
>> > 	struct reset_controller_dev rcdev;
>> >+
>> >+	struct gpio_desc *device_reset;
>> > };
>> >
>> > static inline u32
>> >--
>> >2.18.0
>>
