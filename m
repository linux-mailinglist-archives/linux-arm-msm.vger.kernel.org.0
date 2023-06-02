Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCC3D71FB55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 09:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbjFBHsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 03:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbjFBHsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 03:48:09 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8B9195
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 00:48:07 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-565e8d575cbso16982067b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685692087; x=1688284087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvKbLs2r6JPjvHYaqbpBSfWMO9ELDdpgKZ199OCUnN0=;
        b=eMkIv4uJJ0pcLg2uBFyJUdOnS1LUD9tqzovRH7qjVZE7Eb5xTsemA7Cx6FoNb36tfQ
         erAjpIWl6NNYjcsmwCQGbJBOYFvotY+UiCpNShWVkikDhDGGAx5M4yBv3g4e8qgpZiKM
         8ZYESUJcVII4AYI5qOk3LNy/3mAh4sNmot2Ds39HYeUVLQQS/zSL/nscS2fQypZq1yJ9
         B/NgntqVGcUAasdAYUE2PtzIMaGhkFZYdA3DbwTlgawdOvt+2i1ZiT7kjPmZ5WFQCe9i
         nCj3mxSBz/kClPK84oXKYliZoJufxxwagiyhfnpMMSTc5McwZfd5RILv+QchDRNlw+Gt
         lI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692087; x=1688284087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvKbLs2r6JPjvHYaqbpBSfWMO9ELDdpgKZ199OCUnN0=;
        b=R6BW3YKz45X31ZSZCaag4A99M3cQ9WbZ62p29927leIHWjsoWepji0DoTV7S0wnUnu
         MFeOZJxU5J+958PsvnOnRy8AWm6paRlznNaGQnS20PoNLnKsvHvCWY6Z8396z4rzEYTi
         w0KHeso5bg/JwLyRBm9Sce8Fvo7Xwif1AzlYCbtZ8Ic9qXPEjueFp1ciR681lgCMzTgH
         89ccdGyid+00/ZpPnEAm3v/eYKrs5x5EwiyC/5Q33Bbb+udg0+xOMqs3rYt1pcdQxbpW
         orhqeja3r3FaXsxWrpg5Oh3PgfJmfs4liWRRWHze4UQgGNZQFeIpuFQ84bVY4N88v+kZ
         L9ww==
X-Gm-Message-State: AC+VfDx/hSkKXj/NpO5ThXFjypbuNrh/9NYQv2jFEUfEfgRJu66ZncIF
        Hh+hKz3Zmvj3iJcJ7T4h0CY8rO+QdCfVoouI5uxdAQ==
X-Google-Smtp-Source: ACHHUZ69gxClkmiksXQX8sjlRTdOQo8hftIoEDxtpra+6UljIWPKkHEHblNpu41lJoSN0j9xow4szqJB4BRov4DsRlc=
X-Received: by 2002:a0d:d1c7:0:b0:54f:9cd0:990 with SMTP id
 t190-20020a0dd1c7000000b0054f9cd00990mr11133762ywd.18.1685692087002; Fri, 02
 Jun 2023 00:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org> <20230601152026.1182648-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601152026.1182648-7-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jun 2023 09:47:56 +0200
Message-ID: <CACRpkdbq3_g+i7Rn4QsXkSYv=sSeTHR3Mr7H02AaeGtsMoe5Qw@mail.gmail.com>
Subject: Re: [PATCH 7/8] pinctrl: qcom: organize main SoC drivers in new Kconfig.msm
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
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

On Thu, Jun 1, 2023 at 5:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In menuconfig, some entries depending on PINCTRL_MSM are indented and
> expressed as dependening but some not, because of other Kconfig entries
> in between,
>
> Move all main Qualcomm SoC pin controller driver entries into new
> Kconfig.msm file so they will be nicely ordered in Kconfig file (by
> CONFIG_ name) and properly indented as PINCTRL_MSM dependency in
> menuconfig.
>
> Functionally this is the same, but since entire file is guarded with "if
> PINCTRL_MSM" drop this dependency from individual entries.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This makes things look much better.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
