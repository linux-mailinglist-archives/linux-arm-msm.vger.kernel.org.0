Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF716CC09F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbjC1NYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbjC1NYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:24:31 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F562BDD1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:24:27 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id z83so15008767ybb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680009866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODv/TKj9XjaGyfGiVPdjZaxUlz/rpPmjxWi1979l79E=;
        b=QrpT4AWmDV5PNsSjsK1Es7HVbk8RwYyZ5JiskPsXcIgfTZJwr8NXQuODsU+BU+8Wba
         s6ZgNaz//CNzHTeUXje4j8kevD3J7/7JwwbgsOl+2aZgBOMYM5VplQ2IzdX5of70eKdd
         SZFBQUFWR2ngzryn9XvhBW/4IWKEQevd0OH67djOyxbqlLo5GDtDYifg9UlHX72fD+QC
         cg5wYKlSnAUh8ywXFc4HR1qovOchRH5OLXZB+r7mhml6BHcccFX2glJfgjUTNex0QAmo
         qitA9nkwMaTnGfZ4RytGU13WYUoHbAllEKyHCaGRoWUac6jeAaHsmdx2EC2v6hdZOICL
         Ib+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODv/TKj9XjaGyfGiVPdjZaxUlz/rpPmjxWi1979l79E=;
        b=XUah2WRnrVa/o9OmZerLsLdzVrUK9T81dsi4BfTdRrs8K2dORiWvOniqtb5sLfbPIY
         fU6KGvuUaemn1S6SwdC1J/9T2jxbksvDDtvtwqtp1/QAjo9t45IIGikiXqxADGTCuZKu
         oBDL9SF9RQkCaqnMbAeyEbSrmLeGFFRiIE2KU7b3r4Tfe2BpQydjPjtyjf0C0P5BQxcX
         nhK6/DGR9m+NTF5FIjZhPNWl33cJ6v6yq/T5Dydv1Tu3wMOf43MGgrS7WpmPaQ/f5UyH
         O62fDchJkcHFZBMij5jMCe0QkWI39ZZPbHSg2R4bXi8+ET+A7vGYebJzr65jQM6jWf+o
         H/Yg==
X-Gm-Message-State: AAQBX9d8HnjqYXzvod3Ihb7N6RYARAGxpyJ1uNHmLuJ1dmniSggLKmko
        YP7LDHWKygC2pGbk8SjqgABTPglrJBNtICnuvGZsGyUNPvaVB6xC
X-Google-Smtp-Source: AKy350bDfV+vPtjGahbsAvHKOHcERGC3P+SbDfRyneogd0gEggS077fTJ1OZHb7rB3+yw4kQl2rShkLkFqqoKtl3cWM=
X-Received: by 2002:a05:6902:1145:b0:b09:6f3d:ea1f with SMTP id
 p5-20020a056902114500b00b096f3dea1fmr9744104ybu.4.1680009866559; Tue, 28 Mar
 2023 06:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230327125316.210812-1-brgl@bgdev.pl> <20230327125316.210812-13-brgl@bgdev.pl>
In-Reply-To: <20230327125316.210812-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Mar 2023 15:24:15 +0200
Message-ID: <CACRpkdaYHaJMn7w_q12V3Q0WW71-U_kb+XsR1tNsirF35xYEoQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] dt-bindings: pinctrl: qcom,pmic-gpio: add
 compatible for pmm8654au-gpio
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 27, 2023 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a new compatible for the GPIO controller on the pm8654au PMIC. It
> has 12 pins with no holes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Counting on Bjorn to pick this up.

Yours,
Linus Walleij
