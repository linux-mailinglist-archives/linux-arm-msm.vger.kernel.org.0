Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C8C375675
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 17:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbhEFPWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 11:22:12 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:41762 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbhEFPWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 11:22:10 -0400
Received: by mail-ot1-f54.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so5184357otu.8;
        Thu, 06 May 2021 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+DOw2+1KvbO19dBTS8Eu5XZWbE/rNGcWmLaSTrzLx5g=;
        b=UdcpsOBJyffcDGXY2v441f4iyeuCCOCdejuvEFXUWfHYmSS7huDLxue+sk6FA2bxC1
         OLxjmfS1vWZ0ymRYBZ34xTBvnyZjJBfi6JWl6pBmeJHf6vG0+unW1hlnZ6jBRH6MPdrE
         jJuHRCBuhUOnEp7As0dGO8EHPaRmyLAyxd1FERZrv2VFSCCPEN5qT5IzM54+/7dT/p8s
         1nVENELcykj9ck7pyeymWov3n8gA0TZK5YpNwlB/dk74koC5O2vLLhss8ybK9QrBFgwo
         AxmRp++exeL6TazqPGgRKoWk5XJ0iRPUhs5xDnI144M8hukmNb/Xu84ntK/hIhaS8Va7
         scvA==
X-Gm-Message-State: AOAM530jRXt2x106o4AYzPUSz6T2lidLdJ1HeKnZW3m9fiMXPu/Fh17n
        fDgR4Xvv2g7xiaY9arOw7A==
X-Google-Smtp-Source: ABdhPJzdmfZGloqXwF9qho2V0Aw9aF0WXgwzbszVcs4kV2HBM4JI70AxXxTxZNYXAYiaa6kLZGFuMQ==
X-Received: by 2002:a05:6830:803:: with SMTP id r3mr371002ots.237.1620314471972;
        Thu, 06 May 2021 08:21:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x187sm476838oig.27.2021.05.06.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:21:11 -0700 (PDT)
Received: (nullmailer pid 348598 invoked by uid 1000);
        Thu, 06 May 2021 15:21:10 -0000
Date:   Thu, 6 May 2021 10:21:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add MSM8226
 compatible
Message-ID: <20210506152110.GA348194@robh.at.kernel.org>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
 <20210502122027.9351-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502122027.9351-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 02 May 2021 14:20:24 +0200, Bartosz Dudziak wrote:
> Add the dt-binding for the rpm on the Qualcomm MSM8226 SoC platform.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
