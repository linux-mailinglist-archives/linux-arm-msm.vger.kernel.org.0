Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6C732F390
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhCETLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:11:16 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:32771 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCETLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:11:16 -0500
Received: by mail-oi1-f177.google.com with SMTP id a13so3702751oid.0;
        Fri, 05 Mar 2021 11:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Qe0t3xvl3xj63oeczWIhEDgvDLoHpC/HRpucgyYEMI=;
        b=uNuKSBNucglyh3oAgmIYWN4LjHvT7uc6YI7ijZDeU6w9gSqu0NvvLUe0xPyJarF8LK
         nLD7d6XxZvk+kke7oBK5zVkcbGTa2etirK5oR3/Nq31itpT0rErDkIqihxEfvpC+mUfr
         Q7DXpeByO86qyBq4gwFvjkOc5NVcr6NiD1jeuQn2t9/nWG76mQXOtAVwNNvl/Kn2nnV5
         8iY01gnIW9fZS1a4RSpL7eamoVq4BqLoUstL0sZsIj5MtFDQKDtKm8GgPm7nOjRy3Nsr
         /HsiK3VWwvSA1fWG0dMoUYtCTewH6zqNPQi8NcjC2bP51Qjr+PC6ufK7E+/nX5fZo/Bx
         KpMQ==
X-Gm-Message-State: AOAM5311UNfQR5D+Ep2wBe4TwMbYnQHzTZriaxArTc9+s98HOjagMLCE
        paNKrDQknRIC/KFJdhp6TA==
X-Google-Smtp-Source: ABdhPJy4Jn7BuBARMVuTuOANGSgFmVLXcqXJhCC5KtjZmTfuUjwd56SzpFg9C36NJJ6EUM17t6fCyg==
X-Received: by 2002:aca:4fd3:: with SMTP id d202mr7935873oib.11.1614971475429;
        Fri, 05 Mar 2021 11:11:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a49sm752384otc.37.2021.03.05.11.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 11:11:14 -0800 (PST)
Received: (nullmailer pid 490874 invoked by uid 1000);
        Fri, 05 Mar 2021 19:11:13 -0000
Date:   Fri, 5 Mar 2021 13:11:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add rpm power domain bindings
 for SM8350
Message-ID: <20210305191113.GA490826@robh.at.kernel.org>
References: <20210210104257.339462-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210104257.339462-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Feb 2021 16:12:56 +0530, Vinod Koul wrote:
> Add RPM power domain bindings for the SM8350 SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
