Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACBE226128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgGTNjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgGTNjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:39:08 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271FFC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:39:08 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id x9so20260925ljc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZUWsa00iYf7K4HBHvDEC7hUnyTTw9NrXYfUvdxiJpg=;
        b=heDejIMJKRXAtiwM4h6NQUEF4C8R+h9OzJFFP+tx2PpKbFI2hUWSzTXkRZ5BekWopZ
         kkmHaTiWp+56nihbet+WZkRgccJ+WY102U7/bX1toov424jnra2iCMxgAaLdXldEDN9m
         /M8CrZMGUnAdq3bLWETEuv7OnckZaZ7GNi/Zuv2LR76FQP+GkPBC7iWl1Isv1tTs42FF
         a+kNCmhUgNF5Ky1orT1rf+r2/pdGrZr1F8A4yIGvL3Hjqp/vvU3qdtlqbklKCbpDSO4/
         /GttKdlO6SXUGc+AMPh+wpuKfytoLCdVR9ceEA9QCUEUVTGf+BvfnCLlMrY8DbFi+EID
         sVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZUWsa00iYf7K4HBHvDEC7hUnyTTw9NrXYfUvdxiJpg=;
        b=C2op4UNEBT6o5JXoMCmMK6f0se0PPpKIDw4LYoaKSpMCcP12/JQMq9yrmy8sKVzzLE
         rmVvKVxojNBgs+iZw4vRPfbA5QGQzt+cESzoSXc2WWp/vkPATOa3P1ipTXFeaxBmdruM
         02V5vf4TeOuvigAaw6WW/s34OGuHsGc4uhpGTO2+5oPp+892Jsa2fw3yhd767FsP2j4K
         n4R5N0i99q8QlVFsaLhb1ZBnvoOkUA2QD+jP+x1GbN7C8w7JyTHWlxilAn9ORd4sjUqM
         JsNPUSmjtiKcr8IU2ixMFruRYicINfaHHVlBc5Q3fq9aYXUh9VNA7Mz0lNPl1h+8osJc
         p4fg==
X-Gm-Message-State: AOAM533m+cm1m8WyFhuAcNf5jfaO083fBqhfEvqzFjLaqNA2kvSvo6+E
        0Agpm1ZJ5BPUWQIgq6plE23nKOaqkkcqAHwgd2CkBQ==
X-Google-Smtp-Source: ABdhPJzHGab0xEgyMQVlieVYjfPMYKbHimCOGtZ21uJ+KasO8fWcs9EFajtwAK+p4doX0sdbOccThgfvXySb191nTxI=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr11205367ljc.286.1595252345768;
 Mon, 20 Jul 2020 06:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200716212213.GA17623@embeddedor>
In-Reply-To: <20200716212213.GA17623@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 15:38:54 +0200
Message-ID: <CACRpkdaBuvbtswYczwsSx9-YOLODs5x8YvWSB4bpMbXpvoPLrA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: qcom: spmi-gpio: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 11:16 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied, I don't see any controversy here.

Yours,
Linus Walleij
