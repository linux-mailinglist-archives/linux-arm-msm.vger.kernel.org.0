Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE8742B0AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 01:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbhJMABv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 20:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbhJMABu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 20:01:50 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B2EC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:59:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id d3so2690172edp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pA/RLR0KfHQo0D8Z/6AcxihH5fdEamebhyEqoCoH4js=;
        b=NgLAwMaGbmUpS08qwcfFBxXGk97MvrDJzl+Zy9GxbMz2FgHsuLSjIoLw29SgHz0bae
         9e9QKK7XDIYQSljiJg1Z2S1XkPpGL4PizP+l+uzo73L5GL/Lzhx7AuHHJLSVKt5Pp+x/
         nFCrSmi4+L5gStAt3H06UFjMdRUI9sBX7bYOI0zbH3BJ67b75khA7bizEA83aiHrB64i
         CbJl2UHuxXGEcxCTTJ9VoBoiPDE+SYy6fGMu5L4FlyCOHxqlCgZfxhB4onKVCgDgAmlf
         HCBk/c3Pv809yvj759/8HZvIeipZswDs9pI0ZLXPbmJhW7V+iVUfFWuvVbgKAcwZwR8k
         5iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pA/RLR0KfHQo0D8Z/6AcxihH5fdEamebhyEqoCoH4js=;
        b=5OujBv1woUKtCTX3YlRj7pSGTlu1TepkBb5EVyecFjpreXp6hPvJlnuG/gOkA/0Acq
         CCK7D2L5rS8R6WJYJLhw0angj+Ctk3KQqcs2yNjoybPUOVy8p9Kyr16ROoV56SoxOobt
         hy1OW+CSG0Agla/TRFhzXMccQz3YB/kYMiOj+nEnfsWtwGdquyGRmmrJiLciJ+evMnOc
         0UrFY8CbHg3XemCS12zWTc/V2rFpibVFsrGNeeszZDYNrUsYM+6qT0N18AeHnHNMb+iT
         rSuA0KkBM6YCLc+7/fj433ez4IUdaGXeFAghPoyZLb3EJH8EdYyCCwwmcno2FsRUuGNy
         5O7g==
X-Gm-Message-State: AOAM532IAV/P+jS1rHSjPk/E1NvYP7Ov1ZYGYM4F8k9j6/c1M8YwkwJO
        S6HsJ8njsfGO33K8TP+up0DHSvT1d27j+gG18e9mXg==
X-Google-Smtp-Source: ABdhPJxbTyvOlEME29e2j+RkbfPt0NEPM4IQeMGrTtrmsNasAnyXtTpQbfSjPAEtbeGr0KaEdx7nUJlQAMiUSRr8oeU=
X-Received: by 2002:a05:6402:410:: with SMTP id q16mr4556268edv.286.1634083186495;
 Tue, 12 Oct 2021 16:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Oct 2021 01:59:35 +0200
Message-ID: <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
Subject: Re:
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
> to hierarchical IRQ helpers, however MPP drivers were not converted at
> that moment. Complete this by converting MPP drivers.
>
> Changes since v2:
>  - Add patches fixing/updating mpps nodes in the existing device trees

Thanks a *lot* for being thorough and fixing all this properly!

I am happy to apply the pinctrl portions to the pinctrl tree, I'm
uncertain about Rob's syntax checker robot here, are there real
problems? Sometimes it complains about things being changed
in the DTS files at the same time.

I could apply all of this (including DTS changes) to an immutable
branch and offer to Bjorn if he is fine with the patches and
the general approach.

Yours,
Linus Walleij
