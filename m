Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A7F81838
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 13:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfHELe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 07:34:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33042 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfHELe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 07:34:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so7543907ljg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+gdt6jaSxfozMzDqzJt3/RN8BGk3uSUmYERQCMQQrEU=;
        b=dPAg1QRXa/qBwYjTW2z4itUlMq9B3ieWItaKFvalHRO1TfCDSlJ91SuT8R2pSHyHAJ
         1RvSa0wqG2s5zI2uw+rM+Vj7A3DF9EvYjl/WKqP3tjOAznfGjXCBjVw58oW3hyrxyi5m
         NkZUeZBhJ4131f28RWRamzpCgzckZKnRQCE4L59kU48F8wn0pTVLgq0pYTLEr6ETplM2
         gLVFiq1UPc4d+pL9jCwMk2COHXObYWW1To4exD6R6g7dfviWaEvjB8qynCLNB1qOK2vg
         21x71nOSW+nKSByp0EpSeO8bQlnJYr1dY++yqo2bxMnhbx1VzucWS5aqdpuwn3fUlYQ6
         Tmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+gdt6jaSxfozMzDqzJt3/RN8BGk3uSUmYERQCMQQrEU=;
        b=kuEw392I2wTRQyY3V+BYucVRCYsOmUAAt6oawIVm0kctnyDasZ2YutiJvXahn1LLoR
         I9PCs8hIFFwbVHroRL+U658kBFBju094/jAiSWT3P5lGDz0O+qIeyuIXoh4O7Uy/R3UT
         YbZuXjudI4eCnI3mBRF2T+MsmvcqI2Hnd0zC5ZSAtFN72ql7ncht0YtN01+XnUWs4VLY
         ws3EPfU1ucIUnnBK/JJIa9donmpsEO7fI1fdUbM4l3/uNdkkwWPecp6+DrdlwT9prSZ6
         LzFHy4Q0aXQd32hD3uxf3ui5BcMhh2nFMHO3cPZa6N0WsbSnYgb4FRqjAE5HDf64DI8k
         6BCA==
X-Gm-Message-State: APjAAAXftxPtXP2+EI3wuOaFFu0Zs9fHeLVUsURND2qyD1t6nqoE0LWp
        YhQbT55rO3aZN0z6Ke1CogVNMGR0tnYM3MVZpP+4BA==
X-Google-Smtp-Source: APXvYqy4d5dyA1aBlM4kQVXGe/WqL/1bnttB2gPsTGhKzYzfk98c7+dk2rkdM6qZpTA/hFAdpbiCmKgQcjPdNls67OE=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9878940ljg.62.1565004864085;
 Mon, 05 Aug 2019 04:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190801100717.23333-1-rnayak@codeaurora.org>
In-Reply-To: <20190801100717.23333-1-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:34:12 +0200
Message-ID: <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl binding
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 1, 2019 at 12:07 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Jitendra Sharma <shajit@codeaurora.org>
>
> Add the binding for the TLMM pinctrl block found in the SC7180 platform
>
> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [rnayak: Fix some copy-paste issues, sort and fix functions]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied with Bjorn's ACK.

Yours,
Linus Walleij
