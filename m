Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D432416731
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243192AbhIWVNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243193AbhIWVNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:13:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA1DC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:11:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so31458398lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p1Ur9mDQJrxxxKKtvUNbsObnagkgoIKu1zTSJFMJRAI=;
        b=OWzTBJO0Oxz9T1eiG1HmlQm+jlqfImdO27LbZ/sOl2nug8QeTffpfDP0O7pqzc7ywc
         VW0Po3SOVCC7sN/1WlP0hLUzJ6oNYgm7uimAdkt/+4DnjqEDzkKfhp0ZPCsq0ytKmpA3
         ERNs4s+hSSCH/pk1YfRfOpBsQ6YxwPuo1HhxgqfWVsNZwvKYJH+4mOvnCUpmxHGF5x89
         fXfvMrfbx8jDO3JpYL/h+nJOxMlkn5WmOGicPoSTSdz8F+MIqT14+MPHg2uJeoZIZGqL
         XmZEquEj7NXUbWSRk6kA4xJst+6DO8iQh5Vi+RVm3MVtJeW0dZzIa7oP3qYiJ4LFLh5+
         cy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p1Ur9mDQJrxxxKKtvUNbsObnagkgoIKu1zTSJFMJRAI=;
        b=7tZ7/iLuxi8Epk8K7a3phBQb46koc5sMQt+A7SZuRoqeXZLi49vqG6RKS/g5c3wHkq
         Mcjic/Lt4Kvq72lbvcYlFesJyLMT7/DvDodAhk/AQmLiUaaXd0n+u1DaoG2srDHBSPxQ
         55j+CQOHrshisa0nVXnUDLVAIO2HH+q/fUtanZTlAa6gDSj55byPGMtA9GS7klD9ggpj
         M0ULgAdudXGhamsfh3I0PESAS/bSLceyS/WZVwzhb4qv61PYO7ktLcIHgEqB+y3nRZW+
         T+pj75+qipSKtNb9fYmCWwnPEjFXKZ+W7HN4aehJfWtuK2qM2goqK5qd2uMApXwSwOkG
         2X6A==
X-Gm-Message-State: AOAM532vMCbQXN0q7lanJphWl4egRtY5PQyD82d5i9Q38LrAdMHN0ywH
        Pp7P1tNVakpUBJLIXiE5mPkBum/DuEcBL+OE/dxEFA==
X-Google-Smtp-Source: ABdhPJwPcligFsjGw59I+AviOKzPYmC+dBi5fWpJYxXSCjsw3GvUu/YonGc2AXAegTZ6biPRjBEzt7SUntjsGqIJNew=
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr7750969lji.259.1632431507415;
 Thu, 23 Sep 2021 14:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210923161450.15278-1-konrad.dybcio@somainline.org> <20210923161450.15278-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210923161450.15278-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:11:36 +0200
Message-ID: <CACRpkdZ5+ZKd0KKRfkhoit5jbwqsBnMq76MnCdtv3tvzCdrOMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add SM6350 pinctrl driver
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 6:15 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> This adds pincontrol driver for tlmm block found in SM6350 SoC
>
> This patch is based on downstream copyleft code.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for v5.16!

Yours,
Linus Walleij
