Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AFD15D562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 11:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgBNKUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 05:20:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41070 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729026AbgBNKUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 05:20:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so10106235ljc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2020 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a84WNLM8wHkd5zEtxHoEDgoCVKtrYjUViLHMY7hthbM=;
        b=Gj6tG+Qt7ycjUY4Q2ZAXyamt4t4+IDdww3s8W9LBz0qskerpmAwDH4ozKfHDaq9+3B
         OawNf6cyiZJ4cMn5p8gXDPXDqWERgdiSM4tHnRLkyR1BUTncMg0AiBKlUIaPCigS/w+I
         hHKj4YQAuRVNwLKDQMYcjNrsrORFZTl2NSe3GktvgggquQuVYglQ5uJOIzdg0855ye+C
         6uwaU4LtSMjMvgAJUzlgFZBaaBewg04d5gKNDb91yAuw834QulLqP095JhQvZkZMzb4Q
         LdxB4L75YeD1jYbj+FRGGS3MFhhk6pwX/YoqCFfWzKu8x9R/PPKVWxQx7lYFPIbCtrq7
         Zx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a84WNLM8wHkd5zEtxHoEDgoCVKtrYjUViLHMY7hthbM=;
        b=HwU8OBOGuS6NE9hiqPuaovEweIe8pSVTcdiuk4QiZZpoirxqz95ckM8Fcd9skLGKZF
         Y7u4nCJ3zwzNX1kx211mJN91GzuJrFf7EuVN8Y+Y+YnRtkYZHeFYd2xHDuJ5dKcrI5ed
         KnSSSfiFRm8ixM3jWFbwObuF15YJWjhUzMV8yww7WIm7vk2nAip1N63H2pMZk+FUGVcF
         Y/WRHxBsBd5uD/VrRUqLf2aO9KBNx+ADJMkgc/a2jRUEhAqTHZRvnkMtlNjMAsTLTu7c
         RlWqmajdJ00TxVOngeLPbfQlSROsuMAMI7yYnjUJDXT3tBJdc/H/wjhX5f1C8wR+s3EV
         pOYQ==
X-Gm-Message-State: APjAAAWDLcPbj4QyrxnkqhF/A89BPAaOErTkV7tyTnlynRQ2Czgohlyn
        oFM0u3inX/+wf9yvyuvLyt0cLhN37qIZlZ/Y+w0xOA==
X-Google-Smtp-Source: APXvYqxqN7AMNMFOzd2fYojplBnENxRnOLrJhK/Z0n4uE8TLS7K1XSLI5bd514akMiltxuCr4HE2d8mGerIytGW52qo=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr1526961ljo.99.1581675606201;
 Fri, 14 Feb 2020 02:20:06 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:19:55 +0100
Message-ID: <CACRpkdZ1G-Rks+-JrY-bN6A1YpQGqRBoDKS5kYn9BfdWqYjXSQ@mail.gmail.com>
Subject: Re: [PATCH V6 0/5] Add minimal boot support for IPQ6018
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq6018-cp01 board.
>
> [V6]
>  * Addressed more review comments on pinctrl bindings from Rob.
>  * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
>    dependency with,
>         https://lkml.org/lkml/2020/1/9/84

I have applied patches 1 & 2 and the remaining patches can be
applied to the ARM SoC-relavent tree (Bjorn can handle this I think?)

I am sorry it didn't make it into v5.6, this is caused by the bottleneck
for YAML schema review, we would appreciate more people
participating in writing and reviewing new schemas, we are currently
in a bit of learning phase.

Yours,
Linus Walleij
