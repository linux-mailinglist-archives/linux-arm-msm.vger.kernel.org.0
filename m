Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4411F48B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 23:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgFIVUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 17:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFIVUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 17:20:46 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D78CC05BD1E;
        Tue,  9 Jun 2020 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=WgXhjIqEqe9lN7cFLebCYyX1j2EEIGbyPRJp6OZ6StQ=; b=iSOClD/EGXDodqQYh/GGg1ldvf
        B/CzvYN9Pgtsa0yKoS9s7lW+6UDa6tGzRZVAxbH9SrAeVARY6GXh1dRohebMA4KOqTeoUOuFgaLZ2
        G0QiBniW0Es2UJ5F2ugqsg3pvLpOvcpuA5h0v4JH3s5ePhRj6P8v+idH//lEKaCYJK50Xh9AZni58
        I1M+YP5qklkWX7Jik2hAAFYSdYHPVroVObYvDm2DnYqfuQcWEk6853RKYz3cp/qPW/yQNdbpZUCiV
        C/nyYLJhRZ44KyBC2PpdNeIwnFRnG/YTELzFECYgmRptcrIPeLw5ZOqHv7QASji7/ll7k63JIvjaI
        b6CAzXgQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jilfk-0006Hi-7j; Tue, 09 Jun 2020 21:20:40 +0000
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
To:     Wesley Cheng <wcheng@codeaurora.org>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org
References: <20200609205851.30113-1-wcheng@codeaurora.org>
 <20200609205851.30113-2-wcheng@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ccfc3e7c-d1ce-27bd-b24c-df5fbc468449@infradead.org>
Date:   Tue, 9 Jun 2020 14:20:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609205851.30113-2-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/20 1:58 PM, Wesley Cheng wrote:
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 559dd06..8de2520 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -73,6 +73,17 @@ config TYPEC_TPS6598X
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called tps6598x.ko.
> 

Hi,
Please spell "Type-C" like all of the other drivers do.

> +config TYPEC_QCOM_PMIC
> +	tristate "Qualcomm PMIC USB typec driver"
> +	depends on ARCH_QCOM
> +	help
> +	  Driver for supporting role switch over the Qualcomm PMIC.  This will
> +	  handle the type C role and orientation detection reported by the QCOM
> +	  PMIC if the PMIC has the capability to handle type C detection.
> +
> +	  It will also enable the VBUS output to connected devices when a
> +	  DFP connection is made.
> +
>  source "drivers/usb/typec/mux/Kconfig"
>  
>  source "drivers/usb/typec/altmodes/Kconfig"


-- 
~Randy

