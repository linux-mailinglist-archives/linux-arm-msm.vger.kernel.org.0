Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2902042DF4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 18:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhJNQmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 12:42:50 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:37749 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhJNQmu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 12:42:50 -0400
Received: by mail-ot1-f46.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso7290512otl.4;
        Thu, 14 Oct 2021 09:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bVtoOLFk8vKv2ef2PdCLzrS7N3cFMVjjFu9rOm79RAk=;
        b=B39Xt1QYZrmi9sC5tQkGlyPj4mJkcridBRbtWy5KSURnQXYx3t/cPID9WwPlXgd+gS
         0SAImDhkXUH2mHZWmQtapzhkxwm9n7pxl8l+NXQEz2aEfRrJQWt25WK22jXuuV9qT9ld
         /Z8unm2FcaQN8EzWo3lyStXU6C+sXCM/X+O3FaSYxH0FEjgsfH+5Q964gpTacXIrLF+9
         jlrMgDHGgOPNRRI2Y/HUN9aYeJDsmnQ/eu8OB5KJtgDn+z2mcdPowJ/IyPcWQG8E75V3
         Z92c51o02w481fx2fdi22ehVWfxtQ5PEvCBuMDkfqD8YqwQMhrjDcjbROuvDIqtrs4ix
         yN7Q==
X-Gm-Message-State: AOAM530aVCQzVcJVg94Grk5s3z0HnKOj+jHufCb0qkTuWFD9MM20YzZI
        qodBXi+P/mfz4102ptrjsE3ReysoiQ==
X-Google-Smtp-Source: ABdhPJyBXbZ+H53VwJdr37cLIej35EHN4+HdXOPjB3Dt01BeSPzFoovMQV+UMtG5znAcKgFiib+YWA==
X-Received: by 2002:a9d:6f93:: with SMTP id h19mr3460489otq.14.1634229644976;
        Thu, 14 Oct 2021 09:40:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u21sm663324oiv.25.2021.10.14.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:40:44 -0700 (PDT)
Received: (nullmailer pid 3508590 invoked by uid 1000);
        Thu, 14 Oct 2021 16:40:43 -0000
Date:   Thu, 14 Oct 2021 11:40:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 08/15] dt-bindings: arm: cpus: Document
 qcom,msm8916-smp enable-method
Message-ID: <YWhdi8gt95W2q+pB@robh.at.kernel.org>
References: <20211004201921.18526-1-stephan@gerhold.net>
 <20211004204955.21077-8-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004204955.21077-8-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 04 Oct 2021 22:49:48 +0200, Stephan Gerhold wrote:
> Since MSM8916 is an ARM v8 64-bit SoC the CPU cores are normally booted
> using "psci" or "spin-table". Unfortunately, some devices come with signed
> 32-bit-only firmware without ARM64 and PSCI support. This setup is easy to
> support since it's very similar to older 32-bit only Qualcomm SoCs
> (e.g. MSM8226) and only requires adding a few new definitions to already
> existing drivers.
> 
> Document the qcom,msm8916-smp enable-method. It is actually just an alias
> of qcom,msm8226-smp since it should be implemented identically.
> The enable-method is only valid on ARM32 and must not be used on ARM64.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes in v2:
>   - Clarify that this is only supposed to be used on ARM 32-bit
>     (Add comment to commit message and DT schema)
> 
> The "see above for ARM v8 64-bit" comment refers to this a few lines
> above in the DT schema:
> 
>       # On ARM v8 64-bit this property is required
>       - enum:
>           - psci
>           - spin-table
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
