Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE66E1BAA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 18:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgD0QsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 12:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgD0QsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 12:48:20 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0481C03C1A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 09:48:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z6so391704wml.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=;
        b=PW927SF/uC1q91VoVVYQ+1pXnGZTfNMH4wSEMOjVR2xohzu4yp9PaN8dJxdTffySOX
         Xg90snZYIfR+VLNbsD+aeBooFQY9hW3NEw/9WC8Ikg8Ua3CdX9GPiZdqolNYOZDjbOgW
         8nMoVwWgXPDSdBzjyuD773mLMsMK2wxXf5mig/QQUsR9SZEmYcZxvhi1gOQNi/fBDetD
         M2sOiHVkryGE0+k9XDDGVVwPrq/CFRbfFGAFfPhRys7RrcFrr1jI8b4rEFcrFjBdPlG+
         ClCJmIQPMDJNb+VxjUwfW0rLYaSZQtSlHUpG3wiJ9Of7PaDg2cLwtlVdadaEVGFXiIoU
         E5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V2IKgBBGeWQaS3nKENTTI6oYzwqYmWY3/5vxajcyiRg=;
        b=b2V+o4Jflz4t84z6Iz7wx9bj7r/vhVoeWxAfd+RPZPrvZKyGaCI/vaXlJGRLjBz/98
         0oVTfTaih23t6XsNYVK2s22X/iZoxkldOrxP+2x4cj6grWrBOgfr35xJ5jVlqh2jSkXr
         cxN9zB7M13uGmjfSKuWPoDyo0WdBGemKIQ3jq1i4vdjSxyPzvghY4v4B2J3szmEwgVbe
         xi9mNHbt/MdrqSO0grI3ySBedFuEPTuI/XG/x3rOBB++VHFF2QmCTPPk7dtw9imGHebk
         QXnk/ytK4cys+wM+dI4E4hazJhg3W8QBmgfAy4AmQn4ImVWYvoD/JEh+CD78d+PqO0r2
         WUbA==
X-Gm-Message-State: AGi0PubDvA5PK+s/B8mkOWOkBibBqjeP2PNW6Q6kWE9fdDMsVkPrrv70
        XhFYh2F9PO+SlN40olUM3uzIsg==
X-Google-Smtp-Source: APiQypKZLllr/ppZ5WEDGUG/MlZ92mT/85cNLs+v4f8ofGxIckLH3GUuN5fThqZIftzZJCB3DKPn+Q==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr387758wmf.176.1588006098658;
        Mon, 27 Apr 2020 09:48:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id r20sm15553355wmh.26.2020.04.27.09.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 09:48:18 -0700 (PDT)
Date:   Mon, 27 Apr 2020 17:48:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jason.wessel@windriver.com, gregkh@linuxfoundation.org,
        kgdb-bugreport@lists.sourceforge.net, mingo@redhat.com,
        hpa@zytor.com, bp@alien8.de, linux-serial@vger.kernel.org,
        agross@kernel.org, tglx@linutronix.de, frowand.list@gmail.com,
        bjorn.andersson@linaro.org, jslaby@suse.com,
        catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] serial: qcom_geni_serial: Support earlycon_kgdboc
Message-ID: <20200427164816.j4xqw3vvlgoqkmx7@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.8.If2deff9679a62c1ce1b8f2558a8635dc837adf8c@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 21, 2020 at 02:14:46PM -0700, Douglas Anderson wrote:
> Implement the read() function in the early console driver.  With
> recent kgdb patches this allows you to use kgdb to debug fairly early
> into the system boot.
> 
> We only bother implementing this if polling is enabled since kgdb
> can't be enabled without that.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2: None
> 
>  drivers/tty/serial/qcom_geni_serial.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090ce045..4563d152b39e 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1090,6 +1090,36 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
>  	__qcom_geni_serial_console_write(&dev->port, s, n);
>  }
>  
> +#ifdef CONFIG_CONSOLE_POLL
> +static int qcom_geni_serial_earlycon_read(struct console *con,
> +					  char *s, unsigned int n)
> +{
> +	struct earlycon_device *dev = con->data;
> +	struct uart_port *uport = &dev->port;
> +	int num_read = 0;
> +	int ch;
> +
> +	while (num_read < n) {
> +		ch = qcom_geni_serial_get_char(uport);
> +		if (ch == NO_POLL_CHAR)
> +			break;
> +		s[num_read++] = ch;
> +	}
> +
> +	return num_read;
> +}
> +
> +static void __init qcom_geni_serial_enable_early_read(struct geni_se *se,
> +						      struct console *con)
> +{
> +	geni_se_setup_s_cmd(se, UART_START_READ, 0);
> +	con->read = qcom_geni_serial_earlycon_read;
> +}
> +#else
> +static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
> +						      struct console *con) { ; }

This is pure nitpicking but since I was passing... why the ; ?


Daniel.
