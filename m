Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC701700CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 15:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBZOLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 09:11:02 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39036 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgBZOLB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 09:11:01 -0500
Received: by mail-ed1-f66.google.com with SMTP id m13so3916210edb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 06:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5DhKMOCKougglQKBhGOeHVANE51m9Ir+JY7qypOlF1M=;
        b=HFzgY7fAErEEDpdomlXQINmzmWIb+d13WsvTNxgkexmA0K5Qiw5yOLP8OkZpcRJgYZ
         ztK8mfnAOleT9kyx4AwB//dzL15yj/TxvUYErvFfRqKAlGgFT/oI3pKplgvaO9XOCinP
         c0C7HVk9s7LErAnqIVH5HpOxZi+TAlhfN2a28lSQFPPtq+fDh3JQ1pJsavJBN9s46WNG
         uCVA3iOT5fV8LS7ajS8ZvoPz2kf9tvcv5lqRIJYXyd0peSjIqFJpDkxJ6EI0J2XAHik0
         0TfQWxxP9utTVJOn795X/1kcyffN6Fs29zRAOme0kqSlgoA5XYxhWt+hkgxjDpJKNrJX
         DWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5DhKMOCKougglQKBhGOeHVANE51m9Ir+JY7qypOlF1M=;
        b=ZxHQruwEY/W9daJuEaIauMYLsdG5+LiZ0RnIlV4mq+6rtX1oFWgLMWvegqlrBamse9
         3y8OX7vPOj1CLLMhFVyt1a0WVYhQxODYEDw57rtzVMszVinjKkk7hSfzLdfeIb2/dMGl
         Z/VfnlqPuBPr3/wgJUeR2tT+JvDY9zw8YkxmcL958qeRhTGsWv7czz2AzauyMDPPWSIV
         WnDLMv1MLYJ/5h/4vCYEiqJBD4Ly8MjwpCoc7JbBNROAR2mRxcYa+uyjOuxX6dRPQPxS
         SpToEys5Lti5oePj3vkLrSnq1T6bzl47WlpYNyP3yDcib0E+lW2qMyfkybSS90siahAL
         lKCQ==
X-Gm-Message-State: APjAAAWBKf/v3GXHLSTlenOBn922iPMSEQf4jkJ3FTk0Wb8psPDztS9F
        69BULXUSKelkM7bvom5dByPRVw==
X-Google-Smtp-Source: APXvYqxFEpx1h3DCctgiXd8YObb2t6UvVKbAfD7zvtcYN4qUL9HT0QEeCyTofZJB+vP8XAV1fXOcFQ==
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr4738582ejb.265.1582726260216;
        Wed, 26 Feb 2020 06:11:00 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id dh4sm131393edb.77.2020.02.26.06.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 06:10:59 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Add clock drivers for SM8250 SoC
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org
References: <20200224045003.3783838-1-vkoul@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ef54b53f-f29f-be28-3fb4-f72fde389090@linaro.org>
Date:   Wed, 26 Feb 2020 14:11:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224045003.3783838-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2020 04:49, Vinod Koul wrote:
> This series adds clock drivers support for SM8250 SoC.  As part of the
> device tree, the sm8250 dts file has basic nodes like CPU, PSCI, intc, timer
> and clock controller.
> 
> Required clock controller driver and RPMH cloks are added to
> support peripherals like USB.
> 
> All this configuration is added to support SM8250 to boot up to the
> serial console.
> 
> Changes in v4:
>   - Make qcom,gcc-sm8250.yaml license as dual GPL + BSD
> 
> Changes in v3:
> - Dropped accepted patches by Steve
> - Split the common rename patch to rename and refactor patches
> - Rebase on clk/clk-qcom and move yaml binding to .../bindings/clock/qcom,gcc-sm8250.yaml
> - Fix comments form Steve on gcc-sm8250 clk driver
> 
> Taniya Das (5):
>    clk: qcom: clk-alpha-pll: Use common names for defines
>    clk: qcom: clk-alpha-pll: Refactor trion PLL
>    clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
>    dt-bindings: clock: Add SM8250 GCC clock bindings
>    clk: qcom: gcc: Add global clock controller driver for SM8250
> 
>   .../bindings/clock/qcom,gcc-sm8250.yaml       |   72 +
>   drivers/clk/qcom/Kconfig                      |    7 +
>   drivers/clk/qcom/Makefile                     |    1 +
>   drivers/clk/qcom/clk-alpha-pll.c              |  264 +-
>   drivers/clk/qcom/clk-alpha-pll.h              |   12 +
>   drivers/clk/qcom/gcc-sm8250.c                 | 3690 +++++++++++++++++
>   include/dt-bindings/clock/qcom,gcc-sm8250.h   |  271 ++
>   7 files changed, 4268 insertions(+), 49 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
>   create mode 100644 drivers/clk/qcom/gcc-sm8250.c
>   create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
> 

Resend from the right email address.

For the series:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
