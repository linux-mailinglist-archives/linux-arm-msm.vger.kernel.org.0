Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0584248C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 23:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239606AbhJFVVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 17:21:48 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:36389 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239488AbhJFVVs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 17:21:48 -0400
Received: by mail-ot1-f49.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so4883071otx.3;
        Wed, 06 Oct 2021 14:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pyhogmJEeqF+fRaOZvZaj5jR3nUOG5lT+D5EE+dCDqE=;
        b=St1gAm4Yvz+pmSm+j0OGdSaUZIOTubjGJo20x6YAX9pMtpbzDXu9A1C9CtgMmnaHmd
         b0s9srV/8A1JDsCwvHotndpqZBeqBKBMWPQogsK8LSkHLND/YNdicrmqt/O7LaO1dCAd
         CaBy4rsR/6cpfeoQErWNOlv2Itkb6avOpT7pmKSm4bYwy3a/u9ZiCqwmyGUd9h0wuW0H
         qCyCE9SNNSPKCnzDdAkn6WLKu2w6wbmClRKFRspnFNkZQdCKAUOOAGL1MunjaZ5ZwqxW
         cZcBML/oaSHyHkELVL9jLCabcygf0sqsI05UwH+JX7iwcIa8zQs5LNBAVesjCs2AW2ln
         H+jg==
X-Gm-Message-State: AOAM5305u+w5YkN5xsl+cq/obgNx7k76xOzgERGtwCwdIoeQ+uQRtonK
        D7N8TIyryeRejICahEfZNw==
X-Google-Smtp-Source: ABdhPJyNWYvyWmDLX2Y7GKveOOWJYE/869Gr8NGwpvjE+C25InM8dNr085H9kZCDw+ecAUq/zlUeGQ==
X-Received: by 2002:a9d:1b4d:: with SMTP id l71mr464160otl.188.1633555195487;
        Wed, 06 Oct 2021 14:19:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d10sm4220923ooj.24.2021.10.06.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 14:19:54 -0700 (PDT)
Received: (nullmailer pid 2895941 invoked by uid 1000);
        Wed, 06 Oct 2021 21:19:54 -0000
Date:   Wed, 6 Oct 2021 16:19:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: smem: Make indirection optional
Message-ID: <YV4S+nwUAtiqu1RI@robh.at.kernel.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
 <20210930182111.57353-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930182111.57353-3-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Sep 2021 11:21:09 -0700, Bjorn Andersson wrote:
> In the olden days the Qualcomm shared memory (SMEM) region consisted of
> multiple chunks of memory, so SMEM was described as a standalone node
> with references to its various memory regions.
> 
> But practically all modern Qualcomm platforms has a single reserved memory
> region used for SMEM. So rather than having to use two nodes to describe
> the one SMEM region, update the binding to allow the reserved-memory
> region alone to describe SMEM.
> 
> The olden format is preserved as valid, as this is widely used already.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - None
> 
>  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
