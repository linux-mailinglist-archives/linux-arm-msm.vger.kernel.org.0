Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0181D2C94C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 02:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbgLABjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 20:39:08 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:32974 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730096AbgLABjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 20:39:08 -0500
Received: by mail-io1-f66.google.com with SMTP id o8so25543ioh.0;
        Mon, 30 Nov 2020 17:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9OeJWnpbG+zxIgcKq2BZN7xUVLsnki92nBChXkb1cmI=;
        b=Msj8lApcPzVsEJMxwQN1srBwyHwxKqBvNk5ewffSXh5IMfutsmnCHnUXCwxkQksAig
         qnoEG79u6khGXQrqQBH/YYlxw/KATJgC+wfRr1uRN60X58WX2Bvi+nvXonXtWvB/VhfA
         KxluVMYfc5w8zqg2+sw4ML8t6DYIv7fudq1shVVq3m/I4uBeCs0Udl9+MIPwZMOcjr4+
         9fsZQBk2tFSfwfvmLBkkto0xGQBpIcCSMuwKHShCF0C41EX81AIUvyD0d/m/X8OmLYa2
         jXqnGIV/H2xL6VjOiEcH3B3omam8zrUCj9/Tn4fms5U2XSlZlq8uSDdYFKZ52XoLsDs3
         RAcw==
X-Gm-Message-State: AOAM5311B+Lio46dcIg2e2ndoj/R0MuNeexivYmQG9XeNQu5T2qKjIED
        IWiu8JTl7r5j67qosg+LlRdEDFEqiw==
X-Google-Smtp-Source: ABdhPJzrq8Yv7N2B6nNUFmcDmw4WI9s3GELNLVyNe56+SfGH0bGJAoULzpnvsJAhGQBOTZF6dW3PPg==
X-Received: by 2002:a05:6638:526:: with SMTP id j6mr588070jar.1.1606786701660;
        Mon, 30 Nov 2020 17:38:21 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o10sm188296ili.82.2020.11.30.17.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:38:20 -0800 (PST)
Received: (nullmailer pid 3445725 invoked by uid 1000);
        Tue, 01 Dec 2020 01:38:19 -0000
Date:   Mon, 30 Nov 2020 18:38:19 -0700
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 5/6] dt-bindings: clock: Add GDSC in SDX55 GCC
Message-ID: <20201201013819.GA3445671@robh.at.kernel.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
 <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126072844.35370-6-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Nov 2020 12:58:43 +0530, Manivannan Sadhasivam wrote:
> Add GDSC instances in SDX55 GCC block.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sdx55.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
