Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D556EA5D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 10:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjDUI1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 04:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjDUI06 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 04:26:58 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5DD8A5B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b95c3b869dcso3226309276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065615; x=1684657615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=KfRIFWT9drplhoKI7/ouoQ01P5E31D94jaMz485xTttth3bsmBxVK9dBVvN211wGWq
         fLdWJQpR6j0km7XxRth0VRaPWCixVjFRuxCLss2g/IF/IxFx2mKtFFKsuXSJd8dUTZ1N
         Z7J2newP5zXtvEZOCEupnXWu/z8TQb3eexw8ukQ3Nk/QWve2YEGSR5pUPR0VdrHUIRCs
         8RdfNZYgLNgqjVux8ih6EkMgQqfWCbwdX+gRLMLWoQ6hOxuUWuU7U/cpPfOebqbm52bT
         Lqbnb4aQ3H0gIchvPlHxonyo8BtqwoOBXt7wnx8WpjTY755G3kU8lleYWQnnbbqEEFkS
         nAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065615; x=1684657615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAuTtwnqd4lYOEj0afl/oqM3QX+uTDaG/z7kPpmXMgE=;
        b=dRje6TNunRbbYfW3U6pdp2hVcUyKtvf7wyOmdFsLoz8L/XWT+jnEEsgfG+xGFZZ5ay
         nU2Bh6t6LOcL54tN3utrpOOfQ43ncW7uhC/TFWq9gUuZqdKdMzkdlvpDycneRFb3RqUA
         jAzZMfWNIqFu00hucEvuu/aYGNIfeXaeBpnsELEMxyUSCHI0kSm+DPwQH1xk8s8J2wAm
         fmoiOKxzpWp3l2SKsjN1FoPRFcmPvx+VkdsK4FYmpkf27qecZjL7uwmNgx3FcIvmBUFJ
         2EqvMB/k8vr1p6+gWKeWDkh8apo27viKTIKVuD6GKC5pH5+OkSnQoWbQP++9WS3Z9S61
         YZqQ==
X-Gm-Message-State: AAQBX9dt2s6iOsPjdvHWdsPqeImR8fsyO5isKdZp6s7LjSfQrKSv0hW8
        1tukZ96F6LPi8nQVIHJ/ApO8C19ats0988poSnpzPQ==
X-Google-Smtp-Source: AKy350Z8XcyFNX2JboNAaFrt3oSnc7DS4Jc7Id9gYXDPevkIo3K9uThotJdC51FnQkL/TPRP4jQP8FzcMgBbAAn2v24=
X-Received: by 2002:a81:12d3:0:b0:54f:54c5:70d with SMTP id
 202-20020a8112d3000000b0054f54c5070dmr1414029yws.20.1682065614765; Fri, 21
 Apr 2023 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230414-pmi632-v1-0-fe94dc414832@z3ntu.xyz> <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
In-Reply-To: <20230414-pmi632-v1-2-fe94dc414832@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:26:43 +0200
Message-ID: <CACRpkdb0oncz5UB8vtu3csvBQXojvdxxfDMPrnGeH3qRBr6=AQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-iio@vger.kernel.org
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

On Fri, Apr 14, 2023 at 1:18=E2=80=AFAM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add support for the 8 GPIOs found on PMI632.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch (2/8) applied as uncontroversial.

Yours,
Linus Walleij
