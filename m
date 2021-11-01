Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AFF4422C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 22:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhKAVjo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 17:39:44 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:33467 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKAVjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 17:39:43 -0400
Received: by mail-oi1-f178.google.com with SMTP id bm39so16479388oib.0;
        Mon, 01 Nov 2021 14:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JAg6KdmFAXzUuXNGb8fBqgMEGAaw9CamDaT7qNQbpL8=;
        b=BFbYFvOgo4qczFwcTGwoh1NMg9NghgZ64w8H/3kX25aczxExOvtBRTChxdDViq0l3O
         KHFw8MnplHEaz2xcRhXqxX2fPUyhRtjB+T0k0JqDrQosqWs7JORhY2u7kS1/6YCzqv77
         ZMcVu6Rj11qvTNzgCyw39/A9EcIgzIUFqZwq2VIi5jVBUV+yn8FdF5WcjluRpwnKTCEi
         f2e444638QC8SUWDfHFxOlcHZMw84lB28KxSFVxArd2DAc5MNz34YZztSaUJVF58CBtt
         bFZMFYVwWyscw3lNdxVe3Fj9UB1gnP0vfzwC4AMG0vEGcEPQTOllhAIvu8vmTDOJmX6J
         9+kQ==
X-Gm-Message-State: AOAM5314XpmgnjkG6HgMC8yDrtpxEcoXx40f9NODJfUKdE9BVIXxR8Jo
        impye1mJnKEa4rQn2HBJzYARvaFNcg==
X-Google-Smtp-Source: ABdhPJwwHJSQi7dkJRcGUNwGb6a7bA1FO3rXq7O3icm5Iokg0YPIWwbrh3XTqnkeg8LqfAGHRmgsWQ==
X-Received: by 2002:aca:42c5:: with SMTP id p188mr1447707oia.125.1635802629571;
        Mon, 01 Nov 2021 14:37:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z22sm4001594oth.63.2021.11.01.14.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:37:09 -0700 (PDT)
Received: (nullmailer pid 1110199 invoked by uid 1000);
        Mon, 01 Nov 2021 21:37:07 -0000
Date:   Mon, 1 Nov 2021 16:37:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, judyhsiao@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org, perex@perex.cz,
        bgoswami@codeaurora.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, rohitkr@codeaurora.org, broonie@kernel.org,
        lgirdwood@gmail.com,
        Venkata Prasad Potturu <potturu@codeaurora.org>,
        plai@codeaurora.org, alsa-devel@alsa-project.org, tiwai@suse.com,
        robh+dt@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
Message-ID: <YYBeA7Qt2vhFoMeO@robh.at.kernel.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635342097-2726-3-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Oct 2021 19:11:36 +0530, Srinivasa Rao Mandadapu wrote:
> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
