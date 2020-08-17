Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7A0246F15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 19:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgHQRmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 13:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731545AbgHQRm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 13:42:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3086C061343
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 10:42:26 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x25so8583462pff.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dOiaQirXBI3rQ6qT+kTTGtB6bOoUlvCJmrcPgoAcFag=;
        b=GXqhKU6YA+o0z+HzDuOj1wrYpCBvfRBexpZQHyS0GUUx+GzyM0VfexnpuHmqXovRgw
         ibR94ySpDu1Mvk8/yRLNFsBhOkav76Jd3gAqNGlw86D9WuzxNtPswfqjrNle6Cw5BONA
         //OPKcywsNON0CBA0/EzKmHeffwzlRuvDMuBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dOiaQirXBI3rQ6qT+kTTGtB6bOoUlvCJmrcPgoAcFag=;
        b=C1rL6e1ZyBdbw2Y/A19cdytQe6PNSnrRptC5ibrhiSrccTFbsRCczfSGTWXssea2LU
         +KgHQb7khiL3zIfgbvzo7hYCz7GqtbmmamtOI5zzPB47SmpRvOQNSif0nvRBsJNYpe/5
         0x3pKosY+PRXHiwMisRRK2R+ewWhsfytvBTGhgejivsqNHa1pscWlpJMHuNzUg59jj0p
         FJgdInW+J1bEwRykd6Oy3jpkesRHfmg9jrLAdW/c5lmd97CFa9WGdOYh7nTr95JRvrJq
         VRIp9WGGLnPSDkOg5lPTUqjXqx38kZgtZS2jEJO3s/XRKUZAps5I9Nac/0DLRzCX0V1l
         p1Vg==
X-Gm-Message-State: AOAM533y2SINH72Y1qd97vfOw0XhVVaRN3HdKFtaMCXCyYKBolEsXfAK
        oIPWLYzeEqPr+o3oo3TWtxAZSA==
X-Google-Smtp-Source: ABdhPJyHQmuEwO2cQ7Y9JRh9ksUJUsr15yCYIESJvvghfsOXzwabIpJ9rsWYsfbyI5WvYGNtVBWcBQ==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr10410151pgc.441.1597686145978;
        Mon, 17 Aug 2020 10:42:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id h1sm21195366pfr.39.2020.08.17.10.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 10:42:24 -0700 (PDT)
Date:   Mon, 17 Aug 2020 10:42:22 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 3/3] tty: serial: qcom_geni_serial: Fix the UART
 wakeup issue
Message-ID: <20200817174222.GC2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595563082-2353-4-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 09:28:02AM +0530, satya priya wrote:
> As a part of system suspend we call uart_port_suspend from the
> Serial driver, which calls set_mctrl passing mctrl as NULL. This
> makes RFR high(NOT_READY) during suspend.
> 
> Due to this BT SoC is not able to send wakeup bytes to UART during
> suspend. Included if check for non-suspend case to keep RFR low
> during suspend.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - This patch fixes the UART flow control issue during suspend.
>    Newly added in V2.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 07b7b6b..7108dfc 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -242,7 +242,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
>  	if (mctrl & TIOCM_LOOP)
>  		port->loopback = RX_TX_CTS_RTS_SORTED;
>  
> -	if (!(mctrl & TIOCM_RTS))
> +	if ((!(mctrl & TIOCM_RTS)) && (!(uport->suspended)))

Why all these parentheses, instead of:

    	if (!(mctrl & TIOCM_RTS) && !uport->suspended)

?
