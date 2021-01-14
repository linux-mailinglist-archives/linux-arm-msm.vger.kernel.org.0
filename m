Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDAB2F685F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 18:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbhANRyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 12:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbhANRyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 12:54:21 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2351C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 09:53:30 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id l200so6761730oig.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SAQ20xRQL/NbqgMnrMeM6ds4nRHdebpusaxXVvq+8jY=;
        b=n8Uke2ZrV7AW1F1Ibb0Lns8VJdLcfms60B+gCZkAxTz9kKDLISScw/4qa+V1H2Bn0R
         dyFI4n0pcYfx9YJKTlaBC9nZwdUAyGydFyrE2js9KDjMwCpV1jwPjzYNXrEvpWuut3Cb
         aFcS2Suh19jmZNGnzPm6FS84A4tmkF+xkEyDhiCjJN9aZqCMq4j+hSaCi45AgWSHf/yQ
         00H4OxfTvvoqoxhyZ8pmIqzCUikq/Vgx5BNvU1Jl4Sy3W624d5NWBaB+V950Z/RrvHr5
         JDJPy7oo9lYNgFoJTuMV2nf2IEK5D/hLe4qFka0C57EbdBFEf8OcS26LYEZbptLWpII+
         xgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAQ20xRQL/NbqgMnrMeM6ds4nRHdebpusaxXVvq+8jY=;
        b=p9JnyUDQJsDorgrHNSMOlU5iDFFd+1kQmE9EowoJn262yWAH9Gpzed0RnyqOoDcMM8
         +iJLZ+P7PxoYAn9FfphU8b4pjFxyKEq/rMy4ICN+pDnZl7rlqPz8pRzbG4OLRjdO042d
         HVAr/kZbPPEpUPtnZwRIffdHHUB9WZxnCe4ZO4B5aUQIivTeEDQoc3SwE9Xpnk1/ISdp
         GWxSxJ8B2FHYHHZxoK7wehP6sysxbehm0JxDcbLX+F7n8ThZhobAASLOlZeVlLy/kEhP
         ulKKBbBfGPfxQQELofq91j6Mbqeq/7Gp76kLUwz5kJTnUJSKnOM/tps+556Ueb/7vd9T
         Svcg==
X-Gm-Message-State: AOAM532GcoQxeHqQwMe6ScGXisNcRGC6Ly5Wx2jYbdBmvmbDYzc4+h+p
        e3ZwhuwHJM3uHA8oC63hFINRIw==
X-Google-Smtp-Source: ABdhPJz9FKoRxMERTXm0FbMjFq5wFy1ttaVQGS0dKuRhJTxl5a4EHgsNh/n2iKUv31SHjn1qqmi0wQ==
X-Received: by 2002:aca:54d8:: with SMTP id i207mr3221322oib.101.1610646810307;
        Thu, 14 Jan 2021 09:53:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u76sm1161164oia.48.2021.01.14.09.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:53:29 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:53:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: phy: qcom-qusb2: Document SDM660
 compatible
Message-ID: <YACFF+Pj/L7ZWt8N@builder.lan>
References: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
 <20210114174718.398638-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114174718.398638-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 14 Jan 11:47 CST 2021, AngeloGioacchino Del Regno wrote:

> Support for the SDM630/660 series of SoCs was added to the driver:
> document the qcom,sdm660-qusb2-phy compatible here.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index d457fb6a4779..582abbbd8b32 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,ipq8074-qusb2-phy
>                - qcom,msm8996-qusb2-phy
>                - qcom,msm8998-qusb2-phy
> +              - qcom,sdm660-qusb2-phy
>        - items:
>            - enum:
>                - qcom,sc7180-qusb2-phy
> -- 
> 2.29.2
> 
