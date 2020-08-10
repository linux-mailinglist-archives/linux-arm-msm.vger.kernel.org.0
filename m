Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B522405F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 14:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgHJMca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 08:32:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41025 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgHJMc1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 08:32:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597062746; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YATn2IQenXC1AZhlnO1R/hOYwlccU9AexyRTM+qvl5Y=; b=tCr7gazHDJ49mXJIYuaANd2fHNqN+TTZQ+d1hDnPB8jRtkBhNuCXAUEl+PcWqPpqwA7fPTjG
 SEFDKJdsH4AGNrvVH70D2YtrqBdrNW7+GuZjNI3cMMqjpunSpWu0bBF5WDp9dif8kZW5wp37
 LaCohAniZ+8lxpTjTPBsf5uXyrw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f313e49d96d28d61e297ded (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 12:32:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEE58C4339C; Mon, 10 Aug 2020 12:32:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [47.8.236.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04822C433C6;
        Mon, 10 Aug 2020 12:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04822C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] serial: qcom_geni_serial: Fix recent kdb hang
To:     Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kgdb-bugreport@lists.sourceforge.net,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
Date:   Mon, 10 Aug 2020 18:01:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 8/7/2020 10:49 AM, Douglas Anderson wrote:
> The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
> even if UART isn't console") worked pretty well and I've been doing a
> lot of debugging with it.  However, recently I typed "dmesg" in kdb
> and then held the space key down to scroll through the pagination.  My
> device hung.  This was repeatable and I found that it was introduced
> with the aforementioned commit.
>
> It turns out that there are some strange boundary cases in geni where
> in some weird situations it will signal RX_LAST but then will put 0 in
> RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.

IMO that means we received a word in RX_FIFO and it is the last word 
hence RX_LAST bit is set.

RX_LAST_BYTE is 0 means none of the bytes are valid in the last word.

In such scenario we should just read RX_FIFO buffer (to empty it), 
discard the word and return NO_POLL_CHAR. Something like below.

---------------------------------------------------------------------------------------------------------------------------------------------------------

                 else
                         private_data->poll_cached_bytes_cnt = 4;

                 private_data->poll_cached_bytes =
                         readl(uport->membase + SE_GENI_RX_FIFOn);
         }

+        if (!private_data->poll_cached_bytes_cnt)
+              return NO_POLL_CHAR;
         private_data->poll_cached_bytes_cnt--;
         ret = private_data->poll_cached_bytes & 0xff;
-------------------------------------------------------------------------------------------------------------------------------------------------------------

Please let me know whether above code helps.

I am not sure about what all scenario can leads to this behavior from 
hardware, I will try to get an answer from hardware team.

Any error bit was set for SE_GENI_S_IRQ_STATUS & SE_GENI_M_IRQ_STATUS 
registers?


I guess the hang was seen because *poll_cached_bytes_cnt* is unsigned 
int and it's value was 0, when it's decremented by 1 it's value become 
'4294967295' (very large) and dummy RX (0x00) would happen that

many times before reading any actual RX transfers/bytes.

Regards,

Akash


> This weird corner case is handled in qcom_geni_serial_handle_rx()
> where you can see that we only honor RX_LAST_BYTE if RX_LAST is set
> _and_ RX_LAST_BYTE is non-zero.  If either of these is not true we use
> BYTES_PER_FIFO_WORD (4) for the size of the last FIFO word.
>
> Let's fix kgdb.  While at it, also use the proper #define for 4.
>
> Fixes: e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work even if UART isn't console")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   drivers/tty/serial/qcom_geni_serial.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 07b7b6b05b8b..e27077656939 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -361,11 +361,16 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
>   			return NO_POLL_CHAR;
>   
>   		if (word_cnt == 1 && (status & RX_LAST))
> +			/*
> +			 * NOTE: If RX_LAST_BYTE_VALID is 0 it needs to be
> +			 * treated as if it was BYTES_PER_FIFO_WORD.
> +			 */
>   			private_data->poll_cached_bytes_cnt =
>   				(status & RX_LAST_BYTE_VALID_MSK) >>
>   				RX_LAST_BYTE_VALID_SHFT;
> -		else
> -			private_data->poll_cached_bytes_cnt = 4;
> +
> +		if (private_data->poll_cached_bytes_cnt == 0)
> +			private_data->poll_cached_bytes_cnt = BYTES_PER_FIFO_WORD;
>   
>   		private_data->poll_cached_bytes =
>   			readl(uport->membase + SE_GENI_RX_FIFOn);

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

