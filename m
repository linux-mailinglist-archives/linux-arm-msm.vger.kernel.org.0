Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910EE26BDAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 09:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIPHKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 03:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPHKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 03:10:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5415C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:10:15 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d13so3376190pgl.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dCN2AFryqy+FayqDrktseJf4Knff8xTZtC15klQo6HI=;
        b=DKkZQkytUjTwB6aIU6j4eONmza9A70oFPJkSMH1+DRwON/kyhR42FZpvfsHiJSz+XI
         ARVeqU8mDPxQLyrOJFsBNdpHwNfNn8x4RG8R/lJ3aehUm98MzbYsCszFoM3gPpLorwXK
         W86jyHqMG9qbjO8RFsoK9KEtvhfRe+lkWU5n9riBFiJXcegLPo3K947iuKofzQ45gGWd
         irFLCM0HgE01iIgV6oA3Vi3DXlVz/ogf9kZ1SfZnc/pKJOl+Bs3D1aWzpKj9S8HlCOkJ
         AkNo2w5m3ON8yB/tSWt0a5T1EX3jqbxnL1c2xj2uYTz0mvBV3VjAHZ4KC9/LnHqTj6de
         dncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dCN2AFryqy+FayqDrktseJf4Knff8xTZtC15klQo6HI=;
        b=CdQvrp62iopCeDko3GxkrxF1sgjSw2hb39dWAj8+yXV2ZKsgun0u1b2vmos9HSfege
         Rjxv3lVj8uClVKuFk4JW5jvuKffDNpGIpmKi3pf5pSIgB5h5YTAANFlL6RlyEOG7/VT8
         wqTGQFQ5+4BWJnfi/bublufoa+Pvuj3+WLyGDrqjI99+aVWftdNulzJTmm54WoPdn5ui
         A+rWWH0l9nxEq83Vy3P/6ykdT2DFOE5zrzoTfUi5XeMnIB/wQaeuf1bVklyJiqr3MLpf
         hTc1x6PkSuQ2WD8e9YriMWYjHb1ngmKgKnfPnR+DN4yw57z13tRrCv3FVFMrC353DBMw
         2p1w==
X-Gm-Message-State: AOAM530jSv0ZgDyjazAJCAf27DjqxM2hImB5hh1M/rUABzlEvJF0JL8I
        PLOnX6Wc/5WJadle42OyGo3NSw==
X-Google-Smtp-Source: ABdhPJwEKxo7Fjj0kYT7JCpuobL1YW/w9j9hFb9Ge9no8gjp05kHeLFv593g9FA9eT2Uix1Bqu/DpQ==
X-Received: by 2002:a63:5f8b:: with SMTP id t133mr18058069pgb.238.1600240215289;
        Wed, 16 Sep 2020 00:10:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id j4sm16730075pfd.101.2020.09.16.00.10.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 00:10:14 -0700 (PDT)
Date:   Wed, 16 Sep 2020 12:40:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     rjw@rjwysocki.net, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, tdas@codeaurora.org
Subject: Re: [PATCH v2 0/5] Add CPUFreq support for SM8250 SoC
Message-ID: <20200916071001.vr3wxpprfrordpcj@vireshk-i7>
References: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-09-20, 12:54, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds CPUFreq support for Qualcomm SM8250 SoC. The existing
> qcom-hw driver is reworked to support the EPSS block on this SoC which
> handles the CPUFreq duties.
> 
> The EPSS block supports additional features for which incremental patches
> will be submitted on top of this series!
> 
> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Dropped the regmap conversion patch
> * Used "qcom,cpufreq-epss" compatible and "epss_soc_data" for dev data
> * Switched to "of_device_get_match_data" API
> * Collected reviews from Amit, Viresh and Bjorn
> * Dropped patch [3/7] which got applied by Viresh
> 
> Bjorn Andersson (1):
>   arm64: dts: qcom: sm8250: Add cpufreq hw node

Applied all except this one, as it will go through ARM Soc tree.

-- 
viresh
