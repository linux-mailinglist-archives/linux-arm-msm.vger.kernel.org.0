Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5480434D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 16:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhJTOFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhJTOFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:05:45 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8F9C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:03:31 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id e13so2112944qvf.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=942MFQAdclIgl2KqvslSafCq0ctbJW8Cf7/dgZQUQP8=;
        b=EOlmUEkhqOZfNg6KCsoSgPe20D8i65c2gn7HuFCH20PX4ITkn0JLz10+cHd1Xj5Kbk
         QhlE6kJinCShLfJxudqCsJjZKPADTf/E8Q86Cp3Lj3jOakzcCaWbWuGdl8WeZMpgOreR
         UUpGUeFoSBMdcuOraEa7LxEPIdGdhiM40+wofl6jW0lyL5MNwpHlD+R6FKjtkbjjqAkT
         HRvLd1TRJtnJ3088Mxn7XtnFnG3ruJIO+9KkI1/TX5c2gG/pf+f43Yd5cVr+os4sQ2SR
         Xt0ICmHzHR0adsOxDUtjUWUdDQPwrqXWn/YHvBZQ00ipG0+0BaGTNXlR7m3ahQw8N42s
         NR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=942MFQAdclIgl2KqvslSafCq0ctbJW8Cf7/dgZQUQP8=;
        b=neG1wZTwRekrw8hWvMqLypmzZD7d7mnxtE3nfwidZFD44HVgcaEJFhIXx2mumgzse1
         YsgJ4BqJPeRlUEAjXPGNHFoKQmfLw6CRGM6wg1ut1yVtsbQMbDwU7bIh+TeftqjIG5nJ
         kQb1CWdx5abJkCfNOjgGG794XGY+vyWTeXbrQGuiQS26NNkyju40hn2CM7BTQMnNEJ1H
         9+if1jDKALq6SiwqOr/0Qw0BLLhF2bWWoKqu6Ird3UG17fJ2d8Ysnwvq6qnJY7as0B3t
         n9MMZPlxI90SvkufJlnfTxTB4CqfO62NnDllNWYWrfnhwitZ3BxNmeM7RyZR6InlO0X7
         1i3g==
X-Gm-Message-State: AOAM532RjKphmYYsO8vV2nk2ks4HCK8eZ7K5IW4nnQfCUc6/3wpV1TYw
        B07BFGhwS6yuDIwTP0lPDEDJ1A==
X-Google-Smtp-Source: ABdhPJyirz3Cl9goKVtyNv2S9QVWLJkniesMCnKLcEsWPFabxqporpeeqWDuvciZdRcNVpcOXsTzcA==
X-Received: by 2002:a05:6214:144c:: with SMTP id b12mr6306189qvy.56.1634738606352;
        Wed, 20 Oct 2021 07:03:26 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id y23sm967873qtv.58.2021.10.20.07.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 07:03:25 -0700 (PDT)
Subject: Re: [PATCH v4 00/20] Enable Qualcomm Crypto Engine on sm8250
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <a5927363-5e2f-9af1-7446-2146fd455f36@linaro.org>
Date:   Wed, 20 Oct 2021 10:03:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> Sorry for a delayed v4, but I have been caught up with some other
> patches.

Hi Bhupesh,

If possible, please consider splitting this series into 2. One with 
changes required to support crypto driver on
sm8250 and other with the generic fixes / fixing the dt-bindings et all.
It would be easier to review as well

-- 
Warm Regards
Thara (She/Her/Hers)

> 
> Changes since v3:
> =================
> - v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20210519143700.27392-1-bhupesh.sharma@linaro.org/
> - Dropped a couple of patches from v3, on basis of the review comments:
>     ~ [PATCH 13/17] crypto: qce: core: Make clocks optional
>     ~ [PATCH 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
> - Addressed review comments from Thara, Rob and Stephan Gerhold.
> - Collect Reviewed-by from Rob and Thara on some of the patches from the
>    v3 patchset.
> 
> Changes since v2:
> =================
> - v2 can be seen here: https://lore.kernel.org/dmaengine/20210505213731.538612-1-bhupesh.sharma@linaro.org/
> - Drop a couple of patches from v1, which tried to address the defered
>    probing of qce driver in case bam dma driver is not yet probed.
>    Replace it instead with a single (simpler) patch [PATCH 16/17].
> - Convert bam dma and qce crypto dt-bindings to YAML.
> - Addressed review comments from Thara, Bjorn, Vinod and Rob.
> 
> Changes since v1:
> =================
> - v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/
> - v1 did not work well as reported earlier by Dmitry, so v2 contains the following
>    changes/fixes:
>    ~ Enable the interconnect path b/w BAM DMA and main memory first
>      before trying to access the BAM DMA registers.
>    ~ Enable the interconnect path b/w qce crytpo and main memory first
>      before trying to access the qce crypto registers.
>    ~ Make sure to document the required and optional properties for both
>      BAM DMA and qce crypto drivers.
>    ~ Add a few debug related print messages in case the qce crypto driver
>      passes or fails to probe.
>    ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
>      or the interconnect driver(s) (needed on specific Qualcomm parts) are not
>      yet probed.
> 
> Qualcomm crypto engine is also available on sm8250 SoC.
> It supports hardware accelerated algorithms for encryption
> and authentication. It also provides support for aes, des, 3des
> encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
> authentication algorithms.
> 
> Tested the enabled crypto algorithms with cryptsetup test utilities
> on sm8250-mtp and RB5 board (see [1]) and also with crypto self-tests,
> including the fuzz tests (CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y).
> 
> Note that this series is rebased on a SMMU related fix from Arnd applied
> on either linus's tip of linux-next's tip (see [2]), without which
> the sm8250 based boards fail to boot with the latest tip.
> 
> [1]. https://linux.die.net/man/8/cryptsetup
> [2]. https://lore.kernel.org/linux-arm-kernel/CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com/T/
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> 
> Bhupesh Sharma (17):
>    arm64/dts: qcom: Fix 'dma' & 'qcom,controlled-remotely' nodes in dts
>    arm64/dts: qcom: ipq6018: Remove unused 'qcom,config-pipe-trust-reg'
>      property
>    arm64/dts: qcom: ipq6018: Remove unused 'iface_clk' property from
>      dma-controller node
>    dt-bindings: qcom-bam: Convert binding to YAML
>    dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to
>      optional properties
>    dt-bindings: qcom-bam: Add 'iommus' to optional properties
>    dt-bindings: qcom-qce: Convert bindings to yaml
>    dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to
>      optional properties
>    dt-bindings: qcom-qce: Add 'iommus' to optional properties
>    arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
>    dt-bindings: crypto : Add new compatible strings for qcom-qce
>    arm64/dts: qcom: Use new compatibles for crypto nodes
>    crypto: qce: Add new compatibles for qce crypto driver
>    crypto: qce: Print a failure msg in case probe() fails
>    crypto: qce: Defer probing if BAM dma channel is not yet initialized
>    crypto: qce: Add 'sm8250-qce' compatible string check
>    arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
> 
> Thara Gopinath (3):
>    dma: qcom: bam_dma: Add support to initialize interconnect path
>    crypto: qce: core: Add support to initialize interconnect path
>    crypto: qce: core: Make clocks optional
> 
>   .../devicetree/bindings/crypto/qcom-qce.yaml  |  90 +++++++++++++++
>   .../devicetree/bindings/dma/qcom_bam_dma.txt  |  50 --------
>   .../devicetree/bindings/dma/qcom_bam_dma.yaml | 107 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  10 +-
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   4 +-
>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  10 +-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |  28 +++++
>   drivers/crypto/qce/core.c                     |  66 +++++++----
>   drivers/crypto/qce/core.h                     |   1 +
>   drivers/dma/qcom/bam_dma.c                    |  16 ++-
>   12 files changed, 302 insertions(+), 86 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>   delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>   create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> 


