Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52648663A49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 08:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238052AbjAJH7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 02:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238111AbjAJH6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 02:58:35 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EB644369
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 23:57:28 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4b6255ce5baso143862897b3.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 23:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHQteKRecbFpVoOlyu2U09f/KsEEnT2ReMw9RcZTI+o=;
        b=P2Smu5KoxWqxdChmwCGV9/u6dGY/6h4BWVicD8QFvcXFbIWkNax2gd4DNaABE9r1dT
         Ts2GU6WzW2xiGXcuytRU5weIP0d7XqWXg47/hfHy+CTxwBLOI01HrTSBkQyzHcnUD+wg
         8E3hxG+3hAjBoMjSnaiPbciQARbtNxkZs+svjTbL6ZWynqfpO9IwSq3RPTQizGG9N7YT
         CThDSPeUOfU8xxtDHrdiOlwGpvMs7goUzxmMgf2DSPnDaH/AwLGsdRml0soUISJDEP8z
         cEW9lE7YRE2ScchUVD1Ozy/PHlQxp4MgOxHsgtjHPeq8EdIqGvYmr6IzIdbpZTrgMJ/r
         axIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHQteKRecbFpVoOlyu2U09f/KsEEnT2ReMw9RcZTI+o=;
        b=uZjwfkh/l/hkie0BnDh0aGwHXlUahI6Olca7nd/pA4dl7VaSeNFf8czxXrPEJb7WoN
         RoSFKNjKSNS7vi165QH/YLExrl+6qCvznzApCsh17qMf3A7mx2aMyBYM59QgItB9rN1Z
         mtbmYJwlCDb+xVTZwfs9CUpeXuKQRKT4vv8gz8L2X3dcFW7E+sEAzq+0PQpzPr2V5ozW
         Ol72fPDD+Xg4gI2IH+UGxew9YjInA+UXXGjOAnFB5PfRzlh2cUIygKb4LybCLdw/aHOV
         t9Tf0iB3bDaXaIy1MZvK1YWcL1qnJ18D/SA1dwW1HHt/ty9il3aX24ORysDezYksV5z6
         RKBw==
X-Gm-Message-State: AFqh2kpxZr9vOWTOXzmji2VPfbxvn0FYRrmqp++irfMpIahaYpyprhBN
        /FQ735k8hX5doOw2cwCNkghGKEY+ZkXjTqFgf76KsA==
X-Google-Smtp-Source: AMrXdXvQTIFSoh83YGadyAeRFZnp6YQcUpVpM5k3bJFQ3g4Sda0QXqn6dIwcctKw2bFPF9yUL7fyRlJtmWSG0pkuoYc=
X-Received: by 2002:a05:690c:d96:b0:478:6ef2:da73 with SMTP id
 da22-20020a05690c0d9600b004786ef2da73mr477797ywb.488.1673337447290; Mon, 09
 Jan 2023 23:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com> <20230106114403.275865-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20230106114403.275865-2-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:57:15 +0100
Message-ID: <CACRpkdYq0uxCY5iffGXZfCeTHc3EZMXoydDSkQOdyrBwhVrtgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: msm8226: Add General Purpose clocks
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 6, 2023 at 12:44 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> Document the general purpose clock functions that are found on MSM8226.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Patch applied!

Yours,
Linus Walleij
