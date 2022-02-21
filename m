Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D1F4BE285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 18:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344715AbiBUIs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 03:48:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239688AbiBUIs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 03:48:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3ECF21
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 00:48:04 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d27so25737992wrb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wByXpFHcY828yEK0Dp3D79lhT0Mw7H4yz4zgZkFlSyk=;
        b=y4TWg7PuSmRDeC+5vYasXzH736kKvAUZMgKQoejcgTHMIedb7tmlAOcEYkzx550LYs
         lLzQK18Xvv6vHQSq0HCQCUha3XMpeCx6ugSm7mt1f/ikFxnGvg7kikjRAEOlxq6rziEY
         w4SrR5qegL9K/JELtYBjCN18PIV7lCx/7DVfiwAWf5CBkWOyAINfmzvPzcIGRUGRtzVf
         N/nkUNrT9j33mD74eCSOwEtQmoekcEJfaGvF7qaFG25G+HiHLJXrrBF4pzlK+UGTJyG9
         IebfoMQL0GKa7le1WqVZp7llE/73UCA/RFWCwGXjJHSwJzCbbvoR+nbfwJCc6cxvEoFc
         5GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wByXpFHcY828yEK0Dp3D79lhT0Mw7H4yz4zgZkFlSyk=;
        b=RKVlSkOy/iu9tdPqvmDpRIVM2c+jHVQtQNOy+CFqccTzhZZeGgQTE7PpJb4HjWNaxs
         v75pU5kyHRMYprM2dKmnmOCiC1/f2SxD07qhVp/VNZhAuG5oIAv1rtBD0ildIn7iNvjK
         a6TDzKbeXB3phvTh6bPySPYh5/VI+DQLIop1uutMDaebnnM10Rhm4yxGrZFwoZFD9Siz
         ozTWNld7T4KucNw3lZbD7Gofz5a5Xih7o+cDKTpjpN1KwymYZf1ycymhIfxGG/YbqIQp
         Kk9NEYnnip/+oPjhbQqd2MGAdGCHuUFyk8AOND+gQcZDKUf/1SdnFADQIfat+ElcXbtJ
         1hFQ==
X-Gm-Message-State: AOAM530ZRkdpUtagsKpajUUTqY03UZ/B4XDG2/n2PJdcIsYOm+bqOuqA
        /QwexlLy/MKQ+MVKLsELchJGmQ==
X-Google-Smtp-Source: ABdhPJyZ7nP3mDgn/E3K+0vAzO2zqpef4L+DFdCQ3+B1Y3Zr7WMetU+au+cM0/NZO8oaSOyImF66uQ==
X-Received: by 2002:a05:6000:18ad:b0:1e8:cbe1:afd with SMTP id b13-20020a05600018ad00b001e8cbe10afdmr14545370wri.352.1645433282965;
        Mon, 21 Feb 2022 00:48:02 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id a8sm11138231wra.0.2022.02.21.00.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 00:48:02 -0800 (PST)
Date:   Mon, 21 Feb 2022 08:48:01 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: mfd: qcom,tcsr: Document msm8953
 compatible
Message-ID: <YhNRweYMmkaSKJX7@google.com>
References: <20220220201909.445468-1-luca@z3ntu.xyz>
 <20220220201909.445468-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220220201909.445468-2-luca@z3ntu.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 20 Feb 2022, Luca Weiss wrote:

> Document the compatible for tcsr found in msm8953.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
> - no changes
> 
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.txt | 1 +
>  1 file changed, 1 insertion(+)

This is already applied.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
