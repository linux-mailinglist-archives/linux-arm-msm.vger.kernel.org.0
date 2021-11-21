Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12C7458704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 00:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhKUXYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 18:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhKUXYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 18:24:30 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7617FC06173E
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:21:23 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so7676654otv.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/h9j+VohNLyIgef0fdgxHddKdl2XvTPyEkgWayghi4w=;
        b=v0jEuVRIAiBdxpvfqAJDWpd3PVQ3hH1sW2ZiMhzZbekRIOfkm8S4YoknYa/ngAcMO4
         6ewyTDV64dLIlE1hvvsU8E8k+tf/gwfKum9MC4eIRvNbwzoYIvhUfGeQr/ac9bNkmKAi
         TlvgU4kDY9sql5silScA/QiB3hdOmPTJ5MwlKd0ZNCiMizxjrBsTr3dHsVOCUF2AFUxi
         8NJI0sPnAhjrMMZSz5xOsGvpwMQQCi29eIn+dDCU+c7Bci/Aha98qs6iVuPbKQM2fznt
         QhyPL2LZD44RjAx0oharIUzvA7jYIdlYcGX9M39Gb7XdfbeaT5RhEIi8l0sr3nzdc/tl
         lDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/h9j+VohNLyIgef0fdgxHddKdl2XvTPyEkgWayghi4w=;
        b=vwW6jxabeEwL8sxQKjm++r3q3BqKc8djld3nkNQ91HWepXGIl5CXb5lQ2M/8lykdCm
         x4JdLrVJmss8MzxfzfCm0xO95oC8TXksy20EpJswuAs69Lw53MZmQ87ODyK0MDHtihFx
         5vHfyz2qrx8TfhNnjgfiZJq+PlN1EEqqKFqny5YWm95yloWvxEharN0YJFSAeQZd0p0G
         PubVRtavvCShrsx++HWSkgt7XigIclv5ELo1CxBfhVGn/2e/G9jE4IPM5mwFuI6sFsSp
         G0TsldPdUzJ82NQMfpxUzGEnCHfKoHyCmSy4VZWTofLcrhqr+uPRwhvUtNTYQudtPms/
         441A==
X-Gm-Message-State: AOAM530utdN4D6FGYTKjFbSPIhYbSEp8qul66SppwHtinxeoyYBIYCk9
        zixqs49aS5fuU0PjeTX9HyhXRng1ieXxKCxZwQlrIA==
X-Google-Smtp-Source: ABdhPJw3DT1NKCGNYyVT8P//H748Ne9pjIKj8dMw7dLTJAXIwlTvzJvEJCcKUCLCX9Vku7LTpXvU09bW30xfB9yqs3I=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr19960895otl.237.1637536882884;
 Sun, 21 Nov 2021 15:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20211112115342.17100-1-konrad.dybcio@somainline.org>
In-Reply-To: <20211112115342.17100-1-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:21:11 +0100
Message-ID: <CACRpkdYMNDGhR6aKyyhW+YLOoNYLQOoQ=vh=qwY2C2AJR3Qd9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for PM8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 12:53 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add pmic-gpio compatible string for pm8019 pmic.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied for v5.17!

Yours,
Linus Walleij
