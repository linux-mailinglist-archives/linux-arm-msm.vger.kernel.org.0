Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B5427CE43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 14:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgI2M4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 08:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgI2M40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 08:56:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADDFC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 05:56:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so3922429lja.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xwc6QcG165YvYnxLOr7Ig+7m7J7xD/MU+AJCfEa21vs=;
        b=npuAc3Z4q7b5/MOlpEyIxPMdkQkfGyy+xQQ4dKRXMIawUwLtwKv7YsAxgmdOIAcx0C
         V7aSDMhMMWCBgV7R53k9yA7j2I5W4AZ46AfJrz6OhlVZCCHbGROw1rxqKG/q+MGxp7R3
         5X7lZGeYG9wjg5iOKD+CMaqYx++eKtsyFZHwRyRyZhZ4EIdea/yrJ1hjkPWjyZUtYmJY
         /NzZuMCq9nTM5lHSOqzpSy/RIJ1yS4Y5K4NWCVNT025G5Au7oZ/8P0ZWcpC9ubw5bPtE
         28FyijSj6Hf143BqA8q5Bw42QsPFu2BOLKTYhIp9n/jDXmNoRO8UPQSEqhxWL/2qv/6C
         BABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xwc6QcG165YvYnxLOr7Ig+7m7J7xD/MU+AJCfEa21vs=;
        b=OcW82BmLeHRsFJvxybXKcOjIa6gwc1qDodkGv1kSyQVyp46tPzhv6KtbVBnwFkSzCO
         rr5mWV4v78uRttDAwy/CD4Mj9G6janqEqpBe9jjz/Y93SdaY72G68IqkidM/6VZL6zFc
         Nmfa0Fz5Rap3kO0haKcnc3zHjWIrHTCXEzD28Oxb53pqstmSzUfsUlemSBV2zte3gj3I
         +kHENMllFUMAl1+wtMXmlmroJ6a5SJZhIJRQrduqC7LVVhylziazbGRwaSo5dLSr0gmL
         kbbC7q7Vvt0cmmX8dt0uTRYBFZGhwkBuP5RTnuWQmia0v1kpnZeJRpN7l1+5LzFZg0o9
         fPuQ==
X-Gm-Message-State: AOAM533HTNvt2Zct8Cpv2FD+JIzCkEpZWcI+eRwzwrT+FYwn5BzMolaM
        WfxWVz3i7YnV5i45HTimdrGlw6nrTwAPVuadUuZb6g==
X-Google-Smtp-Source: ABdhPJw/sTFqnnCnmjiBkxcM336wh5a1yrj9eBOkl+NOXdP0eHGyLO27lGNGZcAFlkObJIC+WXvMMWTvGT4NVR1kG14=
X-Received: by 2002:a2e:a306:: with SMTP id l6mr1248375lje.286.1601384184843;
 Tue, 29 Sep 2020 05:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:56:14 +0200
Message-ID: <CACRpkdb2WnQ40oZQZ3GN=ynhgZTmpJqT1yVuEJejOGQ7qe8pwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 11:18 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Correct sdc2_clk pin definition (register offset is wrong, verified by
> the msm-4.19 driver).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a

Patch applied for fixes!

Thanks for sorting this out.

Yours,
Linus Walleij
