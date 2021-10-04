Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8A842182B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhJDUJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhJDUJx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:09:53 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04F7C061745;
        Mon,  4 Oct 2021 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6NiXQi8FxQNfm2NDse7N8BfGltA2mCF/JILct9+dz5A=; b=IvWFtcK7h4k7Vmy6dpdXujm7yI
        mQdPZ4B0HaT3PYtufSwlwh/xglhOMcG20bRkm4jBUJQYB3Hf4XdzG4M6rBO9U849TDLp/JhD659kY
        Gwoa0rfBOy/GIu172JyiyMUTDyuT3hn2rcmMjll/B6GqhzAjsQzbsLDfn/S+9Ec+kEjxivzW4uv3T
        de5BndTeYo4ENzV5OrgNTTxSOa6Ykw7bI0wRpm1pt6ML40YSFf0RPjXn9D2Nm2L9jYOfeb6a3JA51
        7ET4f8Q4lVKxtAtW8Gbbx+16A5+s9b/UfkceikvMhe297oYqr1qDTh2rGJFcp+8VNQzki9cqP+dGh
        HNpp933g==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mXUFm-007wSC-Qt; Mon, 04 Oct 2021 20:08:02 +0000
Subject: Re: [PATCH V0 4/7] usb: common: eud: Added the driver support for
 Embedded USB Debugger(EUD)
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <73c1eb4f-6870-1c30-9b23-d991b8c8b35d@infradead.org>
Date:   Mon, 4 Oct 2021 13:08:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e6df4a21a283e822d15dedb7ffb3ae62c241999c.1633343547.git.schowdhu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/4/21 4:16 AM, Souradeep Chowdhury wrote:
> Add support for control peripheral of EUD (Embedded USB Debugger) to
> listen to events such as USB attach/detach, pet EUD to indicate software

   I don't quite understand: what pets the EUD? how does it do that?

> is functional.Reusing the platform device kobj, sysfs entry 'enable' is

      functional. Reusing

> created to enable or disable EUD.
> 
> To enable the eud the following needs to be done
> echo 1 >/sys/bus/platform/.../enable
> 
> To disable eud, following is the command
> echo 0 >/sys/bus/platform/.../enable
> 
> Signed-off-by: Souradeep Chowdhury<schowdhu@codeaurora.org>
> ---
>   Documentation/ABI/testing/sysfs-driver-eud |   7 +
>   drivers/usb/common/Kconfig                 |   9 +
>   drivers/usb/common/Makefile                |   1 +
>   drivers/usb/common/qcom_eud.c              | 256 +++++++++++++++++++++++++++++
>   4 files changed, 273 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-eud
>   create mode 100644 drivers/usb/common/qcom_eud.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
> new file mode 100644
> index 0000000..14a02da
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-eud
> @@ -0,0 +1,7 @@
> +What:		/sys/bus/platform/.../enable
> +Date:           October 2021
> +Contact:        Souradeep Chowdhury<schowdhu@codeaurora.org>
> +Description:
> +		The Enable/Disable sysfs interface for Embedded
> +		USB Debugger(EUD).This enables and disables the

		    Debugger (EUD). This enables

> +		EUD based on a 1 or a 0 value.


-- 
~Randy
