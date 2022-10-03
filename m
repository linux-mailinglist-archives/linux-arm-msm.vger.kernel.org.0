Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCC015F362B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 21:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiJCTQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 15:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiJCTQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 15:16:21 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A54B3057B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 12:16:18 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 13so24288328ejn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 12:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EJmCld9y6KB8eRy9I0zDmp0PKZYGcStJe83KPH6aFr8=;
        b=ic08+oY1jDUkZSpQ6tzgKhyeypyfmFm9NgjAp4vYRjxeBteDUC1G46Z3O/k5Y5UTkG
         eMfPo8nRiCm2Ja3n5+iuqZzFnZ4+tS7PQ/Lbg21gq/L3+eYUUs8ZeGS1A9YHAkjggDOn
         C6mqNANFaetO8+/pEFt+/fcrmKcYz3PvimOMrfnr96gsBL+1+poZM+PsqxCz6LBx5bJQ
         P32RWoUsV/Z1+rzmiqZ8LmfN7kGJAPu2dz9YNI6rE+DncCPTcodsv9h7sEuL+Omx1rcG
         l2V0qQ1gdAUxQJqvoq3dqvgMXQ5KVaOqqGjZGGWpMvull1PUaaxmqvNLqjeRDDKgIR7R
         L2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EJmCld9y6KB8eRy9I0zDmp0PKZYGcStJe83KPH6aFr8=;
        b=yRR4jRj05oJgyCT/P3b3jRI6JiTYKqnrWUuB7WvwI8c6Sfx/4u7TAZj1Pa3v8UloJ3
         PQ5ENzoQJt/M8sICpRiAt3Nda8ABez8hmryMHhweabyXTGxNU8/kaQNxbIhkpi/YYtFe
         QyMT48zGOZOFbDfsoYD9YdRSNm/3B+rCk7r9D0Bb5d9jgdJFsx924uRTXVKCfoS1N3IK
         Qbf0pnNsblQHLXtxnpt0DJ9/wc1YkVUS9/RZu7Rxz3mHtP+s7LOlMfMiqXPozpjtsUes
         tXGZB6XoRpiYYco3Qj0hbs1Bhgc3iXFxv9nvoCyjgW2V5A0N1ze/la+FJR5lTnfYu6l5
         7IUg==
X-Gm-Message-State: ACrzQf2rQls3gdmi4dtpscJvlHNfiE5j4jKrUdbmjGr62baLPq4JSkx5
        hCRnNMX/HRi2lO/nhP2R+axhX/owvNHyQFVvk2AJhw==
X-Google-Smtp-Source: AMsMyM5CqC5O7zpV/nIPjTWE5eb+IDXEDjT9fokGoCO+9qLYEhRLXEbVhUGylha928ZTbiRuDkD5wWHpdhWnORWiR6o=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr16486043ejc.500.1664824577115; Mon, 03
 Oct 2022 12:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221001210725.60967-1-mailingradian@gmail.com>
In-Reply-To: <20221001210725.60967-1-mailingradian@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 21:16:06 +0200
Message-ID: <CACRpkdYnFBbVqUEfqn65y-8Bit9yu_FbkX4voW1z6viZk+KCQA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] SDM670 Pin Control Driver
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 1, 2022 at 11:07 PM Richard Acayan <mailingradian@gmail.com> wrote:
>
> Changes since v5:
>  - remove function requirement in schema
>  - change "-state$" regex to double quotes in schema
>  - drop quotes from qcom-tlmm-state ref in dt schema

The DT bindings seem fine, I'm waiting for Bjorns review of the driver
before applying.

Yours,
Linus Walleij
