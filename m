Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4557620B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 19:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjGYR6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 13:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjGYR6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 13:58:23 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A601FF2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so259073a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690307898; x=1690912698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b46yA1Vvz5EBZCOyU8aDfGflg6YOPM/a7952vWZXQbs=;
        b=X81Eg+KiyJkaBmeVc7EzuZxmo2VAgibDS6w9rEvwlAfI6tGsS0j7KOFV9ugSL2rwNU
         Z88MZ/QzLnnbm0huHZtZLjh2zPf+1Gqt6pgk79KKrxL9k7PkcaPEr9hREGK3AzlTnfNM
         hu4xfVfmIw/WiTeUz/2DAZVTDsmJrhk4SlXZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690307898; x=1690912698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b46yA1Vvz5EBZCOyU8aDfGflg6YOPM/a7952vWZXQbs=;
        b=frPcuzY5UwW1Q7DCvqynukeYc3FJhLwGdxpdsQ7vRvOiqw91k2SRo1SvySS0Kft53y
         jAzKAgf4LVqXMkI6ufrtlGDstsp8MhMft1GxvzfTH0qhGAJ++i6aRjIeDLCRi5HcyxM+
         i/y6wueypUJlsRuoVMsBoAniyKw/LMjvFzu/UudELgifr+XwJENTah63ttN5rrRU+Zs8
         efNbK2IOo2lUtPrkXB4zx4+MpZYHs8xVxc23kbOwE0Mlg/d3R6TiAurIUTA1/lGn2Zjd
         5wk63RlTb4jmG7VcuosfEK06QjmDGKNakh8KuLTbp6BqcwZ8hLmlYK6Q7JwetSxNJuZZ
         Oflw==
X-Gm-Message-State: ABy/qLbl2YPOrZqnE782qbdVI6y6tgWZtdbodXW7tZJrVkJyvj7p3Z6t
        f/bH0eZYQBiTcJGZzttFxIAuSMgzYbclOCs0xJVl573h
X-Google-Smtp-Source: APBJJlGXYAzJXIvZ936oGBzU0NpbWP/Y2/BkUVLOCG7/lSADQXrvCcLHNiFM+U7HNGzpnWXbeyEWWw==
X-Received: by 2002:a17:907:2d89:b0:988:d841:7f90 with SMTP id gt9-20020a1709072d8900b00988d8417f90mr3531172ejc.27.1690307898457;
        Tue, 25 Jul 2023 10:58:18 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090634c800b0099297c99314sm8417652ejb.113.2023.07.25.10.58.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 10:58:17 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so1309a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:58:17 -0700 (PDT)
X-Received: by 2002:a50:d55c:0:b0:51e:16c5:2004 with SMTP id
 f28-20020a50d55c000000b0051e16c52004mr143860edj.6.1690307897245; Tue, 25 Jul
 2023 10:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <1690285689-30233-1-git-send-email-quic_vnivarth@quicinc.com> <1690285689-30233-3-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1690285689-30233-3-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 10:58:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wb4_q7xL_ec=_=bQodb0dy18HQzY=E855mZ1r+5G36uQ@mail.gmail.com>
Message-ID: <CAD=FV=Wb4_q7xL_ec=_=bQodb0dy18HQzY=E855mZ1r+5G36uQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] spi: spi-qcom-qspi: Use GFP_ATOMIC flag while
 allocating for descriptor
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 25, 2023 at 4:48=E2=80=AFAM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> While allocating for DMA descriptor, GFP_KERNEL flag is being used and
> this allocation happens within critical section with spinlock acquired.
> This generates a static checker warning.
>
> Use GFP_ATOMIC to prevent sleeping; and since this increases chances of
> allocation failure, add handling accordingly.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/abc223e8-44af-40bb-a0bd-9865b393f435@=
moroto.mountain/
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Fixes: b5762d95607e ("spi: spi-qcom-qspi: Add DMA mode support")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
