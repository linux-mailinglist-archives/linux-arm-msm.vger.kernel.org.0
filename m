Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3816DCD6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 00:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjDJWXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 18:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjDJWXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 18:23:13 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B131737
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:23:12 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54bfa5e698eso278666327b3.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681165392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqzijXan3tbsRD035Gip+Q2/1907zc8S6CEtVT7zJ+o=;
        b=qxQ3TGut0CDdZg7WfjGFwsLUaIvbZS/P76q6rQUaI0tTClhQ1SiVKZAQDDmid+ncqg
         PpZAePtYwUKUbZpDJhpphnnyuOE7QWtQQJAbvf7FR8pQpMzEglKpW/L80CxMiwhoVlFn
         8wNmks/g5Ay8L/jIHqDpAN0CYLYnP5nhYOxRwFWsv++1HuyD48O2/niQFjtKsiCKcvj+
         ll75Ou2hHDu7jc1LInVif44jVm7ASeLc6LwHNZK39awSjcZouVHYlhBKmLiOn/ecgt6V
         UnZisOgTJybUqdYM8wgDVFF49xcji+rymGGz8O4Rd3OBpaVGcCu/mc9l8GXJTZDjV9gn
         ckjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqzijXan3tbsRD035Gip+Q2/1907zc8S6CEtVT7zJ+o=;
        b=KoJ3vsa7i7cTtoL7fABU39Aghbushbk2m2M8QMoZ7KkFtxpNrwOpBoM8qRxWnuCjtF
         4uW4s6qUEkN2Qca4/w6qSmRBzETstaLTafBaCHDTjjHsBT8tM66D64hkaM7a9GV0tZKx
         qX5Y2jflgr5ARoobH4yqNnwFealP+GWIVFjf5Pj+fkutJe5VYKXeSw0hmBoFLh8qbIX9
         dMPgri+vKvgYIZxlrzSmqv0LX5aBXlBorL1jJTjUh1cNYXlB1H9J7iQFa8lOIXf4YOis
         D6XhMahpFJNfPAo3zSQjFX/Fne0Fq/bf9k4kRfC7j6VoFJA+GIuawXHxvBAGQ0uaxdiL
         vi9w==
X-Gm-Message-State: AAQBX9dt1ReHF7YysZ8HKXsPakrhycLIPaDNADkHMvJ8WVpv+lwyo2FZ
        AvHbRyDb8vZ7nFMiCS4d80M6j3LHhestRAU5aesaKw==
X-Google-Smtp-Source: AKy350ZlEYOLCGErRvEJNnVaXWgyMcgVUP+9FL3bH6XvLfYW6GMr55R37YmMlKd2Pw88yL58x2v6zAv5WJAAQ6eUVuA=
X-Received: by 2002:a81:c409:0:b0:545:8202:bbcf with SMTP id
 j9-20020a81c409000000b005458202bbcfmr6407198ywi.9.1681165392023; Mon, 10 Apr
 2023 15:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230407142859.1.Ia5d70e320b60d6707c6182879097708e49b8b519@changeid>
In-Reply-To: <20230407142859.1.Ia5d70e320b60d6707c6182879097708e49b8b519@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:23:00 +0200
Message-ID: <CACRpkdZH=EKoVjvDz4Er9XS6TSAGLYS=daZFb+bc2LpONz2Vgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add "and" to PIN_CONFIG_INPUT_ENABLE comment
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, Apr 7, 2023 at 11:29=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> The comment recently added talking about PIN_CONFIG_INPUT_ENABLE is
> clearly missing the word "and". Comments live forever, so let's fix
> it.
>
> Fixes: e49eabe3e13f ("pinctrl: qcom: Support OUTPUT_ENABLE; deprecate INP=
UT_ENABLE")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Link: https://chromium-review.googlesource.com/c/chromiumos/third_party/k=
ernel/+/4409769/comment/9a1d5def_e1e71db7/
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patch applied!

Yours,
Linus Walleij
