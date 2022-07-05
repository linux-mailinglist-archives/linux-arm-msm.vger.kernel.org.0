Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A94566EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiGENOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiGENM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:12:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1209ED6B
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 05:38:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so9609592wmp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 05:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=E7MeRem5odn+2v7xFAFXaFY+6IJDYKBYvG4FE0QhOyQ=;
        b=vWFeyV9dajGOVMuOQxnDMzl4YF98Gql8vg/nJ8o9HUt25XFcCuIcIBzjcfupIP4KLV
         8t3onhwOEj0gs2j+j4JPU6vmwK3m2kJemL30vFy2cj3cViX+VH+xEXlFAf67FtOvKpqR
         pa7J7LwBemnVzDWfjs3kMUd4pdRlReKUFYcpMiJH+bw/dZtKnSFVUEuYqo1oDJMVZhQB
         sqowRWtLxifwKigMNdsqQoJ/SAsuEVTyOCPePCMMzP+hXCqeosW6KxRrXCq6SOY5viRX
         PnxiqSMasYVo4QDiksKOvOIPWw34MvalTWbcCCINJh1V4Wtux4FYq3ngLZ/QtBEIyRUD
         SnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=E7MeRem5odn+2v7xFAFXaFY+6IJDYKBYvG4FE0QhOyQ=;
        b=F0d0tiWzDJpQd3Dylns34rmia3R7VYqZdjJxXPEkdpe8BvubwPPirSVnaLVf17o49L
         S6Ba5PKZLTS30srE7RUXo0AyNP7OiePjAXlJyL9ZPKaIdpplUIz6A3NJnIp8kegiS2tE
         grm9zbEur3vjbs2Bs9d/7qm7Ry5tfgy4FGdOXnla2aba13BUUKmSwbT+x0jdCw5R0P/Z
         abic+6xUzn4/TcVB5qnK3qYuQwYkbK8XlIlhYHjvG5rUvtRivIo5389/GizNEKOouT6+
         3kXJxZfmgcD2IDWLJ+oV7XHojoJ9zzNhw2da4SbaxJz8PGVoDtheF6aiXgaIb5C7EuPg
         vOnw==
X-Gm-Message-State: AJIora8jALZj0vPhYI0C+mZ2sc2/acmnmCnxKxApJTH7N1vzgV/h5Wvg
        t+2dX5PuCf7MEaSIgC4wWPyn9w==
X-Google-Smtp-Source: AGRyM1uimptZOye5/08vrA44zZMJbSONHOIsORNrVkz9GrQiNZ66c4JeDA9wtV6Asms/bwDtCYuChQ==
X-Received: by 2002:a05:600c:502c:b0:3a1:a02c:f5c4 with SMTP id n44-20020a05600c502c00b003a1a02cf5c4mr12502912wmr.132.1657024652532;
        Tue, 05 Jul 2022 05:37:32 -0700 (PDT)
Received: from google.com ([2.26.241.96])
        by smtp.gmail.com with ESMTPSA id q8-20020adff508000000b0021d6d9c0bd9sm4276757wro.82.2022.07.05.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:37:31 -0700 (PDT)
Date:   Tue, 5 Jul 2022 13:37:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, jic23@kernel.org,
        lars@metafoo.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v6 02/12] mfd: qcom-spmi-pmic: add support for PMP8074
Message-ID: <YsQwiqyPZQjd1M+T@google.com>
References: <20220704212402.1715182-1-robimarko@gmail.com>
 <20220704212402.1715182-2-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704212402.1715182-2-robimarko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 04 Jul 2022, Robert Marko wrote:

> Add support for PMP8074 PMIC which is a companion PMIC for the Qualcomm
> IPQ8074 SoC-s.
> 
> It shares the same subtype identifier as PM8901.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/mfd/qcom-spmi-pmic.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
