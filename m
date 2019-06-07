Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE58C3885F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 13:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbfFGLB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 07:01:57 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:41365 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbfFGLB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 07:01:57 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190607110154epoutp03df6632bf35366aae0e72ebb2f39b63bc~l5Z5M80iD3075830758epoutp03Q
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2019 11:01:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190607110154epoutp03df6632bf35366aae0e72ebb2f39b63bc~l5Z5M80iD3075830758epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559905314;
        bh=TpCZHwLTpQpBOqJc8oRDcdUSNF6IdZi5tI2MMNRe19M=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=XN92KWsSw6yCbmYx6IYXH3lmrIKRLuAbugb8+BDSRV3bhCAcysQmP2sXV3QLMINw5
         DQspYp69/GIXe3ZpRDsW8NKjUYQe2KjRbmV29F72wep0mIA735VrByvMrFdzt1L3Od
         YMhWYb0VZjuI3ptpSvNz5qe9g51DvQXJHnUZt0xg=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20190607110153epcas5p4d9c8cb414dcf5bceafa18507e35a5024~l5Z4pwXFq3268332683epcas5p4z;
        Fri,  7 Jun 2019 11:01:53 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        87.44.04067.1244AFC5; Fri,  7 Jun 2019 20:01:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20190607110152epcas5p47c678360fd94b918e09f91c082355a59~l5Z35v6B83268332683epcas5p4y;
        Fri,  7 Jun 2019 11:01:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607110152epsmtrp160bf9a0f515134c1025b34b287d5a0b6~l5Z35CELL2419924199epsmtrp1w;
        Fri,  7 Jun 2019 11:01:52 +0000 (GMT)
X-AuditID: b6c32a4b-7a3ff70000000fe3-6b-5cfa4421db44
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.8B.03692.0244AFC5; Fri,  7 Jun 2019 20:01:52 +0900 (KST)
Received: from [107.108.73.28] (unknown [107.108.73.28]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607110151epsmtip1de3ed8d692f2b7d21ad3580e4eb4de81~l5Z21vzQ22568925689epsmtip1U;
        Fri,  7 Jun 2019 11:01:51 +0000 (GMT)
Subject: Re: [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Avri Altman <avri.altman@wdc.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        SCSI <linux-scsi@vger.kernel.org>
From:   Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <875adde9-1a4b-6bb6-1990-9bb78610546c@samsung.com>
Date:   Fri, 7 Jun 2019 16:11:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7bCmhq6iy68Yg2OfRC1e/rzKZnF6/zsW
        iyl/ljNZTNx/lt2i+/oONottn88yO7B59K/7zOpx59oeNo/Pm+Q82g90MwWwRHHZpKTmZJal
        FunbJXBlfD7+lKngvWrFh5uLGRsYv8l2MXJySAiYSCy9PI+xi5GLQ0hgN6PEwWWf2SGcT4wS
        h9rWMUE43xgl9l/4ygLTcrrpFgtEYi+jxMmzE9lBEkICbxklZl1V7mLk4BAWcJJYu9cKpEZE
        oJVRYsaqm6wgNcwC+RInlh0Eq2cT0Ja4O30LE4jNK2AncXxiA9gCFgEViUnfboHViwpESNw/
        toEVokZQ4uTMJ2A1nALWEttbpjJBzBSXuPVkPpQtL7H97RxmkMUSApfZJJ6/2csGcbWLRMOZ
        W+wQtrDEq+NboGwpiZf9bewgR0sIZEv07DKGCNdILJ13DOphe4kDV+awgJQwC2hKrN+lD7GK
        T6L39xMmiE5eiY42IYhqVYnmd1ehOqUlJnZ3s0LYHhL3vqxhhgTbD0aJ/5cfsk9gVJiF5LNZ
        SL6ZheSbWQibFzCyrGKUTC0ozk1PLTYtMM5LLdcrTswtLs1L10vOz93ECE45Wt47GDed8znE
        KMDBqMTDO4PpZ4wQa2JZcWXuIUYJDmYlEd6yCz9ihHhTEiurUovy44tKc1KLDzFKc7AoifNO
        Yr0aIySQnliSmp2aWpBaBJNl4uCUamAUWdXbopi+47XIzvNCGQolJUa5C6uuWHc1+hnmH9OW
        rnmTKrBgyq01hz5WdtlusZ76zY/z6ZtN7flX95yfk9Kbvsvq+YWsil2R1WbTv/q+PMyYfirV
        xe3LhF2/Hl6qvnN9xyxFN8llAcuY47PldBaIVohemp58givv8ucZ3Qczqp/Y32qwsr6txFKc
        kWioxVxUnAgA89HGOjUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSnK6Cy68Yg49vZSxe/rzKZnF6/zsW
        iyl/ljNZTNx/lt2i+/oONottn88yO7B59K/7zOpx59oeNo/Pm+Q82g90MwWwRHHZpKTmZJal
        FunbJXBlfD7+lKngvWrFh5uLGRsYv8l2MXJySAiYSJxuusXSxcjFISSwm1Hi2qRHTBAJaYnr
        GyewQ9jCEiv/PQezhQReM0p8vu3YxcjBISzgJLF2rxVIWESgnVFizXJNEJtZIF9iydXzbBAz
        fzBKnP62iRkkwSagLXF3+haw+bwCdhLHJzawgNgsAioSk77dYgWxRQUiJM68X8ECUSMocXLm
        EzCbU8BaYnvLVCaIBWYS8zY/ZIawxSVuPZkPFZeX2P52DvMERqFZSNpnIWmZhaRlFpKWBYws
        qxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgiNES3MH4+Ul8YcYBTgYlXh4ZzD9jBFi
        TSwrrsw9xCjBwawkwlt24UeMEG9KYmVValF+fFFpTmrxIUZpDhYlcd6neccihQTSE0tSs1NT
        C1KLYLJMHJxSDYyONwqLjl9UW7HJe/+6zZdvltmcEJefcubmeQ0WG+m7FatnbJHT1bS09tj3
        97J9VOq2vvyGp+lHdSVL+mtWtJ4U3ib3Jyj6scsF/ZNT4k1Pp/X6xiq3n2X/bjtvS+nEGnbG
        nWHJp80yPxqza4QkJfSYu3o57d7crvtts2uYi4dO2s5/ppvDu5VYijMSDbWYi4oTAZ8VO4qM
        AgAA
X-CMS-MailID: 20190607110152epcas5p47c678360fd94b918e09f91c082355a59
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20190604075345epcas2p4078376e31e760396490431a6b631f9dd
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
        <20190604072001.9288-3-bjorn.andersson@linaro.org>
        <CGME20190604075345epcas2p4078376e31e760396490431a6b631f9dd@epcas2p4.samsung.com>
        <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc
Thanks for coping me.

On 6/4/19 1:23 PM, Marc Gonzalez wrote:
> [ Shuffling the recipients list ]
> 
> On 04/06/2019 09:20, Bjorn Andersson wrote:
> 
>> Acquire the device-reset GPIO and toggle this to reset the UFS device
>> during initialization and host reset.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   drivers/scsi/ufs/ufshcd.c | 44 +++++++++++++++++++++++++++++++++++++++
>>   drivers/scsi/ufs/ufshcd.h |  4 ++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index 8c1c551f2b42..951a0efee536 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -42,6 +42,7 @@
>>   #include <linux/nls.h>
>>   #include <linux/of.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/gpio/consumer.h>
>>   #include "ufshcd.h"
>>   #include "ufs_quirks.h"
>>   #include "unipro.h"
>> @@ -6104,6 +6105,25 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>>   	return err;
>>   }
>>   
>> +/**
>> + ufshcd_device_reset() - toggle the (optional) device reset line
>> + * @hba: per-adapter instance
>> + *
>> + * Toggles the (optional) reset line to reset the attached device.
>> + */
>> +static void ufshcd_device_reset(struct ufs_hba *hba)
>> +{
>> +	/*
>> +	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
>> +	 * be on the safe side.
>> +	 */
>> +	gpiod_set_value_cansleep(hba->device_reset, 1);
>> +	usleep_range(10, 15);
>> +
>> +	gpiod_set_value_cansleep(hba->device_reset, 0);
>> +	usleep_range(10, 15);
>> +}
>> +
>>   /**
>>    * ufshcd_host_reset_and_restore - reset and restore host controller
>>    * @hba: per-adapter instance
>> @@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
>>   	int retries = MAX_HOST_RESET_RETRIES;
>>   
>>   	do {
>> +		/* Reset the attached device */
>> +		ufshcd_device_reset(hba);
>> +
>>   		err = ufshcd_host_reset_and_restore(hba);
>>   	} while (err && --retries);
>>   
>> @@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
>>   	ufshcd_vops_exit(hba);
>>   }
>>   
>> +static int ufshcd_init_device_reset(struct ufs_hba *hba)
>> +{
>> +	hba->device_reset = devm_gpiod_get_optional(hba->dev, "device-reset",
>> +						    GPIOD_OUT_HIGH);
>> +	if (IS_ERR(hba->device_reset)) {
>> +		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
>> +			PTR_ERR(hba->device_reset));
>> +	}
>> +
>> +	return PTR_ERR_OR_ZERO(hba->device_reset);
>> +}
>> +
>>   static int ufshcd_hba_init(struct ufs_hba *hba)
>>   {
>>   	int err;
>> @@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
>>   	if (err)
>>   		goto out_disable_vreg;
>>   
>> +	err = ufshcd_init_device_reset(hba);
>> +	if (err)
>> +		goto out_disable_variant;
>> +
>>   	hba->is_powered = true;
>>   	goto out;
>>   
>> +out_disable_variant:
>> +	ufshcd_vops_setup_regulators(hba, false);
>>   out_disable_vreg:
>>   	ufshcd_setup_vreg(hba, false);
>>   out_disable_clks:
>> @@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>>   		goto exit_gating;
>>   	}
>>   
>> +	/* Reset the attached device */
>> +	ufshcd_device_reset(hba);
>> +
>>   	/* Host controller enable */
>>   	err = ufshcd_hba_enable(hba);
>>   	if (err) {
>> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> index ecfa898b9ccc..d8be67742168 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -72,6 +72,8 @@
>>   #define UFSHCD "ufshcd"
>>   #define UFSHCD_DRIVER_VERSION "0.2"
>>   
>> +struct gpio_desc;
>> +
>>   struct ufs_hba;
>>   
>>   enum dev_cmd_type {
>> @@ -706,6 +708,8 @@ struct ufs_hba {
>>   
>>   	struct device		bsg_dev;
>>   	struct request_queue	*bsg_queue;
>> +
>> +	struct gpio_desc *device_reset;
>>   };
>>   
>>   /* Returns true if clocks can be gated. Otherwise false */
>>
> 
> Why is this needed on 845 and not on 8998?
> 
Not sure about MSM, but this is high implementation dependent, different 
SoC vendors implement device reset in different way, like one mentioned 
above in this patch, and in case of Samsung/exynos, HCI register control 
device reset. AFA ufs spec is concerns, it just mandate about connecting 
a active low signal to RST_n pin of the ufs device.
> On 8998 we already have:
> 
> 			resets = <&gcc GCC_UFS_BCR>;
> 			reset-names = "rst";
> 
> The above reset line gets wiggled/frobbed when appropriate.
> 
> (What's the difference between gpio and pinctrl? vs a reset "clock" as above)
> 
> ufshcd_device_reset_ctrl() vs ufshcd_init_device_reset()
> 
> Sounds like the nomenclature could be unified or clarified.
> 
> Regards.
> 
> 
