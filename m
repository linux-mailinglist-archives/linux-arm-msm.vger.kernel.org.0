Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756F732F577
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 22:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhCEVqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 16:46:50 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35626 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhCEVqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 16:46:19 -0500
Received: by mail-oi1-f177.google.com with SMTP id i21so4136369oii.2;
        Fri, 05 Mar 2021 13:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3aXASnehLpAnhE7ybXqztlUJbmoibh1p17DxUSvDDCI=;
        b=RUwvDuccqg82EIE8yEImwHz6ZBxoufuks3jzUFgpxIUNTtUiU2DMEz4eA7rErndybV
         8CErdGZrWFLR332iuDFL3nwpnvrjiLJJq1sPZS+jTDQm2eAVVw7/uKXdnuM3HKe3UaEg
         0JTDIos2zvSYVPt1RQTLLZRhn4y0DM6dup7pzrv0r+UCkyqJWHjiONN1MTzFN4ValAsE
         sjAZ7FdmvgV8YdsInbmAh4ebNcs93583T4EEmhU93NKIP+sQQvqw+N2yCQGgYippVoBJ
         MEKZzVElbbc3tBQW12Gck0y77GsaxgXGfVderlnvfyQLekfNqK9i1ZMGLTEgiwQB301u
         Slnw==
X-Gm-Message-State: AOAM531n5/izpXhFPB7UAAQwQ24bnQ3qMmZPVkmWGN0+lkZFwKZf1ceo
        BurUcbrt0JEFPP82GlKvrg==
X-Google-Smtp-Source: ABdhPJycvVIc1/tf9vzPn8sweFi9jbD9stgDWfMUX+S5uKGI6UR/oPm+RtWtikPpVZbl6ISl77TOUg==
X-Received: by 2002:aca:6289:: with SMTP id w131mr8562283oib.69.1614980779246;
        Fri, 05 Mar 2021 13:46:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y194sm805855ooa.19.2021.03.05.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:46:18 -0800 (PST)
Received: (nullmailer pid 701367 invoked by uid 1000);
        Fri, 05 Mar 2021 21:46:17 -0000
Date:   Fri, 5 Mar 2021 15:46:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     tongtiangen <tongtiangen@huawei.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 1/2] drm/msm: add compatibles for sm8150/sm8250 display
Message-ID: <20210305214617.GA701315@robh.at.kernel.org>
References: <20210215162607.21360-1-jonathan@marek.ca>
 <20210215162607.21360-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215162607.21360-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Feb 2021 11:26:04 -0500, Jonathan Marek wrote:
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
>  drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
