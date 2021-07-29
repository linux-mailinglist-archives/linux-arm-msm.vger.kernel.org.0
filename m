Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A783DAC5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 22:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhG2UCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 16:02:48 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:45885 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhG2UCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 16:02:47 -0400
Received: by mail-io1-f50.google.com with SMTP id l126so8644964ioa.12;
        Thu, 29 Jul 2021 13:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ZUld8oYLswfBWaIIa32GlcaW9W895It5HVoem+LqtM=;
        b=HmxjNJT+4YW6tBull+W0kWlzFzTB5cynACT+kIJ1E5wAAmfPpyPDo7dNv+z4aAZ7+U
         UY3mxK4L4Hd4YjXoM4ndPASYbBBV9l9VkeWXLoqPDtGIDT1Lb8r4kWRZ8epAoGs3VYJT
         WV2cUj6WUw3NvHh2aYj603m8aAI0N7ho4dQGYQqH3f4c7ZpsoOBH5cADnp4YRW4rsqbv
         8ZaFVUaSUCPfnhIm7xzMVGjpbYyqKR2nZvnPuOOXkH4htvT3wnlEIANyeGCRUFR4ru8C
         tF6KIYTEp4wovIMLnofp7nmJdDM0mRgumEUTB9p8+k7C9SblSCG9twBUL74K/mOTx4KM
         /hoQ==
X-Gm-Message-State: AOAM532DuCauIEgvu79Naur9k6ZPHjF0L6qECH53mZbsr4xLZWUUzVHs
        gHz1yMn2FTK6dswKV1mIww==
X-Google-Smtp-Source: ABdhPJwXGjqesgbLpbEWDhh9lhRa/zWJ2SmHm6nEdm4oeM1BtsFJR67KpTPyneSwhx3+1ej/e8im8A==
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr5810285jak.91.1627588962983;
        Thu, 29 Jul 2021 13:02:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r16sm2378280iln.30.2021.07.29.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:02:42 -0700 (PDT)
Received: (nullmailer pid 789374 invoked by uid 1000);
        Thu, 29 Jul 2021 20:02:40 -0000
Date:   Thu, 29 Jul 2021 14:02:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: msm/dp: Change reg definition
Message-ID: <YQMJYEZOi7wjExay@robh.at.kernel.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722024227.3313096-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Jul 2021 19:42:23 -0700, Bjorn Andersson wrote:
> reg was defined as one region covering the entire DP block, but the
> memory map is actually split in 4 regions and obviously the size of
> these regions differs between platforms.
> 
> Switch the reg to require that all four regions are specified instead.
> It is expected that the implementation will handle existing DTBs, even
> though the schema defines the new layout.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
