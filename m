Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9227C3AA79B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 01:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhFPXoR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 19:44:17 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:43727 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbhFPXoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 19:44:16 -0400
Received: by mail-il1-f178.google.com with SMTP id q18so3808121ile.10;
        Wed, 16 Jun 2021 16:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UoOPrJZ73e5wIFEUoeJKokE3tlnOFu6gIU9BqXYbZfI=;
        b=We7io8M3IhKxPy8dymc/Nt4Ma5Te6t5oHO0c39aHZ9Z3ZisKFQQ4lxv95bMx8w1p/8
         KIG1AbiJZuTrBO42NESe8V3LRj7pyLxkAqzc4gIkAOlUE5nELWO83XMKaIo/86WwdFm2
         lDWRXfD6QfrXRXuu80HDuc0v39QgMXgNqV3j78MSJntPFa07wn/8IGBwroDVSSE1nGSF
         mz0V7dwtDve4qrF9oqVk+1QjZ7SFF9xyRxu2W7Y/lcxpfOXiW/NT9qgrbTRj6KjQGBmR
         nbBUalpbHbbjvor5ojhyNOL+fQcDoaP0Fc3beDPHWbYoFkYOMvwEwdB9WQwDU0XAeRtG
         bt6A==
X-Gm-Message-State: AOAM533ARZExXwsLzG0Q2wjWH4UnHMfMFYQBGaBI+x/HG8TCTG5bLPho
        ladp0h0UIpp6GLKlPTlxeQ==
X-Google-Smtp-Source: ABdhPJz5mN1w8Zkp0Re+HuVUIOtXCsoP0B3RThWLppuTU532lXrEaWAEpdwt3vC7wmvQFmhOBkhGFA==
X-Received: by 2002:a05:6e02:ea9:: with SMTP id u9mr1378779ilj.96.1623886928859;
        Wed, 16 Jun 2021 16:42:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm1969302ior.4.2021.06.16.16.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 16:42:07 -0700 (PDT)
Received: (nullmailer pid 303024 invoked by uid 1000);
        Wed, 16 Jun 2021 23:42:06 -0000
Date:   Wed, 16 Jun 2021 17:42:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add SMP enable-method for
 MSM8226
Message-ID: <20210616234206.GA302973@robh.at.kernel.org>
References: <20210606201612.100752-1-bartosz.dudziak@snejp.pl>
 <20210606201612.100752-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606201612.100752-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 06 Jun 2021 22:16:11 +0200, Bartosz Dudziak wrote:
> Add binding in enable-method property for MSM8226 SoC SMP support.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
