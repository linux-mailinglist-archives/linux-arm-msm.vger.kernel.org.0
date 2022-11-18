Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06B362F5F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241392AbiKRN1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241560AbiKRN1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:27:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB0C85A2E
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:27:12 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j16so8170660lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb+SwYsu46wttKtERbGl06o8mw6wcmAJG3y7WTEqJgM=;
        b=LGWJY5OcVIgYmrgPT635tYwh7YyerAwyfo4NKcT05MTRTX+6wCdshy8MEs2yY3BCBp
         6nbpwyu1cuwknY6xVSygjntz7X4Kze+vYFZZ/0OdBA6dD4fOsXgORcJkVPen9orgJ0VR
         y/RJZ2XL4wvHKvSYb26v/pJC4a3kydo5EtGFk2GYCVFSXiNLzYqR1u8tnsaYopjsclqJ
         GV8eCNoC7tM63SvZSQ48WXJRZjW98a45NddqKq5W7irawHizWcs1DtOnj5SaFFInr1ht
         i3nfkCcpOSTsItjYVwhGicMFAF4OC6bU8NOLMFD42CZyaZUrWeoktdrmJi2uyyRAB20s
         fgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pb+SwYsu46wttKtERbGl06o8mw6wcmAJG3y7WTEqJgM=;
        b=qTq1bAjTcpfavCWlW/MI5WwJk9YXjLDCtUF0ET9J379b1fmgfcqUhC3BWAxVdxNLva
         zRxWu/Ww9b8P8XfDT4OGFylplS1r60/m3G+ZfYK7Jh4zi2GEYw7Vwlwubh8riqMvWk7r
         XHT/GTjKm3p7JfhOhr1mvae5og/fyVRU/xxu7050rMpx7hSsFbMY+OYaJVF54hnvrlTu
         E0rAOA+V/OvZjLJXyivtRa/3bE3+WEvuaomyqpq1CWj7Q+PNiFDU2W3RUlOSS3DH5TOD
         /QM888Kq1jBJxY6NHHg7VtB3BY+jp472hbhpR6gRVaME/ui1Kg8+UvhLywTh77waXAHt
         9wEA==
X-Gm-Message-State: ANoB5pme92pak/7CU4QOTE4Ydfs8r0TJLQZ5WuwQas9vNN39YCbxGEZu
        dX+h/bcXS0+AkaZIyuFSiBgxNQ==
X-Google-Smtp-Source: AA0mqf48HjEBueln40TrF7hdJp8v3REaMkCfFZLfFIfNZ2tcnoOGLlb9dgnOseF8Xhbjg2nQC9b0pA==
X-Received: by 2002:a19:5047:0:b0:4ab:7f8d:46c with SMTP id z7-20020a195047000000b004ab7f8d046cmr2298905lfj.383.1668778030685;
        Fri, 18 Nov 2022 05:27:10 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512370800b00497a3e11608sm654209lfr.303.2022.11.18.05.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:27:10 -0800 (PST)
Message-ID: <2ccecd72-0c6e-1268-0406-8f147d4b1091@linaro.org>
Date:   Fri, 18 Nov 2022 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 08/15] tty: serial: qcom-geni-serial: split out the FIFO
 tx code
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20221118122539.384993-1-brgl@bgdev.pl>
 <20221118122539.384993-9-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221118122539.384993-9-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2022 13:25, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_geni_serial_handle_tx() is pretty big, let's move the code that
> handles the actual writing of data to a separate function which makes
> sense in preparation for introducing a dma variant of handle_tx().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/tty/serial/qcom_geni_serial.c | 60 +++++++++++++++------------
>   1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 39041538e5d2..4b155ca0ac74 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -701,19 +701,48 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
>   	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
>   }
>   
> +static int qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> +					    unsigned int chunk)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	struct circ_buf *xmit = &uport->state->xmit;
> +	size_t remaining = chunk;
> +	int i, tail = xmit->tail;
> +
> +	for (i = 0; i < chunk; ) {
> +		unsigned int tx_bytes;
> +		u8 buf[sizeof(u32)];
> +		int c;
> +
> +		memset(buf, 0, sizeof(buf));
> +		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
> +
> +		for (c = 0; c < tx_bytes ; c++) {
> +			buf[c] = xmit->buf[tail++];
> +			tail &= UART_XMIT_SIZE - 1;
> +		}
> +
> +		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
> +
> +		i += tx_bytes;
> +		uport->icount.tx += tx_bytes;
> +		remaining -= tx_bytes;
> +		port->tx_remaining -= tx_bytes;
> +	}
> +
> +	return tail;
> +}
> +
>   static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
>   		bool active)
>   {
>   	struct qcom_geni_serial_port *port = to_dev_port(uport);
>   	struct circ_buf *xmit = &uport->state->xmit;
>   	size_t avail;
> -	size_t remaining;
>   	size_t pending;
> -	int i;
>   	u32 status;
>   	u32 irq_en;
>   	unsigned int chunk;
> -	int tail;
>   
>   	status = readl(uport->membase + SE_GENI_TX_FIFO_STATUS);
>   
> @@ -732,7 +761,6 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
>   	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
>   	avail *= BYTES_PER_FIFO_WORD;
>   
> -	tail = xmit->tail;
>   	chunk = min(avail, pending);
>   	if (!chunk)
>   		goto out_write_wakeup;
> @@ -747,29 +775,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
>   					uport->membase + SE_GENI_M_IRQ_EN);
>   	}
>   
> -	remaining = chunk;
> -	for (i = 0; i < chunk; ) {
> -		unsigned int tx_bytes;
> -		u8 buf[sizeof(u32)];
> -		int c;
> -
> -		memset(buf, 0, sizeof(buf));
> -		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
> -
> -		for (c = 0; c < tx_bytes ; c++) {
> -			buf[c] = xmit->buf[tail++];
> -			tail &= UART_XMIT_SIZE - 1;
> -		}
> -
> -		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
> -
> -		i += tx_bytes;
> -		uport->icount.tx += tx_bytes;
> -		remaining -= tx_bytes;
> -		port->tx_remaining -= tx_bytes;
> -	}
> -
> -	xmit->tail = tail;
> +	xmit->tail = qcom_geni_serial_send_chunk_fifo(uport, chunk);
>   
>   	/*
>   	 * The tx fifo watermark is level triggered and latched. Though we had
