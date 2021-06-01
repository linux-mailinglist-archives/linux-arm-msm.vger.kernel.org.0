Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D27397650
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 17:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhFAPRb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 11:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhFAPRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 11:17:30 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C395C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 08:15:48 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so2165471wmq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NHydh3/ncsVeDXTAdKoz81qBNS+Ux9OeRAZ7MP0jsJw=;
        b=PdTPy6jQNfzwzWFynDMkSAvAzEWVeKtZ47edSlenJqHlyRW7HanJO4/vy5P11qevkW
         crQKWvlquXLWDgK2ag5DFHwo4ciy0gHPt0w47UY+YXDVxxFa0SQPdoESs7a4KkG8muNK
         m2Dc1SbuPgVYUVBoG4uAXzcEre6VZ6CL1QrnpbXPv8hMlHRegb3Kn9akK6AV3IhVl+cl
         gMN9TSFKgOYK3EBJvDRcb3LKFrDlCa138qxxBV15RA+/v4t0GJTHO8dVH4K0ls1DuaH6
         B3Dybhs9WcMCFU1nTZNxRhNoi2gbeUfFYKMXH3R1GDsnF74pT8cgTxX8Jg28HdWwQuzI
         pKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NHydh3/ncsVeDXTAdKoz81qBNS+Ux9OeRAZ7MP0jsJw=;
        b=W0Qjlk5hDpdRKuwlXQ41xBOZXRzZgXfWbkWHVnYY8DNeZp7vzpmkVGj+/SwcLSg6q2
         R+Ic8jlytePFLi4zHuovwXOtakSIfTdUYlMI5DcrjaWz305hUNUpel+xClfeOX2zC6UH
         APyhfjRt/NbC2J0KG1xel+24yWge4tX49F86YWq5cYIEFvXILD08ZgmrG7TDh7mx8LLt
         etFNWWxWiRseiJA5kLgOQirbC2Bc35DqCdmH7UXNNaCZrJrPGQ+napLY1dmu7Fyy/NUR
         B1OvDfReU8v6dU35aaF3YcbZldt16e7+PDeK5WVUYxRUG5nwfw6mnh1C9kfyub8LTeTt
         2/1g==
X-Gm-Message-State: AOAM533wtpBtHTcUvSj42n6Yl8FY7gWH50GcgDglm8JSG2iqeFDWvAfX
        gQLILf121d6xYiNysw/KqUkWCg==
X-Google-Smtp-Source: ABdhPJxcZQ1D4L2hNpZsGsfckqmotsmM54FGHzV2CcZoiUggH6ogr02f/L/zJkFZL9zu6Iho0qR9zQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr406714wmb.11.1622560546968;
        Tue, 01 Jun 2021 08:15:46 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id q3sm3467252wrz.71.2021.06.01.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:15:46 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:15:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 2/3] dt-bindings: mfd: pm8008: Add bindings
Message-ID: <20210601151544.GR543307@dell>
References: <cover.1621965146.git.gurus@codeaurora.org>
 <ee714da21108a5183815ffd1233876dba4c253f5.1621965146.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee714da21108a5183815ffd1233876dba4c253f5.1621965146.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 May 2021, Guru Das Srinagesh wrote:

> Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

Fixed the *-by tag order and applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
