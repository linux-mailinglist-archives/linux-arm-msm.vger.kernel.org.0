Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2175820FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 09:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiG0HWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 03:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiG0HWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 03:22:47 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D48402DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:22:46 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id e5so12089578qts.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+JqPHdLZ/HYmdmzXrTEQb3nj60bzhY+VUEyiaklLUA=;
        b=l8J2gKSeNzW5YJOcXjbRCD4ynGDcCn3u3BVHiqNKZpZ3pQ6zsWQuvk3rwVgQtE3Ufp
         Gonkjw8w0RNfzO6gKsAqEn7yRXWl1bCBISVtazCITQ85V4ZYbKGD15BAl8bntLHx+Zco
         VlkQX23RY7d4kVmjKJbTB3RrHNqlpMpat1hDFg7ctM+pcMdtGB2DGHLrjq4dIuTC/CFr
         SRqNK4LJhMFKS0lzzcIujZl5nBpnKBPr3IrQyLTXhgNIon61FETLI7zURffaoXsdotCN
         1q93Jby6kOxqQnFx8XhNEFUVZBORy/BWq8rlNT/pUBGaovjHO7rjSI2WqPc0TUrETzar
         6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+JqPHdLZ/HYmdmzXrTEQb3nj60bzhY+VUEyiaklLUA=;
        b=N1mV9o9uxi2alF1hkyKElXRL7oO1CjZLAyZYbKcjcAK+TPbEbUB7FS6T3kvgkXgHYP
         lARNZ+TKt/1MyU+buWxgIDZca76I6xW6maMtN6u/AZdxoFgCRB2n+/Uk1r5joIx6roCZ
         YkOImah6juqLGunpP95/92QC8ZEAmLUMsnuAmQ8gsp8eEtyGp0FY2vP2PKPK0RKxb0O9
         RysPrQzNlt1VBtYOBXvcwjEiiCXrQeXmQmtbkNrqtPpJbfMaUi2mZMgW22NWC3JUoADf
         USJnohFDf0/hWBrpgTw/IfvTl+2xb9oTsCAMUX5abHZGUlKSvdd/g0K2grekWVhLNzO/
         4xEQ==
X-Gm-Message-State: AJIora8XgjKyy9K0PxABFYanR//mh1de7ItSJvVZTFGsSvN3KWwK3rT3
        1iLizJNg+pPaq51Xga6UzEoEKVQI+Pl0+UQrAjVsXQ==
X-Google-Smtp-Source: AGRyM1s0olf/ke1T+BX9JXnVMG+4PvmsCJi9SxAHK/k32HsCZsCXwwArDf5ZflSFRsDA5AmS0Pek62Yy7bz+Lh3kW/0=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr4767760qtx.370.1658906565516; Wed, 27
 Jul 2022 00:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org> <20220727065830.10681-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727065830.10681-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 10:22:34 +0300
Message-ID: <CAA8EJpr5BG=LX_ykE=AL-GSewzu07WCvsVz4u97vMFXFwLODsA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] ARM: multi_v7_defconfig: enable more Qualcomm drivers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jul 2022 at 09:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable Qualcomm drivers:
> 1. Command DB (used in SDX55 and SDX65).
> 2. On Chip Memory - OCMEM (used in MSM8974)
> 3. RPMh and RPMh Power domain (used in SDX55 and SDX65).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/configs/multi_v7_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)


-- 
With best wishes
Dmitry
