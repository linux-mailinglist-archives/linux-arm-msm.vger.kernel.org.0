Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EA417E635
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 18:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgCIR76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 13:59:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43239 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgCIR75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 13:59:57 -0400
Received: by mail-pl1-f196.google.com with SMTP id f8so4280902plt.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o6f1XN2QdK3/34G8poFrstUBbYP1xGGKRnPC/3QZdN8=;
        b=nI9zT1dVrdQoNL1AWD+XOqRWyOWRG7gJMPuQj7rtqwn/deuQkD/iQkfyvVn4YsXnuc
         6CgdzlgI1vbyiSr68bB+kpUokyGzOo5P8FLYDXkjAD/h48hx2vo4ECTzuJbRu08dnhUp
         MSeG+gJAfC8nRv7n+Dr5GLpOIZncq2Lwvdx3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o6f1XN2QdK3/34G8poFrstUBbYP1xGGKRnPC/3QZdN8=;
        b=WN7i3k6aexY7JVGQ6V667vuwajcgqclzvrAJPsm6w7vi7unv6DDhxOuog976OboO8z
         OlQt/ku6EugPBXaO06R0+U1gblGtHJnpUo0ihm9IjVV3RR2H1pfPIxQLGriL6Vy/hYjZ
         TAcKWDTubJoyWVH1V9z+NOU/nvNnjqPhzYJT0IhedKTos6IqYCDRT/zUjXRqtItnbLS9
         23YkmkHzzP0GbN69RdNBLNSOtI34Aaq1SKSwdyYCOUX7bpMXPpHGEsjBYgf9ID6VyrRK
         3kXnj7cF5t4DV91+VTxX/gENb3mD82v4n5Mqp2ZmVYf/1wzZfqPbz0f3YGb8aWO532mI
         6Oig==
X-Gm-Message-State: ANhLgQ2OrGRlyF4PxFr6EK9Y8dQj4ghX+mu2aKdHNY20HM5TCInzsz2N
        2Bo8Yn61cH+DD1rOVsySjBvD8g==
X-Google-Smtp-Source: ADFU+vt3+o2du2Fq064MfV6TGC2EFx3BxICuQAPQBtOsAHCsUGtQYLsmUBYlgqwDh8gBmTOhL9rDgQ==
X-Received: by 2002:a17:90a:b114:: with SMTP id z20mr493552pjq.101.1583776796480;
        Mon, 09 Mar 2020 10:59:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id t19sm43960690pgg.23.2020.03.09.10.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 10:59:55 -0700 (PDT)
Date:   Mon, 9 Mar 2020 10:59:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH 0/6] Add interconnect support to UART, I2C, SPI and QSPI
Message-ID: <20200309175954.GX24720@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akash,

do you plan to re-spin this series in the near future?

Thanks

Matthias

On Mon, Feb 17, 2020 at 06:59:59PM +0530, Akash Asthana wrote:
> dt-binding patch for UART, I2C and SPI.
>  - https://patchwork.kernel.org/patch/11385965/ [Convert QUP bindings
> 	to YAML and add ICC, pin swap doc]
> 
> dt-binding patch for QSPI.
>  - https://patchwork.kernel.org/cover/11386003/ [Convert QSPI binding
> 	to YAML and add interconnect doc]
> 
> Akash Asthana (6):
>   soc: qcom: geni: Support for ICC voting
>   tty: serial: qcom_geni_serial: Add interconnect support
>   i2c: i2c-qcom-geni: Add interconnect support
>   spi: spi-geni-qcom: Add interconnect support
>   spi: spi-qcom-qspi: Add interconnect support
>   arm64: dts: sc7180: Add interconnect for QUP and QSPI
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi  | 199 ++++++++++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-qcom-geni.c    |  84 +++++++++++++-
>  drivers/spi/spi-geni-qcom.c           |  65 ++++++++++-
>  drivers/spi/spi-qcom-qspi.c           |  38 ++++++-
>  drivers/tty/serial/qcom_geni_serial.c |  84 ++++++++++++--
>  include/linux/qcom-geni-se.h          |  31 ++++++
>  6 files changed, 481 insertions(+), 20 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
