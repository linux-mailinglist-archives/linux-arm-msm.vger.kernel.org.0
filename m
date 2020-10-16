Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6538290C7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 21:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391385AbgJPT6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 15:58:01 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:21465 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390785AbgJPT54 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 15:57:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602878274; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YNFKO4kn2tIA269ZV/Ckq/TsS5zSHfh9jxfzWSxby98=; b=sIVVRuL82ZkrdKCNMCHT2l05GDsD0QQSiMT+vn8d324OfGNq8YQ5sFmuOeQbg6PK6LuCBi2y
 5RrqS/diEHzuw1FjjMF2lOl5QGP9VNedB2LwbhadLZC/SycFmXJSrWIJoZ6HlCLpn5jwvkw3
 0Wla/B1HJJH2gWGkuCVn06bI9u8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f89fb410764f13b0097c28b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 19:57:53
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F870C433C9; Fri, 16 Oct 2020 19:57:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C20DAC433FE;
        Fri, 16 Oct 2020 19:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C20DAC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH RFC] bus: mhi: core: Enable unique QRTR node ID support
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org
References: <1602875069-12514-1-git-send-email-gokulsri@codeaurora.org>
 <1602875069-12514-2-git-send-email-gokulsri@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <ef188540-932e-9da6-7af1-a970024930ff@codeaurora.org>
Date:   Fri, 16 Oct 2020 13:57:51 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <1602875069-12514-2-git-send-email-gokulsri@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/2020 1:04 PM, Gokul Sriram Palanisamy wrote:
> On multi-mhi platforms, host WiFi driver and
> QMI test driver needs to differntiate between
> QMI packets received from multiple mhi devices.
> 
> With QCN9000 PCI cards, once SBL gets loaded, we
> utilize ERRDBG2 register to write a unique value
> per mhi device from device-tree that the device
> utilizes to set a unique QRTR node ID and
> instance ID for the QMI service. This helps QRTR
> stack in differenting the packets in a multi-mhi
> environment and can route them accordingly.
> 
> sample:
> root@OpenWrt:/# qrtr-lookup
>    Service Version Instance Node  Port
>         69       1       40   40     2 ATH10k WLAN firmware service
>         15       1        0   40     1 Test service
>         69       1       39   39     2 ATH10k WLAN firmware service
>         15       1        0   39     1 Test service
> 
> Here on column 4, 39 and 40 are the node IDs that
> is unique per mhi device.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>   .../devicetree/bindings/mhi/qcom,mhi.yaml          | 36 ++++++++++++++++++++++
>   drivers/bus/mhi/core/boot.c                        | 14 +++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mhi/qcom,mhi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml b/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml
> new file mode 100644
> index 0000000..f763e9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mhi/qcom,mhi.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/pci/qcom,pcie.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Modem Host Interface
> +
> +maintainers:
> +  - Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> +
> +properties:
> +  qrtr-instance-id:
> +    const: 32
> +
> +required:
> +  - reg
> +  - qrtr-instance-id
> +
> +examples:
> +  - |
> +    pcie: pci@10000000 {
> +        compatible = "qcom,pcie-qcs404";
> +        status = "ok";
> +        perst-gpio = <&tlmm 58 0x1>;
> +
> +        pcie0_rp: pcie0_rp {
> +            reg = <0 0 0 0 0>;
> +            status = "ok";
> +            mhi_0: qcom,mhi@0 {
> +                reg = <0 0 0 0 0 >;
> +                qrtr_instance_id = <0x20>;
> +            };
> +        };
> +    };

So, its impossible for me to have multiple QCN9000 PCI devices on say an 
x86 host, since x86 doesn't support DT?

Also, I have to know ahead of time, when I'm writing the DT, how many of 
these devices I'm going to have in a system, and if I decide to add N 
more at a later time, I'm back at square 1?

> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 0b38014..7406f28 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -18,6 +18,9 @@
>   #include <linux/wait.h>
>   #include "internal.h"
>   
> +#define QRTR_INSTANCE_MASK	0x0000FFFF
> +#define QRTR_INSTANCE_SHIFT	0

I fail to understand why IPC Router specific stuff is being clobbered 
into MHI.

> +
>   /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>   void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   		      struct image_info *img_info)
> @@ -445,6 +448,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   		return;
>   	}
>   
> +	if (!ret && mhi_cntrl->cntrl_dev->of_node) {
> +		ret = of_property_read_u32(mhi_cntrl->cntrl_dev->of_node,
> +					   "qrtr-instance-id", &instance);
> +		if (!ret) {
> +			instance &= QRTR_INSTANCE_MASK;
> +			mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
> +					    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
> +					    QRTR_INSTANCE_SHIFT, instance);


This violates the BHI spec which states that this register is read only 
from the host perspective.  You cannot write to it.


Overall, I get why you are attempting to do this, but solution proposed 
in this RFC is pretty bad.  I'm thinking it would be better to have the 
QCN9000 "generate" its node id based on the assigned PCI bus address 
(SBDF)  The current Router maintainers should probably weigh in to 
ensure that won't cause conflicts in the node id space.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
