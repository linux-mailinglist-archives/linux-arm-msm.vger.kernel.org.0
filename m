Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7888E3A8C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 01:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhFOXhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 19:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhFOXhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 19:37:06 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8B8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:35:00 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso620621otm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1SXIGYOCCwrEprlwkDNLeMzP1j174DyS0Qx64mDoDE4=;
        b=rRPv7dwDzwEkml4dxzWW2W/z7tVfDa8081oNKZR22oUeYQqc2fIaT4Szmz56crLMtn
         k+kC21OH+DIQBM5I/IYsVDnyoDa+ly4rStuTfGtNe/WKcL2o5bo4XRfRBbe7VCHkILQ+
         S/qX/Rp7jZiFeD20tkbe6pZV2p7UrbJ26bhVUlTe+t5STalnCY3SzONNJbfIa7ZQ42mr
         m+Qn2Dg5r0bFLT43Rflk2RaNRa1ymx5DQu/3zdP6CvTRNlqSmd57qI9xq+0ZWJJFDoyU
         m7BNt9wgLT/xJ0kv8WDbXGo9tGbhvIdvysO62d1NKgAonKRkTUNh2Hysi8U2xofLc/95
         32fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1SXIGYOCCwrEprlwkDNLeMzP1j174DyS0Qx64mDoDE4=;
        b=XVqXcGSJSNhDvFh2EmRi9PSDra7Znex9DyNWUKPAWhdrRrO4EeuV+Y3t5lsANzp80B
         j+gQ9R0DkgebZt328Qu3hmyfuM44NkTG5du2UuDXmgLyHw6PUsrnOnj+u4ugiyrgNdXQ
         MveagKgXOPZzzUrGELERFCGb55YWugYtfo0TEsh5XJmxsweYo/doywSAMbMSteiGYTc1
         xdVcP5N4SL0ZHX3ap6AQtk5PXCmNEJc10y+N3f/MWe493wLnSc6q3KXgU33IXfeG4sbs
         JIIx+ykdDNsWmSv3ZSNeYLhMhL6HJnBDfPD+YsuXSZ03+SYdzLwLCgdVKk/tUt9SjKV8
         ADFw==
X-Gm-Message-State: AOAM531JvQ3K4biyGa7va9Mo1gm10pogLAaMB96U5KqfhSHQuDVhX9je
        lgfn+8a/DjadLHetRzXXEQ04XA==
X-Google-Smtp-Source: ABdhPJwJoUtletQNmpDSr4lg8tKxRbP8aCDUPUswS+TTyMYWUpvAPneZi4UEbbTZBqsOMaYE9wMiwg==
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr1423471ota.116.1623800099792;
        Tue, 15 Jun 2021 16:34:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p17sm102666otp.73.2021.06.15.16.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:34:59 -0700 (PDT)
Date:   Tue, 15 Jun 2021 18:34:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: qcom: gpi: Add SM8250 compatible
Message-ID: <YMk5ISpTel58qGqx@builder.lan>
References: <20210614235358.444834-1-konrad.dybcio@somainline.org>
 <20210614235358.444834-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614235358.444834-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 18:53 CDT 2021, Konrad Dybcio wrote:

> SM8250 seems to work just fine, so add a shiny new compatible for it.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/dma/qcom/gpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 43ac3ab23d4c..1a1b7d8458c9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2282,6 +2282,7 @@ static int gpi_probe(struct platform_device *pdev)
>  static const struct of_device_id gpi_of_match[] = {
>  	{ .compatible = "qcom,sdm845-gpi-dma" },
>  	{ .compatible = "qcom,sm8150-gpi-dma" },
> +	{ .compatible = "qcom,sm8250-gpi-dma" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, gpi_of_match);
> -- 
> 2.32.0
> 
