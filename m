Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088F85F412
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 09:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfGDHqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 03:46:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45188 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDHqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 03:46:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so5141643lje.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2019 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FbowtTXJF3QFhJ+0g3CanF/mErH/8mwP+8HtXFh3lcU=;
        b=JJTwPDrnOaJhqi5LfDKpVC6A4J6s/xgYjGmVsxsNAfBJx54YwIp1Q5SEY5yhOS6m8F
         l7JwbLFP41q855m/5ZZVp45EX3qVmQfsBZfdGAp3wbCjRHhG6IEmMlCDwNnVpHCrCrcA
         MRa6MP4wchKhRQy4C1wMh8mO16q/YzH3HnzGm+0vyPLMDWsyVC4hFcxhl6koNh7W/D98
         Msw/H2o7jzcS1Uhr3wmHJMUuaiPgheSDyjPC13FX5Q/s/B3OR9V5g7QSkJxXLtnG++hv
         JVy6fZZn1uHAr6KybCjG7j0kxx0v3ECcED7PJ91Dp0NlKSmR4tuFyFGYKVm4Ark/kZ+M
         5lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbowtTXJF3QFhJ+0g3CanF/mErH/8mwP+8HtXFh3lcU=;
        b=kF8Ud7WVp+AlN3A1bKJZxRwCjJGL9khUP8d5m+zEv0ZJkkkPm0cW3d6S28eN2gE6a0
         cYNhjxYu8vyyhrid1XbWchWe+3d/NlJzUchdQaYJoqovo31kWhRLqDaXI3umgL4vuGJe
         H+vCxg81IEALc6YBIpTg+zrEirmLA/zibC1RAdcEpvwfJpnNMugC+4h9nnmzonLH4aWR
         anHS5kTJugc2kiQP+Rq2tKECETrRJpKyHjp837zww6gJpSDEX4wvCkgjWClI52g4d+Uu
         Y71jZa8lbeA6JoeBdi6WhDqqe/WPYo6jpie7lQ/n/lUKVhZorgW+r4fXYEXKH82xJKO7
         1etA==
X-Gm-Message-State: APjAAAX4c0Q8ohdtO8N3M9lMkoTBloTst3r8St5yl+YAZd+EexbkMZKB
        0f8nOXLY6PM72OCWLl3u5851vEiXoU2ljx+xvLfL+Q==
X-Google-Smtp-Source: APXvYqzqg5P2vMEvtlnyJnlnLPgWS8atGO17WX4nId84bAvMCyKUN49Rj0v1zHwWQYFxM9dFj68ZveRig2GhLolmJSQ=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr2128406ljg.37.1562226413734;
 Thu, 04 Jul 2019 00:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190702105045.27646-1-vkoul@kernel.org> <20190702105045.27646-3-vkoul@kernel.org>
In-Reply-To: <20190702105045.27646-3-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:46:42 +0200
Message-ID: <CACRpkdYuhUNggeVQ-urVKkV-Pa64zy_hJEb5d3wJ2K3MvBQB8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 12:54 PM Vinod Koul <vkoul@kernel.org> wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> Add the binding for the TLMM pinctrl block found in the SM8150 platform.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> [vkoul: add missing nodes of gpio range and reserved
>         rewrote function names and order them]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
