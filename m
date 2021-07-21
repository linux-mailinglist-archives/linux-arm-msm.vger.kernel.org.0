Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237423D0826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhGUEfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 00:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhGUEfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 00:35:30 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4F8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:16:07 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id x16-20020a4aea100000b0290263aab95660so300675ood.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=V2Y9FK8B3XEt2CBNMnOBB1fSQfFtt/UMwPYA85/KD5s=;
        b=CKOk08I09kVqDyHTWl5Jm7LtpyXb0tS8INMXUBNAXqEuQVASWYEkI6ceQIVAd6KUU8
         VgOdlEmqvEWIHiSGa+JdsJioQNcICJ5QYAuX5Ouqgri/KnpBnYQkwjO6AC8P9Vn1h9SY
         2wonFd9Q6YFZIfn3RE51prrouC+J188ZTEPOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=V2Y9FK8B3XEt2CBNMnOBB1fSQfFtt/UMwPYA85/KD5s=;
        b=dbJF8WierM1bG6PZkn2pw8SdQNRNC/sccxIShU6kQaa8pRJDFk8cNJ9PEUZQ0oPihm
         Uji0uYNzVGB5g1PdSZ+Lei3VkbzGP3FlQ5XSAMYVXcLbxV3ffZverwTDSGLfTEnWQIfH
         3YsSIYrg7uCXs60hdvKJD0yYY/Ji6ZQd/3QCYFC9OWctQO/tbEXxFPy3GVT56V2i+mSr
         BOl712qu8XtQeis13V2AZBkSnwdrknlDGqhXUA9dsJWZajuk1C5ECzzTV5nWjOcPXf4p
         gXwynyDITQUrC9KuRDYGusTjqOlRloXrIHha6voH+2opbc2BOL5R5EGOBdM0/fHPTOJY
         vLGA==
X-Gm-Message-State: AOAM533SucXEKSjglnA2o2D9srmg3Q4atxtIFCQsdr7d3koRqLDuz4gt
        zY+2zTocNK+phuu/M5YhCqyRxstMdrJvOdHq12HV1g==
X-Google-Smtp-Source: ABdhPJxCJYRZlniT0E2L1KJRisYCloErmXTq0V6N+52uVLiOm2L3iNt58JcJnkGTkkaUDS8usl2FRAroypRGXiSiFxs=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr23323098oot.16.1626844566901;
 Tue, 20 Jul 2021 22:16:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:16:06 +0000
MIME-Version: 1.0
In-Reply-To: <1626755807-11865-13-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org> <1626755807-11865-13-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:16:06 +0000
Message-ID: <CAE-0n51BCqrbRx7g8vPHp-C_5L3owD-c720aiKqxoOVM9UyqkA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] dt-bindings: msm/dp: Remove aoss-qmp header
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-19 21:36:46)
> Remove the unused aoss-qmp header from the list of includes.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
