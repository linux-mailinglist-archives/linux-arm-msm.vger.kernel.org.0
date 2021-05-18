Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A57386F00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 03:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238781AbhERBQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 21:16:55 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:39472 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhERBQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 21:16:54 -0400
Received: by mail-oi1-f182.google.com with SMTP id u144so8233182oie.6;
        Mon, 17 May 2021 18:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LuVNq72WnGz1x5uFUjZ9BxC8TtfLJq/4EYkRSHkXnXU=;
        b=Y+xVVc9xBjfdORlHbt/eHL8D5RPHX+7GTbZz/0WpqaG/2rt+ucCToLwP/kY+zxvmES
         rqIjv/dc1PeFKhp+ebmafodGIuuUWHTdfuFvOjHeOewQjQV59vf6bqWQ8MPdpq9FKNEp
         cbHHaQovLFSQrq/esXMYcYjsl1pnvMVSs4HPvywlFrHwU0UBmCJ0kvfoBGAUhp/3QPfD
         TpGNWadiqRBWSDARzdNRflQTfcDwdYbREJgL/f/mDe54VAVfZ3jaUmvnMQEdFrQw4xBp
         noHsp9NIwBBByA5IwFdaWvh1jV7PN10j9hSocjsccqpGCbGAyE7pHz9Mbw2jtxUpgWQF
         Wt1g==
X-Gm-Message-State: AOAM53343vEDSxWJeSIazypOwGe2UcFtk0AnfQRGn4QwYP+0nrmJl12t
        rPss1zcTQap1gfmtMZo02A==
X-Google-Smtp-Source: ABdhPJw/Xjed7FvwN9XmA/DzGWkDO9GpQpEkcWETaWKruXFvc2WlHi3+tlwN+jGBTCYRUrYaLhALpw==
X-Received: by 2002:aca:2b0a:: with SMTP id i10mr2030021oik.75.1621300537212;
        Mon, 17 May 2021 18:15:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k21sm3476518otr.3.2021.05.17.18.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:15:36 -0700 (PDT)
Received: (nullmailer pid 3580472 invoked by uid 1000);
        Tue, 18 May 2021 01:15:35 -0000
Date:   Mon, 17 May 2021 20:15:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: add QCOM SM8350 display clock
 bindings
Message-ID: <20210518011535.GA3580442@robh.at.kernel.org>
References: <20210513195617.15068-1-jonathan@marek.ca>
 <20210513195617.15068-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513195617.15068-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 May 2021 15:56:17 -0400, Jonathan Marek wrote:
> Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
> bindings. Update the documentation with add the new compatible.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
>  include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
