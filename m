Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8671700C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 15:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgBZOJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 09:09:53 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41859 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZOJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 09:09:50 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so3893874eds.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=uBz3+g+j8keWl8UqI79zfp5ubt5QR7/jXbEkrRg/FCZsiZGJC3aScHfLMQZxnVbof3
         /QZebawsO2zze1XxLqeBsXC2dsMaenQfIFyIOtbY2d5jk5G7uwQkFUZrYjeLa+zy3DE7
         lzADPtw5KQoK/Pm/ROUTLWxaKS8vLmq7PtHLzzwWCoYi/uqf06dA+oXXNc1vUs/imun1
         GOWPx1wK29lGZ/IcYPHFQbIU6q34VUM+92OI4u3yF1LEl7bMTJirNuZm/atrMNTPRdg5
         ZG/tqQrfoKU+uMNPz9Ru9PJe0pyNk6lFQEORi/37O03LN46FGtKkMXMCRNDMc5vDil1W
         RjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fXFKoR7odDqKyjm1wlalyPUtaV5JgRAtJWLDNUWDC8E=;
        b=bmG3dQD0Jy68PlLs0RLC+T7dRs/JT2KBgRKpm8YKFh0/M/f2f6TAuHq4takkPw6qsx
         TJNjU3jIwnmo3SKeabeeXi0wcp2GRcqIM+AhDJn9PCgFGWFA1DvipiqO3F4Lp48IIltj
         ApjpRvF3ikyD9diXd3cxz2FoCOoI3CwQzP6FrOQ3wr2stIIEWSeIzEJ8Jc0t1IxjUIgA
         B40FB5wMpItSCiuAEhMRHn6U3g3RN8NcYesFXtoZO0mn/KHrzpD2cBPpCwHSd83HVNS/
         YOVvBNta5fIH6+P+3zExVE/zOHTb7K4xByLMAwrG5crKgkqdQD217Czpa9AGGAVhiJHg
         sjMw==
X-Gm-Message-State: APjAAAXg4EhEfZ0IBJwFaDBzyDzQz55Vbs4Q3amn9MVqpg+PmKjQcwug
        0YRarrVDusRmil4ALYX8CSrByA==
X-Google-Smtp-Source: APXvYqw0u4w7Awwn/Oq86trc1VxG309aOYxrpuzvaTjpcOA5sSGDTXcJUngxdDIFv1GDoA39EXuUlA==
X-Received: by 2002:a05:6402:22d4:: with SMTP id dm20mr5099174edb.353.1582726187668;
        Wed, 26 Feb 2020 06:09:47 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c19sm91152ejm.47.2020.02.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 06:09:46 -0800 (PST)
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
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <ada86697-374c-653d-156e-36af61b53c52@nexus-software.ie>
Date:   Wed, 26 Feb 2020 14:09:58 +0000
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
