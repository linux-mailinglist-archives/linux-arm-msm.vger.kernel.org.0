Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EED866D0AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 22:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbjAPVGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 16:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbjAPVGN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 16:06:13 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5B416AE6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:06:08 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4d13cb4bbffso276113027b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pTx0hKUehj5zlFMm8je22yYIdgmSFNrS9JKax6jHuBQ=;
        b=TslgB/uw5OZ7lyuSRs9ylD8Njzd6I2vt5fglIxu6Ub/uB0qGZeWMKHdRzW/HJG6lsZ
         9xudq/U89FOtQcaxBE/5/x5dQaTouirIBcV5OR4EjPzhRe+LZkgQDP9qIvSCuY0mQ9HX
         RyFMxumcmyTYFx0j5aP7D95hgezZubz0GDldGis8O0QWZJzKNthh0JJlEnAG3NUqd/RJ
         0BUN5TGqNn/6F/HSljpP0mWorX7FWgCtmTpyHqyfP6uDQyI7UZx637kHM9843bEVMKvx
         FTRs+6ehFNkgBYFYTwASZqnnB3kDCn2kjhhsVBatyQo/1i3GtGqbQIKE0Z4CMCMR9yWV
         kh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTx0hKUehj5zlFMm8je22yYIdgmSFNrS9JKax6jHuBQ=;
        b=sAMhxYAw+dBpEJxrpgkBGM++JlEoC8l0jpzhsfxROY+2Rq/8YxPK4KhISZEwqbBRzd
         JjkSxat9IWL4hcL+ECv5IbZNqPohBBz7jqwVPx728huf0nIli4UNvslY7mfq7YnAFkRk
         COi6o9893SAH9uwA/7EhTgz3jBZdoVOY1oVST1UqqaNHvwAsE1z2TaT/+oAw8lsaM//1
         F2W/k0qlIllSZZOiAEcGVIycnIUaca72G1thzNIqTYI4WkRm/ZXNc2dShBb+zy2AGvBJ
         oGBSvVANfZdFPcXmLIeK1TEM1UAd03cItGo0rQgKXKsGAbngOg3c+Mzi3nEBEgBQpLiS
         cI7g==
X-Gm-Message-State: AFqh2kpqTylXKXR04Jv+kli/aIL9AsNn9x6ju+FszQeTS/cFwKtcSAti
        usJAS8rB+6sTVjmpFl32R+EvN/73NapCfDQXvk+zMA==
X-Google-Smtp-Source: AMrXdXv9CEbf8RGoRc6TXpluqPTTq48HnVzFbmyL8U8sOQv2gZMYUAx7xB2dnKo3zWCRMrxZ3DXsJ6juWXp614GVzd8=
X-Received: by 2002:a0d:d60e:0:b0:432:2458:f6ca with SMTP id
 y14-20020a0dd60e000000b004322458f6camr103782ywd.138.1673903168207; Mon, 16
 Jan 2023 13:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-8-ansuelsmth@gmail.com>
In-Reply-To: <20230116204751.23045-8-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Jan 2023 23:05:57 +0200
Message-ID: <CAA8EJpreAtkY3RvUbU9JS4E3Ye=trc8MvyTLXp6PxPt71X0Jjw@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] ARM: dts: qcom: rename kpss-acc-v2 nodes to
 power-manager nodes
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
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

On Mon, 16 Jan 2023 at 22:48, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Change kpss-acc-v2 nodes naming to power-manager to reflect Documentation
> schema.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 8 ++++----
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++----
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
