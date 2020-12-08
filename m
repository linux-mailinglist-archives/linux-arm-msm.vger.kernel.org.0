Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4451D2D2F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 17:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgLHQJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 11:09:41 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38489 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbgLHQJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 11:09:41 -0500
Received: by mail-oi1-f193.google.com with SMTP id o25so19921557oie.5;
        Tue, 08 Dec 2020 08:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gqy913jTNhiXuHNwdA8EIGtb2jTtxvgeV3/C5GrEFO0=;
        b=pRdmE/sFQO/XAJoSuKx8IIxcyXYk2Dg3xhGcjK/iZmzB1z62aXrdhxieOysifQFs4l
         bwxJGSwk1sv5INCLfdrezvyuUWKjgOD+cHetO6H8FF7Ze1rai1pV085mMNm6t6ku8YY8
         kR+m7L0Ca4w1j3enHMZVWXm3zGGNyw/jC/9RhpUMPJr8uzW5aBBRsBgrL5AISuEit5N9
         WpRUDwj1WKuDekin1ze+2HNI0ihHko1ENCScUIL6eobv+0bTDRKRJTVkTY9eX7wwU/or
         XZjzYftGWtdiWcFBaPionSo05oQineaKK/u9kcy11UjCl/7/+dy54Z3X6fPLVKZFeZVh
         N62Q==
X-Gm-Message-State: AOAM531Wg3XTbGba+wbWNB+K8YwE3+dXE0exNPbws+a9zBkVqdIBJYtC
        ArQIs94Me8OHWBleQXI/Vg==
X-Google-Smtp-Source: ABdhPJzn7QrM9vfH8+GNIiMEKD9w8Pwo/4nyIwLzsfka0xW5ft6dCLEL2uW4pfBb0Z4tl84Z/reaiQ==
X-Received: by 2002:aca:cc89:: with SMTP id c131mr3140565oig.2.1607443740607;
        Tue, 08 Dec 2020 08:09:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q184sm2003598oic.41.2020.12.08.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:08:58 -0800 (PST)
Received: (nullmailer pid 2620220 invoked by uid 1000);
        Tue, 08 Dec 2020 16:08:57 -0000
Date:   Tue, 8 Dec 2020 10:08:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vigneshr@ti.com, miquel.raynal@bootlin.com,
        sivaprak@codeaurora.org, bjorn.andersson@linaro.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, richard@nod.at, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: qcom_nandc: Add SDX55 QPIC NAND
 documentation
Message-ID: <20201208160857.GA2620163@robh.at.kernel.org>
References: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
 <20201126085705.48399-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126085705.48399-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Nov 2020 14:27:04 +0530, Manivannan Sadhasivam wrote:
> Qualcomm SDX55 uses QPIC NAND controller version 2.0.0 with BAM DMA
> Engine.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
