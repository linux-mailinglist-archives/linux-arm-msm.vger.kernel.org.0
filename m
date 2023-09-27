Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A99B7AFF26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 10:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjI0I6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 04:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjI0I6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 04:58:08 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228E7C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:58:07 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a1f00b75aaso21347997b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805086; x=1696409886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4Qt7MPKUZBp7gXinhRZHu894kl5p4OlGl8pyoVCVvw=;
        b=PSQCUa4zSz9zdkYl+3UDVCmwQISAkb+w8sFU5aKVoEc0sgMZtODT1kw4VrXFOSyRth
         85Uun9MjT09IcWH7298B4sNWtKrSEz0q55baMLNFaiY8oTVXFdBJxXFxxDN4dqFYoCEt
         ALpyUbtTBXiG7oHVaXk+M3J8vZyCyPH2iathfT4drvfQzCDpWcHC5QB9Xte9jsvj3D69
         qS+9WRZEmJbFG8Q+nd+RdQgUAO4npr6cuL3f+GRVmbo9S1kYQwLdGLkpe/egOpD+JJ0E
         KfOw/wBhENPbSk6DM4DEV6kpnxmkFL1DYcdiaLcKP3xgnlNHPZbF1Jtd63dYgXn8o+1i
         fiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805086; x=1696409886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4Qt7MPKUZBp7gXinhRZHu894kl5p4OlGl8pyoVCVvw=;
        b=NVsDq36AfCoiLN5/9RKxhZswYioUXUsEAUEd1wDIw9VstKOQSygpITF+ziWIYSzHHx
         IADnFylWtxiS6vu2jtY6hUx140UkSH/E2oBWXlTeSZhh5LSpMKMEbhMz1yRgIY1kEsLc
         gBrZ8E6AncVSdHlz7Eidx0NP3wDJjq9qaG47qGwheeBXmOO5tH910Ky6w3RcG7vAbA19
         QS/YhLhtimmvyz+266BudTCW1a0zv/Iz8UH1Ys0h7ZzyZg5snBglwK2ZRIVoOszGsAjG
         q8lBTfDKNF8jAWxZKLO1+nmqoGGKDzABQVwA5jsfGckVeoAYnqwvvdpjKdldaOC64F7T
         zJqw==
X-Gm-Message-State: AOJu0YyJBlMeVG5CyhT0/lRk7OE75abkOKwYbGrdBX059AvQcoQi5mUB
        cEmuJyiTDQkyUPVocfzE5zUZSqJ9a7evKIiBpqMVBQ==
X-Google-Smtp-Source: AGHT+IEUmKO2BsqC37PrNycNqioSf/28nUrv3FZyiL1k0/yaHaLFkmQkRcbVXqDppaKLaYKSl/j7y7Gt5sdoNpGrogI=
X-Received: by 2002:a81:48d8:0:b0:59f:6212:e170 with SMTP id
 v207-20020a8148d8000000b0059f6212e170mr1641107ywa.10.1695805086311; Wed, 27
 Sep 2023 01:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com> <20230919-fp5-initial-v2-5-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-5-14bb7cedadf5@fairphone.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:57:55 +0200
Message-ID: <CACRpkdap7ZC=KokB4ysgvDVPRYP0ns3Dqz6p4d6cQqGmWWX2EQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: qcom,sc7280: Allow gpio-reserved-ranges
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 19, 2023 at 2:46=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:

> Allow the gpio-reserved-ranges property on SC7280 TLMM.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

This patch 5/7 applied to the pinctrl tree!

Yours,
Linus Walleij
