Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDB86A094A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 14:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbjBWNDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 08:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbjBWNDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 08:03:07 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125651C596
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 05:03:05 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id fd25so5165740pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 05:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDOFit7llw2/gJ6jzLJCmahPdSfAi0DepjG1IAxiPnw=;
        b=sFy4typzM2eOLsbkJQe+vXY8RZQNu0UdpoVzLNcyjTzyvY1oK49i4XDePvX1aB125R
         XNv/2o3Ztp2tdRZ0zvW+XJhKCPpk6o0XUVYD7bfzdJcX00NNg5bI90fC80Zgt0MLgJXB
         OKgZ4ehTF3EDtLwRDn9QFxSYWRTamgHmr0Beo49Z0Jlb9K8y7eTR2oDziqTNJe0vOSDZ
         fSIVMAsqiJaffVjtzZ41Lsh9MNQksmZenPta7WOeF8F5sOb9DO/wCzWIT2I2f4FWEC0s
         LlEgrTxnkXzHkfk5sMOg5SGwdAGYSKn4jSb+Is/Hobn2TTTUYIvo8FyqAcZsML3EtHlh
         PF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDOFit7llw2/gJ6jzLJCmahPdSfAi0DepjG1IAxiPnw=;
        b=nSN2iRb/lRIjTwXMgREorbs8UppR1uOq4K+0LLQTsIoF9YkzlYIPTL38rC5b+f8gUJ
         HjgSZXRZg8J9yjg0RYjVTj1w9A0ozHHP1aMsPKtu768iinJMcf/w9ZQ7dbj2nzuif5Bi
         ehOIMvI5+rvp0Mds2pNYRdAc7Yv5US5BVMAsUx6Co9zY5LVB9wFsQNamNUSqz13YD1f1
         derQOJHI5lIu3LaiselOEBgZqyxAzEnd/tAjOPYZNQYfn/jfUjAXaJa0CaFrP4fGHZEn
         4LMNiQfLzvO9PDS/uhVtI+NCzD2qEBBV5gBzlyv96w/Y3zdoJtwaynoTyxaWfqI+Sh8S
         Omdg==
X-Gm-Message-State: AO0yUKUS4De5XCzbs+f3HZPg6bWm8JVkMIrqdezLbN6dH2DYKCVeGSwD
        CyzRAU6MR9aPFLqJrFPCCTPT
X-Google-Smtp-Source: AK7set8RmPOqlaqJ5BqWR398VXNl+vStS+Es8uuVnuZgEnR0iokSb0dH7fO5GrQxrllNTeFi14oscA==
X-Received: by 2002:aa7:952f:0:b0:5df:421d:1962 with SMTP id c15-20020aa7952f000000b005df421d1962mr661952pfp.2.1677157384106;
        Thu, 23 Feb 2023 05:03:04 -0800 (PST)
Received: from workstation ([59.97.53.124])
        by smtp.gmail.com with ESMTPSA id j15-20020a62e90f000000b0058bc7453285sm7145680pfh.217.2023.02.23.05.03.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 05:03:03 -0800 (PST)
Date:   Thu, 23 Feb 2023 18:32:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: PCI: qcom: Add iommu properties
Message-ID: <20230223130258.GA6422@workstation>
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
 <20230222153251.254492-3-manivannan.sadhasivam@linaro.org>
 <896e047a-9188-de5d-d3fd-197b3fa208da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <896e047a-9188-de5d-d3fd-197b3fa208da@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 23, 2023 at 10:37:27AM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2023 16:32, Manivannan Sadhasivam wrote:
> > Most of the PCIe controllers require iommu support to function properly.
> > So let's add them to the binding.
> > 
> 
> If most of them require iommu, why not adding it as a required property
> to respective (or new) "if:then:" part?
> 

Well, I thought about it but then followed the convention of
"dma-coherent" property. I asked this same question while adding that
property but I didn't get a clear answer (or maybe I missed something).

So if you want me to add iommu properties to individual SoCs, then please
explain why the same cannot be done for "dma-coherent" as not all SoCs
support dma coherency for PCIe controllers.

Thanks,
Mani

> Best regards,
> Krzysztof
> 
