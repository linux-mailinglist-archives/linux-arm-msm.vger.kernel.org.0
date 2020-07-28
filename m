Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF862301F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 07:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgG1Fks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 01:40:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58227 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgG1Fkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 01:40:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595914847; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mONsxEXPia/IwvtjrGztj4uoZZENrqPyBiOnXzhuICU=; b=bmPfjq+Titm30NtFoJ7ntUQ0PRM37wAx6x4b8zKvMkYIaLxoj8KFdAwCGEZQDUf69WMeZ5RY
 5OplIbJ/OWswpYziyoY/ANPihX8ijpDfpwalycJiY4PtyiRjZ7goRvbHKXc/xs/qkcEB4xkp
 9sOkfBzZSad4606GAGNTowEzwQQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f1fba5efcbecb3df126cd3f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 05:40:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 290D7C4339C; Tue, 28 Jul 2020 05:40:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AD85C433CB;
        Tue, 28 Jul 2020 05:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6AD85C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 3/3] tty: serial: qcom_geni_serial: Fix the UART wakeup
 issue
To:     satya priya <skakit@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <1449a9ea-9fbe-b2df-abda-dfc810e3cd9d@codeaurora.org>
Date:   Tue, 28 Jul 2020 11:10:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/24/2020 9:28 AM, satya priya wrote:
> As a part of system suspend we call uart_port_suspend from the
> Serial driver, which calls set_mctrl passing mctrl as NULL. This
> makes RFR high(NOT_READY) during suspend.
>
> Due to this BT SoC is not able to send wakeup bytes to UART during
> suspend. Included if check for non-suspend case to keep RFR low
> during suspend.


Reviewed-by: Akash Asthana <akashast@codeaurora.org>

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>   - This patch fixes the UART flow control issue during suspend.
>     Newly added in V2.
>
>   drivers/tty/serial/qcom_geni_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 07b7b6b..7108dfc 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
>   	if (mctrl & TIOCM_LOOP)
>   		port->loopback = RX_TX_CTS_RTS_SORTED;
>   
> -	if (!(mctrl & TIOCM_RTS))
> +	if ((!(mctrl & TIOCM_RTS)) && (!(uport->suspended)))
>   		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
>   	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
>   }

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

