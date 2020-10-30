Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A74C2A0699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgJ3NiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:38:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45479 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgJ3NiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:38:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id f37so5523540otf.12;
        Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+NTaR+FmsROaR0mc3AxOVyIyS9PM41eAe1X9dDcISGo=;
        b=k5DYtFWF+frKkxt0Wv4/OKpD1/T706jdv8a7hlEIus0u5Vq+lW1sKxX6V4bMKAa0D0
         J6FuY2f7I4M7VkcNsBJYBowDyrk5TN/AuTFKS1uq3wx6xiEZNoVsa6RHBo/9qS1Lx0JF
         wcukCDHB7s9Eram2ytY1hS33rQkozvaiqO0XWtXQIV1OwjXVc21aQZRQr9/h19o5ifj8
         rRoEyiNDJRHqMTkZCeq0LBoF+p3kukQQHcIu43mQKhSNDKrjnMQN6e35SnAmeUcDvwcg
         z4coyaevBfGP0pbkufMotA0LBwTZGHIeSt/Nnlvro9w7AYZE1+UeURkYjLWv2EMpPzm5
         op8Q==
X-Gm-Message-State: AOAM5310c3xcatf+FaUnj9Xr8wTwKZFZLwUv07c+/SUCuQO0iZcJy4Jw
        1sZcs2wk6OcBFxyfeo4BcA==
X-Google-Smtp-Source: ABdhPJw2DwG/OKaEJ21EJ8MvBOaMf7vQ+RMEY20B0hdl2Y4TXBFZRVC5SVhlmh9eBGawREAWfV9uYg==
X-Received: by 2002:a05:6830:154d:: with SMTP id l13mr1814291otp.61.1604065090197;
        Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v21sm1315274ots.29.2020.10.30.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 06:38:08 -0700 (PDT)
Received: (nullmailer pid 3727265 invoked by uid 1000);
        Fri, 30 Oct 2020 13:38:08 -0000
Date:   Fri, 30 Oct 2020 08:38:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org, dri-devel@freedesktop.org,
        robdclark@gmail.com, mka@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v4 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201030133808.GA3727230@bogus>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
 <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Oct 2020 13:37:21 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
