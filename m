Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B09247C54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 04:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgHRCyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 22:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgHRCyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 22:54:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7C6C061342
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 19:54:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t11so8533668plr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=289GtmYrcRm91a6nEwufxSTLcmmJ736QYsqJVvByhuU=;
        b=F0R4XzwnnyqJHeJUCbyzmsjQbgLmf6rtTWog/sUoI47YLSbJ8JoxlnSuZIjhmZRnD7
         PRTrg+5BrkQnwc/ATTQrVjVZtmD41vm4U96/65810PzS3l1PbpLMpknDkhaiFHoqtISO
         81C+y5KZesPUR9nF08uNbJSJYGENGbKx8hOdb5p/6/BPfiHG/Lwzv7DwayK+n8YIBubE
         kC+M8cW1gq8jFmKQkGaNeNK4OxjrkVLqKB2uTZU0/ONxvgvGwWEusVEtiTe7XCWsVIWz
         1QgVVSzhDWZqp2M/I6u566I3JNIsy2cbnGbN94fLjJGXWMh0bLlt9I8AiiBdkBWeVTow
         9ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=289GtmYrcRm91a6nEwufxSTLcmmJ736QYsqJVvByhuU=;
        b=ALsgZrlU5qFTMZGCq//xywGlSo54AqeFf2kMJTmxotaP/i6A9vjph2sPtM01d3N/79
         UBgZmjobALtXc+9EfN/xeI9YBKoUBuLor31TQTK3JnLVlIC8lZtOtL4Kcfr67lqTjBtB
         of2Of0woQNxq1rxxdwABqo/K+pADSz18b/vifJvlP0MgCxdYgvlF/cv7yHOzbmoxsPZO
         7Uh0Ihox7m58g+rWWMSdaGDWjigPHF396dWjtmQz6WE+B3HZ1Ru4vCY8unPlA3a5CKip
         A8rwivXvc0hVsalepA53IIjq6SRpSFxQQ/6DOyQ72ertD4WIPFALVYtJ8T7PlCLCaffp
         n1cQ==
X-Gm-Message-State: AOAM532y8erKsT69AfzBbHdjbaQHoSzbULPmp/LpHIYmtASGonS4Hgxp
        vjNA+oylpXwQaLYm5EO/CgkS
X-Google-Smtp-Source: ABdhPJyMXBWy1Xrp26PFY2sg+IztE08qWr/nquNlkaQiKfmiT6PpwKjMSkYjogqAPMKcRd4NlkgxRQ==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr14568659pjj.6.1597719255463;
        Mon, 17 Aug 2020 19:54:15 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:796:aa9c:e184:5916:ccba:b6d1])
        by smtp.gmail.com with ESMTPSA id nu14sm20149111pjb.19.2020.08.17.19.54.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 19:54:14 -0700 (PDT)
Date:   Tue, 18 Aug 2020 08:24:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] MHI stuff for v5.9
Message-ID: <20200818025408.GA13207@Mani-XPS-13-9360>
References: <20200723142738.27159-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723142738.27159-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 07:57:37PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is a single MHI bus patch for the coming v5.9 release which fixes
> the kdoc comments.
> 
> Please apply!
> 

This lonely patch seemed to have fallen through cracks! Will include it in
v5.10 series.

Thanks,
Mani

> Thanks,
> Mani
> 
> Randy Dunlap (1):
>   bus: mhi: fix doubled words and struct image_info kernel-doc
> 
>  include/linux/mhi.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> -- 
> 2.17.1
> 
