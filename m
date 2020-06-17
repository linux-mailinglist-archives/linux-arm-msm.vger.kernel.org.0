Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0360F1FD889
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 00:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgFQWPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 18:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQWPs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 18:15:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FD9C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 15:15:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i12so1621802pju.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=utLyEazY0Lxy25RnigtP2rxCKLns71B2z42HG9ml/D4=;
        b=WckloiLg0RFwJrJdmcKNlWXSNfZ/6MQx67MHZDFh8c+yAskzSA6l5RIBqs3zddQnm2
         WzDiiiw1LhLzjc1n7L91A2p7Kxb2n33xRnOvq5adE7m++wo6DD9qe3TIAE0m9ByUu8be
         zdLjcFokB4JAHoo/6w6q5FnZnghxo3w3kkkeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=utLyEazY0Lxy25RnigtP2rxCKLns71B2z42HG9ml/D4=;
        b=QFyGecaJPLKsu7rJ7ImFdNmyxF4FVjlSEUR1QlQ0gB4q/NQtKLCPecKn25bWWciYRF
         lSa6ZB/GCgQSLiONv9jZ7kPbhbOc/Tmcqi/KXloNpesCWNtM1RwR7VA+fXfr5fLM+gub
         7xauzL0k0KpinQZT7ltlQcVkrk7VCW1ViHIlKuK7ymCi7UMF8ukBUQqCCtb+C1QhCtNg
         UJBxperkSDE5kJXxChT74oHGGAS/3B5JVNGEZF2BLsVAnNC40onS0iUJbFLlHk63EDyr
         3GsGmmG+kKgXM3wXn/SieW7NvSVHiiK8ILf6eDuCHSI257b/NxVGAqq9kvvXRzusnxNl
         x4Ug==
X-Gm-Message-State: AOAM530bviidR3shdStwRSNuVId2CmJ/BB/aCxVPm9qGXlcYWSUYSi+f
        UkvYt7ashIwYjTTXzM2TL1lfXA==
X-Google-Smtp-Source: ABdhPJxlTozeERdzOMihQqX1dEP3H+HnoPVAcG9HIrnzfmpQZGVKOE9LHSN9pSjhSEaGM204Pa8oQQ==
X-Received: by 2002:a17:902:b206:: with SMTP id t6mr1058159plr.262.1592432147885;
        Wed, 17 Jun 2020 15:15:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z1sm776586pfr.88.2020.06.17.15.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 15:15:47 -0700 (PDT)
Date:   Wed, 17 Jun 2020 15:15:46 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org, stanimir.varbanov@linaro.org,
        viresh.kumar@linaro.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] DVFS for IO devices on sdm845 and sc7180
Message-ID: <20200617221546.GC4525@google.com>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

What is the plan for landing these, it seems not all must/should
go through the QCOM tree.

My guesses:

tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
spi: spi-geni-qcom: Use OPP API to set clk/perf state
  QCOM tree due to shared dependency on change in include/linux/qcom-geni-se.h

drm/msm/dpu: Use OPP API to set clk/perf state
drm/msm: dsi: Use OPP API to set clk/perf state
  drm/msm tree

media: venus: core: Add support for opp tables/perf voting
  venus tree

spi: spi-qcom-qspi: Use OPP API to set clk/perf state
  SPI tree


Does this make sense or are there any dependencies I'm missing?

Thanks

Matthias

On Mon, Jun 15, 2020 at 05:32:38PM +0530, Rajendra Nayak wrote:
> Changes in v6:
> 1. rebased on 5.8-rc1, no functional change. 
> 
> Changes in v5:
> 1. Opp cleanup path fixed up across drivers
> 
> Changes in v4:
> 1. Fixed all review feedback on v3
> 2. Dropped the dts patches, will post as a seperate series once
> driver changes are reviewed and merged.
> The driver changes without DT updates to include OPP tables will
> have zero functional change.
> 3. Dropped the mmc/sdhc patch, which is a standalone patch. will
> repost if needed seperately.
> 
> Changes in v3:
> 1. Added better error handling for dev_pm_opp_of_add_table()
> 2. Some minor changes and fixes in 'PATCH 12/17' as compared to v2
> 3. Dropped the mmc patch picked up by Ulf [2]
> 
> Changes in v2:
> 1. Added error handling for dev_pm_opp_set_clkname()
> and dev_pm_opp_of_add_table()
> 2. Used dev_pm_opp_put_clkname() in the cleanup path
> 3. Dropped the OPP patch pulled in by Viresh [1]
> 4. Dropped the UFS patches since they had some major rework
> needed because of changes that were merged in the merge window
> and I don't have a UFS device currently to validate the changes.
> 
> We have had support added in the OPP core for a while now to support
> DVFS for IO devices, and this series uses that infrastructure to
> add DVFS support for various IO devices in sdm845 and sc7180 SoCs.
> 
> [1] https://lkml.org/lkml/2020/4/14/98
> [2] https://lore.kernel.org/patchwork/patch/1226381/
> 
> Rajendra Nayak (6):
>   tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
>   spi: spi-geni-qcom: Use OPP API to set clk/perf state
>   drm/msm/dpu: Use OPP API to set clk/perf state
>   drm/msm: dsi: Use OPP API to set clk/perf state
>   media: venus: core: Add support for opp tables/perf voting
>   spi: spi-qcom-qspi: Use OPP API to set clk/perf state
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 26 +++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  4 ++
>  drivers/gpu/drm/msm/dsi/dsi.h                  |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c              |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c             | 58 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c       | 43 ++++++++++++++++---
>  drivers/media/platform/qcom/venus/core.h       |  5 +++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++--
>  drivers/spi/spi-geni-qcom.c                    | 26 ++++++++++--
>  drivers/spi/spi-qcom-qspi.c                    | 28 ++++++++++++-
>  drivers/tty/serial/qcom_geni_serial.c          | 34 ++++++++++++---
>  include/linux/qcom-geni-se.h                   |  4 ++
>  13 files changed, 268 insertions(+), 23 deletions(-)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
