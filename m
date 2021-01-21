Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD89B2FE917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbhAULnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730505AbhAULlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:41:53 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A080CC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:41:08 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id p18so1170472pgm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Grnv1BY39ZpTOwqxY3Q8GBSHVo/zJX0hmfj++nFS1DY=;
        b=PMBxCPy325X7ku3lxRR+ip5TL5qdzvTVeoStWxw5GZ2lusCaGIF15+D8XSkHzhfssa
         GFFwtVRXsgtGaoJWYckroIQ/M4hfkLnZ+RPS6wNnKV6FbhouTGhuwl+i/TQCe8I8hOF0
         CIJT0DJ/TUF0dND2+WieQ3NhSDq0QYIqhkhEpn8wkL9mv7ekFfxVlppW7sdyff3QbSuv
         K256U+/47K6mzOg14eLUp5IhXF4gnyjXz56ZQcG47QOvzFWGJa5sTNmWI86WA6xWwBYO
         MwiXM+5pEDahXVOtWKoP52IAyo8FGpWrf3UPdaP6lMJLYHFsvpjWJIHCTnOjHLa7l3QU
         agAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Grnv1BY39ZpTOwqxY3Q8GBSHVo/zJX0hmfj++nFS1DY=;
        b=tLJ4sQmSnzjADcLB2ZzD52t6Oxd9EwXyWjf0svPnLVG4gumM5fu6TyHo/LerX2hgzM
         gjnWGObGDTvtT3XUMr658GBF8lI2LtWiU5I+T2cyy3mR7o0UnY7NndktV3yHekGY6jTi
         imZINqyUp1yyJt3gPVjoTzsyOvxcupQFL8UvV9qOme5rUbzBrGmpANqncargQOUEcaoe
         T0tHBa484doIQI+xyWjSNKk9wh/KZnsQvhhn/MBUBcQB6eRSuK5mq7TpAGcXolK8vc9K
         rdkEjeJz9kYxJW3OfQkSH/YCDAmFmV3bz5mYS/WWItQA/dGpJjcI1lIf+aasQ6M366rr
         gQaw==
X-Gm-Message-State: AOAM5316a0dbsjkLQeUNpMtA3HwSo8nV7Nh9iIuaDLwtPsPVUFdmB4xs
        GxyLvBTiFr6HbWbW/w2OWFCqrEqltbdL
X-Google-Smtp-Source: ABdhPJznpRKHElehPuL4qbJbhxi2GzhJtbQEE1aoh0ECi4SwRKcGvT4AW+5rWsLmpH3FwFPvbaUVhw==
X-Received: by 2002:a65:434c:: with SMTP id k12mr13656396pgq.373.1611229268181;
        Thu, 21 Jan 2021 03:41:08 -0800 (PST)
Received: from thinkpad ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
        by smtp.gmail.com with ESMTPSA id x8sm2200142pjf.55.2021.01.21.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 03:41:07 -0800 (PST)
Date:   Thu, 21 Jan 2021 17:11:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org
Subject: Re: [PATCH v3] mhi: core: Factorize mhi queuing
Message-ID: <20210121114102.GG30041@thinkpad>
References: <1610384195-14211-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610384195-14211-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 11, 2021 at 05:56:35PM +0100, Loic Poulain wrote:
> Instead of duplicating queuing procedure in mhi_queue_dma(),
> mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> as common helper.
> 
> Note that the unified mhi_queue align pm_lock locking on mhi_queue_buf
> behavior, taking it with irqsave variant (vs _bh for former queue_skb
> and queue_dma version).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: re-integrate pre_alloc check (Mani)
>      comment about _bh to _irqsave unification
>  v3: move pre_alloc check in queue_dma/queue_skb

Integrated this to the v2 and applied!

Thanks,
Mani
