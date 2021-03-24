Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839A13474CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 10:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhCXJjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 05:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbhCXJjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 05:39:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB63BC061763;
        Wed, 24 Mar 2021 02:39:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w37so30919893lfu.13;
        Wed, 24 Mar 2021 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vuuMNZyMbynJyv9nWBiTXWKNpHBcQegClLmvv2elQDQ=;
        b=rHg+uMJ/Jmtntx9B0U8Lky7O9aZtQ+iuLA8ivN7aEyeScg/4yXP5Wtuy35tQS975Kl
         e4QA48kuyFs87+fN/6eVB8bz6plXXKglIAN7P1v1bg5i+NhiB6QJ4/h/eIgUea7Z49MG
         DAnghQvlVU6shUkVPlNw043EDWj/Rw7uuE/nmD+/ReRBFEZG0BLTCa3F9ilHVJCnr9l9
         S5SsXiidRXXXb1DA9IP4JFv3gPynTgZ47DcfcpBuxYbr61cfwaC7SFvHjfV1PHBncml0
         Bg60W8KE+tmthQviV1B1quPNgJRkRAc6kjl4Le+oE1fhKAZQlfaKATKHMxVe4dT+epgu
         gTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vuuMNZyMbynJyv9nWBiTXWKNpHBcQegClLmvv2elQDQ=;
        b=iQK6fMFbuJiT1OIWzsznMTqAXdLTC6I4Ln1XpGa6rQ4UwMcld2wMUVTdqu1ecW5yjK
         gc0nWRP9cisiU8hOkN4CHfTk1slkRaE62+/hprw1omVB5gwcfbR+yfbxEBfasynt4uuK
         8xVmANE0tHQiCp5g6VoGfmoHjpnZctF1Kmy63QXFVN98PX72Zm95wPoHCDDKEC6y0VMy
         lCJTuEz95JoFqv6HezxJMG6FL97RjhXjGR6XDBXYSgdTakUPsr5G8yIjRURbVU6rDByv
         OhhGWV5cw95zDxdZaT/K6v9cHsS/IicOm1JbyVxC7LzfYihM+UTL8iqDus5htR3RC7X0
         rVCA==
X-Gm-Message-State: AOAM531ipqhI6mFNsYYTIH6/QEK75pcWn5Qxx3yN8RwpsRgEtgOXzSiv
        nKtLQLCrFnXEO99CWbn1IRDM0rnVd7GLXA==
X-Google-Smtp-Source: ABdhPJzGvZagKE62pBEOULPsNjpaf3bp1+vG+Uhs99091wPRLfeHlXZmpdTHu/ZZPBto2cnTQhK8fw==
X-Received: by 2002:a19:c7d7:: with SMTP id x206mr1488565lff.403.1616578750194;
        Wed, 24 Mar 2021 02:39:10 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.78.13])
        by smtp.gmail.com with ESMTPSA id c27sm177829lfh.146.2021.03.24.02.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 02:39:09 -0700 (PDT)
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <e6157db7-426b-04a8-3261-58b8674c9cda@gmail.com>
Date:   Wed, 24 Mar 2021 12:39:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

On 23.03.2021 22:27, Sandeep Maheswaram wrote:

> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)

   Space before (, please.

> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
> 
> Previously this was added in dwc3 qcom glue driver.
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=382449
> But observed kernel panic as glue driver shutdown getting called after
> iommu shutdown. As we are adding iommu nodes in dwc core node
> in device tree adding shutdown callback in core driver seems correct.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>   drivers/usb/dwc3/core.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 94fdbe5..777b2b5 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
[...]
> @@ -1976,6 +1987,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
>   static struct platform_driver dwc3_driver = {
>   	.probe		= dwc3_probe,
>   	.remove		= dwc3_remove,
> +	.shutdown   = dwc3_shutdown,

    Please indent = with tabs as above and below.

>   	.driver		= {
>   		.name	= "dwc3",
>   		.of_match_table	= of_match_ptr(of_dwc3_match),

MBR, Sergei
