Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82247D83E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjJZNwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 09:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbjJZNwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 09:52:18 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F54E1AC
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 06:52:15 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7af52ee31so7078777b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698328334; x=1698933134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l1pXXPojYJERfyGbdEpNZqOClr1acgIl7421/gNGH0=;
        b=mxFdr4SC0qtnzbV6PAGMQA4W7/7r2CJPyZECw1TMM5yR41EId/0VZRHp9F6GiRkd3F
         ZkTOKozF0IyO0eHP1YOv25Y39/6bUzZ0gutNCWxC1TzcFXZ+e3nmQQIG+DOJth/0E25N
         TTqjHZCPjMqM/vihPdrmtWV+47nCaPuD1s02V3xk0OBFKgf+qhh1Xt/UkXYyHRJOrnwp
         KUKiaQGcuRCn/GtLC1KdqdZP06OHjq/za2+1TV4w9VYbeKCzYMl+vu4kSUcUxhoLx2/m
         Vk8xdgAfm7cqNisU99MfUu6ABGlTsvx9QzhUGk/ZKccpqOlcGN+F4W9Gpa6nTfW49loh
         9XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698328334; x=1698933134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l1pXXPojYJERfyGbdEpNZqOClr1acgIl7421/gNGH0=;
        b=R/W/URO3rBBDENB++sr7NixVSDKFbYLdieaM9kecFsOWuD00WbFrH3YPc8Lo88HuGK
         tno1F/as+TOUfOAmW7wGchYhB8gMxpgWhbv5EZIbYpZjN/f4qi4XIswapPK7OIIaJ4By
         pVc1EiqZ5tHk4bJEiUJ3EUUl3N55/fmvoYeGH1kMGx3JR/Mnsd72mS8kVVO7owH5VqoC
         Z7cB3eqMYTeotonA1dTOmh5+vxH37zuSo3jAXOiCpkw+ZX3q7Qph/d7bktdJeOH13EV+
         iafQ37U3mO3NWah3DCJx37NqEmF9O1WFa2r5TsPxWsISuu+SMv850TEFRa3ZEdlAmhJp
         5fbg==
X-Gm-Message-State: AOJu0Yz4ACczGlaOjyjkc/PhIgHI2S78t3XO7wjAn/r01PUHXXjC0QM9
        h9TKmSpvxAoSOiaeAma5YLZN1xpZEcnKZIlSAQZtZQ==
X-Google-Smtp-Source: AGHT+IHfP/O7KN1EAK1myIjKq27giWPODeYiJ0sVAkgkirwOVfNgi1SOykk4KY59v73CE8NRUJB2ldzUl35zFlzaUsc=
X-Received: by 2002:a0d:dd0c:0:b0:5a7:d11c:f0ed with SMTP id
 g12-20020a0ddd0c000000b005a7d11cf0edmr20160216ywe.33.1698328334604; Thu, 26
 Oct 2023 06:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Oct 2023 15:52:03 +0200
Message-ID: <CACRpkdZZhm+h-ZXy6X6xX6DE1bVbWPR3hd9EpgEDUUNX_t4S2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 18, 2023 at 4:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Add missing wakeup-parent property, already used by DTS to indicate that
> pins are wakeup capable:
>
>   sa8775p-ride.dtb: pinctrl@f000000: 'wakeup-parent' does not match any o=
f the regexes: '-state$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

Yours,
Linus Walleij
