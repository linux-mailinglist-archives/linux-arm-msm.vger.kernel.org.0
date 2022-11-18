Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BDA62F5DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241837AbiKRNXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241875AbiKRNXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:23:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947F07FC10
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:23:11 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id be13so8197477lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGk0T32TBu5Feib+GN4MZpX75E7t6+QlVj5xDhxgrhg=;
        b=ZeZyveJTXKuuJzzddyWhZo73GbwQMoPxOHdUyzaykfPA3crzFwOqn5rM/6f+iGZXPE
         x0hE/kYfF1LZzsKr4FCvtmVn98l+eF77HP4adbZl7m5t2skDhKDZyn4AhfWoYM8ial9k
         yrertMFJdaT8RgpC0wfFKUNkwRViEkCXp7GioMGZa0kOZhGQPWdC9XLfqnndPEMIOX+w
         CsKxv55UoOw5456X4mD6vWma/r1w91Px3cEprtHEVytrS9bkwCMJqyGrZEuQ6dGVY+Tc
         XChNCZF+xYK1wcz5qBUqeGbSALbM98DNQsfXOfObdDa4wFLEGg7FDpljobYqLiCjUps3
         YBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NGk0T32TBu5Feib+GN4MZpX75E7t6+QlVj5xDhxgrhg=;
        b=eno1G+zA2qNM5Bp/KwhQu4+Nk/lq2+5j7rHHQ2Loe6F/blKV0qVB1qRyOv2zVfRwPa
         wzaDO0ACf7SdesV4LAst3wgUxPVyD+CMsimJLX6M5kNhjNFDLqU9EI5/iR2Ac+TjlLj0
         qhzQ6EpugDqIxbkPwFbEBQSPBoW11ZB5i9dc7aOdWBLekaAMYeBg1QY5OiyafSCS3u7k
         94yqKHQMCkXvB4tqFuCcFkVhw0uSz1b7XYZtSeh16mhp0W1T9qUi3M0PvOIeekueQj7b
         J1K1Q873EEH6niB+uX8vBHqH0tZf6itYn3l5/+0W+Cxy7NPMSET6KSf9hAyu9Vte3CSp
         sW0g==
X-Gm-Message-State: ANoB5pka7+piGW3dapjwf89rNce2x9g30Z/6vJQCs8wy6N5E6uTZSzG9
        t0oxeod4j3J15ylgbq4dQExIlg==
X-Google-Smtp-Source: AA0mqf5v7a49GTkiDgFNOAvwfh1TRTOts9M5NJut4SRWEqdzvDgbQrEVjFmPcwaEz5mpvodWykTJEw==
X-Received: by 2002:ac2:5593:0:b0:4b0:40e5:6c2f with SMTP id v19-20020ac25593000000b004b040e56c2fmr2280738lfg.301.1668777789954;
        Fri, 18 Nov 2022 05:23:09 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id i16-20020a198c50000000b0048afb8b8e53sm659911lfj.80.2022.11.18.05.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:23:09 -0800 (PST)
Message-ID: <1d8459b6-e4d3-3e6b-7e6f-bc55bd9bfa8b@linaro.org>
Date:   Fri, 18 Nov 2022 14:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 05/15] tty: serial: qcom-geni-serial: remove stray
 newlines
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
 <20221118122539.384993-6-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221118122539.384993-6-brgl@bgdev.pl>
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
> Remove stray newlines around #ifdefs for consistency with the rest
> of the driver code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/tty/serial/qcom_geni_serial.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 1db2795804e9..dd1491a72deb 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -317,7 +317,6 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
>   }
>   
>   #ifdef CONFIG_CONSOLE_POLL
> -
>   static int qcom_geni_serial_get_char(struct uart_port *uport)
>   {
>   	struct qcom_geni_private_data *private_data = uport->private_data;
> @@ -542,7 +541,6 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
>   {
>   	return -EPERM;
>   }
> -
>   #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
>   
>   static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
