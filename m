Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504AE3193EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhBKUGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhBKUER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:04:17 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B859C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:02:42 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id o193so6506204qke.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGWXC1tvxeiuqJ7onGaG0KHJFRjfviIJBFxWQD4b7Es=;
        b=skTDKy4orqOPgPVBqKJ3BzPDvrEJ9mDiyzaDcDzntnP5yOc16dAQWJzceNEXZN1kxB
         7wVrevqEc4DylfzG8bDoTl6Ca/pqULdHdilxM1Ss2m8ET1+v6otnmJwWli/gme9X0rt1
         YGB80vDKquq58WCTUXwOdIfcpfUucjfBT8aSh386xFj1LBdHe3Yf/8XGZUcD5JSqwKIW
         p8UCK+2BvC5Gg5lbvs6/ZP3S6rv/JQBexefYL3lEIoYOC1TB7bIHjm6X7jbZF/PM0KT9
         76VUkhvXov6BNr2cxS9vQhUyBz/zUZ/AdLYOk6YGtRZPyJaHkO5OWkNgx8JSBqfd0JxL
         yn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGWXC1tvxeiuqJ7onGaG0KHJFRjfviIJBFxWQD4b7Es=;
        b=duTSQ8Zajm62KNZN+tQDZvgjv/roNtYnJqyJFNbYhfushnN6yNzQP6VU9rIZgJv4NL
         Aa9N4gtSfeENn6TuojBB608l00p8W65DzbfYzQbG4whnyyIQkPaPF56HM4s5HrSWLzWv
         sGTTbgOrG/rdkjgDul8hb0Wja9zzoLci8+j1T7U3kmekkJZeiv7fGgEhfJyG+aX/g9rl
         LFnATGCyn09C2uw0iI4BZVVMYG35KUi7vkZH9snotvmuRALtt2iGowlp6+nqlR4X8WtJ
         4Vn6MKVPDsSkvoP5LNBShU+t7WvX6/DFU411QdgIeIb8/O92gozwqIyap3VBVAYxwroO
         Z2vg==
X-Gm-Message-State: AOAM5311Fe+FZkayI03ttd82ixBPK3hNg3kEmar63bgMNhnMyitrE3Q3
        ZWWPAsMysZHLjuQVypWhT/eUSpIRqrMFklrjo3E/0w==
X-Google-Smtp-Source: ABdhPJwriuEE8h6tPlFkxz6xc6fNn4uHZxsu9IWNBRkn6E5TgdCSuTg/FIf49sgv1o/VJnNT98KvFWeAbP8SUk4Bk3M=
X-Received: by 2002:a37:a9d6:: with SMTP id s205mr10559165qke.162.1613073761910;
 Thu, 11 Feb 2021 12:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20210211193637.9737-1-georgi.djakov@linaro.org>
In-Reply-To: <20210211193637.9737-1-georgi.djakov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 11 Feb 2021 23:02:30 +0300
Message-ID: <CAA8EJpry+Nz_W9q00tsm9qNDNbeZOzyit_1KafP34PQH5LioAw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix epss_l3 unit address
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Feb 2021 at 22:37, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> The unit address of the epss_l3 node is incorrect and does not match
> the address of its "reg" property. Let's fix it.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
