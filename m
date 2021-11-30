Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08EA4629FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 02:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236913AbhK3Buh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 20:50:37 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:42969 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhK3Buh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 20:50:37 -0500
Received: by mail-oi1-f180.google.com with SMTP id n66so38178037oia.9;
        Mon, 29 Nov 2021 17:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tgy4edY9pGRm8kT3d6217bKg6opO3kPRlIz6J3SSLJ0=;
        b=xjccsQmxrn3FeZvX6Xr51/o8PZkuxxZ3GQhcMSztsPccKFOeAhZr+SwcS/WzuqFirY
         qoYVE/51YEuW2NDEX7edGinezoC/javcoZZHVb1g5Gxxh/fLilFLRRBqL1prJpL6eaB9
         CPCXgH69IioMWShYpR7pOA6+obO4p+wIK2Kq3Q9NmL0Wjfx9u4QZYrZdfuTMgNiKz2t8
         7XNuK1X4O52NryfS+4BuUXFeSY1gGiXuGzhcwU6or1ra7q3pm/q+A9lsbkDuNSqbw8Tw
         pOf7w9vQj2VpCJrCN9+SavbF1m3MPOmXK1sGU3QcBwv4YxSF6c+jLq1mhweo3twgTq/U
         tgHg==
X-Gm-Message-State: AOAM531Wcn3jmRlFFBOM1RG2t4c7jy2vmVh5kwophCW0BoZc5wm7iVUY
        KtXPiihHCME9P0vlL2E9WA==
X-Google-Smtp-Source: ABdhPJyzXo6wQaZkHTpCbltXhUflPOkdaQAJMRY4cJ1EBC8EIxN4lSucCBsuGCRGYqfoHr7v+W0xIg==
X-Received: by 2002:aca:230b:: with SMTP id e11mr1599242oie.22.1638236838792;
        Mon, 29 Nov 2021 17:47:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a6sm3410078oic.39.2021.11.29.17.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:47:18 -0800 (PST)
Received: (nullmailer pid 1001672 invoked by uid 1000);
        Tue, 30 Nov 2021 01:47:17 -0000
Date:   Mon, 29 Nov 2021 19:47:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: stats: Document
 compatibles with fixed offset
Message-ID: <YaWCpXV4A0j6u402@robh.at.kernel.org>
References: <20211119213953.31970-1-stephan@gerhold.net>
 <20211119213953.31970-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119213953.31970-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 19 Nov 2021 22:39:51 +0100, Stephan Gerhold wrote:
> Document additional compatibles that can be used similarly to qcom,rpm-stats
> for older RPM firmware versions that have the sleep stats at a fixed offset
> rather than a dynamic one. The exact offset might vary depending on the SoC
> so use SoC-specific compatible names to avoid confusion.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes in v2:
>   - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
