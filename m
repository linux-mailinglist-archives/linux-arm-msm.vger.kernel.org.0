Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F1E145981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 17:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgAVQKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 11:10:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33317 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgAVQKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 11:10:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so6774718otp.0;
        Wed, 22 Jan 2020 08:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TgzJ9ZutlYtvfAqgtYkqR4r+agw8THf+icQvm+26OKo=;
        b=p/WSlOHZYu1J04rw2VLiAHrNeWDfljkJ0AD88iAR7BE9m9aJYrSiUGt8xmOrrfpCnV
         ak81RU0yZ59Q8OS465x+e5q51ROOCpuFj2d0LlwgK7ItseEoneJ7cIkyVFvmABKJV2UR
         cEXDQ2Yw4hxX2ZY8LAWLlAhx3ULq/EQr7aAklVx4iS44gt3wLUMuR61D5q+hIdr85Xyx
         xR+6ZKdRdgr/jk5DEks6TCAbYWRblv5jtWsTMzzLUqKqTEqLpojJTwxL6IxOKS1/bkQO
         UM+ekHlXHsOuF6NYN0X9k95JnBbPpbMCiz9Jwh8vdXGorwWEM0jXqBzmWraVA0yVMzzx
         6GFg==
X-Gm-Message-State: APjAAAUoS96wt9YlJFZUBJSTmsQ3wA269XIovwyLLFjgemfgg/BTpIi1
        K5BhWtXFDxzejSCcf6eHOQ==
X-Google-Smtp-Source: APXvYqyOIAOrAEHzXYhJhhnCgRLpP7u3uvTd0SqsZnLeBC8DI/vNn4PSdtAK3tvJcEPEa+32hJ8dFA==
X-Received: by 2002:a05:6830:11d2:: with SMTP id v18mr8306701otq.151.1579709410683;
        Wed, 22 Jan 2020 08:10:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e65sm14911359otb.62.2020.01.22.08.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 08:10:10 -0800 (PST)
Received: (nullmailer pid 18272 invoked by uid 1000);
        Wed, 22 Jan 2020 16:10:08 -0000
Date:   Wed, 22 Jan 2020 10:10:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: clock: Add SM8250 GCC clock bindings
Message-ID: <20200122161008.GA18205@bogus>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-6-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-6-git-send-email-vnkgutta@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Jan 2020 15:39:52 -0800, Venkata Narendra Kumar Gutta wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add device tree bindings for global clock controller on SM8250 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        |   1 +
>  include/dt-bindings/clock/qcom,gcc-sm8250.h        | 271 +++++++++++++++++++++
>  2 files changed, 272 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
> 

Acked-by: Rob Herring <robh@kernel.org>
