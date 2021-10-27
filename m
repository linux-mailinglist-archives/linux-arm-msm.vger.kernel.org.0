Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C3843D366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 23:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240780AbhJ0VCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 17:02:51 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40526 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbhJ0VCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 17:02:51 -0400
Received: by mail-oi1-f170.google.com with SMTP id n63so5270185oif.7;
        Wed, 27 Oct 2021 14:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Feu+ijj0c1uWGjND40NWm9tPo385lhiJ4ge94odhHmc=;
        b=ITKUMaioZy07QMqpnREdN0GTDToj1qK9jdVXNIqeC3umGvi3rUflKWqn6tZSk66rkA
         iXgxR7VXOdPazsBPmvwM+8+1dmTxqLrh7UoiX9Xf0GGvlWlf/PGVygwgq7mzEMdke+Eq
         0p46XjPoX+h97tMBrTYha9bOA7AZRRWhm7xSE8sm5yv0yP9AV2kOp51i4vHgvYyParQ2
         /DgBasnu8vdGW/ZG1J8INnIqzYLLa5cvez4+rkFDfyeSOkRz4sWy9iryXm51KJew98Av
         QlVOi4jNs7GXh2NnwEB02Arzh3UM0eEMcd7Ti+iLsHIbDAw8kCk6zjydV0gDErwDrpWQ
         DBvA==
X-Gm-Message-State: AOAM5338c/zkoYLKNhquPScvRBQxq7KQbfN8K2qWTrQQbDPneu0AqdAK
        C/nz2G3fVLQg48ZMn6INJg==
X-Google-Smtp-Source: ABdhPJylT8TaIy/PSzoJWNra3P3eLuzS9TTUapyqBHmGBfyMLk6jEEbO9IiD09ubpm5qUGK4Xq/xRg==
X-Received: by 2002:aca:1818:: with SMTP id h24mr5422542oih.76.1635368424951;
        Wed, 27 Oct 2021 14:00:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d16sm356516otq.33.2021.10.27.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 14:00:24 -0700 (PDT)
Received: (nullmailer pid 2149644 invoked by uid 1000);
        Wed, 27 Oct 2021 21:00:22 -0000
Date:   Wed, 27 Oct 2021 16:00:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        srinivas.kandagatla@linaro.org, perex@perex.cz, broonie@kernel.org,
        bjorn.andersson@linaro.org, bgoswami@codeaurora.org,
        tiwai@suse.com, rohitkr@codeaurora.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, plai@codeaurora.org,
        agross@kernel.org, Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: soundwire: qcom: Add bindings for RX
 and TX cgcr register control
Message-ID: <YXm95p7XmvVWjV/w@robh.at.kernel.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
 <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Oct 2021 17:49:23 +0530, Srinivasa Rao Mandadapu wrote:
> Update description for RX and TX cgcr register control property required for
> soundwire version 1.6.0 and above.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
