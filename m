Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451AC41C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 08:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbfFLGbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 02:31:01 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45632 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731114AbfFLGbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 02:31:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id s11so8993915pfm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gRU97u8F3heZwksD5NXw0YJFqwH/QRlGkCsX4mDvygU=;
        b=uUFu1DVciMRXhSOTU5k0VpTZdcd+0DQP7nnLOmG5vdfT08Q7T6XA80IVAoo4PK1rMI
         CnyREE5R0Ndvi+TKKM2GKivx0VqpJGt4Qg/xcyJ3kx2cp19q3U2GjCuGTBTN7TsBsKpx
         xi2oIGkfHotbx8ybVO7pYyrn/voiHo5O/CEH5t3tZlqE/MIN6oGzmVFB6t6LERYyHkmK
         co8psl8W6TjG036PEe5As8Gq4e4pTaWw+JaOXM45k9RUk+3f2TwzachJrM1Eoj1uR0Wl
         kONgrevcnbqhCUzCbM+8kFCL9IHt1a/sN6IHDzWjRyP1mDdSxiNsyO5PNJczNvk5ZUQH
         fTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gRU97u8F3heZwksD5NXw0YJFqwH/QRlGkCsX4mDvygU=;
        b=lUJMjzJYYuGtNoizI4sa1K7PILNnbq2BUEprFSbMc8y3jSRHUYBS8sGhIRnOzqWzuW
         61QOGrxM8Ls62xbGIdcrYJ/q2uWBsw38smlE+fPrWXum1+pO60Pu5OjLNtWdKhpq06oQ
         iMJUPCyHOhPxht0CNk7t7y+R75bDLMvaQRMk6voFX0JgsUWv4DnbN/u1hsdHIeaRTjYt
         BqW0O0H+elnC15SqVxYBYKNOl7saR2o/lT4nnJnIIwQqVk1PgtOwjA+vL5FL86xJNZRc
         PI4Fk39JJa6nTFwkgt/w04xe72/0OC+JAmG3lugut06i4rIHJQ5ReGIsrGsivaYo+3Kg
         9/3A==
X-Gm-Message-State: APjAAAUSGyfbnjt6ZQFNhty69+ksH0wSmgeHVdwqyb/9BdrI175neoHA
        yTVhfiATcoXvJ4DTNIM+vxrqew==
X-Google-Smtp-Source: APXvYqyqeocc93w7xNJCHOiQGj0GObB6w9hjNxSzx+wtommrrEgQn6nhVSqyv7l1OkxpaA85zCP5Mg==
X-Received: by 2002:a62:5387:: with SMTP id h129mr86969334pfb.6.1560321059827;
        Tue, 11 Jun 2019 23:30:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l38sm4124385pje.12.2019.06.11.23.30.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 23:30:59 -0700 (PDT)
Date:   Tue, 11 Jun 2019 23:31:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
Message-ID: <20190612063143.GD22737@tuxbook-pro>
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
 <20190608050450.12056-3-bjorn.andersson@linaro.org>
 <BN7PR08MB56848AB3CC413CBEC211130EDBED0@BN7PR08MB5684.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR08MB56848AB3CC413CBEC211130EDBED0@BN7PR08MB5684.namprd08.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 11 Jun 09:08 PDT 2019, Bean Huo (beanhuo) wrote:

> Hi, Bjorn
> This HW reset is dedicated to QUALCOMM based platform case.
> how about adding a SW reset as to be default reset routine if platform doesn't support HW reset?
> 

Can you please advice how I perform such software reset?

Regards,
Bjorn

> >-----Original Message-----
> >From: linux-scsi-owner@vger.kernel.org <linux-scsi-owner@vger.kernel.org>
> >On Behalf Of Bjorn Andersson
> >Sent: Saturday, June 8, 2019 7:05 AM
> >To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> ><mark.rutland@arm.com>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
> >Altman <avri.altman@wdc.com>; Pedro Sousa
> ><pedrom.sousa@synopsys.com>; James E.J. Bottomley <jejb@linux.ibm.com>;
> >Martin K. Petersen <martin.petersen@oracle.com>
> >Cc: Andy Gross <agross@kernel.org>; devicetree@vger.kernel.org; linux-
> >kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
> >scsi@vger.kernel.org
> >Subject: [EXT] [PATCH v3 2/3] scsi: ufs-qcom: Implement device_reset vops
> >
> >The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> >through the GPIO framework. Acquire the device-reset GPIO and use this to
> >implement the device_reset vops, to allow resetting the attached memory.
> >
> >Based on downstream support implemented by Subhash Jadavani
> ><subhashj@codeaurora.org>.
> >
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >---
> >
> >Changes since v2:
> >- Moved implementation to Qualcomm driver
> >
> > .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
> > drivers/scsi/ufs/ufs-qcom.c                   | 32 +++++++++++++++++++
> > drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
> > 3 files changed, 38 insertions(+)
> >
> >diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >index a74720486ee2..d562d8b4919c 100644
> >--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> >@@ -54,6 +54,8 @@ Optional properties:
> > 			  PHY reset from the UFS controller.
> > - resets            : reset node register
> > - reset-names       : describe reset node register, the "rst" corresponds to
> >reset the whole UFS IP.
> >+- device-reset-gpios	: A phandle and gpio specifier denoting the GPIO
> >connected
> >+			  to the RESET pin of the UFS memory device.
> >
> > Note: If above properties are not defined it can be assumed that the supply
> >regulators or clocks are always on.
> >diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c index
> >ea7219407309..efaf57ba618a 100644
> >--- a/drivers/scsi/ufs/ufs-qcom.c
> >+++ b/drivers/scsi/ufs/ufs-qcom.c
> >@@ -16,6 +16,7 @@
> > #include <linux/of.h>
> > #include <linux/platform_device.h>
> > #include <linux/phy/phy.h>
> >+#include <linux/gpio/consumer.h>
> > #include <linux/reset-controller.h>
> >
> > #include "ufshcd.h"
> >@@ -1141,6 +1142,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> > 		goto out_variant_clear;
> > 	}
> >
> >+	host->device_reset = devm_gpiod_get_optional(dev, "device-reset",
> >+						     GPIOD_OUT_HIGH);
> >+	if (IS_ERR(host->device_reset)) {
> >+		err = PTR_ERR(host->device_reset);
> >+		if (err != -EPROBE_DEFER)
> >+			dev_err(dev, "failed to acquire reset gpio: %d\n", err);
> >+		goto out_variant_clear;
> >+	}
> >+
> > 	err = ufs_qcom_bus_register(host);
> > 	if (err)
> > 		goto out_variant_clear;
> >@@ -1546,6 +1556,27 @@ static void ufs_qcom_dump_dbg_regs(struct
> >ufs_hba *hba)
> > 	usleep_range(1000, 1100);
> > }
> >
> >+/**
> >+ * ufs_qcom_device_reset() - toggle the (optional) device reset line
> >+ * @hba: per-adapter instance
> >+ *
> >+ * Toggles the (optional) reset line to reset the attached device.
> >+ */
> >+static void ufs_qcom_device_reset(struct ufs_hba *hba) {
> >+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >+
> >+	/*
> >+	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
> >+	 * be on the safe side.
> >+	 */
> >+	gpiod_set_value_cansleep(host->device_reset, 1);
> >+	usleep_range(10, 15);
> >+
> >+	gpiod_set_value_cansleep(host->device_reset, 0);
> >+	usleep_range(10, 15);
> >+}
> >+
> > /**
> >  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
> >  *
> >@@ -1566,6 +1597,7 @@ static struct ufs_hba_variant_ops
> >ufs_hba_qcom_vops = {
> > 	.suspend		= ufs_qcom_suspend,
> > 	.resume			= ufs_qcom_resume,
> > 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
> >+	.device_reset		= ufs_qcom_device_reset,
> > };
> >
> > /**
> >diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h index
> >68a880185752..b96ffb6804e4 100644
> >--- a/drivers/scsi/ufs/ufs-qcom.h
> >+++ b/drivers/scsi/ufs/ufs-qcom.h
> >@@ -204,6 +204,8 @@ struct ufs_qcom_testbus {
> > 	u8 select_minor;
> > };
> >
> >+struct gpio_desc;
> >+
> > struct ufs_qcom_host {
> > 	/*
> > 	 * Set this capability if host controller supports the QUniPro mode
> >@@ -241,6 +243,8 @@ struct ufs_qcom_host {
> > 	struct ufs_qcom_testbus testbus;
> >
> > 	struct reset_controller_dev rcdev;
> >+
> >+	struct gpio_desc *device_reset;
> > };
> >
> > static inline u32
> >--
> >2.18.0
> 
