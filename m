Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0334735C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 21:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241761AbhLMUVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 15:21:15 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40840 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbhLMUVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 15:21:14 -0500
Received: by mail-ot1-f50.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so18703211otj.7;
        Mon, 13 Dec 2021 12:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FBt0ubICNCgGkaELLaCLU2bVkOIIUBGePXG67VK50EU=;
        b=7fZB9otSfAD3NT2DtQyUXRm7Nrf1cGURpavKiWWsVoypZRvJUxAsTx8UOPkVzwDOMf
         CVZKfBwl+4uhSWRxs85bq2IOMlATYmVXLtcdfww3O2hl0B/1GS2OGInMBChncn4O3mYO
         TKtlgHfrqYhhE1nx97+NlOJVMyb7DO7E6kB/Dq4CIN8cd1VsyBEbrFB7tUFZ4o+TJQ2l
         dsVy5lttmFO4Ae75cjHxgcZqCQG6B7UhZt/IrMvt5wuKeOtjxgHW3duORMmLBRyazSYp
         z1tDyFqOXmwTAfnPce6KdFpGWUc/joWCaQVkp10/bBXIV95EUKTEzE9hlVFzvjpwfYDP
         LnmA==
X-Gm-Message-State: AOAM531CG5qRRmQCm3q+/naziO+RXxAiTp+8TMiuB9lJMvMVOdRBqTNF
        AVAwXNOuBg5dHlZ/irwF4Q==
X-Google-Smtp-Source: ABdhPJyrqMJic+kGNvlxbkAlDzEbRjv+DjzQtpPWX4Vidllw/tObUb7QZzh90vXGdag0i2TFxngPZQ==
X-Received: by 2002:a05:6830:33ce:: with SMTP id q14mr682223ott.346.1639426874303;
        Mon, 13 Dec 2021 12:21:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bf17sm2789682oib.27.2021.12.13.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:21:13 -0800 (PST)
Received: (nullmailer pid 1505028 invoked by uid 1000);
        Mon, 13 Dec 2021 20:21:12 -0000
Date:   Mon, 13 Dec 2021 14:21:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     alsa-devel@alsa-project.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant
 MultiMedia routes
Message-ID: <YberODnYzbpwYcLN@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 02 Dec 2021 15:55:01 +0100, Stephan Gerhold wrote:
> The MultiMedia audio routes can be deduced from other parts of the
> device tree (e.g. the definitions of the MultiMedia DAIs) and therefore
> specifying them again in "audio-routing" is redundant and prone to
> mistakes. This is no longer necessary since commit 6fd8d2d275f7
> ("ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai").
> 
> Let's drop them from the example in the DT schema as well
> to avoid confusion.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
