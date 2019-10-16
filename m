Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6458AD8B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 10:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391786AbfJPIl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 04:41:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43455 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391783AbfJPIl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 04:41:29 -0400
Received: by mail-lf1-f66.google.com with SMTP id u3so16732708lfl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssx3E9AK9p6749zZaq+BomwgK5eiQnswsLOVXlYW29c=;
        b=qdPgZ35Y1+lmVqkVwpryS2vB8Oh9Ww6/PMjzG+tomGo/GSFQdF/JcD8v23X7oxGoxw
         Umd1pOjtCWg1SiHc3uhbWSs/Ghp6LK1UizMRU3QfBAoI4AW/TkkRmB0JmCVadtfJsWOT
         DhXlhhxyhEdPwgRcVwUNhlp/5ddohkBa+Ykw7Rj3Cs9yxJKmUpAl4p4j/ywqLFHhN06g
         hbmbQIQ36UkI7aKr+l//4QQh53a5AGcwitpTv9ae+dTYfFMs4Ndl48BH9DkyKMvuPrsV
         Z5OsnWtmmmRiP0IlfYXd8MyRiWlVvIDz2/MkdQcvJGemAfD7tY039VKI9QGVxI61LFjL
         f9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssx3E9AK9p6749zZaq+BomwgK5eiQnswsLOVXlYW29c=;
        b=B8VcH0LCJw3EjmMIgPRUcBTO5ZPhh6FeAYl40tv4nQ0pyLp8Gc9FrjS4y9F+3R004j
         Q3MoOWynIHr7kR8uMP6JlMQJ6LhVugxP5NG1H0B/ax6vWZrKMrld/Xx/AXLdME/7nLwR
         7C0FRZqe3ifz9sDI6dwfQcVTXTnfJFE3Ubm+InvGefxip0c0WkEil6GH1jrxw3RSJ9Bq
         daMDabXLnz/duL6FZBSDQR4XkIJjJFJCY73p3YOjBreE4yovKr7UIHCOL+GUf+4JuQqO
         yqGLlXGGr/IGKUc1xN4aNIVWCJpoW+1d4Tve5pGugPTmpskLdrlbHaSatmKfVGPAb3Ax
         tiEg==
X-Gm-Message-State: APjAAAUg9JwQH3F9kIuK2KsN95IzGXeLgEKB2Uf66IW2b80eTH/u3vUx
        iVzlrd6+3ar8eahcSC54ZdGR/XQJXPglu9iV12x8xq5p
X-Google-Smtp-Source: APXvYqzUPTAj/wdpGxospwfgSvc6NbuF6ASWLLAqMPz4Y86VHAcr8x+P5MUlqNOOs7hv3snxjhkd5UQcARi7p66kzFk=
X-Received: by 2002:a19:c505:: with SMTP id w5mr24026445lfe.115.1571215286849;
 Wed, 16 Oct 2019 01:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191005105936.31216-1-kholk11@gmail.com> <20191005105936.31216-2-kholk11@gmail.com>
In-Reply-To: <20191005105936.31216-2-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 10:41:14 +0200
Message-ID: <CACRpkdb1s6caSc8gViWrTLRv=x1SeYFviwL3qe-HY_nQomn7HA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 5, 2019 at 12:59 PM <kholk11@gmail.com> wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Patch applied with Bjorn's ACK.

Thank you for fixing up these platforms, good job.

Yours,
Linus Walleij
