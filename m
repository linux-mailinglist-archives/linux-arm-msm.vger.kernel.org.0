Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5E74AD4B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 10:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354087AbiBHJXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 04:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347016AbiBHJXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 04:23:40 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B0CC03FEC3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 01:23:40 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h6so10794680wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 01:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nv9eGMngUI4irs2c+oCw9hCjsOWg2bDP2XUBGqADoak=;
        b=pjGIicdCBYz734ZtdMDLF0Vk0sQ4CQdXf13cqIefkoiIZvpwGSwsRPI7XLM+fzR/JU
         66QDwlp33BgK6zTu5GMchSO6Ya9LIEeg4vIq/hsPX9qoPO/DBT617X9KBShEQ9HjKS3U
         gVwWvGKzfRSOZn7GFMBRHHBpbfJhj1VVzWYRmEtM2bYZZmCn/l/ewK9rphxpSqANRpvG
         E1nBnNFufGsa7tYM50+ZOtRY6zuv0Y53TRZq2ffG0QggCSdsLFY2h57mKKXYqGlDp4VO
         pdzzVHt/rJ+K6LFu45fvQxTcKaMVXBNOCUfbuZEfXzpsVIs/gOslOA0VAS15MRIPWYTV
         OKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nv9eGMngUI4irs2c+oCw9hCjsOWg2bDP2XUBGqADoak=;
        b=znpL2WI9tFt3QpjY0Rd57OtzUi2ummpaSHZ0YsWS84MoXRDdE77G9yHc3CmqRlwLQ6
         VZ556Eh7U3ZqBB3rBgxxoyC+H1v8osHf6XvLh4JYcFs/xMt5SPc6oH37FxpayIrFN4BM
         gZRBl8NmEAaaUe8/nBQHQy9PnhxrlZU0imwDepoKGGrqsF0vrEnvYvRTzcY0J1LWXirH
         Gl1IGYU9K5F8AK71/WEF0UJvjZRz51PwlVTSmJ0wBeoxqcKErRdgG6j1lSeHOWgtTF9Z
         NTH51i6f8TWOVBp3Ty0ZVkoqjl/JN1NVJYui3pSQ6cQLFDiSmEJZPc+8VC5fW3DbrrNm
         Qt1Q==
X-Gm-Message-State: AOAM531GJxJg6f4Ui9NfV/FaqzBGen01Ynzr4D1e90xE6RSpLgpKJ+vh
        VMWLM4TtFoXj7lrHr3vA9edMdg==
X-Google-Smtp-Source: ABdhPJxjRg1M0ImAnVJO2McmBHHY7WjBVt9i/brwoGpY52oPDZ+DU4XInyUB2s7IiA+cTZulDHS/rg==
X-Received: by 2002:adf:b610:: with SMTP id f16mr2693143wre.266.1644312218574;
        Tue, 08 Feb 2022 01:23:38 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id y1sm1771596wmi.36.2022.02.08.01.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:23:37 -0800 (PST)
Date:   Tue, 8 Feb 2022 09:23:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: backlight: qcom-wled: Add PM6150L
 compatible
Message-ID: <YgI2ltTYI/1mAxR+@google.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-2-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229170358.2457006-2-luca.weiss@fairphone.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Dec 2021, Luca Weiss wrote:

> Document the compatible for the wled block found in PM6150L.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
