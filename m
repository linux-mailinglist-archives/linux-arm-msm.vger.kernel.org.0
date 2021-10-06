Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808884248BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 23:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhJFVU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 17:20:29 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:37635 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhJFVU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 17:20:28 -0400
Received: by mail-oo1-f51.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso1273920oom.4;
        Wed, 06 Oct 2021 14:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nztvh6IbkiikPBshf+nxM9zD+bQnj+yJie9stb0db+U=;
        b=xoCJ7pdowsm+sxL+Ezh2oiHV3nRFwqNGdI7VEOHyUXC+LUwrsvlVZU+atP1wCH4h/U
         x1JfuOPpe7LAo6jm1VrjiOs6fI1b1eiPYQhJyCYKbR0WPWNKH4+AWJC1RJOnO5S4JspT
         fcZZlB3hv+4DWUJISNa3W1TrqInGaGEdHEOm1hdWVyzzgCZ9C6SQ69wBeNVBEIeYqUnF
         eJXXd46aQEstNXZWKB77t8a3EKYAt/ie/e4G2ktRAX2D9K1v7Bz2nz2cOhgAaU1t+d10
         ZubXsElfYFRwZTCk935C9Hur1oFwDGVGpUalGY2frZ7qRTb6XcPj3zzbSja+4pot2ywG
         Hysw==
X-Gm-Message-State: AOAM531io177c3PUCud9QFsF2yuT+NnHICdWTH5+n1zUZiC2dENLQauE
        4Os4T+PlP4K4fBcTNG1J6w==
X-Google-Smtp-Source: ABdhPJygDBfzJdSEGwLTIJVzJx9WbinbeLrrLPsydYtDBcJz9RWZDmNtNSRDmxN7ctBdNKliuNjsiA==
X-Received: by 2002:a4a:dc1a:: with SMTP id p26mr518103oov.6.1633555115683;
        Wed, 06 Oct 2021 14:18:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u9sm4538894oiu.19.2021.10.06.14.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 14:18:35 -0700 (PDT)
Received: (nullmailer pid 2893756 invoked by uid 1000);
        Wed, 06 Oct 2021 21:18:33 -0000
Date:   Wed, 6 Oct 2021 16:18:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: sram: Document qcom,rpm-msg-ram
Message-ID: <YV4SqRsCvsTDPF4/@robh.at.kernel.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
 <20210930182111.57353-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930182111.57353-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Sep 2021 11:21:08 -0700, Bjorn Andersson wrote:
> The Qualcomm SMEM binding always depended on a reference to a SRAM node
> of compatible "qcom,rpm-msg-ram", document this as part of the SRAM
> binding.
> 
> The SRAM is consumed as a whole and not split up using subnodes, so
> properties related to this are not required.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch, to resolve issue with the existing qcom,smem example
> 
>  Documentation/devicetree/bindings/sram/sram.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
