Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C4F21E9AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 09:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgGNHLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 03:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgGNHLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 03:11:31 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DFDC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 00:11:31 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so6649100pls.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/WLZJPm08taWe89b8OcO3RiGHAkyrQdyXvvrmGEECfw=;
        b=P8b9r7AhWBygX3NBYxQT/LEbgjGIuGGaIWo7XuRmfjyrFvUp0J3t2eSJaE5UTcP59s
         +xITHoeiAzu2MkmqkRQassswJ23sE7xRcmwFe2ObXFDpYPnpKmnL9HWLnVuM6SkJ+W6v
         V8csNKd0eAhBMVTmfBnyBZnw5DQRl5Oz7okTeVkiaQBvigwUg/C8tOcbBj7D/BZ/ap2i
         dOyYYcZs4sqsjyUMdcFOtGAC9EaGu3BZB5RlObwwFTUxDEGeZrTw3SqhfHA/Gn20U7h1
         qSh7ocIKvkNt55EC0j9qX05tB1kekqP93jAgPobWVkYqATB1S0ONmSH6+Hf4cpyFqMWe
         YAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/WLZJPm08taWe89b8OcO3RiGHAkyrQdyXvvrmGEECfw=;
        b=uW26LKEFT5vPCVEI7oLG4325c9UJisJM3yCsHmJrRLwx4wAaxFtwbrHEhm4a5XTnFE
         E9WqRkUzLPDmD9U5bLQjtjyKknb5TAL8Jy6azaC8S3S34oC7DOX0+BmnpgUUR7L9WOhs
         SuIPpRJhW5cNJ6HngC9vam5HPo7tii82NX6Td1jwiqsN+pwEzZd0LxhkeUGPXptO5jd8
         3NBHs48mOWZcNbcBgwv/hDdzz2vTkoPnZ8akfEMhc42RdpAHLg1vlI9ZcbcaztJ1nWW8
         8t9cRhK0o3eB81mqFA42zEpoxT7dSYByQoIkACI+T1Z3hmCfCQtymz6Z9g3znhi2HVH2
         r4bA==
X-Gm-Message-State: AOAM530QAeMGPL2+T/qlVAj/BPQyQutnKjVZk2SU1h5Fw/OFq9mgYeeS
        p6injalC/LjGHSdLva04FgcY/g==
X-Google-Smtp-Source: ABdhPJzQ5F/LP5A44IfUDN/q8dCaCCqZYXZABJlKCRhW228Br6zI9sUjQFfbd4nUA1bTRa+bQ4PqwQ==
X-Received: by 2002:a17:902:76c4:: with SMTP id j4mr2766995plt.131.1594710690746;
        Tue, 14 Jul 2020 00:11:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s30sm14434103pgn.34.2020.07.14.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 00:11:30 -0700 (PDT)
Date:   Tue, 14 Jul 2020 00:09:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, gregkh@linuxfoundation.org,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH v2] tty: serial: qcom-geni-serial: Drop the icc bw votes
 in suspend for console
Message-ID: <20200714070923.GD1218486@builder.lan>
References: <1594704709-26072-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594704709-26072-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Jul 22:31 PDT 2020, Rajendra Nayak wrote:

> When using the geni-serial as console, its important to be
> able to hit the lowest possible power state in suspend,
> even with no_console_suspend.
> The only thing that prevents it today on platforms like the sc7180
> is the interconnect BW votes, which we certainly don't need when
> the system is in suspend. So in the suspend handler mark them as
> ACTIVE_ONLY (0x3) and on resume switch them back to the ALWAYS tag (0x7)
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied

Thanks,
Bjorn

> ---
> v2: Rebased on the latest qcom for-next
> 
>  drivers/soc/qcom/qcom-geni-se.c       |  9 +++++++++
>  drivers/tty/serial/qcom_geni_serial.c | 16 +++++++++++++++-
>  include/linux/qcom-geni-se.h          |  1 +
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index e2a0ba2..355d503 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -771,6 +771,15 @@ int geni_icc_set_bw(struct geni_se *se)
>  }
>  EXPORT_SYMBOL(geni_icc_set_bw);
>  
> +void geni_icc_set_tag(struct geni_se *se, u32 tag)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++)
> +		icc_set_tag(se->icc_paths[i].path, tag);
> +}
> +EXPORT_SYMBOL(geni_icc_set_tag);
> +
>  /* To do: Replace this by icc_bulk_enable once it's implemented in ICC core */
>  int geni_icc_enable(struct geni_se *se)
>  {
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 583d903..07b7b6b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1505,16 +1505,30 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
>  	struct uart_port *uport = &port->uport;
>  	struct qcom_geni_private_data *private_data = uport->private_data;
>  
> +	/*
> +	 * This is done so we can hit the lowest possible state in suspend
> +	 * even with no_console_suspend
> +	 */
> +	if (uart_console(uport)) {
> +		geni_icc_set_tag(&port->se, 0x3);
> +		geni_icc_set_bw(&port->se);
> +	}
>  	return uart_suspend_port(private_data->drv, uport);
>  }
>  
>  static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
>  {
> +	int ret;
>  	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>  	struct uart_port *uport = &port->uport;
>  	struct qcom_geni_private_data *private_data = uport->private_data;
>  
> -	return uart_resume_port(private_data->drv, uport);
> +	ret = uart_resume_port(private_data->drv, uport);
> +	if (uart_console(uport)) {
> +		geni_icc_set_tag(&port->se, 0x7);
> +		geni_icc_set_bw(&port->se);
> +	}
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index afa511e..8f385fb 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -454,6 +454,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
>  int geni_icc_get(struct geni_se *se, const char *icc_ddr);
>  
>  int geni_icc_set_bw(struct geni_se *se);
> +void geni_icc_set_tag(struct geni_se *se, u32 tag);
>  
>  int geni_icc_enable(struct geni_se *se);
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
