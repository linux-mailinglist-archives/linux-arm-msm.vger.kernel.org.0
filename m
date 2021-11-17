Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B5345412F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbhKQGu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbhKQGu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:50:28 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6332C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:47:30 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bk14so4256891oib.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Zak65d0llgOFfhY3hybLsYtI2ouYCuOebdLehBe3uDQ=;
        b=kJDBoZqckhA1ufpBGBrbzY8MhU4rh7qrsdI+cIC5Onil2qj5n8EcSnY0WEtjtyGLH6
         IE/58w4qBV0Dg4fs1Ihrh+8iFniCCSX+CO2qsZmSt4RYPtxda+aEyP5JJWqSuRzIdoZX
         Tf65fEItflO3+FzH0pKzrmGdQZ+jfOE+Ak2cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Zak65d0llgOFfhY3hybLsYtI2ouYCuOebdLehBe3uDQ=;
        b=ef2ZQPuDY5akwh0WzPR9O/jOUCxSQxdycTwxwlnNAYgPcO3LtcmlyL2w5U6uEGaAyh
         1dGeb1J5TL3RHKM4C8mxPaMDh2J4UU1EJaMeWnEMthZFi4iWB9vlnQDCiWHMGupZJSSW
         6DVJS01sDaM14IL6IAOS9w+ATNe7+Rue5rkXEYb+gtGlTEREeBBpySsfgvh7aZyGQarC
         7IawT6Jnf1bXCH3k2Wc7rD8ptAwPShbbYhPe015zbzCXGrEJFe8LjDbrzKCKleAsTW1X
         GXg4JZ1fTOJ+L0kZs+dl3uGUpgHzYqcG6pzT3AVRZTQZMYCgD00pH/FUq3gPwW7ibz6b
         WTuw==
X-Gm-Message-State: AOAM533RNJKkKkSj/ykRe72HwSJM3zXIJro9/Wq4jL3ZDzzFu0ru7zka
        fzANOR/AAFNaGEAB8CTZnfnW0fEU4CA8IVhRdaetvA==
X-Google-Smtp-Source: ABdhPJxXlEg2JLK1FcPrTGa04zmneplUZhBuAZ+dBWt9jp44No5UGmnqM6QBox1hxIZFuPlSyhlYpe0evSb69UmBqWU=
X-Received: by 2002:a54:4506:: with SMTP id l6mr58797206oil.32.1637131650176;
 Tue, 16 Nov 2021 22:47:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:47:29 -0800
MIME-Version: 1.0
In-Reply-To: <20211103234410.1352424-2-bjorn.andersson@linaro.org>
References: <20211103234410.1352424-1-bjorn.andersson@linaro.org> <20211103234410.1352424-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:47:29 -0800
Message-ID: <CAE-0n52XWvOsWm36+ucuwbOa4ceKRAYWFtPnD3Xg5emfiQGK-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] phy: qcom: Introduce new eDP PHY driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-11-03 16:44:10)
> Many recent Qualcomm platforms comes with native DP and eDP support.
> This consists of a controller in the MDSS and a QMP-like PHY.
>
> While similar to the well known QMP block, the eDP PHY only has TX lanes
> and the programming sequences are slightly different. Rather than
> continuing the trend of parameterize the QMP driver to pieces, this
> introduces the support as a new driver.
>
> The registration of link and pixel clocks are borrowed from the QMP
> driver. The non-DP link frequencies are omitted for now.
>
> The eDP PHY is very similar to the dedicated (non-USB) DP PHY, but only
> the prior is supported for now.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
