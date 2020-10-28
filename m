Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58FB29DCF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgJ2Ad6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732371AbgJ1WUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:20:55 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E46C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:20:55 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id f4so439264vsk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gyZXe4UlIiJyEgA29yuKS3oeW8M7zKVy8IBiRsmYAmc=;
        b=onAmLV9juNbP7wo91heam4H8gAMYtfy0venQZrmZZMNDJ8HiSHuuZ+CS/6A/yrwoSy
         ZZNOgWqUW4BH3NZGYK6+7vUXkGUv/DTH/Bfzi6Ln8fRJBp8+Cyb29Ra3Jy4YdefTcDo/
         zGGjvWhGYKGbs1ClJV+Ye7VjWBEJ3XORqgnVA4dlgEbukbSJ7Bcx9oRwo+L6XeApeMcx
         FdZha+HtwNipI11KsEjqoYfnLUDq5xnY3NObfd4sQySAytfwzKMntQM/bYaoqkpDl/Z5
         UzZfGapIufvzWiB4QEkzOuPpfvs+I8KiQ4YFpJ73sM1046oIlPRkgLy7DXNTV7u7ufqC
         jxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gyZXe4UlIiJyEgA29yuKS3oeW8M7zKVy8IBiRsmYAmc=;
        b=PMRCcMF9wLoQMGpiaepyS2+HOYMFSEhWApHu4OnWBCT7NDcUQYlhkSppMkaptufxg9
         iQORnZQ3OKmVXccPeZIa493P4lDc5l7kMG1dJob/sLqXm2M5AN/Txd8DN0EwbCx6V0dI
         rVmC+t7r/IuHcVFtfTzWlk2frJ1htpyHEsqsw5wz4b5+A9rt7Do3EQMXNz5SCD2rGS6C
         vs3VM05u1oMXpgECXqx7a+Dn8LlHgtFL+vPz1NctquMP7tsYzwxGbxRy7fhUkUQLVtRT
         hkGdt4nbbidi4WRUQKh8HJImEbEzecVUdiaV7UjgIzhOvDkmla1ZwA5zRUN5NCijMYSS
         v63A==
X-Gm-Message-State: AOAM530S3VZ9Ci6Ez/1Q83dCwo8CIEEsvQ8e/bZXSobKAWbE3j5JVBum
        rBNC2TbBwYH6Bjf83TgrgDC3evlIMWal
X-Google-Smtp-Source: ABdhPJy4wp8FcMTLG82s6NTTpGozSLiiRiD9djXMWJMN+OzFd+L2lYlZ4UuNtdVzO4TBLhilRIP1pA==
X-Received: by 2002:a62:be04:0:b029:15d:7423:e320 with SMTP id l4-20020a62be040000b029015d7423e320mr8247134pff.42.1603904943114;
        Wed, 28 Oct 2020 10:09:03 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e05:4ccd:292c:2726:5b8f:786d])
        by smtp.gmail.com with ESMTPSA id h13sm187608pfk.23.2020.10.28.10.08.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 10:09:02 -0700 (PDT)
Date:   Wed, 28 Oct 2020 22:38:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add GCC and RPMh clock support for SDX55
Message-ID: <20201028170853.GA3191@Mani-XPS-13-9360>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 01:12:28PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds Global Clock Controller (GCC) and RPMh clock support
> for SDX55 SoC from Qualcomm with relevant DT bindings.
> 
> This series has been tested on SDX55 MTP board. The dts patches for this
> SoC/board will be posted later.
> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (1):
>   clk: qcom: Add support for SDX55 RPMh clocks
> 
> Naveen Yadav (1):
>   clk: qcom: Add SDX55 GCC support

Bjorn, I've inherited the gcc driver from downstream and did some modification.
But I'm not sure if I can take the authorship of this patch hence kept it to the
downstream author.

In my point of view, the downstream author wrote the driver so I should keep
the copyright and even list them as MODULE_AUTHOR. But I don't think I should
give the patch authorship to them because I haven't received the patch anyhow.
I usually keep the authorship if I take the patch from a source like LKML and
repost it. But in this case, I authored the patch using someone's code!

What is your view on this?

Thanks,
Mani

> 
> Vinod Koul (2):
>   dt-bindings: clock: Add SDX55 GCC clock bindings
>   dt-bindings: clock: Introduce RPMHCC bindings for SDX55
> 
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |   71 +
>  .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
>  drivers/clk/qcom/Kconfig                      |    8 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/clk-rpmh.c                   |   20 +
>  drivers/clk/qcom/gcc-sdx55.c                  | 1667 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
>  include/dt-bindings/clock/qcom,rpmh.h         |    1 +
>  8 files changed, 1881 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
>  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> 
> -- 
> 2.17.1
> 
