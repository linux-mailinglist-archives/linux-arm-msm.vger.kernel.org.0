Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7F22294FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 11:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgGVJcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 05:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVJcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 05:32:52 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C3FC0619DC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 02:32:52 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so1333395wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 02:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vwHeqn+GJzfqT5CHnpILDuTc+uk5/83NXLaFNZ81FAQ=;
        b=SJDv4Myfu5X3zHK+ZO/6qmjypR9DI38Rgn1FDEfoZriY45kXLlNSIHTHaayb97o7Tj
         AVB1Ooh66VJYwzvW+NqHyeRSkplkbsr3J7TJyNwCLkJ2Ath/oqP3/vatAKAZ3r0dZzI7
         9T5d3kG7aV5MEzkr0zK29kX8VDMu+qcj+PKmgoJ7rbnZZTAliolbgxP1NQmcJIAB0qzV
         qXvozH6KKekeMfKI+j3eZePPuh71BarOqpbBD0+GmaOzF6uWcDOjBLXfrFaLkY/iwSdw
         SMHaB5HK3+4iBzNk1Wza8n8SXCVf1zJa9fncDbxYka43v0tPapuGYuc396NgYt6lSDTw
         45yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vwHeqn+GJzfqT5CHnpILDuTc+uk5/83NXLaFNZ81FAQ=;
        b=oqJDK/NJhqf6Ap9hiboaYaQ2NUIONUcnVQmzVpJ5cfjuP4Iq/P5l0jErKhsGnVS9+H
         WHl6sK/1qITCWqR3lYJCJ2TQdnJ54SmOFeQdyxnSAUXsDugRP3g3r3/kteQUPS06Adom
         CK9r55InvyQeV69PDPGPvcMaumQpL1iqdKqktuOg5KJgrzdxWu1QGjhdGRcVJz6+akAt
         7D5edLzOZi/HODJGty9OtqOwDJ9gcTCoLffyISvVA2pmFIVCBbdlh5YhcpZPnoU56I1e
         IkMKndijCAHPVfpCNxuRGMnW8M/Y42qXxDjcBGEjiFoOVXAr3fg368eG2qqBY2ci3jQg
         sLyQ==
X-Gm-Message-State: AOAM533WX3925Lw0yJjTeJLu6VjL3FMeQfopRXInwfjVI68vZnu/vsjz
        Q1BpJPTdY72JU1osIHNIdKEAbMozTE8=
X-Google-Smtp-Source: ABdhPJy+YLy8wuuNSuXK5kp8TEQtybRcvNVmXB/t2lxxEDfw5VOpIW+z+1gT7UDISw2IRJ9pa9exiA==
X-Received: by 2002:a1c:7d85:: with SMTP id y127mr8112024wmc.181.1595410371197;
        Wed, 22 Jul 2020 02:32:51 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id w16sm44813847wrg.95.2020.07.22.02.32.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 02:32:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] nvmem: qcom-spmi-sdam: Enable multiple devices
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Shyam Kumar Thella <sthella@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <1595360761-640-1-git-send-email-gurus@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a81a3563-1a87-d302-054e-bc20db8de1e7@linaro.org>
Date:   Wed, 22 Jul 2020 10:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595360761-640-1-git-send-email-gurus@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/07/2020 20:46, Guru Das Srinagesh wrote:
> Using pdev->id as the nvmem's config ID (which, by default, is
> NVMEM_DEVID_NONE) prevents multiple instances of this driver from
> probing because of the following error:
> 
>    sysfs: cannot create duplicate filename '/bus/nvmem/devices/spmi_sdam'
> 
> Use NVMEM_DEVID_AUTO as the NVMEM config ID to fix the issue.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>   drivers/nvmem/qcom-spmi-sdam.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Applied thanks,

--srini
> 
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> index 8682cda..a72704c 100644
> --- a/drivers/nvmem/qcom-spmi-sdam.c
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2017 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
>    */
>   
>   #include <linux/device.h>
> @@ -141,7 +141,7 @@ static int sdam_probe(struct platform_device *pdev)
>   
>   	sdam->sdam_config.dev = &pdev->dev;
>   	sdam->sdam_config.name = "spmi_sdam";
> -	sdam->sdam_config.id = pdev->id;
> +	sdam->sdam_config.id = NVMEM_DEVID_AUTO;
>   	sdam->sdam_config.owner = THIS_MODULE,
>   	sdam->sdam_config.stride = 1;
>   	sdam->sdam_config.word_size = 1;
> 
