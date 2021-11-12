Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B0E44EF43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 23:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhKLWaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 17:30:55 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40693 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhKLWaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 17:30:55 -0500
Received: by mail-oi1-f176.google.com with SMTP id bk14so20530571oib.7;
        Fri, 12 Nov 2021 14:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vQPRv80bc8SYmXYBWVHsPdB/KpWaN0qWlOQNTUrjSMk=;
        b=DyXFUL7hlEh0E7LaS3fXQR7xHeqmsYxt2oGt7/ZlD2wwHGJ2WT+4W75Hd6FqkZcmeJ
         NFR60IhXCRVj6usDPPbn4LTSvMvFIUHwzLZQzqHx99WPRjf4/WOQ0GaiUSOIV6+sO5cB
         hUjbZdyFUv3XK6v2fcEXTIx/i+irU4u1/XUcU5RQln623Tk315FKZ3NNoMmurHOCeUAa
         pr1Dn29llOcSNbKntoISLL39FkwYCa0iTtopyDF4ttkmaUwFsAoDvOBXWSf37Rk+af8C
         oK5SIKxq2SxMrEFsNkV3uW3cjIWCzASK3sly573GBD2kVPz6DQ5Y+QvDVfEhtMP0yVDb
         eSjg==
X-Gm-Message-State: AOAM5322lhSCdJfNIKT2M+YA0TwXVOJbXUXV2v+UbnHJEkd+Ez3jFME+
        xZnAZs/FxSnYmuHKhv4/hw==
X-Google-Smtp-Source: ABdhPJxbnpWk0b2Fa+X5OdC+d0rg3/J+o676Yv1+6M0xlBeX2KddE2j4h3c3LHlDwuKVqADB3818Rg==
X-Received: by 2002:aca:ba55:: with SMTP id k82mr28770010oif.167.1636756083777;
        Fri, 12 Nov 2021 14:28:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o2sm1126496oik.11.2021.11.12.14.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:28:03 -0800 (PST)
Received: (nullmailer pid 3488745 invoked by uid 1000);
        Fri, 12 Nov 2021 22:28:02 -0000
Date:   Fri, 12 Nov 2021 16:28:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
Subject: Re: [PATCH v3 1/7] dt-bindings: usb: Add qcom,pmic-usb-typec
 dt-binding header
Message-ID: <YY7qcrf3axIWcQni@robh.at.kernel.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105033558.1573552-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 05, 2021 at 03:35:52AM +0000, Bryan O'Donoghue wrote:
> Adds a series of defines which are used in the DTS and type-c driver for
> identifying interrupts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../usb/typec/tcpm/qcom,pmic-usb-typec.h       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
> 
> diff --git a/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
> new file mode 100644
> index 0000000000000..263c999b59b8d
> --- /dev/null
> +++ b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Did you check with QCom on this license choice for DT files?

> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
> +#define _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
> +
> +#define PMIC_TYPEC_OR_RID_IRQ		0x0
> +#define PMIC_TYPEC_VPD_IRQ		0x1
> +#define PMIC_TYPEC_CC_STATE_IRQ		0x2
> +#define PMIC_TYPEC_VCONN_OC_IRQ		0x3
> +#define PMIC_TYPEC_VBUS_IRQ		0x4
> +#define PMIC_TYPEC_ATTACH_DETACH_IRQ	0x5
> +#define PMIC_TYPEC_LEGACY_CABLE_IRQ	0x6
> +#define PMIC_TYPEC_TRY_SNK_SRC_IRQ	0x7
> +
> +#endif
> -- 
> 2.33.0
> 
> 
