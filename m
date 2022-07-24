Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3E057F692
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 20:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiGXSoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 14:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiGXSoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 14:44:24 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98D6DF98
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 11:44:22 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id m7so7182289qkk.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uqLCtj81FzXR1rhJvIs1w4M+P+JCKpBnNBBvGjMwhkY=;
        b=b5RRwEQx9QQiM2iteB1J9tDEhxTHRFV9M2mhDG+mWfrbuIpuUzbCT2yguT0ZX8Xz74
         mzowjZAAnR0twZciOuTIMIvaNedFOYbmnb30yydFpDsPFXbjV9NoRvRxHUjH4H7ufAkw
         VU1J3nWeFiEyLm6Y1zX4hCfKzvL4s9/jfcDUo3a0ICeZ90PT7jkQEEaU51rbQG99OvMm
         gwCkH9wCz1aOJ05n9BcIBdtm4LvX4Vv7kUOpevhUY/S5E7dpPLoQU+eQpMuFzKq3//RS
         q9DRJNxOt/y2Fq9NCbCERrFQCZCr9z78GLNkJSZM97gY11rCIwaipfRmJUemucK6AgH3
         pzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uqLCtj81FzXR1rhJvIs1w4M+P+JCKpBnNBBvGjMwhkY=;
        b=NqLXDcdquNP/A4hIb3nbNaxe5zfEkCP/EZgz8Q6A/34ZqPNgSPUhyI4ARwksjB+oYR
         wqzI80nGETRK1pbakThIwlMYHMLUJX3UhIB9vGx1e2lVXwmvqWxG8fK+bKWXVnKsV12R
         txxprgl0YUn+ElXNwDYrMZqrMkIgk7T7rFk/6rPokZNTbpuQW4sIJFVZwwzzY617NZd7
         2rC+SHORpLVEfJy2Zyt7f7CiOyKr4UPwM/xQVF1V9GOC/s7x+tWxSNHycUUsQtgyXx1v
         WoEY0RHFNr8Sb5CiLJxnyH1SzMJ2eshU4eKo9Y6/5eR1bHavHoUlfPzgJyM/rO4Cl4AC
         bDWg==
X-Gm-Message-State: AJIora/2idkMn0w6LXxEGjOh7XN3iTnhK5mDsU01QXsMHzJmjjbWqkvZ
        oT9XCiNErdkA3WrgJ9eMr5NS6KActM7sCP3/vCCmaQ==
X-Google-Smtp-Source: AGRyM1vUDgkdDdsy8580QybhfJAvFu+1i9OFoHQ5vdHGHRp/oVSD1FiSHUQDYvIBh9xS6RcwZBGF9eySc2sErRzDKvM=
X-Received: by 2002:ae9:f311:0:b0:6b6:30a9:1bb1 with SMTP id
 p17-20020ae9f311000000b006b630a91bb1mr6795622qkg.30.1658688261879; Sun, 24
 Jul 2022 11:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220724172442.87830-1-matti.lehtimaki@gmail.com> <20220724172442.87830-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20220724172442.87830-2-matti.lehtimaki@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 24 Jul 2022 21:44:11 +0300
Message-ID: <CAA8EJpqwpO3gu4XD8cHju=9avGb-1YGN8r1cHwgLOFVKpOFBrQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: qcom: pm8226: Add node for the GPIOs
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Jul 2022 at 20:25, Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.c=
om> wrote:
>
> The PM8226 provides 8 GPIOs. Add a node to support them.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> (no changes since v2)


--=20
With best wishes
Dmitry
