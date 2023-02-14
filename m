Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18813696314
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 13:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjBNMGy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 07:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjBNMGx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 07:06:53 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4158B6EA6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:06:51 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bk16so15380455wrb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dTuoqSN3nUDDHUnixCG2GlQIWQEKens+Uo3RsvB8jE=;
        b=q9h33ThpgiMyYvC2n+ERo8vzFNnzZfEGcIoRHB+lMy8eyajiSNpr5wAiHMT0OjuOnj
         ATvlfkUN1Igmqv7DCdml7Gqb26JIBMmp7B4/zvGIslPLMc2vLWVE5rwuygpoLkVuB6dB
         Rh97wAQbE2l6ZIJLcbBtJfeNpHl5pJkzuMeyTNJVDsymwwxJpGqHFeucOxiPwedWUX8c
         rR1on4AC+rI1SY+dtjoHrO/XtwcfqlMH5lQ4ZjSleA1bYhZ127dA8K4k/y2Jtdn7SDpA
         6AdWOPVqXQhsFO9c2xSS35nQmSjhim3BvD3ts39iwEhcmsOM0yl5Pi/GCSmkh8ZCpuDl
         IHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dTuoqSN3nUDDHUnixCG2GlQIWQEKens+Uo3RsvB8jE=;
        b=f4ZyRvaEl9eTsOzHZUIKe/gb2KwAeCOWkGKDP0q0dWjff2cmUWLTEkp14B8BY+Yjc+
         oweVljwyUzKeF4ep7pqJUKsK+ePYcB9nO7BA0KqYXiutJrnU3GLy6F4tCNYlVu9kayTZ
         3knz07lYPlO/Q8gVkuAqOYpzgsAhUx7EmlbUQVjyZR+IQ3gLhS+FLIiceBD2TO8oZS3n
         aP9d6k/jIY/fa30ZWqCDGH3CbM5q9ugwJHUvg7FqpVSFCTUGUpN65BJI1kKnHvbBP6dd
         JBmtKXC12tUg9//ZxZjp8R7C+jSK1acBlCWX9F6gNVcz1dbqxrBlgNsTiqDx+eD9Spgf
         ynUg==
X-Gm-Message-State: AO0yUKW36yusvWF0sBaHITTh3c4RCtFLCqt4NBTCBLGlqjlCNakX8VsJ
        rDLQxDYtufjB04+pEXg8XCwHAA==
X-Google-Smtp-Source: AK7set/yJWOH5/Bmi1HyNWbYN6j+KyNu4iEr6LIugfGebQGZt8mZBxo1n7ylPuqzgjj23iLLvZnBIA==
X-Received: by 2002:a5d:4006:0:b0:2c5:4ccc:a770 with SMTP id n6-20020a5d4006000000b002c54ccca770mr2077419wrp.7.1676376409738;
        Tue, 14 Feb 2023 04:06:49 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q9-20020a5d6589000000b002c559405a1csm4632273wru.20.2023.02.14.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 04:06:49 -0800 (PST)
Date:   Tue, 14 Feb 2023 14:06:47 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] Add dedicated Qcom ICE driver
Message-ID: <Y+t5V1Uu702JplW1@linaro.org>
References: <20230214120253.1098426-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214120253.1098426-1-abel.vesa@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-02-14 14:02:48, Abel Vesa wrote:
> As both SDCC and UFS drivers use the ICE with duplicated implementation,
> while none of the currently supported platforms make use concomitantly
> of the ICE IP block, the new SM8550 allows both UFS and SDCC to do so.
> In order to support such scenario, there is a need for a unified
> implementation and a devicetree node to be shared between both types
> of storage devices. So lets drop the duplicate implementation of the ICE
> from both SDCC and UFS and make it a dedicated (soc) driver.
> 
> This RFC should be treated as work-in-progress. Initially, its goal is
> to figure out what is the most agreeable implementation for both types
> of storage. Note that currently, only one ICE instance is supported
> (like the existing HW suggests) and it is laking refcounting and locking
> of any sort. Also missing bindings schema file for now.
> 
> Any suggestions are welcome at this point, including the location of
> such a new driver.

Forgot to mention here that I only managed to test the UFS on SM8450
HDK. Though functionally nothing should be impacted, I intend to test
the SDCC on SDM630 soon.

The devicetree sdm630 patch is here for proof-of-concept, mainly.

> 
> Abel Vesa (5):
>   soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver
>   arm64: dts: qcom: sm8450: Add the Inline Crypto Engine node
>   arm64: dts: qcom: sdm630: Add the Inline Crypto Engine node
>   scsi: ufs: ufs-qcom: Switch to the new ICE API
>   mmc: sdhci-msm: Switch to the new ICE API
> 
>  arch/arm64/boot/dts/qcom/sdm630.dtsi          |  18 +-
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |   4 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi          |  24 +-
>  drivers/mmc/host/sdhci-msm.c                  | 252 ++----------------
>  drivers/soc/qcom/Kconfig                      |  10 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  .../ufs-qcom-ice.c => soc/qcom/qcom-ice.c}    | 247 +++++++++++------
>  drivers/ufs/host/Kconfig                      |   1 -
>  drivers/ufs/host/Makefile                     |   1 -
>  drivers/ufs/host/ufs-qcom.c                   |  42 ++-
>  drivers/ufs/host/ufs-qcom.h                   |  32 +--
>  include/soc/qcom/ice.h                        |  61 +++++
>  12 files changed, 326 insertions(+), 367 deletions(-)
>  rename drivers/{ufs/host/ufs-qcom-ice.c => soc/qcom/qcom-ice.c} (50%)
>  create mode 100644 include/soc/qcom/ice.h
> 
> -- 
> 2.34.1
> 
