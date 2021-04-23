Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5CC368BD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 06:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbhDWEKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 00:10:39 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:36722 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhDWEKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 00:10:38 -0400
Received: by mail-wr1-f46.google.com with SMTP id m9so34186899wrx.3;
        Thu, 22 Apr 2021 21:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NEAj7YFHV/fmMkK3zL2KqXVEqxafCEMmM3EwgPewYr4=;
        b=ooliFFLZL3dusTWCTtlNdcIxIS7NcDqEsd13EhLpJXuGl5iIYjdZqVx8ht1Hk7+oZ1
         0YNQJwWB21tCcivtnQ2JIgUmuUZlJJGVb/PtKlnj1oR9P+EMKKBcdtStO/4o1kZ7E2Pp
         fBGWtORmNAfQ2EKiraZrQtk7I4O+kPpqBsfc2kaBV1ppwKU4zuaF50CNu7O8h/jon6ib
         0MiYerj6P8PXL7Rp/cMLCvsbRcbvspYQ8XZ1A4HEi0aJTZov/7rAwAcT0FZ9OP+nJzRd
         UvGcmjlqnj2Mwkb/dXtti5o4gOQUj8iELXVd8cUEYQ0QsNAUeHQQun/Rsdx9QDuh2y8X
         A0Jw==
X-Gm-Message-State: AOAM533971O1BudD7wHo1m9olCe+ZiKZYaIFhAbDIsP16cFZH7SZxMl3
        pxgKqe+XlY3UQGmjHCw2I4M+KxX3qjg=
X-Google-Smtp-Source: ABdhPJy91wnLa1xxDLsC3Osh347tC4UnSQSLN6RUdQnMnZwYRVXubw2xB6YOI/SVDdvTlA4H0L2Ikw==
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr1823482wrd.177.1619151000110;
        Thu, 22 Apr 2021 21:10:00 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id l7sm7832051wrb.35.2021.04.22.21.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 21:09:59 -0700 (PDT)
Subject: Re: [PATCH] soc: qcom-geni-se: remove redundant initialization to
 variable line
To:     Colin King <colin.king@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210422125810.248166-1-colin.king@canonical.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <06eab84e-db3d-44a5-44d8-5e09bd876283@kernel.org>
Date:   Fri, 23 Apr 2021 06:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210422125810.248166-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22. 04. 21, 14:58, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable line being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/serial/qcom_geni_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 99375d99f6fa..c5f2a4fa2bb1 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1338,7 +1338,7 @@ static const struct uart_ops qcom_geni_uart_pops = {
>   static int qcom_geni_serial_probe(struct platform_device *pdev)
>   {
>   	int ret = 0;
> -	int line = -1;
> +	int line;
>   	struct qcom_geni_serial_port *port;
>   	struct uart_port *uport;
>   	struct resource *res;
> 


-- 
js
suse labs
