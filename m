Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F804216B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhJDSlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:41:22 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36445 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhJDSlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:41:22 -0400
Received: by mail-ot1-f51.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so22845532otx.3;
        Mon, 04 Oct 2021 11:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gFE6Zrwh36md7xRXo1r5LwgkE2MlXqHKMZYtf2/mijA=;
        b=z7seC7CoF38wYBRGDcCJ+MLIh/aheiupZfVtPXUP+0YZDk0ouEsKR4ZNyD/e+khXRm
         m3dWC4Ea+xCF7j13C8ALod1kqDjnJyZ8fCjd7hej0nn5xmck2wV3lp8D1Axg2wz8Kqy0
         6hkCTW49jAqtLtXyUscNDLmyHEq0oQb40v6Ckej09i/7kLLcX6kkm8gDgsdH0S3GQq3Y
         lmoaNG8G5cVLp+mb4UvQsQq83yM5uUG1Qr+yeLalKXIGohjGDpRLrS49Vo8DAEuFrecf
         m9y0OEYNnL9Nx2fXS2xM2g025t/iFg46ksqsZTryuuTYLbov3slujPIwWmsk4lX/5HpG
         YNjw==
X-Gm-Message-State: AOAM532T40nXfvhaf6H5mMocmsYBN9G8C9ibukC31JcH5tq9q+9X9HFu
        3Exl/oLOEu7VqIwnZUambw==
X-Google-Smtp-Source: ABdhPJwnuR4jPfngb9xLZk4Ss1bbs3Od1eg7kzgJ1GVcG3t4jZUPJB7/SnXnQRqxwc/JBJphRJiSYw==
X-Received: by 2002:a9d:7344:: with SMTP id l4mr11002389otk.155.1633372772926;
        Mon, 04 Oct 2021 11:39:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s7sm2965482ook.8.2021.10.04.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:39:32 -0700 (PDT)
Received: (nullmailer pid 1629772 invoked by uid 1000);
        Mon, 04 Oct 2021 18:39:31 -0000
Date:   Mon, 4 Oct 2021 13:39:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: rename vendor of
 apq8026-lenok
Message-ID: <YVtKY6wY4GJpwVvF@robh.at.kernel.org>
References: <20210928203815.77175-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928203815.77175-1-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 22:38:14 +0200, Luca Weiss wrote:
> In order to avoid having prefixes for multiple internal divisions of LG
> use the "lg" prefix instead of "lge".
> 
> Fixes: 21f3cbf693b0 ("dt-bindings: arm: qcom: Document APQ8026 SoC binding")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
