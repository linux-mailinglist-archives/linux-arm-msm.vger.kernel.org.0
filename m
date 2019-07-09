Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6262462DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2019 04:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfGIB4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 21:56:49 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37319 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbfGIB4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 21:56:49 -0400
Received: by mail-io1-f66.google.com with SMTP id q22so17924241iog.4;
        Mon, 08 Jul 2019 18:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ebeYJSlqUBgPCFbuGYvtotmaCOfzw1YCdXQO1z6sNkM=;
        b=pW+JlbAH4dmSMZSXgRbhJtvbzTQiwYJcb7NSdjDDyvAgC4AMD+t3RLkZnvuX6rRDdG
         U1vMsVaDhqdWYt6hoCB2umvB+0jENcYumzJzWLnA+Jd0xAojmSbV+tgVnJHXTZo2y0P9
         q9Z6/IeqUV+jTso6+zICn+0giunbexZ8nfMX58pizX9lToXkiaDmOsgvoXaMDFnmoq0t
         n2mODSg8qmg4wCTvFMYsV680/ygw9ShZnVVgW/C2FPELpQCibnwfeIhMfh4EnESxjKDo
         jyVLB1DAkAFPyhu7RkF2UiMxnUxhcVbLGCZgUVWxe4WZbYwj9oXXqFt86+tlg6hNyvqk
         QE2A==
X-Gm-Message-State: APjAAAXL8NPvM4I+EMQEnPdBUGIl4bKaigSsjqvce9tw8Hj1ZCFGx8FK
        3m/dlkoqDDyKAsl/lWwQ/g==
X-Google-Smtp-Source: APXvYqzYGb59v7P/HBfnpafzo0Ah8x4i4rjPYIpOBl9Ui5xNOrFY2JQOg2tlDNaf3+9rdP9YbcsWPA==
X-Received: by 2002:a02:cc8f:: with SMTP id s15mr24386437jap.94.1562637408297;
        Mon, 08 Jul 2019 18:56:48 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e84sm19789686iof.39.2019.07.08.18.56.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:56:47 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:56:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SM8150
Message-ID: <20190709015646.GA30394@bogus>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607101234.30449-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607101234.30449-2-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 07, 2019 at 03:42:34PM +0530, Vinod Koul wrote:
> From: Deepak Katragadda <dkatraga@codeaurora.org>
> 
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +

>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm8150.c                 | 3649 +++++++++++++++++

>  include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++

Next time, please split bindings to separate patch. 

For the DT parts,

Acked-by: Rob Herring <robh@kernel.org>

>  5 files changed, 3901 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm8150.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h
