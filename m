Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B9F4248CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 23:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhJFVWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 17:22:37 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38873 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239680AbhJFVWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 17:22:36 -0400
Received: by mail-ot1-f44.google.com with SMTP id c6-20020a9d2786000000b005471981d559so4863851otb.5;
        Wed, 06 Oct 2021 14:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wsk8RujENKPF2c4h64RRnI6VLfD/b5uYWJziNgJB7M0=;
        b=7hoBXHQnSVB1GM5P5S1vsI7bVDjrAKr7KAUlPPFUM4WVTFcwGPZ7VRDkIq/52XQFcg
         5vOz3h2pPTgvMscsSb/grySk7VdecMZguG4CkZ2j89sZk/sLl+bma6LxiM2WTIYUTxU2
         l2eQV5cXn300Ak1axjaX2wWa8xvw4+ACvLLZXig3FT5dnqP2oWAYfnWZeaMLmHWnsyo5
         /2uY1OvnC5QDCZ9jYFyxYVhbkwAKLQ4Dhb57a8wgSd0TJuEGuH0vBRm3rnTNS9WJqxsF
         tg5CFoKX4DE7P3XvzdOMkb0IX6YKWVyhJhdJ3q8WtpXxSGSLjkSCr9cE2PGj3thDUIgy
         SeTQ==
X-Gm-Message-State: AOAM530lg2mP0/h+NJeo1a08o9JWWwllhKK6c7jqdxrCuDurerZGaikl
        01fr6gK0xYPZ9mI2F7Muog==
X-Google-Smtp-Source: ABdhPJzk0l6OpNMLfyVJq6uEk7MSbYP8iSur8KxaREovhFU5d98gqEVN2G7ijUssdWzjCshNN35VWg==
X-Received: by 2002:a9d:4049:: with SMTP id o9mr455235oti.161.1633555243743;
        Wed, 06 Oct 2021 14:20:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s10sm4189966oib.58.2021.10.06.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 14:20:43 -0700 (PDT)
Received: (nullmailer pid 2897196 invoked by uid 1000);
        Wed, 06 Oct 2021 21:20:42 -0000
Date:   Wed, 6 Oct 2021 16:20:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: Re: [PATCH v2 3/4] soc: qcom: smem: Support reserved-memory
 description
Message-ID: <YV4TKh3XJYGOpGM3@robh.at.kernel.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
 <20210930182111.57353-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930182111.57353-4-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 11:21:10AM -0700, Bjorn Andersson wrote:
> Practically all modern Qualcomm platforms has a single reserved-memory
> region for SMEM. So rather than having to describe SMEM in the form of a
> node with a reference to a reserved-memory node, allow the SMEM device
> to be instantiated directly from the reserved-memory node.
> 
> The current means of falling back to dereferencing the "memory-region"
> is kept as a fallback, if it's determined that the SMEM node is a
> reserved-memory node.
> 
> The "qcom,smem" compatible is added to the reserved_mem_matches list, to
> allow the reserved-memory device to be probed.
> 
> In order to retain the readability of the code, the resolution of
> resources is split from the actual ioremapping.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - None
> 
>  drivers/of/platform.c   |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/qcom/smem.c | 57 ++++++++++++++++++++++++++++-------------
>  2 files changed, 40 insertions(+), 18 deletions(-)
