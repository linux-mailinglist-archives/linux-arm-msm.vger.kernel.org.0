Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116A0663A4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 08:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjAJH7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 02:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjAJH6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 02:58:48 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20D24915C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 23:58:02 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4c9b9185d18so73404217b3.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 23:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=zl9SYem24/egt7KSne70ItzNplyc4RaeOVz1ikEiBN+vCJ6ArWdyXQ3CC5DeiOSGt5
         48KZchtk+ZywqgNIP00ff61UyDjyYq+PoP+1C8vVnuFPDdne/wlyntqZD4pAjCYaDBtq
         JKYTYDyKClhl2ubziUCoFSgJAw/6m9NqE4LWGoLaavx1p1T3pEsw195uwINdkVWFtZV4
         R9RL4hDPfH0l2zpJHmGwiRe2/Kr7naAwhEb9Qryxl6G3WC2k7lu81jnTxervAetelWkN
         Aq8QpA0vcoAAPH1ZKZ+PhJSdvC18g524m0QIMo2DS29blcoDou8hdM36s7pvYiqanMx+
         0Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq0p1nbItdJ6ml7TEiox7aLYzhDtYgaXKvEnkphIMZo=;
        b=O0u4t33tuVwT3D2t629MUnV5a6lqNjM9koeWYXJQE4OJdSBPCOmc8WSa7CuhXE5gaG
         Haf7pbTY0whV9WL1q/Tz7le29RG6REW+YVkuwFTbHD/Hh1NdHKbfrL1+mgR89EKsRDu8
         eBbREQaPHmrEwwAPKn0KOkxYksTi3TUtrWMvVb5Sjyac2nvcfskmSC0loOaTkOwJMx0+
         2OnMv0G2YA0cck7c6+mhRUxLOwJJe6qEzy9JtYTfjVv+3Yaj/9pjrJF3CUtpLlcdM0UK
         hlX4auW3hfDyY5zloSdg7SDfG1u1PkPL97y4f6XzJXRjq+s0q9NQSJkkHF9dgp5vItyb
         PeMg==
X-Gm-Message-State: AFqh2kqsa51ojmrdim507kmsSvLcaj80n17kapiA2oivfpT9hnOmaG/4
        xzfiFiLavdM+wlnN9Cbxi+8SYjYaKtWUGUSxMPs+yw==
X-Google-Smtp-Source: AMrXdXvTMMm7Ub8ElIqw+FOLuZZsoiGCIUIi++horW7FXhTzxh4aBm0Fjpi2NKH3Iuh09zUB6LR28K+m29XyYe1cdQc=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr1195100ywa.469.1673337482073; Mon, 09
 Jan 2023 23:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com> <20230106114403.275865-3-matti.lehtimaki@gmail.com>
In-Reply-To: <20230106114403.275865-3-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:57:51 +0100
Message-ID: <CACRpkdYa3=UnzeYeFgurFH8Dyq+NBQazSFK4qiUP==+zdmYRKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: msm8226: Add General Purpose clocks
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 6, 2023 at 12:44 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> From: Luca Weiss <luca@z3ntu.xyz>
>
> Add support for the general purpose clocks that are found on MSM8226.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Co-developed-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Patch applied!

Please funnel patch 3/3 thru the SoC tree.

Yours,
Linus Walleij
