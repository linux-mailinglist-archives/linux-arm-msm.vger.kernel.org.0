Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C3E36AA10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 02:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbhDZAmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 20:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhDZAmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 20:42:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66F4C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 17:41:55 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n10so16855400plc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 17:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TXjxihzndDexm6xIop0V110XmoQxqXlGFxQfNvPS+WE=;
        b=RKHK3ySwpl3uhv+XiJVB0+R3LV/eaVUh6FG1Kp7mKU3vOhZknUmthOGB11EBkjfWU0
         5fW0Uu6eOFR8abDlsrXZd/6/eedVjontkQiRB2kvMbHz5XHjNtioKTpvXcVyceqXtcjB
         BHrVuXndeOVN9G08cCrxri/vly4t+B3W5Td5rugBJjUrFBSQTPalJEJhCkhLpmowLe9E
         7NPp5brT2gUXNDfICJOecYAE67VHT3+ZtD1QIqqAmNR/+gRvOMzjsaXe8+VZ01urmm6b
         vfiss8LIG/P4OShIkGfO2i/0qVm24UTaeL+Fzem36UqF82NNlTkzKhYV2wRvjX6FKNIU
         4hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TXjxihzndDexm6xIop0V110XmoQxqXlGFxQfNvPS+WE=;
        b=OQFV6pi99T8JeeigFUxhMG3yS8jMKAtE3F/E6KmWPGdv/uXhYTNG3o+ey0gc5qL1CT
         AP549pc4a/glMqJQTuzj9+oeGb79bQ1DNeIqwxV3fYcxbTOjVtbaSPD3/OCAFLKW63L+
         jqusdzgwYEbae2oaEpzQEEXwRpX4tvDFP5l2sippW6UIpZkV0bdIOZ7TuQjx3Du01cAg
         sd265Tt0Rfn36HfVRoGwSun76Khv1YfInd8IKKcqEf4/ernmXnxxcRtRrV//2U6kB5Kg
         ZuNy1u0iiDo0RZrkFWITxOHPfsnj3sgI9YA7uaq1ss5+vJJigaA31U0ZYsZdGgJGiWrY
         3rGg==
X-Gm-Message-State: AOAM530fUwYT6pKrgpbdyiqzP8adiJLgGyKZVe58bZAFi9Vq3X16CI6R
        zCKVphn6YM7o5EWCGbtq2kAaZQ==
X-Google-Smtp-Source: ABdhPJyjPyHk6bq1u1t0ihan1g3YNLCp+Kz5n5yt6faxD+AGdXzfUMj5KW4bSswtS/3VQ/HkjEO30w==
X-Received: by 2002:a17:90a:6fa2:: with SMTP id e31mr19827422pjk.225.1619397715221;
        Sun, 25 Apr 2021 17:41:55 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id f135sm9500137pfa.102.2021.04.25.17.41.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Apr 2021 17:41:54 -0700 (PDT)
Date:   Mon, 26 Apr 2021 08:41:49 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm-smmu-qcom: Create qcom_smmu_impl for ACPI boot
Message-ID: <20210426004148.GG15093@dragon>
References: <20210402035602.9484-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402035602.9484-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 02, 2021 at 11:55:59AM +0800, Shawn Guo wrote:
> The arm-smmu-qcom driver needs to hook up qcom_smmu_impl for booting up
> Snapdragon platforms.  Such hook-up is being done for DT boot by
> matching compatibles.  The series tries to handle the hook-up for ACPI
> boot by looking at model identifier, which is figured out by IORT driver
> using acpi_match_platform_list() helper.  It helps to get Debian
> installer booting with ACPI work for Qualcomm SC8180X based laptops like
> Lenovo Flex 5G.
> 
> Changes for v2:
> - Rather than using asl_compiler_id in IORT table, follow suggestion
>   from Robin Murphy to use acpi_match_platform_list() to match platform.

How does this version look?  Any comments?

Shawn

> Shawn Guo (3):
>   ACPI/IORT: Consolidate use of SMMU device platdata
>   ACPI/IORT: Add Qualcomm Snapdragon platforms to iort_plat_info[]
>   iommu/arm-smmu-qcom: hook up qcom_smmu_impl for ACPI boot
> 
>  drivers/acpi/arm64/iort.c                   | 36 +++++++++------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  6 +++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  9 ++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  9 ++++--
>  drivers/perf/arm_smmuv3_pmu.c               |  8 +++--
>  include/linux/acpi_iort.h                   | 12 +++++--
>  6 files changed, 51 insertions(+), 29 deletions(-)
> 
> -- 
> 2.17.1
> 
