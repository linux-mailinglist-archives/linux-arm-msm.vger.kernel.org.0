Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B142D4E92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 00:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732005AbgLIXNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 18:13:44 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45328 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgLIXNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 18:13:44 -0500
Received: by mail-oi1-f194.google.com with SMTP id f132so3606887oib.12;
        Wed, 09 Dec 2020 15:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DbzHGImAcTT7vzhgLCNSr9SC7gGFu2mGT6058M0Q0tw=;
        b=gy0je09tDqDuWIP7onML7b0kKxVoQfxWxtuxSSRkS5Wg+pm/LUL/ZofJIxlpIgKp6J
         figA5FpBjZKU5nT1GgLPkTXWLyfTBoVwFnMcAO05Z5CsYx/k0Q24IRTLpy0s2vR4/cgJ
         hqr48AJS2qphLNkCiHMNyJKRijBzH0RdBcV3kiTiiP9Fs13owEaMfGOY1s+SYFOd8qcJ
         Zm0cKaQ0gwWGUaVLEukMBLJD6+EkxNpprkRcvvVDHVqPtvXOUD8LhV5OYz5Fi99sPBoo
         QKHsvGg+pH4vAYKNjalN7hoFU64vTyemEzCtwr7UVJ6r3zhSe2gtYIGEVTL3Vhr5saxa
         vOcg==
X-Gm-Message-State: AOAM532IfiHV4uLgToJmDbfHEAo+9in53/wYkLlSIPSdj+5i8Y7MWjC9
        FRKpH5aFY48btA8u+O2taQ==
X-Google-Smtp-Source: ABdhPJx4QoW1syGJSsrSlt1Q0AWlOF/+p7zbDKvks47RNx/PNOunSvrp1KBzpNrO3ErLINco0aU9/A==
X-Received: by 2002:aca:ec13:: with SMTP id k19mr3603672oih.97.1607555583202;
        Wed, 09 Dec 2020 15:13:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z14sm691739otk.70.2020.12.09.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:13:01 -0800 (PST)
Received: (nullmailer pid 1258522 invoked by uid 1000);
        Wed, 09 Dec 2020 23:13:00 -0000
Date:   Wed, 9 Dec 2020 17:13:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document SM8350 SoC and
 boards
Message-ID: <20201209231300.GA1258492@robh.at.kernel.org>
References: <20201204054347.2877857-1-vkoul@kernel.org>
 <20201204054347.2877857-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204054347.2877857-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 04 Dec 2020 11:13:44 +0530, Vinod Koul wrote:
> Document the SM8350 SoC binding and also the boards using it.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
