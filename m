Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DD033182C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 21:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhCHUKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 15:10:31 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:36372 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbhCHUKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 15:10:05 -0500
Received: by mail-io1-f53.google.com with SMTP id n14so11385688iog.3;
        Mon, 08 Mar 2021 12:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7EAFq/viqyqIPyoEX+zk4xe6NhJ32ufPCo/HyaU0d6o=;
        b=WoyzyFUjHlnlctOIVCd+cvdDUcYgTk2gDV6tAj3wu2nwDB2+qo88f/wMotEBxxWlyY
         EBfVdpq+XNyvZfo2y/C6L00++WuTGkJ6LY9DxNnJ+Q9P0x+GyaGexHuaYNhpxQzo/bM9
         /DbSZvH4kjMhnH8q7lihb/2OG8rY7bOPY4+3Ud21I09NZE5SpFRfET3I/vy+4PUaWaCh
         C2akQf8BbSdXMjNiBpzivXrT6LsAAjyppOPrPLllhv2k9BuDkB40RG5JDRtZJ6ccKOzl
         dSO0A6smX/aTC93s9/3Sb2oboi2Pm8MYN13QP/K83S8CCk6zU/zahfIgqwXjftKitBwR
         rNkQ==
X-Gm-Message-State: AOAM533W+QDf7+7j1IpA1iXDcU7A5sNCxLoAQmtE8Mwx0av4tRRhxeLY
        tmBs45pGEfLsS7To0WmGcw==
X-Google-Smtp-Source: ABdhPJxV74FVfrNcz/+KDeunaCCiPGF1Jb3oFoZ7w14TDd0tz/13IxvKO6XdQeChyCJhKpE1+a6k1w==
X-Received: by 2002:a02:230d:: with SMTP id u13mr25030047jau.53.1615234204460;
        Mon, 08 Mar 2021 12:10:04 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e4sm6553733ilc.47.2021.03.08.12.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:10:03 -0800 (PST)
Received: (nullmailer pid 2881476 invoked by uid 1000);
        Mon, 08 Mar 2021 20:10:01 -0000
Date:   Mon, 8 Mar 2021 13:10:01 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, swboyd@chromium.org,
        bjorn.andersson@linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v2 07/14] dt-bindings: arm-smmu: Add compatible for
 SC7280 SoC
Message-ID: <20210308201001.GA2881445@robh.at.kernel.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-8-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614773878-8058-8-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Mar 2021 17:47:51 +0530, Rajendra Nayak wrote:
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Add the SoC specific compatible for SC7280 implementing
> arm,mmu-500.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
