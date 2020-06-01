Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D221EA4FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 15:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgFAN1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 09:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgFAN1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 09:27:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA891C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 06:27:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a25so2005141ejg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8JJuCOOH8RdyowotzK9kI82M2Yj9yM7F/os1HkdyKYM=;
        b=Mky9fRdd7XLKQsd9lAv/YYGG/0o9TrtEeTojVwvK2dc5yWW2Tt+ptZTvz+0raNcp3M
         N34NJbhALxjTn1xcG9PeaznZExXVDJk2DJDRzS8IrmFpsPySRJuYPID1abcv4z8xiK/E
         bTy8cqD/U1IIgPIuf7UNrSebyBB0d/n4VWz/XJyXRmhQZaRKKuOWJKxAzrVK+XrdZTpv
         KIJQexh/L/HOnwvrlawKrL/Ed4VF6/tZSr76+RAd+B9/u47f21ZVSrr7DTXvxTitDuno
         HJeZ7isPxmCj3XmC29WEf67wXdWpczUeBQeZgviFjDg76RhEbW9hrMKZBg+S7fzV5jP3
         RWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8JJuCOOH8RdyowotzK9kI82M2Yj9yM7F/os1HkdyKYM=;
        b=bVqfTztJaYdvy8zBEhvppuaxyzRHIx8+OjP/kqFqErcqORHY+w6WcxVinyKf3kM7JT
         CfljUG8e3CEa8HpsBmiSgYA/sZuz1kKwL9jNrhMucyfV70KxAn2FOeA5Z34k2Vx8bz2K
         7foqXp6iGsb2tpnqN1YHt3DOgYL/smTC0yhgCTXH870ZWdMBEeV/G6VGrsnaHku/koef
         yRPqPcijmSfSUguWENCSGiYNnrdzoggbvLfBBPUX+Un9aSShbU1X0lsbfoMJaeoYWAYb
         EC0P3LfGwW5rzGVUIQGBgOjc0kfpg11iBgDHIBFZWu/e4p77ZZ9pdlkKSpZaYoOO2npa
         Hw4Q==
X-Gm-Message-State: AOAM531wPr1Xu93nOwKM7eZnmm7V57GVJ7Eu23ipAg93S8T2tE5gaQC2
        P6ykEUdGxseZikZwIybP9oPDv+0R6bbMlBvulb/vOw==
X-Google-Smtp-Source: ABdhPJzYZICWrmW4FMgFWWqrndKLW4lZTBdMdQDXaf6oGPoMqEtnHDTYcLJCGbJRQSohmSn3AKpRofu5ADkRfevPb3I=
X-Received: by 2002:a17:907:9484:: with SMTP id dm4mr20655143ejc.56.1591018067462;
 Mon, 01 Jun 2020 06:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org> <6e62147c36c76b9485d14960dced4f6acda17591.1590947174.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <6e62147c36c76b9485d14960dced4f6acda17591.1590947174.git.saiprakash.ranjan@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 1 Jun 2020 14:27:36 +0100
Message-ID: <CAJ9a7Vh=GPKdYcX3aiJfaAVQ3j8rEmoSvP0CDeF-mfPpV4DMaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] coresight: tmc: Add enable flag to indicate the
 status of ETR/ETF
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, 1 Jun 2020 at 09:02, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add a flag to check whether TMC ETR/ETF is enabled or not.
> This is later used in shutdown callback to determine if
> we require to disable ETR/ETF.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-tmc.c | 2 ++
>  drivers/hwtracing/coresight/coresight-tmc.h | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c b/drivers/hwtracing/coresight/coresight-tmc.c
> index 39fba1d16e6e..5a271ebc4585 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
> @@ -62,11 +62,13 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>
>  void tmc_enable_hw(struct tmc_drvdata *drvdata)
>  {
> +       drvdata->enable = true;
>         writel_relaxed(TMC_CTL_CAPT_EN, drvdata->base + TMC_CTL);
>  }
>
>  void tmc_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +       drvdata->enable = false;
>         writel_relaxed(0x0, drvdata->base + TMC_CTL);
>  }
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 71de978575f3..d156860495c7 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -184,6 +184,7 @@ struct etr_buf {
>   * @idr_mutex: Access serialisation for idr.
>   * @sysfs_buf: SYSFS buffer for ETR.
>   * @perf_buf:  PERF buffer for ETR.
> + * @enable:    Indicates whether ETR/ETF is enabled.
>   */
>  struct tmc_drvdata {
>         void __iomem            *base;
> @@ -207,6 +208,7 @@ struct tmc_drvdata {
>         struct mutex            idr_mutex;
>         struct etr_buf          *sysfs_buf;
>         struct etr_buf          *perf_buf;
> +       bool                    enable;

Is this flag needed?
For TMC, drvdata->mode indicates if the device is in use.

Regards

Mike
>  };
>
>  struct etr_buf_operations {
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
