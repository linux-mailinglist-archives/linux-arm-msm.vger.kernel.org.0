Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274CD204B14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 09:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbgFWH3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 03:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731057AbgFWH3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 03:29:23 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AEBC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 00:29:23 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id s21so18014656oic.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fWjmAOPbHTLJzpYz+sy+z31E1izVE1LPqGR/mFW6VFs=;
        b=yAVFzV6PVBFAy2hY3vXcJzS1GczJUTFS5vZPzQh5LZcYNqiikW53hpz3rIe2XDPo8C
         0hyeFHa2yN+Ye8/nXtjZtOhOL1j0LPwEJxWCN6qm0oH9pzbzqypUzz6M7LrVrIYlznYR
         NhGdWbIxmcaBZFgmiZUGKeN1Y16cQJbhVGCnzhBcm10bHi2azAS2TcLflPfW4V501Ywm
         hu5zz2nY5lDEAk4TY/YCQZUdvTHan+c876RDZsWeZvM4eHYGP7Ly34ba71vF1bae+e4m
         ylnmMJ77TfoocM9VeWTlg7Qtt2Z6Yalq/jxUn9zZ3CHvUOVsRCncA6S4/4H4F/i1U49o
         4NZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fWjmAOPbHTLJzpYz+sy+z31E1izVE1LPqGR/mFW6VFs=;
        b=cyEbef/ygW875kcavDoSn8fNUdFCQVZDJo/+RGZ6uAtEfBNeGqd4I3JMzA2sNHCuy4
         ki6FI3bN5yVUsMUxsRCPqJdQ7Ndw7XcC3LX4cEPmJXp0ELACvdIeQWyEI/RP521i6HAJ
         wL4wzjIIgBsYHQDhOyr4kOkHkviiUBZH9JCBEN0rO5R/bbceEqMwz5VBxDcYLumvt1uA
         JyGHoqdWSZgD94HcOK/XOGa72vTv+r69n/F8xv0K6jKtjQs+iXBmZYj97FNx08msOOcq
         RHeErvtFNDCG/a7jRQ2iI41xkVy/xra1t6nQoYgQSqYTgbVNfLzmS8yWoQVK+A2vm4Yq
         T8lQ==
X-Gm-Message-State: AOAM5323PEYEzUhEas8K/2gk3NjSnb+LC+WCPVNhwJugjJsyDAMB+mK9
        KfOIKTP3DxIIlxq2B6qhnS3Y3Q==
X-Google-Smtp-Source: ABdhPJzP34B3Rwc4zxe2WgbBZFWKaQe90xa2tW61z475GjCUrbJCMHJrlaNe1KIzYpPZ5uM2CEUNCQ==
X-Received: by 2002:a54:4495:: with SMTP id v21mr15211852oiv.35.1592897362777;
        Tue, 23 Jun 2020 00:29:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m3sm4040184oop.37.2020.06.23.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:29:22 -0700 (PDT)
Date:   Tue, 23 Jun 2020 00:26:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/7] Documentation: Document pm660(l) SPMI GPIOs
 compatible
Message-ID: <20200623072638.GZ128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622192558.152828-3-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 7be5de8d253f..c3d1914381ae 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -23,6 +23,8 @@ PMIC's from Qualcomm.
>  		    "qcom,pmi8994-gpio"
>  		    "qcom,pmi8998-gpio"
>  		    "qcom,pms405-gpio"
> +		    "qcom,pm660-gpio"
> +		    "qcom,pm660l-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
>  		    "qcom,pm6150-gpio"
> -- 
> 2.27.0
> 
