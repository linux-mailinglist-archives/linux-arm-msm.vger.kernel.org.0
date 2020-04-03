Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEC319D26E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 10:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgDCIkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 04:40:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:24678 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390403AbgDCIkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 04:40:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585903230; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pcPZXHP6kJuCOK+5sj4KXybMGy4D3NvpQrGs0CQsFM0=; b=uMYqZWT9Jr9ygkJaydkcaPtRg5D/kn1KpJGwlzY20NCFYzaKWZkZX6EddR324cwzpjNcHD1X
 0eyl2w1TE3OO9ZjnnpWrKvXqe/AIDtLD+dz9R1QG8sQpfVA4jlvma8/kdbifd9XbnVv0p0tZ
 46wzoZNHKBvc9olpeZsbkT/e+0k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e86f675.7f1f14f46d50-smtp-out-n04;
 Fri, 03 Apr 2020 08:40:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37B75C433BA; Fri,  3 Apr 2020 08:40:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.111.194.152] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 58944C433D2;
        Fri,  3 Apr 2020 08:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 58944C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH 1/2] phy: qualcomm: add qcom dwc3 phy
To:     Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>
Cc:     Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200403002608.946-1-ansuelsmth@gmail.com>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <75326e97-a6fb-3682-9973-22d46e48b58d@codeaurora.org>
Date:   Fri, 3 Apr 2020 14:10:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403002608.946-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/3/2020 5:56 AM, Ansuel Smith wrote:
> This has lost in the original push for the dwc3 qcom driver.
> This is needed for ipq806x SoC as without this the usb ports
> doesn't work at all.
>
> Signed-off-by: Andy Gross <agross@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/phy/qualcomm/Kconfig         |  12 +
>  drivers/phy/qualcomm/Makefile        |   1 +
>  drivers/phy/qualcomm/phy-qcom-dwc3.c | 578 +++++++++++++++++++++++++++
>  3 files changed, 591 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-dwc3.c
>
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index e46824da29f6..3d45a9156f85 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -91,3 +91,15 @@ config PHY_QCOM_USB_HSIC
>  	select GENERIC_PHY
>  	help
>  	  Support for the USB HSIC ULPI compliant PHY on QCOM chipsets.
> +
> +config PHY_QCOM_DWC3
Please rename to PHY_QCOM_IPQ806X_USB
> +	tristate "QCOM DWC3 USB PHY support"
> +	depends on ARCH_QCOM
> +	depends on HAS_IOMEM
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  This option enables support for the Synopsis PHYs present inside the
> +	  Qualcomm USB3.0 DWC3 controller.  This driver supports both HS and SS
> +	  PHY controllers.

Please mention that driver supports only IPQ806x, as it can't  be used
for all QCOM phy and dwc3 controllers wrappers.


> +
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 283251d6a5d9..04c5a8da941a 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_14NM)		+= phy-qcom-ufs-qmp-14nm.o
>  obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
>  obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
>  obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
> +obj-$(CONFIG_PHY_QCOM_DWC3)		+= phy-qcom-dwc3.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-dwc3.c b/drivers/phy/qualcomm/phy-qcom-dwc3.c
> new file mode 100644
> index 000000000000..f33da199ddde
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-dwc3.c

Rename to phy-qcom-ip806x-usb.c

Please also add qcom_ipq806x_usb as prefix in the function names and structures etc.

> @@ -0,0 +1,578 @@
>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
