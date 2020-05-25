Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC001E1275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgEYQP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgEYQP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:15:56 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B45C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:15:56 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e11so8030679pfn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gq7KDxytrwBv3Ee6LFih9/KTjS7vsScQxcda5nNQ+Ms=;
        b=Ojfn8JqqBQKNdvSd4HpjRqRwRnE62A/rHtJxs74MU9uf7cmH1r7hohAX2tdclJ7BXj
         xdPhMSF97utN4AWhwYJAIpwX9YaKuJdWNsEv0OirKVrVWS3gPlLxyPMZVHAOm9v+AoJv
         FBEmR2ClctF/sTe6tSDkzC2LLnoEfpxFHgPPWbNkwE83qPdcPmgPVms84DR+Co1Yw+Wt
         gvvS1hjOfSjAfWC+s7njQ625zkmNisqy0UZ23ceVy0bH0WJioV8r1Dngn17Kgk7dFX0n
         fS9b3YYpaHIUB4RxhdPqtfkW6C8kE/aZGNbXl+3A129MLcAtqpUu0H7HMWC2Q0cqFJNN
         bokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gq7KDxytrwBv3Ee6LFih9/KTjS7vsScQxcda5nNQ+Ms=;
        b=Px+MfiIVZ8ZVbQho1k4Mrvf9Lw6sJiWiN1SAeqdl7O6bfEakv95D5+Dy3iTBqfymiJ
         1seiv0YK7BrRTmxFxR1cy2Zok+/E5f9QnlBz6ZNwSoDbPQsiPL7cwd/GTgl3DteKwZ0a
         R/AHDC4l2IuDmO81yp/lGPivD+xnfA+RFKagwZohg0UP6cEmOkeANCDSfkafkPc9rmfF
         kQ2WJ0N1+g3DEQCDbgA2yEiCG8zwFDejccgbfNdcjW2NZazfxmL47P/e/yVZ0UHmcjDL
         f6X2ROFD3EQqDQt59ACp+Keu0Ck2X/DRltxEbBzThHq70SNr3/Zq3gleBvc1142PkFbC
         baLw==
X-Gm-Message-State: AOAM533qiNvAxGUKWvvFJev2Ri5Wqx9w0+p4ODVf/XTqFieibuO9VYuF
        CjCnbTm6outlzKU2tPnwNInBug==
X-Google-Smtp-Source: ABdhPJx5O26DBjPbD+W02Sji+TfR+vDgK84YFsKmX7EKqaRnHafICtceif3e2vp0vgA6JP89sQ1Zrg==
X-Received: by 2002:a63:e549:: with SMTP id z9mr13461127pgj.213.1590423356161;
        Mon, 25 May 2020 09:15:56 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i10sm3040188pgq.36.2020.05.25.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:15:55 -0700 (PDT)
Date:   Mon, 25 May 2020 10:15:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv3 0/2] Add support for replicators which loses context on
 clock removal
Message-ID: <20200525161553.GA31527@xps15>
References: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On Sat, May 23, 2020 at 12:06:50AM +0530, Sai Prakash Ranjan wrote:
> This series is mainly to add support for replicators
> which lose context on removing AMBA clock like on SC7180
> SoC where replicator in AOSS domain loses context.
> 

I am good with this set but need a reviewed-by on the DT binding before I can
add it to my tree.  The same goes for your other set[1].

Thanks,
Mathieu

[1]. "coresight: etm4x: Add support to skip trace unit power up"

> v2 - https://lore.kernel.org/patchwork/cover/1244340/
> More discussion is found here - https://lore.kernel.org/patchwork/patch/1231182/
> 
> Changes since v2:
>  * Added DT maintainers which I missed in v2
>  * Added proper kernel-doc and header as per Mathieu
> 
> Sai Prakash Ranjan (2):
>   coresight: replicator: Reset replicator if context is lost
>   dt-bindings: arm: coresight: Add optional property to replicators
> 
>  .../devicetree/bindings/arm/coresight.txt     |  6 ++
>  .../coresight/coresight-replicator.c          | 55 +++++++++++++------
>  2 files changed, 44 insertions(+), 17 deletions(-)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
