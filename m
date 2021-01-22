Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B392FFC0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 06:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhAVFSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 00:18:48 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:13509 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbhAVFSr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 00:18:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611292701; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=vOZ8V3PI+mLIfXX89NrnhfpLX937QB0x9p+EEU3L+2Q=; b=HlCmoaNilgSthiI/NGZvu8xUqX3PdzfK2p+Bl4CR7trBT3MKzHf6pdrrej9hiCjEdUJMfiKR
 B/9jbGo9EooobFj74BFTfuv6h4Ken2+rKYkgg5AbcJmY5DYSMimqU8vM7M8PThMK2PaGzwZw
 FgdVJlWwUDN/q5G3Oo4XzScVkFc=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 600a5ffb5677aca7bd0baefc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 05:17:47
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0ADF2C43463; Fri, 22 Jan 2021 05:17:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C17D0C433CA;
        Fri, 22 Jan 2021 05:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C17D0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 21 Jan 2021 21:17:43 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.chen@nxp.com
Subject: Re: [PATCH v6 1/4] usb: gadget: udc: core: Introduce check_config to
 verify USB configuration
Message-ID: <20210122051743.GE31406@jackp-linux.qualcomm.com>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611288100-31118-2-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On Thu, Jan 21, 2021 at 08:01:37PM -0800, Wesley Cheng wrote:
> Some UDCs may have constraints on how many high bandwidth endpoints it can
> support in a certain configuration.  This API allows for the composite
> driver to pass down the total number of endpoints to the UDC so it can verify
> it has the required resources to support the configuration.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/udc/core.c | 9 +++++++++
>  include/linux/usb/gadget.h    | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 4173acd..469962f 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1003,6 +1003,15 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
>  }
>  EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
>  
> +int usb_gadget_check_config(struct usb_gadget *gadget, unsigned long ep_map)

You should probably add a kernel-doc for this function.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
