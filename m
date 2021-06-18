Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE093AD418
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 23:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbhFRVGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 17:06:20 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46048 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhFRVGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 17:06:19 -0400
Received: by mail-oi1-f178.google.com with SMTP id w127so11980794oig.12;
        Fri, 18 Jun 2021 14:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TqQpsaLK+esgXTn20wN1XoitRPv/E5tklHK/5Zb8GAs=;
        b=npaSkGVpniIpI3E34Udf1Na+CKh43MEtjyd1rS6xradVYRq9PH2uRt3z9BtM7vqwT4
         nJeBPgeRVsYLYMj49bsAa/+IqjGevNR8aykY9hlsjcl1KTNilUbR6iTaOJMm4yIIhF8x
         MFI15lhzEFy0tqfYgG3l0TQz9cdSs3NJbfqj4nEUncJCuT/oYg8EyQI4pGIr88+7Uw/2
         cNYLBH9teTxqRHqE+XxHumdRZ6m1RUIJfBUE9kmvlrNuTNhzgnEmvQb0Z0duw99ythfI
         R1UQM7rpqJ3kJFzQ47Zxnenwjuw8mJ4Cgs4Ul/x7XVloXmdh7SvyWtt9TjQkgcIGbWIG
         uHxw==
X-Gm-Message-State: AOAM530SET/K9jCGgkhY7ViaBhdyR09klLUHWUsZlL481lq8A7YNt+sI
        JqolnIxuYU/9cB03fyLXDg==
X-Google-Smtp-Source: ABdhPJwVHrWrW873t5oh335FCxM/fUMQjEYLop6U4lSN3JFuKUjH2QkeI7wm6zxpuGA8uF6XQP1yzw==
X-Received: by 2002:aca:3904:: with SMTP id g4mr15687596oia.129.1624050248616;
        Fri, 18 Jun 2021 14:04:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a25sm238415otp.40.2021.06.18.14.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:04:07 -0700 (PDT)
Received: (nullmailer pid 2870738 invoked by uid 1000);
        Fri, 18 Jun 2021 21:04:05 -0000
Date:   Fri, 18 Jun 2021 15:04:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        robert.foss@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andrey.konovalov@linaro.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM8250 camera clock
 bindings
Message-ID: <20210618210405.GA2870695@robh.at.kernel.org>
References: <20210609022051.2171-1-jonathan@marek.ca>
 <20210609022051.2171-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609022051.2171-3-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 08 Jun 2021 22:20:47 -0400, Jonathan Marek wrote:
> Add device tree bindings for camera clock controller for
> Qualcomm Technology Inc's SM8250 SoC.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,camcc-sm8250.yaml     |  68 +++++++++
>  include/dt-bindings/clock/qcom,camcc-sm8250.h | 138 ++++++++++++++++++
>  2 files changed, 206 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
