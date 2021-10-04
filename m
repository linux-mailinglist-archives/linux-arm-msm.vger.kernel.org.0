Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B76E42167B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238530AbhJDSbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:31:32 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:38630 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbhJDSbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:31:31 -0400
Received: by mail-oo1-f51.google.com with SMTP id z11-20020a4ad1ab000000b0029f085f5f64so5664634oor.5;
        Mon, 04 Oct 2021 11:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FSknb9XucRZhO/00BM6q8xI5pafRYeo3fmHNydtNnM0=;
        b=jqWO+s39ViTrXBl6T/i5sCD8SE9wK+1UvVp6oDTwNBjBG269D/84/5yO8ODqUhhlKo
         IN2eEMtXZKW7jkk8f6Yuj9nZZxYq9Dhz38SyOai1HSUvKqavRQxJPVzTUAl1VS58n1ME
         8R4zan6LK6tB7huhF0BEoqhqzbaS5z4wIshxzPCtTQStG76ZLLa6+yoUks9/1DkhztFC
         z8oDqGlcZfDLR/0K5zE93MUp2L0+gZKHy/oPRm0UluWkjsb6JNgXi9HHXlOXyZt220Wc
         uR230XsG32WDefzvHiQOqxlzBcbiA/l26B+kxrKHN2mD2GNiN+oZVdYzbmfWHdBt/kld
         6ANA==
X-Gm-Message-State: AOAM532eBrEnVF7s6rZgLeX+fpEgPjdelW3snVxalhAf5uJvQLLuGxtC
        vjXrQcpUpwL559wi0UOpvw==
X-Google-Smtp-Source: ABdhPJwuTkETkHYNHgbb6MaD/3AdXAmRL9R4LDUql91q1Gowx5uviZJ/UMF/CcvKt6jC2ED9RpnzbQ==
X-Received: by 2002:a4a:da41:: with SMTP id f1mr10336324oou.45.1633372181940;
        Mon, 04 Oct 2021 11:29:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e2sm2925851ooh.40.2021.10.04.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:29:41 -0700 (PDT)
Received: (nullmailer pid 1614180 invoked by uid 1000);
        Mon, 04 Oct 2021 18:29:40 -0000
Date:   Mon, 4 Oct 2021 13:29:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        ~postmarketos/upstreaming@lists.sr.ht,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        phone-devel@vger.kernel.org,
        Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Message-ID: <YVtIFGfBnJB7Qd0n@robh.at.kernel.org>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
 <20210928131929.18567-2-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928131929.18567-2-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 18:49:27 +0530, Sireesh Kodali wrote:
> SoCs based on the MSM8953 platform use the 14nm DSI PHY driver
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
