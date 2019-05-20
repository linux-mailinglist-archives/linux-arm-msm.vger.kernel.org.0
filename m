Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFDE5240BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 20:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfETS5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 14:57:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44526 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfETS5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 14:57:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id w13so5033278wru.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tJAyJXTsyL/aojYOLcoP+1kKW6LofZI8dfFMh+ysm/4=;
        b=lAFT0NkKin5knk7wwDhCC6gyz6R2KCDj5LnsHxKFMhDnSmoMPQ6lNWKXnRe+AKW7IL
         mA3z6jSYm51D3ZWuI50171pETabcVWupPE7Ssyon/s/oKbkiCcHdqppUsixA2Tjie4hg
         0RapWRR0DT7PGYT+vc0mq/kJb7G+n+ogopJoBGJl17D7Y8nYapa+fMDESvu7Xtn9zIgO
         QfL5d8u28wa6pmlMBUKdql3GeGSTOW6N9YmNsisoIqEGHy3n2aDaKZRspMM8j83Gylz7
         bg2HLF00xxFw3aGGV265mu9KtkbDBo1RgAwv20CbyuHHwgFku87L3vs6x+Xnj2djfcWQ
         PbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tJAyJXTsyL/aojYOLcoP+1kKW6LofZI8dfFMh+ysm/4=;
        b=dlZjdIs6+uc8ZxSXB8J0ffJADkQFnsxtVlP6dzIqV5/Uq50zYvNkCw+xpzggplco63
         QNGsBil95jCpbd69OhKmlY+w/Y2qPKmrg9kth50A7rDlMPao1J+02rx4Us77uzo04UAU
         TPKI67UemT1S3Pw3FK3Bbo//X2lp6r5m8R4CVS8dvqISVnNCcWwtaN6Ct5DpN9bR3KWa
         KlinGUeFhv8VetuPxsNj5PToXmnvRabmmJ+Lhs5O0z4WZFRQJVbrKhKuwSilrpHoh09r
         f8XCp3iUXVJLbFzSuV3q5aF3bebuvA1pkrhWTMu7rUoqk7W8L5vfGVMFsnY3WP/u25RE
         ei2Q==
X-Gm-Message-State: APjAAAUZG55gOnnu4nG9guIJgqZ7O+2srtuIDkS2765EjOyllaT5lFS2
        WtLv5wXYmSAcrmy+aSYgmubD0fk4Md0=
X-Google-Smtp-Source: APXvYqwlnt/oummO4IhOP0B74AP6KgvD3t/cquTLPY4eri59+UYWj/Ga3SPL3zo6AKlYtyKZ3db8Jw==
X-Received: by 2002:a5d:4a92:: with SMTP id o18mr3932140wrq.80.1558378660998;
        Mon, 20 May 2019 11:57:40 -0700 (PDT)
Received: from [192.168.1.7] (139.red-79-146-81.dynamicip.rima-tde.net. [79.146.81.139])
        by smtp.gmail.com with ESMTPSA id n14sm14797489wrt.79.2019.05.20.11.57.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:57:40 -0700 (PDT)
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix XON/XOFF
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, sboyd@kernel.org, jslaby@suse.com,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
 <20190520185008.GX2085@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <ef705e54-78bb-27e2-5060-31056234dad3@linaro.org>
Date:   Mon, 20 May 2019 20:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190520185008.GX2085@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/20/19 20:50, Bjorn Andersson wrote:
> On Mon 20 May 11:38 PDT 2019, Jorge Ramirez-Ortiz wrote:
> 
>> When the tty layer requests the uart to throttle, the current code
>> executing in msm_serial will trigger "Bad mode in Error Handler" and
>> generate an invalid stack frame in pstore before rebooting (that is if
>> pstore is indeed configured: otherwise the user shall just notice a
>> reboot with no further information dumped to the console).
>>
>> This patch replaces the PIO byte accessor with the word accessor
>> already used in PIO mode.
>>
>> Fixes: 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> You missed Stephen's
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

argh sorry Stephen. can the maintainer add it when it gets merged or
shall I post V3?

> 
> Regards,
> Bjorn
> 
>> ---
>>  drivers/tty/serial/msm_serial.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
>> index 109096033bb1..23833ad952ba 100644
>> --- a/drivers/tty/serial/msm_serial.c
>> +++ b/drivers/tty/serial/msm_serial.c
>> @@ -860,6 +860,7 @@ static void msm_handle_tx(struct uart_port *port)
>>  	struct circ_buf *xmit = &msm_port->uart.state->xmit;
>>  	struct msm_dma *dma = &msm_port->tx_dma;
>>  	unsigned int pio_count, dma_count, dma_min;
>> +	char buf[4] = { 0 };
>>  	void __iomem *tf;
>>  	int err = 0;
>>  
>> @@ -869,10 +870,12 @@ static void msm_handle_tx(struct uart_port *port)
>>  		else
>>  			tf = port->membase + UART_TF;
>>  
>> +		buf[0] = port->x_char;
>> +
>>  		if (msm_port->is_uartdm)
>>  			msm_reset_dm_count(port, 1);
>>  
>> -		iowrite8_rep(tf, &port->x_char, 1);
>> +		iowrite32_rep(tf, buf, 1);
>>  		port->icount.tx++;
>>  		port->x_char = 0;
>>  		return;
>> -- 
>> 2.21.0
>>
> 

