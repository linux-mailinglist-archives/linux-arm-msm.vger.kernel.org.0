Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8F1A730C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 07:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405537AbgDNFeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 01:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405536AbgDNFeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 01:34:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C169C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 22:33:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w11so5505917pga.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 22:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9aD5U+mD+PXEL20o7thcc3jEGnfFkwTVA8o04+l79Sc=;
        b=xGvR3ngqE8+uxW9/nrvVLEYOZ9BHXLN80IKtoKsIFv7UJlxg5y603Lt+HuChSe8Lfx
         p4BJ+621FR5CaGILNSpX5ijx0B96o9Uvy3Lo/w6dTRJrl3SjF617WgNmHqM4EcWD5kpw
         vC8ebbT500kTR64xYf+jMdV83jdT+E0CVenHaxaieCKjqTMJrGsGuZcS3sYKt+P+Y9EI
         EI4iyuQAzxapl5qmeUCkTaDxA9nGVpyLsslNmyFYdYJ4Xe2aMIQVFqoiYBOCDPzj+fH0
         NWDjVXrkFhUHd3HJU1i/BLvwJYWjuvxB4PVJvoD0ZgYA11iE0MUBHiez528t4Qlnd7n5
         FfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9aD5U+mD+PXEL20o7thcc3jEGnfFkwTVA8o04+l79Sc=;
        b=fqhPIjaKTTAtE5D2r3aLP6HIxp9mVzUrzAig5cL68SCwwWi9NXbKyZokNDMCV7k03C
         nMJH5IKkORiqy0BWt1JgTQCpZTrN1p7qMByrePg3JU1HTxhaW5fEJUCglqqqPvEY2mvk
         j/5IzsnkCZJCt+rmHHeJG0Mi6e9kWSVXuZfOb5/AI04Il/TuIJslUrbqIm8qs9fneZ2c
         UHUXOkkgIqu12YwkcdV+n+BwDaj8YkkFti2Tsgs302eUlDq76bl761B05hoYl6byduzf
         3JlHhT/0CImPjfKozxF67c9LBYbvrtqU/aMairCBOURtCXfvFJt3VpqhC3faMEZ4y065
         O4qw==
X-Gm-Message-State: AGi0PuYQZBWudsuP+/MUEGs5Tff0vt4OjR1m/m5P9h+HXRcmQlYBror9
        b5VNpb2BzV5tNocEfZXQ+3FwoA==
X-Google-Smtp-Source: APiQypKb5R46MCzek7ogTlEz5ouKBv6mQh1MAS3nQ3zcBA7C2POtzZh/pQS5Ez804Yi3+dcG9OyzRQ==
X-Received: by 2002:a63:4b65:: with SMTP id k37mr3872809pgl.118.1586842438646;
        Mon, 13 Apr 2020 22:33:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l123sm9260194pgl.13.2020.04.13.22.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 22:33:58 -0700 (PDT)
Date:   Mon, 13 Apr 2020 22:34:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH v17 0/6] Invoke rpmh_flush for non OSI targets
Message-ID: <20200414053412.GJ20625@builder.lan>
References: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586703004-13674-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 12 Apr 07:49 PDT 2020, Maulik Shah wrote:

I sorted them includes and applied the series.

Thanks,
Bjorn

> Changes in v17:
> - Address Stephen's comments on change 3 and change 4.
> - Add Stephen's Reviewed-by on change 5.
> 
> Changes in v16:
> - Use base address in probe only, drop change to save it in drv->base
> - Address Doug's comments on change 5,6 and 7.
> - Add Doug's Reviewed-by.
> 
> Changes in v15:
> - Address Doug's comments on change 3 of v14 and add Reviewed-by
> - Split change 4 of v14 to save drv->base in a new change
> - Address Doug's comments on change 4, 5, 6 of v14
> - Add missing NOTIFY_OK for rpmh_flush() success case
> - First 5 changes in this series can be merged without change 6 and 7
> 
> Changes in v14:
> - Address Doug's comments on change 3 from v13
> - Drop new APIs for start and end transaction from change 4 in v13
> - Update change 4 to use cpu pm notifications instead
> - Add [5] as change 5 to enable use of WAKE TCS when ACTIVE TCS count is 0
> - Add change 6 to Allow multiple WAKE TCS to be used as ACTIVE TCSes
> - First 4 changes can be merged even without change 5 and 6.
> 
> Changes in v13:
> - Address Stephen's comment to maintain COMPILE_TEST
> - Address Doug's comments and add new APIs for start and end transaction
> 
> Changes in v12:
> - Kconfig change to remove COMPILE_TEST was dropped in v11, reinclude it.
> 
> Changes in v11:
> - Address Doug's comments on change 2 and 3
> - Include change to invalidate TCSes before flush from [4]
> 
> Changes in v10:
> - Address Evan's comments to update commit message on change 2
> - Add Evan's Reviewed by on change 2
> - Remove comment from rpmh_flush() related to last CPU invoking it
> - Rebase all changes on top of next-20200302
> 
> Changes in v9:
> - Keep rpmh_flush() to invoke from within cache_lock
> - Remove comments related to only last cpu invoking rpmh_flush()
> 
> Changes in v8:
> - Address Stephen's comments on changes 2 and 3
> - Add Reviewed by from Stephen on change 1
> 
> Changes in v7:
> - Address Srinivas's comments to update commit text
> - Add Reviewed by from Srinivas
> 
> Changes in v6:
> - Drop 1 & 2 changes from v5 as they already landed in maintainer tree
> - Drop 3 & 4 changes from v5 as no user at present for power domain in rsc
> - Rename subject to appropriate since power domain changes are dropped
> - Rebase other changes on top of next-20200221
> 
> Changes in v5:
> - Add Rob's Acked by on dt-bindings change
> - Drop firmware psci change
> - Update cpuidle stats in dtsi to follow PC mode
> - Include change to update dirty flag when data is updated from [4]
> - Add change to invoke rpmh_flush when caches are dirty
> 
> Changes in v4:
> - Add change to allow hierarchical topology in PC mode
> - Drop hierarchical domain idle states converter from v3
> - Address Merge sc7180 dtsi change to add low power modes
> 
> Changes in v3:
> - Address Rob's comment on dt property value
> - Address Stephen's comments on rpmh-rsc driver change
> - Include sc7180 cpuidle low power mode changes from [1]
> - Include hierarchical domain idle states converter change from [2]
> 
> Changes in v2:
> - Add Stephen's Reviewed-By to the first three patches
> - Addressed Stephen's comments on fourth patch
> - Include changes to connect rpmh domain to cpuidle and genpds
> 
> Resource State Coordinator (RSC) is responsible for powering off/lowering
> the requirements from CPU subsystem for the associated hardware like buses,
> clocks, and regulators when all CPUs and cluster is powered down.
> 
> RSC power domain uses last-man activities provided by genpd framework based
> on Ulf Hansoon's patch series[3], when the cluster of CPUs enter deepest
> idle states. As a part of domain poweroff, RSC can lower resource state
> requirements by flushing the cached sleep and wake state votes for various
> resources.
> 
> [1] https://patchwork.kernel.org/patch/11218965
> [2] https://patchwork.kernel.org/patch/10941671
> [3] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=222355
> [4] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=236503
> [5] https://patchwork.kernel.org/patch/10818129
> 
> Maulik Shah (5):
>   arm64: dts: qcom: sc7180: Add cpuidle low power states
>   soc: qcom: rpmh: Update dirty flag only when data changes
>   soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new
>     data
>   soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
>   soc: qcom: rpmh-rsc: Allow using free WAKE TCS for active request
> 
> Raju P.L.S.S.S.N (1):
>   soc: qcom: rpmh-rsc: Clear active mode configuration for wake TCS
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi |  78 +++++++++++++
>  drivers/soc/qcom/rpmh-internal.h     |  25 ++--
>  drivers/soc/qcom/rpmh-rsc.c          | 220 +++++++++++++++++++++++++++--------
>  drivers/soc/qcom/rpmh.c              |  79 ++++++-------
>  4 files changed, 305 insertions(+), 97 deletions(-)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
