Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA212F428C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 04:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbhAMDch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 22:32:37 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45856 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbhAMDch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 22:32:37 -0500
Received: by mail-ot1-f49.google.com with SMTP id n42so605971ota.12;
        Tue, 12 Jan 2021 19:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=76sM/7UvGAi4Toez0Erb44XvSRKHH+nk+o9NQbAC1Ac=;
        b=MBVU41wEEqtJcOThVkU0PZbggHXTNINC49ROenNZk5J8yKyXOr2/DcTwC8G+RoeRnI
         cmG27Rym5U86ke1WMTvh3hc66DPvt7bzTQjJxmZlXFj+oRCdR2y5StjQ4OOw9yE5imw3
         h7pVkoIMrD0ak+6ETWHWruJVkpKILJVxlBABy9dzQKd5YVWFefB2j1TvlWd/k0eBZlfT
         OTs0GodIoQpQWr7LbgrhrsDbDbHFVyWTWeB/6tzHsigMFq3IeUqSCoyqaVMhcT8BMfwL
         S/O6XcT844waTizzDYBENzpSHcDZQuGHSn49LiK+O9GF+3CIoXaNb1ursNr+u7C9/rUX
         fQrA==
X-Gm-Message-State: AOAM531dVLMlZggiTefenqJwKrRbdwzD58ENdsF4fKAEmhcYVzuO8QZI
        W5NrAkEx+gl5S8dZSnIoqeVsD0kQoQ==
X-Google-Smtp-Source: ABdhPJwd26Q8pJL1EbruyzwIhkFoAy2BOSR4OUJKOPb9+e50kXEKM1WRN7FR0+eBTx7J1Pz9JkmvfQ==
X-Received: by 2002:a9d:220b:: with SMTP id o11mr22159ota.212.1610508716473;
        Tue, 12 Jan 2021 19:31:56 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j11sm157877oos.47.2021.01.12.19.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 19:31:55 -0800 (PST)
Received: (nullmailer pid 1480612 invoked by uid 1000);
        Wed, 13 Jan 2021 03:31:54 -0000
Date:   Tue, 12 Jan 2021 21:31:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        viresh.kumar@linaro.org, mturquette@baylibre.com,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, ulf.hansson@linaro.org,
        devicetree@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Message-ID: <20210113033154.GA1480568@robh.at.kernel.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
 <20210108113233.75418-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108113233.75418-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 08 Jan 2021 17:02:31 +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
> platforms like SDX55.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
