Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E2562F5D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241595AbiKRNU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbiKRNUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:20:55 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A3742F47
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:20:54 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id z24so6758153ljn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyB2ntNPI49OFNXMXBY0Un17H3Pjxvbh7kCsd2D+MuE=;
        b=Mi0nh5gVWEsKv5sD2gMJnczAgqtuI3S8yWA0pJW/mJBSW8fBL4/jNDxLkj18oW3UyO
         MI3Upw3sCdAp2TqvHfcXUBnsPepQbKj0rUXeJl5FkALH177o76l7WGbyIp0TqOw6IEU5
         dmZUp7bofMctJxjlEbK7lNK4uz34C2oaAm/yL4toBWZm5XKJw9+LcYARfMgsz7D7pPE8
         PE/Qdk4sDA9V0qFQAVi17tC9Mk72cX6bZN0BVFmvRAbEe/pPl4wnJ57MuKF1vlO1c6lo
         M2oS6OM/SYf1lVio7cnRdA6zsknwCWi2BbxxBO0dY5o21YxyLI4xPR3G/idUbeQ3BoE/
         J12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyB2ntNPI49OFNXMXBY0Un17H3Pjxvbh7kCsd2D+MuE=;
        b=bE466Y/KtDs7Lj86xRo/Ziyw8lDzavh1Fny/DJtFGHeKTyuSj1XUOkgEmA1idRTFiY
         Vh4l2dm4tTITg5hnP0S9a5rt8Q7WQyx6SiG3a6M2LI4KQiY9f32aNVWWxLxUCkX/A7yn
         MzUGK/evN5pck3bWn39GIm/qEo/TZniFk+AsIi9DOU2ITt6zGrVch14tW/ZjuyS8Yw8A
         kdsMQDPDhx+ksz+/nRMOl1RJloCdKe6Ae8UQkq7xWHOl40InctyAe8ly9x4q2sdlUA/z
         Kkq5E1G2W6CqKfH47L99svz9YqWohGgPHD916llKfqNv6gfZ5/9mSMaPgNIrQynr20JI
         g5Sw==
X-Gm-Message-State: ANoB5pk9jJlvR6seU19x+92waIfuQJjUbc6YQRORgONFMuYQJmDS8Qxa
        kcDEyJT7kP751D2xgtZO/DyfD4U0J+uIRwHq
X-Google-Smtp-Source: AA0mqf7Xa0Q/8iK0gOlT7PawhAU1ASOGHyGUdnxLTIL+4aMRTKMrpNpZsUSdTxIxm5U6nRUuIRLckQ==
X-Received: by 2002:a2e:b88e:0:b0:277:38d8:1e28 with SMTP id r14-20020a2eb88e000000b0027738d81e28mr2717445ljp.46.1668777652556;
        Fri, 18 Nov 2022 05:20:52 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id z20-20020a196514000000b004b257fef958sm662505lfb.94.2022.11.18.05.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:20:52 -0800 (PST)
Message-ID: <e5c83042-8816-7b1c-7772-e0a4877322dd@linaro.org>
Date:   Fri, 18 Nov 2022 14:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 03/15] tty: serial: qcom-geni-serial: align #define values
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
 <20221118122539.384993-4-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221118122539.384993-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2022 13:25, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Keep the #define symbols aligned for better readability.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/tty/serial/qcom_geni_serial.c | 62 +++++++++++++--------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 7af5df6833c7..97ee7c074b79 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -39,57 +39,57 @@
>   #define SE_UART_MANUAL_RFR		0x2ac
>   
>   /* SE_UART_TRANS_CFG */
> -#define UART_TX_PAR_EN		BIT(0)
> -#define UART_CTS_MASK		BIT(1)
> +#define UART_TX_PAR_EN			BIT(0)
> +#define UART_CTS_MASK			BIT(1)
>   
>   /* SE_UART_TX_STOP_BIT_LEN */
> -#define TX_STOP_BIT_LEN_1	0
> -#define TX_STOP_BIT_LEN_2	2
> +#define TX_STOP_BIT_LEN_1		0
> +#define TX_STOP_BIT_LEN_2		2
>   
>   /* SE_UART_RX_TRANS_CFG */
> -#define UART_RX_PAR_EN		BIT(3)
> +#define UART_RX_PAR_EN			BIT(3)
>   
>   /* SE_UART_RX_WORD_LEN */
> -#define RX_WORD_LEN_MASK	GENMASK(9, 0)
> +#define RX_WORD_LEN_MASK		GENMASK(9, 0)
>   
>   /* SE_UART_RX_STALE_CNT */
> -#define RX_STALE_CNT		GENMASK(23, 0)
> +#define RX_STALE_CNT			GENMASK(23, 0)
>   
>   /* SE_UART_TX_PARITY_CFG/RX_PARITY_CFG */
> -#define PAR_CALC_EN		BIT(0)
> -#define PAR_EVEN		0x00
> -#define PAR_ODD			0x01
> -#define PAR_SPACE		0x10
> +#define PAR_CALC_EN			BIT(0)
> +#define PAR_EVEN			0x00
> +#define PAR_ODD				0x01
> +#define PAR_SPACE			0x10
>   
>   /* SE_UART_MANUAL_RFR register fields */
> -#define UART_MANUAL_RFR_EN	BIT(31)
> -#define UART_RFR_NOT_READY	BIT(1)
> -#define UART_RFR_READY		BIT(0)
> +#define UART_MANUAL_RFR_EN		BIT(31)
> +#define UART_RFR_NOT_READY		BIT(1)
> +#define UART_RFR_READY			BIT(0)
>   
>   /* UART M_CMD OP codes */
> -#define UART_START_TX		0x1
> +#define UART_START_TX			0x1
>   /* UART S_CMD OP codes */
> -#define UART_START_READ		0x1
> -
> -#define UART_OVERSAMPLING	32
> -#define STALE_TIMEOUT		16
> -#define DEFAULT_BITS_PER_CHAR	10
> -#define GENI_UART_CONS_PORTS	1
> -#define GENI_UART_PORTS		3
> -#define DEF_FIFO_DEPTH_WORDS	16
> -#define DEF_TX_WM		2
> -#define DEF_FIFO_WIDTH_BITS	32
> -#define UART_RX_WM		2
> +#define UART_START_READ			0x1
> +
> +#define UART_OVERSAMPLING		32
> +#define STALE_TIMEOUT			16
> +#define DEFAULT_BITS_PER_CHAR		10
> +#define GENI_UART_CONS_PORTS		1
> +#define GENI_UART_PORTS			3
> +#define DEF_FIFO_DEPTH_WORDS		16
> +#define DEF_TX_WM			2
> +#define DEF_FIFO_WIDTH_BITS		32
> +#define UART_RX_WM			2
>   
>   /* SE_UART_LOOPBACK_CFG */
> -#define RX_TX_SORTED	BIT(0)
> -#define CTS_RTS_SORTED	BIT(1)
> -#define RX_TX_CTS_RTS_SORTED	(RX_TX_SORTED | CTS_RTS_SORTED)
> +#define RX_TX_SORTED			BIT(0)
> +#define CTS_RTS_SORTED			BIT(1)
> +#define RX_TX_CTS_RTS_SORTED		(RX_TX_SORTED | CTS_RTS_SORTED)
>   
>   /* UART pin swap value */
> -#define DEFAULT_IO_MACRO_IO0_IO1_MASK		GENMASK(3, 0)
> +#define DEFAULT_IO_MACRO_IO0_IO1_MASK	GENMASK(3, 0)
>   #define IO_MACRO_IO0_SEL		0x3
> -#define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
> +#define DEFAULT_IO_MACRO_IO2_IO3_MASK	GENMASK(15, 4)
>   #define IO_MACRO_IO2_IO3_SWAP		0x4640
>   
>   /* We always configure 4 bytes per FIFO word */
