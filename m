Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A2D28D21A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 18:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389568AbgJMQVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 12:21:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45063 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389406AbgJMQVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 12:21:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id f37so514803otf.12;
        Tue, 13 Oct 2020 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IdoZU5IhKB0GQX00X4PaGMQTcXMx5pZQBHr3ZUv7LVE=;
        b=Kc6XMNaq9jOD5jx2UbVs5PcAToBf3LG2yEpNoWIj+YibOkB7VLFoSxUoI7XmqC9lhH
         ncFURB1FAe8c6nVLoI79L9DikkeWvp5ng1mVuHys5FwZ1Y+CBuScm6BgimNJhBOsnk+H
         hHVvuO8k++e/9VmRsjy6OGuMBwkaFUdFZP38Ok6uN8Zn/qlkzbTlv9QGONXeMlT5HWXh
         6n4/Sep05/jsYHTzFBFVO9po3tRxxlN/IMAbUR5rN4ZC+7TqkbQk8vFyLoBMbcDQ6iKj
         v8fN1exukuej2qkHUzGUYalq0THuUNOX4pECq56GUHO+WUeULbpcqmGwxs8cp5ODvn7Z
         2RzA==
X-Gm-Message-State: AOAM533tuaiNe1YWqYJ19Gx9+8cLB9PXkH9Gg68fGBHMjKlhJT2FW84T
        PO5v8WoCjTmafOko7ZRO6A==
X-Google-Smtp-Source: ABdhPJzmgDK5IcCO0sk/bmk6TyP+WJDVO2wUjLt2zHWTkRQiazEcZTPXdTwPapL4qUzSUtjf91w4bA==
X-Received: by 2002:a05:6830:1d9a:: with SMTP id y26mr315140oti.168.1602606106985;
        Tue, 13 Oct 2020 09:21:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m7sm55879otk.74.2020.10.13.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 09:21:46 -0700 (PDT)
Received: (nullmailer pid 3632249 invoked by uid 1000);
        Tue, 13 Oct 2020 16:21:45 -0000
Date:   Tue, 13 Oct 2020 11:21:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Md Sadre Alam <mdalam@codeaurora.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vigneshr@ti.com,
        sricharan@codeaurora.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, richard@nod.at,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: qcom_nandc: IPQ5018 QPIC NAND
 documentation
Message-ID: <20201013162145.GA3632190@bogus>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-2-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602307902-16761-2-git-send-email-mdalam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Oct 2020 11:01:38 +0530, Md Sadre Alam wrote:
> Qualcom IPQ5018 SoC uses QPIC NAND controller version 2.1.1
> which uses BAM DMA Engine and QSPI serial nand interface.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
