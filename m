Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B357E265555
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 01:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgIJXGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 19:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgIJXGn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 19:06:43 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4561C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 16:06:42 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e7so6278755qtj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NDyjd2iMqequc7LRMcRbG7To5TWvVyedy/KOdmHGA9k=;
        b=gSNaWPdEY2QnZcjph+epkQoIRckMJ874n0EFerBdUUjyUl30uIWC34VWoHykoJjQ2E
         LN6wVH8yVGRLppCxyuiY0kt80KWFDFQiTkmaSgmu+hAuWpTiNqVNLOP8xx0sm3oagMAK
         LS3rYYs5b0CjLr4QYfdFymg1HeGqT4gMXc/0KpHr6N7uvpfAqSB4j7t78+WfK6eBcu6R
         TNXKjNwS/tZ/jQ8dslR7h8Wx51Mbm4uE7jjsvWar+SQ4a1TA3Yk1hP+zwMFH0HhgCVIr
         lDdfV7C3fE7uYZh82uHb5FyEvrmCINbklup9YkD6ZmBLHnkbyLW+++sR1/UOpvP+1LPq
         3DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NDyjd2iMqequc7LRMcRbG7To5TWvVyedy/KOdmHGA9k=;
        b=Ih89cOvoHyHLXipTmhmNe//VNTvjV8NLbwxHwjlacqUoEPSA8Z4jZ1j/TrMjT8rQOj
         CNMRhfE1kYCug+WPvDYeHhXMFC780nGz5YyZ4xUe3HjYqw9FA7+2qY5rR2lQ15evjlBa
         XNJrbMd/RKjiwFZH/TloG7y8yoAb8o0kZOLNDxx+GaV2NbYVoWv4Bj5Rms8CsIvJu2oC
         7+mZhoM1bQLNU8nFs/oYBIc0i+QrWMK4SHJ9M5II4ULpvqpXbtkHb9Dnc448csnHBlUv
         +XWotPTucrNN5ENrIRyz5DdLdfh6KZzixkXHffF+haFe7qi4mixitiBH2MFm/d7hH/Lc
         vKhA==
X-Gm-Message-State: AOAM530Njpv3vy5bXpQTla3QO2OwkiBwSwlw+WV+Eb71/LzHdargO/JZ
        GpIz3TH18+V+b+ONGzCGUcTLDw==
X-Google-Smtp-Source: ABdhPJwUNn1cTdcJJNctsCsTgJWF1pa/DKRujT7/DrPwH/+LKqQh/m6CHBbRIBeoyfdun9zY14Czpw==
X-Received: by 2002:ac8:7188:: with SMTP id w8mr3165127qto.134.1599779201381;
        Thu, 10 Sep 2020 16:06:41 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id u55sm288593qtu.42.2020.09.10.16.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 16:06:40 -0700 (PDT)
Date:   Thu, 10 Sep 2020 23:06:39 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>, gregkh@linuxfoundation.org
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 4/4] tty: serial: qcom_geni_serial: Fix the UART
 wakeup issue
Message-ID: <20200910230639.GB472@uller>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599742438-16811-5-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Sep 12:53 UTC 2020, satya priya wrote:

> As a part of system suspend uart_port_suspend is called from the
> Serial driver, which calls set_mctrl passing mctrl as 0. This
> makes RFR high(NOT_READY) during suspend.
> 
> Due to this BT SoC is not able to send wakeup bytes to UART during
> suspend. Include if check for non-suspend case to keep RFR low
> during suspend.
> 

Seems reasonable.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Greg, I don't see this depending on anything else, will you pick this
patch through your tree? I will take the dts patches through the qcom
tree.

Regards,
Bjorn

> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - This patch fixes the UART flow control issue during suspend.
>    Newly added in V2.
> 
> Changes in V3:
>  - As per Matthias's comment removed the extra parentheses.
> 
> Changes in V4:
>  - No change.
> 
> Changes in V5:
>  - As per Matthias comment, fixed nit-pick in commit text.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3aa29d2..bc63c54 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
>  	if (mctrl & TIOCM_LOOP)
>  		port->loopback = RX_TX_CTS_RTS_SORTED;
>  
> -	if (!(mctrl & TIOCM_RTS))
> +	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
>  		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
>  	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
>  }
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
