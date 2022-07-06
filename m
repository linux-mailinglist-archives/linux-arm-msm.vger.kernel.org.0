Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B445681B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbiGFIgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbiGFIf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:35:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4665624963
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:35:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z25so7099205lfr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aLZXwYZ9gaGI3SCl2i3E+E/g2ZEGIRcqkI8rVEaH1qw=;
        b=T4xkDpLRVDEQWlHSzQdxjULMapkSmr7pfUsTQW2VNV4GbleRHs81JU3aaLlxoF8Upk
         A4S+kknexXROJuatHbcBBnpIZlOklSx5YSN7wTRIUmZ1QMiLpUNksl9aYDfnWTY1aJYO
         eT0hxo1jXxxwXuZjr5GoykE+bK/3gzB0FOMWrnp0yBAk33tbYE5Mqnv7B0F1mahd4KAA
         eBWzEt6wsXi70VZo0+YmEQVWewFg1zVf4V0gg7piWT0mZgfIhjWoefKeBU8+Dq2DXaRW
         O9dDRZDYpSIfLLupwZT5SxFOTxLmruk9LWz2017w6XVADhlmBiPwRmdRjn52dhWCyVO1
         Yk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aLZXwYZ9gaGI3SCl2i3E+E/g2ZEGIRcqkI8rVEaH1qw=;
        b=azmVwOb3afBirOBPR3GFYbz+L2lTP522603SuTvblwSaTw64RxCjZaV3mESjDab5jR
         SkhF8zB69y/85sIkF0xf1QNks8shIbv4glizmIB3E0Jf55NULraU0RDAbChJIPFazvSO
         vDdl7+HIe0JficTgq6462sScq56IrLAyXdOrsGx+yxPZYs0ClO/RDlk234q0vNwv7f0C
         imdo2G6Ieba7l6zetliIJVYGrC2LocX+AMacwESsXu613M0ukUhqNEh1DQwbF4e2ORtr
         r4zxhOxya5nU5BxTL25zG3dCk1dPUtIFsBhiQb16Lv4Tqa+oCCdsCMAPMH/H7sW0y1yc
         2bBg==
X-Gm-Message-State: AJIora+2z3Xpit+q2D4mZ2kg4T72jxtiudfYpqqt03RDONVp2sAbsT4m
        o/48E8sC9rEcciYvkIpty7wR5g==
X-Google-Smtp-Source: AGRyM1tnFZkCYGMHFa3J1Rdr08wR3i3EnsXPEtGkc1h4e7ivcWI375TBG1djOjRH5o75QQiNyl7p6Q==
X-Received: by 2002:a05:6512:3086:b0:482:deaf:9c8 with SMTP id z6-20020a056512308600b00482deaf09c8mr6930503lfd.169.1657096553544;
        Wed, 06 Jul 2022 01:35:53 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id b16-20020ac247f0000000b004791b687235sm6142372lfp.119.2022.07.06.01.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:35:52 -0700 (PDT)
Message-ID: <0fc38d25-a03a-35b8-44c6-543daaa2bbbc@linaro.org>
Date:   Wed, 6 Jul 2022 10:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/13] ARM: dts: qcom: add missing snps,dwmac compatible
 for gmac ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-6-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> Add missing snps,dwmac compatible for gmac ipq8064 dtsi.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
