Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 757A45F28E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 09:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiJCHBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 03:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJCHBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 03:01:00 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D37118B16
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 00:00:58 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c68so3100645pfc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=3JNVltYWwjZxKJs51FeQFQjWXu1lm2Nc87fWc2zPpew=;
        b=VGlrW7YJTylUobeHMTQIyhFRYrKpT0uRzag6QvClmPUvl8glSvsazg+/U5aFOBZxb9
         k0kNF4Zr1zLLCCtznvKNxwSytMgdoF+pjaQwOIQb4ymXRrOxEot8s74+y7pYB+2Z8mDe
         97yqEw/+HuU/57XtwagvivZ4XA1OxrF+w4P2zYT9VzuscllNnp1sNGlw1CgxGnetyvmy
         Em4d406BOzw8+vHPvg5f0yKKVbJUlrr4V0Z4EES1E7bNIEweDEWNYUQQLgaGhljojwNW
         bGclTnWN65aGO7zLF5itNC+NT6u0UnSk+2GkWcKzmLS807qhjtxuUiYMwgHO8MrH6JKb
         tknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3JNVltYWwjZxKJs51FeQFQjWXu1lm2Nc87fWc2zPpew=;
        b=BlWyq0xyo5R3pV003KKFrAfoRJIvlJTxSRAGLd+ahfY4rIk123U6HYwTkdfA3a/J1/
         7TnxyrHdFQB4Bn/ZxJvS+YAh4NXSLoG58Wp3B1No7rYBA/4LUOQDFNdfXRwGjsQi2EnW
         K+acfsfwkkHpeXe3X3iIcr54aiSEgY4jUMreJmLr3G1LxzL3suTVkLvlAvwqNIYEvQLC
         JPE0gvvNtwjHESBRbdQOvS65AhyI2Q1xdddXQSW9V+hNukcJyURcOHG3Hr8aFtEEffRa
         3jYkAHthdlW/3RAruTR552GlJdkZhHoEUEo8ig0IZxrrBn7k1deqem9cQZGcQyzdVrqI
         vrCA==
X-Gm-Message-State: ACrzQf3ySRe/dKsWubg8fkJYF9s8ScHwv1koXXpa6oj7wbNx5IhaL2yf
        FzYQ474EfCrMbDY62RPkyV59
X-Google-Smtp-Source: AMsMyM7MxcKIDSEoTF2S8oIVL845jStXPwgBzdsGKcHZEAA+SriQpSK/NKCWMRyWqhqZbYPmlrfbsw==
X-Received: by 2002:a63:5b58:0:b0:452:2ba4:f86b with SMTP id l24-20020a635b58000000b004522ba4f86bmr504129pgm.223.1664780457768;
        Mon, 03 Oct 2022 00:00:57 -0700 (PDT)
Received: from thinkpad ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id a10-20020a65654a000000b0042988a04bfdsm5962601pgw.9.2022.10.03.00.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:00:57 -0700 (PDT)
Date:   Mon, 3 Oct 2022 12:30:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v4 00/12] Improvements to the Qcom PCIe Endpoint driver
Message-ID: <20221003070051.GB5398@thinkpad>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 14, 2022 at 01:23:38PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series contains improvements to the Qualcomm PCIe Endpoint controller
> driver. The major improvements are the addition of SM8450 SoC support and
> debugfs interface for exposing link transition counts.
> 
> This series has been tested on SM8450 based dev board.
> 
> NOTE: Since the bindings are ACKed, the whole series could be merged to the
> PCI tree.
> 

Lorenzo, can this series make it for 6.1?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v4:
> 
> * Collected tags for bindings patches
> * Reworded the subject of patch 2/12
> 
> Changes in v3:
> 
> * Removed the maxItems property from "items" list
> * Reworded the debugfs patch
> * Dropped the eDMA patch since that depends on ongoing eDMA series from Sergey
> * Added two new patches that helps in saving power during idle and low power
>   state
> 
> Changes in v2:
> 
> * Fixed the comments on bindings patches
> * Added Ack from Krzysztof
> 
> Manivannan Sadhasivam (12):
>   PCI: qcom-ep: Add kernel-doc for qcom_pcie_ep structure
>   PCI: qcom-ep: Rely on the clocks supplied by devicetree
>   PCI: qcom-ep: Make use of the cached dev pointer
>   PCI: qcom-ep: Disable IRQs during driver remove
>   PCI: qcom-ep: Expose link transition counts via debugfs
>   PCI: qcom-ep: Gate Master AXI clock to MHI bus during L1SS
>   PCI: qcom-ep: Disable Master AXI Clock when there is no PCIe traffic
>   dt-bindings: PCI: qcom-ep: Make PERST separation optional
>   PCI: qcom-ep: Make PERST separation optional
>   dt-bindings: PCI: qcom-ep: Define clocks per platform
>   dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC
>   PCI: qcom-ep: Add support for SM8450 SoC
> 
>  .../devicetree/bindings/pci/qcom,pcie-ep.yaml |  86 +++++++---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 154 ++++++++++++++----
>  2 files changed, 188 insertions(+), 52 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
