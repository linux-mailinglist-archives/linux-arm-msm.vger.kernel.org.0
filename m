Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98656729087
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 09:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbjFIHBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 03:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237624AbjFIHB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 03:01:29 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CDC272A
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 00:01:26 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bacfb7acdb7so1510543276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686294085; x=1688886085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elu6bJKcJHNxiVwiE626QNNoqTsS0jjzoZTRm9E1Psw=;
        b=FDGqKf8HvvgYs4qwcwy0tK/fGpaKJsSb0KyUJPa1yB2yPkyoRRWzeaYYGbEzmE7Q9b
         7eIeNvMenEsLwG6QvM0hQHeqY1h5tE8pGxs2NLAYzRh5GJbiNX0z2b/6AfsrU9oxu03U
         HWuJ+WN6+dRJ5rx/V3FjJ3FX4osakNajOVEY9YuZLe/NtvfLaZZBwqFWd8SZAcSQeCUx
         d7Mi5aXfx3x1qjZXFDu05RUUYQG7fyb4v6Nl1EJxKlTRZNThKMtBH0DV0O1jw3AlCFp3
         3oazKu029mHUU/b5JKQaCjNNSliWUWtakkclw0EkVS30TR+eI3xhFzTwJIr2eFpO1Bj+
         Q0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686294085; x=1688886085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elu6bJKcJHNxiVwiE626QNNoqTsS0jjzoZTRm9E1Psw=;
        b=ClqvAYlCg/fWBYTIfzJUtacIwpTny5VoPJUTB1/H47DDThbqV2a+XdM+2XUNkkspuY
         lr3JbI17Rscu+oiQyMswqBvVBWkid5Ow65D41W9RyfixpTASmkVUaxjkv/u/YS9K74lv
         fGgcICoQqV+aQGcDMNRCy4emGF7MZ2mErGsJoJPzsugRb7iVHD6327G6h9V2BBl/1byp
         nzYKrV3Ep4UJF0r13sFnvUJwkDb1IPcy693xVJEwymV353jZgMcNR84Fg/+9f5LDd2nj
         tKcmOmn0VjlrFvXPIWCC9Uy4aMdngr3fVo/q4deD03enVj+ooC/hPRtOLbHnmhv4Qtib
         tEpg==
X-Gm-Message-State: AC+VfDzT4G4OuWlyJ1G2NKB/MYgvMHm73le09RxAa8f3r0omfZ3bLoVj
        G9tsY099IPJvY5yCyC+N3CYzb26F/jGIXD8gl6oGbQ==
X-Google-Smtp-Source: ACHHUZ5Jjnhl+b0jxcL7O9IVlDv0/+vbbJgsljEc1FFMBJXHJjgxmzOvbTiIbnBsXLYFE26tNkplg1JcwLHcfI9hO+A=
X-Received: by 2002:a5b:512:0:b0:bac:f684:89f0 with SMTP id
 o18-20020a5b0512000000b00bacf68489f0mr308763ybp.51.1686294085532; Fri, 09 Jun
 2023 00:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230608122152.3930377-1-quic_srichara@quicinc.com> <20230608122152.3930377-5-quic_srichara@quicinc.com>
In-Reply-To: <20230608122152.3930377-5-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:01:14 +0200
Message-ID: <CACRpkdbaNPyLr9322FKA506oBXwc2zPk8yvYCrw9J6VR1hmi=g@mail.gmail.com>
Subject: Re: [v9 4/8] pinctrl: qcom: Add IPQ5018 pinctrl driver
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robimarko@gmail.com, krzysztof.kozlowski@linaro.org,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 8, 2023 at 2:23=E2=80=AFPM Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:

> Add pinctrl definitions for the TLMM of IPQ5018.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Co-developed-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Patch applied to the pinctrl tree for v6.5.

Yours,
Linus Walleij
