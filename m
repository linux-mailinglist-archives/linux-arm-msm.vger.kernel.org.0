Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179FD3C9288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhGNUxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:53:31 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:41873 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:53:31 -0400
Received: by mail-il1-f179.google.com with SMTP id p3so2930078ilg.8;
        Wed, 14 Jul 2021 13:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OWiXarIXPKw2aPNSw9cZV80U357Vkr2GsrGVpeyjsQc=;
        b=r+p5GVPlvwqJBg7VZwdjrNVLcebvyuIEReFtyCCY7FpWztuF9gogCX5fHog7UO8gRp
         xi83kU7SHalZGQwrvNzGargsnal4ojFVuemA4kX6uYgWtdVDAR3CMbwcMM8G/BYaUvLP
         P2p0vjs3wtTWIIvFOOHk6OjgnOBRZv4xrc7toD51im85wM5gaTa/L2jvBB50FGTRtdtm
         znhH1u90mpfe/G7xInM10wV/bYLfxaAsmtWbxT72t4FKnNIbXkNiWbOYFvnxaJQ2DJpS
         7ckXxqCEcLGmBRlnQukoC5xIMk+C8b3Gdou8OZpw9X3/4iwbjXc4wFOBD1qulBRtnpfX
         g5Fg==
X-Gm-Message-State: AOAM532KGu+vivFgf+OvcBuYZbTnDUc1F6f092Q0Xi8LYuIINsXt4ICO
        1fSDDtZLzvvBxYzB9u8Ydw==
X-Google-Smtp-Source: ABdhPJzIfokFz27UgVWurE1fZaeC9BUgl5IrSdDrPhzocFmPLHSsTMbDVpo92BgESGG0aAKy86GhDw==
X-Received: by 2002:a92:ddce:: with SMTP id d14mr8016882ilr.279.1626295838837;
        Wed, 14 Jul 2021 13:50:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 204sm1844033ioc.50.2021.07.14.13.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:50:38 -0700 (PDT)
Received: (nullmailer pid 3498425 invoked by uid 1000);
        Wed, 14 Jul 2021 20:50:35 -0000
Date:   Wed, 14 Jul 2021 14:50:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 4/5] dt-bindings: power: rpmpd: Add SM6115 to rpmpd
 binding
Message-ID: <20210714205035.GA3498367@robh.at.kernel.org>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
 <20210627185927.695411-5-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185927.695411-5-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:59:26 +0300, Iskren Chernev wrote:
> Add compatible and constants for the power domains exposed by the RPM
> in the Qualcomm SM4250/6115 platforms.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
