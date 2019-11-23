Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCF1107C19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2019 01:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKWAok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 19:44:40 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37496 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWAok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 19:44:40 -0500
Received: by mail-ot1-f66.google.com with SMTP id d5so7804570otp.4;
        Fri, 22 Nov 2019 16:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ocM/TfQWn8TE8osmtfQ8wIGRKP2lr8zZ4qHKR/RTxk8=;
        b=MZL2RnXfBr0oQNz/jN6eDvGrlqEggl25jLFB/2JDoMW2z/vxnPgZseFxd/UDPyTgrq
         o6it096EqUSaPVpcZrH26XKBI6SJvRhCHkB4zwC8qRC9ruQPKyW+mLjo5+QdJE+s/0JY
         +ul1vY+5ogztPsdSVnnB/I5LdQjUzj/C/Yuf2EalJQEXMEAUO+kRCBbJKscpp+336ROG
         ZHJTbDzhOj0VOa3kmVvdo7mAJOtnr5I0voq3pjEnsCnwX0VuiSxZ9+a0VJKKxHejaCMQ
         pNKn044fU4IzXJIu8aHTvn5fpBo7T17RfXZMYjq5bO11U1E3LqZmy8wLk46JxwjciW2w
         uIgw==
X-Gm-Message-State: APjAAAXzmUbYU07RpcEKG8YTlZ2NaubUEguLrGzwk5sHQs+i1r8I/zFK
        rbb2HYfPY7tFxZcXVX90wA==
X-Google-Smtp-Source: APXvYqwTtwrVHOXVe5oR9OATyOVwIbX//sNr5xMzcE6pqC7NMGobhGuQsuCW78elG91OHMWuUlwY+Q==
X-Received: by 2002:a9d:604d:: with SMTP id v13mr12838416otj.222.1574469879638;
        Fri, 22 Nov 2019 16:44:39 -0800 (PST)
Received: from localhost (ip-70-5-93-147.ftwttx.spcsdns.net. [70.5.93.147])
        by smtp.gmail.com with ESMTPSA id m205sm2685802oib.27.2019.11.22.16.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:44:38 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:44:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [PATCH v3] msm:disp:dpu1: add support for display for SC7180
 target
Message-ID: <20191123004436.GA18110@bogus>
References: <1574252368-4645-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574252368-4645-1-git-send-email-kalyan_t@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 20, 2019 at 05:49:28PM +0530, Kalyan Thota wrote:
> Add display hw catalog changes for SC7180 target.
> 
> Changes in v1:
>  - Configure register offsets and capabilities for the
>    display hw blocks.
> 
> Changes in v2:
>  - mdss_irq data type has changed in the dependent
>    patch, accommodate the necessary changes.
>  - Add co-developed-by tags in the commit msg (Stephen Boyd).
> 
> Changes in v3:
>  - fix kernel checkpatch errors in v2

But not the one telling you to split bindings to separate patch?

> 
> This patch has dependency on the below series
> 
> https://patchwork.kernel.org/patch/11253647/
> 
> Co-developed-by: Shubhashree Dhar <dhar@codeaurora.org>
> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
> Co-developed-by: Raviteja Tamatam <travitej@codeaurora.org>
> Signed-off-by: Raviteja Tamatam <travitej@codeaurora.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dpu.txt        |   4 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 189 +++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   4 +-
>  6 files changed, 190 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index a61dd40..512f022 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
>  
>  MDSS:
>  Required properties:
> -- compatible: "qcom,sdm845-mdss"
> +- compatible: "qcom,sdm845-mdss", "qcom,sc7180-mdss"
>  - reg: physical base address and length of contoller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
> @@ -41,7 +41,7 @@ Optional properties:
>  
>  MDP:
>  Required properties:
> -- compatible: "qcom,sdm845-dpu"
> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
>  - reg: physical base address and length of controller's registers.
>  - reg-names : register region names. The following region is required:
>    * "mdp"
