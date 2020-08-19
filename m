Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D002C24A088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgHSNuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 09:50:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45266 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728549AbgHSNtx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 09:49:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597844993; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3ier2e5oiSo0MfEVkuwaJW7VejVfgmvvXdzzCytsEoM=;
 b=nOFLt5g6i8lMAyPgvDK5HRFze0VQasxMBliM24gSw+ILVol7nS9Avdf2S0z+lUNdmUUmQ+w6
 jxj3sVO3t5qWx7Et6bF+IApqg9j294/rH3udIbh4ahr6MPmFe1nDB+oNca6Vq87DRPvZuEMB
 cX1vBlGdGFqxkARap3g0v+IG5Fw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f3d2df56835ad600b948282 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Aug 2020 13:49:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8CD3C4339C; Wed, 19 Aug 2020 13:49:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8E59C433C6;
        Wed, 19 Aug 2020 13:49:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 Aug 2020 19:19:39 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 3/3] tty: serial: qcom_geni_serial: Fix the UART wakeup
 issue
In-Reply-To: <20200817174222.GC2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
 <20200817174222.GC2995789@google.com>
Message-ID: <b2b384124971600e7b4faa3998aefdaa@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-17 23:12, Matthias Kaehlcke wrote:
> On Fri, Jul 24, 2020 at 09:28:02AM +0530, satya priya wrote:
>> As a part of system suspend we call uart_port_suspend from the
>> Serial driver, which calls set_mctrl passing mctrl as NULL. This
>> makes RFR high(NOT_READY) during suspend.
>> 
>> Due to this BT SoC is not able to send wakeup bytes to UART during
>> suspend. Included if check for non-suspend case to keep RFR low
>> during suspend.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V2:
>>  - This patch fixes the UART flow control issue during suspend.
>>    Newly added in V2.
>> 
>>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index 07b7b6b..7108dfc 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct 
>> uart_port *uport,
>>  	if (mctrl & TIOCM_LOOP)
>>  		port->loopback = RX_TX_CTS_RTS_SORTED;
>> 
>> -	if (!(mctrl & TIOCM_RTS))
>> +	if ((!(mctrl & TIOCM_RTS)) && (!(uport->suspended)))
> 
> Why all these parentheses, instead of:
> 
>     	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
> 
> ?

ok. Will remove the extra parentheses.
