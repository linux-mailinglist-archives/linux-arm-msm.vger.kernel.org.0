Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D716175E4A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jul 2023 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjGWTyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jul 2023 15:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGWTyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jul 2023 15:54:10 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77F7124
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jul 2023 12:54:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so2937223276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jul 2023 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690142049; x=1690746849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZi7468TmEqGbvwfshCak5drGfAiGWilfpY0t8frKx8=;
        b=YbU8ghtzDZunCrfBBFNOElDn8UxWFPR/dSjzoE/nGX8HFJEN4N2M2z+xEGZP6q3sqK
         5mXqS9oYYlS4tsZ08AOWdDvk7XMHa5Fve2qSOkNaRxXEjg0DivUNoRa0ioqerp2d1Mzr
         0NLPJ9Hm9gNwIERIE/vuo27z5l+K4QtPaWubFswrTFz2G+b6bW40ad/VYVZV8P4lNuKd
         GnLbfJRxbNHMVm9tYmrW4ptIuYr7PHP7I+0+BIGq/G5t1v2lduFl01e48f9lPsw/xJ4P
         NmVkaCXun+SWBlDbJsirKQDOczuXsimNAW3f9fah1IIZp33JjV/9EPnE5wchQY2fLXcO
         pRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690142049; x=1690746849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZi7468TmEqGbvwfshCak5drGfAiGWilfpY0t8frKx8=;
        b=gZvn9R1SLdqRJ0VPEVXfYCf6dts8CSNmqkjagfuLVFhxYyyZk77XIOLeJ95NPWBIeO
         Kzp+3+GfNgubfc0HEZ8fbZZBKB3MpHvYH6NazY5m4lsVXdB0BeNwtumgO51vaQmTXv9i
         3SjSB3gzw7O6b1MOl/5JOHM2QStcWgWcjUj2wx+hwglwPr4mRfxKp8kRh/00jmRv9R3A
         A+FEQGSbBrocmunP85L0hdtdKlOXFgOPmvd8g8VNna0AfiBlqFShLWgBel7PBevUVLQr
         HdwUl9mUG/6quE9+ARFvuUf1e4Uke9mGwP71V9doKrW8NouXVxdnN3dHTXf6w3F6Abmd
         JvMA==
X-Gm-Message-State: ABy/qLYFEh/ZozQjioenBovGEnaeK+meGLz9d9xLmDKDewGNLXVbZBF3
        dpzCqoLy/EqTn5DhOkK5XgjuMtiaKgb8mDphz/BOOA==
X-Google-Smtp-Source: APBJJlHCrNKcdl6M0XijMLnAWdpY3ZIUf/mGSsTJSobtPuKk8YHnjonlzIno5tYiyor1jK3+RJp0FdjJibfBa2CtPSU=
X-Received: by 2002:a25:f50c:0:b0:ced:271:9508 with SMTP id
 a12-20020a25f50c000000b00ced02719508mr5279310ybe.52.1690142049012; Sun, 23
 Jul 2023 12:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230719110344.19983-1-quic_shazhuss@quicinc.com>
In-Reply-To: <20230719110344.19983-1-quic_shazhuss@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Jul 2023 21:53:57 +0200
Message-ID: <CACRpkdY1S9fJxp039LwwWRP_8ASJQ8RyELKdN0xLcpCSeN92HQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add gpio
 function constant
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, bartosz.golaszewski@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 19, 2023 at 1:05=E2=80=AFPM Shazad Hussain
<quic_shazhuss@quicinc.com> wrote:

> Alternative function 'gpio' is not listed in the constants for pin
> configuration, so adding this constant to the list.
>
> Fixes: 9a2aaee23c79 ("dt-bindings: pinctrl: describe sa8775p-tlmm")
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

Patch applied for fixes.

Yours,
Linus Walleij
