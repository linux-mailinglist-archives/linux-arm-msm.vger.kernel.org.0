Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624AD3A8C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 01:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhFOXgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 19:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbhFOXgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 19:36:23 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F40C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:34:16 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l15-20020a05683016cfb02903fca0eacd15so634705otr.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 16:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hxB6H8+aCeSUiBG1hifYHdZhYWkj0hk7sQxa3V/kpLg=;
        b=oqYQ+Aa6KfsGyCXv/4GfHLloW6n1iYOM58VSQSlxcux9dXPsWCqL9A5m1MD79d5HfK
         SI/9op63b0fYQrLDPT7WfehF+7UQEu+SAZ8v85wLD5HMwxYZ5R945ocA6QwJjcd6hjME
         AWiH7dgiP56ZG0mpDaNtk9EQZCglWsV2aYz6CiqAJc7erz7svMz4v1wO5PvybdJjYIgA
         kMjuzFIKDdLkZWoCZ/9Z33QTiC00CNrib0p2M4b5QOF0dGHKMJZPDAOmiyMkndK+LqaJ
         YSSU3l+PzQpmmaaC+PAe7VcwVq6ylbnMpBMkvM0AVyc9d2hagJiPIw5PHQRPuR62ltdi
         N6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hxB6H8+aCeSUiBG1hifYHdZhYWkj0hk7sQxa3V/kpLg=;
        b=HwW1/qo/7UdIFrOi860q4vSsMuc5++rKUsMsg6Aipad82Qrm80Siwg+xujF7onGzyV
         sNTVSOTC4daYhBr5qnpc+sMD69C/VTXMLu1zoYiPdl6UXxXjUk2cZd6/OXcge8HGl4Y+
         6MAFx+ET9JTcLrJdUsJwxoClW+z93+dfNgbVyk+Q7s5O6l12C+q+MO3CcHDxjld6nbyL
         h4p1Kud24k/OoFlrVhg6FqmEC9Vq2jHpHFnsVsKOc6+JQj52e/SsnenBo7bl2PIo5Qoy
         ePR2MDbZme49PWPbmG4xYyObD1XaE7JsYYX2NU6mmEvqxkEMSakyr9/eG4DHBUvGO9VY
         p7MA==
X-Gm-Message-State: AOAM533laElAP/ypTsC5xo7W58iOdYfspFJ6+led3mgFF1cBzyGuP8/N
        OpTY87oGspG7ni2yLrShh4yjicFM07pBbQ==
X-Google-Smtp-Source: ABdhPJxJuEmlFW1DQj0HWiLK6p7P5TX62qHB17KKKwUlZ+JyyEyuSs5idLJAall5Elt35b3sxV6fNg==
X-Received: by 2002:a05:6830:245c:: with SMTP id x28mr1377082otr.169.1623800056132;
        Tue, 15 Jun 2021 16:34:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x31sm111764ota.24.2021.06.15.16.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:34:15 -0700 (PDT)
Date:   Tue, 15 Jun 2021 18:34:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: qcom: gpi: add compatible
 for sm8250
Message-ID: <YMk49VN4CgEa41w8@builder.lan>
References: <20210614235358.444834-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614235358.444834-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Jun 18:53 CDT 2021, Konrad Dybcio wrote:

> No functional changes, just adding a new compatible for a different
> SoC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index e302147e53c6..e614fe3187bb 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - qcom,sdm845-gpi-dma
>        - qcom,sm8150-gpi-dma
> +      - qcom,sm8250-gpi-dma
>  
>    reg:
>      maxItems: 1
> -- 
> 2.32.0
> 
