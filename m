Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881174F6AE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 22:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiDFUKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 16:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiDFUKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 16:10:25 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E9F2E1623
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 10:29:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id m12-20020a17090b068c00b001cabe30a98dso6425404pjz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rr+xzlj7vxdfalta/rr/vaKILwxRPcQ5/NXkWgY8K0M=;
        b=B1sq59hw7ckgQoFKnsvmJEAip8CSip0a3sLJR00RxPH+khENkQjAQh+kGzBFbqGjv8
         citQ4qw67DSyfwtGlKNNuIWL2hIUe6J9qjHzgonZu6wuCG7dLAtC8e1IjtXwMAze0sDj
         RLNQx0bJkjkiIxjwT0lKFRoFztKbmKj/m+Y+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rr+xzlj7vxdfalta/rr/vaKILwxRPcQ5/NXkWgY8K0M=;
        b=aT02xm9Wz+yuw61n94Q51pTSZ8WDW5Z+BRDH6MWLUuupPnwsXHJYu0ETKCC06dlJc8
         1cUZ7lZb+mXcDpcvGdpbK3T1t9hhsMAwFc8IiUzZhkvY5444vl6hvVqdWGZt8uEXWYAY
         beFNvj6ieAMm7LaUyuORQXxuloG2r0T8EX/mu7z5Tz8Xd3bCFWMIc59Zg26Rx2vjmUxi
         QLoGM1OFx3NSwQsLirT3LOCZTckkqc5QTvl0Ce+Qm3sZ0zAcNHpjlt5h2foZ/4McWT1/
         u+PEkfnMnAN/RGR/EkzqbhrXBTgrbohxmul0aVHdSqRzrVhJN27EBb7GY60jT6tZVUjH
         XUVA==
X-Gm-Message-State: AOAM532Dfhg5X7Sulyj2xJqgyhW5H0uy8EryQsbXtYQTaj7iOO98msdn
        yY7EuAK3ROREVN4Z6mB/Fc/1qg==
X-Google-Smtp-Source: ABdhPJwdSFDwLNqsqc2vubhlC0RRxfBG/wKDtKr3C4VRsDexJML+RuUfa9a4Gqn1DJb+ZvQadwh34w==
X-Received: by 2002:a17:902:da83:b0:156:aa83:8409 with SMTP id j3-20020a170902da8300b00156aa838409mr9949694plx.22.1649266181846;
        Wed, 06 Apr 2022 10:29:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dddf:7cc7:1261:9584])
        by smtp.gmail.com with UTF8SMTPSA id z10-20020a17090a8b8a00b001ca7bafba51sm6126276pjn.0.2022.04.06.10.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 10:29:41 -0700 (PDT)
Date:   Wed, 6 Apr 2022 10:29:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com,
        dianders@chromium.org
Subject: Re: [V2] drivers/tty/serial/qcom-geni-serial: Do stop_rx in suspend
 path for console if console_suspend is disabled
Message-ID: <Yk3OA8CLoijOyDDf@google.com>
References: <1649233612-30844-1-git-send-email-quic_vnivarth@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649233612-30844-1-git-send-email-quic_vnivarth@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 06, 2022 at 01:56:52PM +0530, Vijaya Krishna Nivarthi wrote:
> For the case of console_suspend disabled, if back to back suspend/resume
> test is executed, at the end of test, sometimes console would appear to
> be frozen not responding to input. This would happen because, for
> console_suspend disabled, suspend/resume routines only turn resources
> off/on but don't do a port close/open.
> As a result, during resume, some rx transactions come in before system is
> ready, malfunction of rx happens in turn resulting in console appearing
> to be stuck.
> 
> Do a stop_rx in suspend sequence to prevent this. start_rx is already
> present in resume sequence as part of call to set_termios which does a
> stop_rx/start_rx.
> 
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 1543a60..6f767c7 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1481,6 +1481,10 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
>  	struct uart_port *uport = &port->uport;
>  	struct qcom_geni_private_data *private_data = uport->private_data;
>  
> +	/* do a stop_rx here, start_rx is handled in uart_resume_port by call to setermios */
> +	if (!console_suspend_enabled && uart_console(uport))

nit: I think for a human reader would be slightly clearer to swap the order
of the conditions, i.e.:

	if (uart_console(uport) && !console_suspend_enabled)

> +		uport->ops->stop_rx(uport);
> +
>  	/*
>  	 * This is done so we can hit the lowest possible state in suspend
>  	 * even with no_console_suspend

v1 one had additional changes which weren't directly related with
console_suspend. They looked worthwhile though, please make sure to
send them in separate patches.
