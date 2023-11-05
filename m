Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358AF7E16CD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Nov 2023 22:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjKEVUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Nov 2023 16:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjKEVUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Nov 2023 16:20:02 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59144CF
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 13:19:58 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a81ab75f21so46016217b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Nov 2023 13:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699219197; x=1699823997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLnVpTbQiwfXIg8wGXozHxE1Sjn0Em7Ol/PU3YKzMxA=;
        b=PSzxJfZldtV2UFVuZWEnHtxWTTUSXXSytm4p4pqguJPPvpOG/IacbnsC/zLbrsjWtP
         ht9BAjhqWis8GExRE6Ot+/2XxX250CCdlH/xjlbdK9iwF5M2LsAB7YPtSvMCv6nwjoCU
         zi9vrHPPKZ3HnUC4Fw9Ep5g10jiWidjJZSA09UZzVxALiJlE3W6DnpORkQ4uZXCgVUNF
         u3PBOrJ+to8hGb84wD9YBCNaDBWnAYP860FJvF2jPIrWy6vaAVyMmwxHxwdvkNOAJBZn
         IDoeP5H0hF//VB5sHQ/zBqk9Y4bup6Ma12RVIF0Imv/qDY/fc0VUFxrSeSnK+12UMVON
         kN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699219197; x=1699823997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLnVpTbQiwfXIg8wGXozHxE1Sjn0Em7Ol/PU3YKzMxA=;
        b=apZtK2v0fLBSebQjTPVlijq8hy44BLMqVJNIQMEjxjOqDhl8E5xGkzQDua/YVH47FU
         w5/2P3j0eDyvGoOiQftmX63WIv0JUvt+n77Ium2LadpfwtilARLvtifdfJxpTQk+YH1p
         vDFeO+iVAS+iqnj1oITXvMCC32CbIRXJeWNuZJ912UdMfFMEsjVEk9wRMPt0hj+1v5Qm
         RqcUI5Z0oFdX3cw4Nnm6C4g76ucR3ZuBFAHl65cgCA49Yp2IMoO2oFdUiAtgFPDwCn2/
         KC3RLLoHuZONs3lgXQXb9p5KBL/eIP79nitSp093v+0bGO28kb2CofGbMhJw+Kl5rTx9
         4d5Q==
X-Gm-Message-State: AOJu0Yxv7vJnRrLrAnw85XHRdHLKilQfxJPSKV1OU8YB2ZxVYY6E4Q0L
        Z3/IszCI2bVQnG519ut0QLkc10LNXmm6XZfzsUPkuw==
X-Google-Smtp-Source: AGHT+IFPMLz9ALOoujwosu7oN9lqlUr2Y2o8wAtyxVnWRsqtayeiUj0yzzdPWV3JUUcn7AIOW0Vgrh8vqXn2WgXwZEY=
X-Received: by 2002:a0d:ca50:0:b0:5a8:e303:1db2 with SMTP id
 m77-20020a0dca50000000b005a8e3031db2mr9978764ywd.23.1699219197562; Sun, 05
 Nov 2023 13:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20231105204759.37107-1-bryant@mai.rs>
In-Reply-To: <20231105204759.37107-1-bryant@mai.rs>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Nov 2023 22:19:45 +0100
Message-ID: <CACRpkdYmJkaS5dA7RcSGpN3zS58vWE_BmUtidhbR0N3ZqpD9cg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add samsung-milletwifi
To:     Bryant Mairs <bryant@mai.rs>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 5, 2023 at 9:48=E2=80=AFPM Bryant Mairs <bryant@mai.rs> wrote:

> This series adds support for samsung-milletwifi, the smaller cousin
> to samsung-matisselte. I've used the manufacturer's naming convention
> for consistency.

The series looks very good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I also see that DRM+panel is in the works for this interesting device,
which is great!

Yours,
Linus Walleij
