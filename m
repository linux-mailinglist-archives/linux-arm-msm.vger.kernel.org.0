Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6CB2D335A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 21:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731388AbgLHUQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 15:16:13 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35803 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731140AbgLHUPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 15:15:06 -0500
Received: by mail-oi1-f196.google.com with SMTP id s2so11302089oij.2;
        Tue, 08 Dec 2020 12:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xxaopq3so+D3VgiVyFhrugWDVelEOkAwYhk9HecWERM=;
        b=suQoDPXB9xzFXcAQlrci3kaz72g5ZC2IA9wOs49eeRS/Vm1N3rcDEe5By3i3VlNZcY
         uhMJDIZwF2vc7ZUe604BGUCuICgMocxYK5LWKNg0YqY3p1qruvHW5YB9w8H0fLrtmCd1
         PcU+6RrvE6P3PaW5He4MsMnExSMZAiuAfFDmOULTjPLRC9mDhEtae7tW9T69x4O7BADj
         Z9DOXnbpQWaEO8brYb//ntdBDCmwSQ6ZvmlPEB4JTrtOCKJOpEdaEJCqdtsjrB4SIyZB
         FrO3K64G7FbczIp7DFCH7gU1kMQculNalU/F04ib6xlujUURTKvWkpPg/MKwb/DOS1In
         1Vdg==
X-Gm-Message-State: AOAM5309fWn9RYDX7Vc3qW8mtuh8TLoux2g3tKSFEy0YqVe1//ktNvwB
        KWIm56LrThVlhJ53XKXqKj6mBN/eYA==
X-Google-Smtp-Source: ABdhPJwPiRJXvyQF1/uDFMVO3nnTcFVq7zOJMUKs5BJ00h1kTQOwmGFlxY0X6AskgTdAadrOgEBJQA==
X-Received: by 2002:aca:b587:: with SMTP id e129mr4029751oif.90.1607456787229;
        Tue, 08 Dec 2020 11:46:27 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n3sm3625589otj.46.2020.12.08.11.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 11:46:26 -0800 (PST)
Received: (nullmailer pid 2962943 invoked by uid 1000);
        Tue, 08 Dec 2020 19:46:25 -0000
Date:   Tue, 8 Dec 2020 13:46:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: msm: Add LLCC for SM8250
Message-ID: <20201208194625.GA2962884@robh.at.kernel.org>
References: <20201127121127.158082-1-manivannan.sadhasivam@linaro.org>
 <20201127121127.158082-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127121127.158082-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Nov 2020 17:41:25 +0530, Manivannan Sadhasivam wrote:
> Add LLCC compatible for SM8250 SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
