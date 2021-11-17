Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50B04540E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhKQGhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbhKQGhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:37:50 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083ADC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:34:52 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bk14so4187650oib.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 22:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=W9nBJYQ47ZxrMV6bcLPL2xQhR09icnS5iG5YGO5CZkg=;
        b=BRKJ7Kgn4h04/ugFpZOdSRfxGVCK48Z3uvEiNI/i+4ANN7vV5j1DY5cXAjyRzs3/vY
         t4WmQcMqkh7jXMNLlPzsHpHAj8apOlE5O6TaCwRr9wRWzUfxNGv3LbHEFgVEaPE1m4c9
         U1MYt+rjkHC/yxXbI1f+9ar5dk+Xsov9fFcMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=W9nBJYQ47ZxrMV6bcLPL2xQhR09icnS5iG5YGO5CZkg=;
        b=Nl8MmT80HF797pG25qfnDcjuPGQwsFcz8DVYcwfbR3P9rwPZO1wIvrjCozDTAcbBSc
         L6ltivlxBy/8h/MaiVrtjvKdqDsv7pzeDBggBu7BSm2c0Ng00jxL5wf3ukH+HZZvJIoz
         W1idZil1PEZMDrHQI/qNU/bNR8v6ahEQwbCrVqCHdeHDbYSPhf7TtLq2LVcKl4E/X/Jn
         j9k2yNvwGDWTMi/ongYZsjdlIvrLGhD/v7xPpB0fxTJqKCcvj9K2hHrXSuiUfYXXR8Ho
         Hp4ZVMl/YI/DWjWOLXBvWkyaoS0xM8ER4QKn5n1G2GdWxYxGga2tIKWdLKLc7OYcO/Zo
         k9mg==
X-Gm-Message-State: AOAM533OPKofnN8uhBwOYbVfoT0btH11Bl1+KGXbgZ3kxpOB3VrfgKtr
        XB2NjAuHfeb3fLc4vNCwFgYAtNg+m6t/Dyll+V6Yig==
X-Google-Smtp-Source: ABdhPJx8JVromClhtbCHPxYPkkFPqkVX+eXLMb6mIVFF85hfHjPLfK1usV9mYns8iLfYiwwMk8WYJH3OaOMkQibPSjk=
X-Received: by 2002:aca:2319:: with SMTP id e25mr58605624oie.164.1637130891469;
 Tue, 16 Nov 2021 22:34:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:34:51 -0800
MIME-Version: 1.0
In-Reply-To: <1637060508-30375-3-git-send-email-pmaliset@codeaurora.org>
References: <1637060508-30375-1-git-send-email-pmaliset@codeaurora.org> <1637060508-30375-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 16 Nov 2021 22:34:50 -0800
Message-ID: <CAE-0n53+Wt-FL38EnQhgZLEsnuKK88L7yN4dg42OZ=hVYp8XEg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sc7280: Add pcie clock support
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        manivannan.sadhasivam@linaro.org, mka@chromium.org,
        robh+dt@kernel.org, svarbanov@mm-sol.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-11-16 03:01:47)
> Add pcie clock phandle for sc7280 SoC.
>
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
