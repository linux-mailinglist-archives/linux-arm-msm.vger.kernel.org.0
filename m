Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C0381840
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 13:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbfHELfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 07:35:51 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43451 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfHELfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 07:35:51 -0400
Received: by mail-lf1-f65.google.com with SMTP id c19so57663042lfm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PA5LKqLUZg6N/15oENr417+maCymYksiJN1leg5uDv0=;
        b=bK1ttl7iKTWceqtx19Sa/7+DM3zapBwSA9/ODu5KX3kw1ViYsxO9FzDhuFhtu4Aj0O
         uvOO4Lr5/qCu/BnfldETVo9wEXNSTiYLl1E6BI+PA8iNoaCFM7V4mLGiPtDueh/7QeX1
         0KZMMyDinoMb5DuxX91zavTTt5WuGGXQRBP6AZxT9TjOHQsMbwofrPVhJU8A1JtJX22V
         hUBJx7XXThV0mbzKr9FWPaVVLRtElVwiERrWn+ctopnWdVw+kUrj/vsas0MNCrA+3pe2
         T+r9Qq6eoZVNJ4I3L5I0e23wL8LCzQLzqDETEUxcMTYet8+SfCKJ0RBJpbh8sXIMBiFT
         NX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PA5LKqLUZg6N/15oENr417+maCymYksiJN1leg5uDv0=;
        b=dh6V8hApVgYFZMwnslp2u0pjEsbDfGkG0rQS4sKEV6FMveJWMkv2n+9TWHKg++WtS4
         1UwhKimfXltM7S0hc3vl2G0EgZjJm5agZ8HLKViEo7nug9HCvYW/gHhelZvdi6yPXPU6
         POxiRmeC8hIXmWi4NWuN0qxeNHFLunboW/lKgtc/GfWXCf2mZhCoejfT3TNco0o/tthl
         RgSRAwHmqILt3pkWXtrYN5DR+gp/ifmAiYS0R/91+EfrabN1KR5VP8GTel5LcAUGYp8c
         KiXVOtaLXNNEPZ1E7Tsq+bBbhCwX3Jy//gT6d732+fWJEsX3QXIJ7RnJ2tVtXkWygrnp
         PU9A==
X-Gm-Message-State: APjAAAUeCM1ZicPgXV2qh1FOxTHiN+UziAOMzuMIJF0zNeG5pJmlLG1M
        zrzH3F1cyQEnIwp8Gv/C0E2U2vWbeH0UWgcHnJVVfg==
X-Google-Smtp-Source: APXvYqxpziKgKxkC0CLx9svUiuECS9qp3k4Ke29MQa+w28OfxT6UG3D8k/lLoKpht7+O8PeX6bA1nQoVqBuP0bOPSsc=
X-Received: by 2002:a19:e006:: with SMTP id x6mr69629944lfg.165.1565004948937;
 Mon, 05 Aug 2019 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190801100717.23333-1-rnayak@codeaurora.org> <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
In-Reply-To: <CACRpkdYLb-WWSEL8yG3yy8Qq7bOKP9JjUGV51mY6=aEwrQAJvg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:35:37 +0200
Message-ID: <CACRpkdaoOuyUmysb3OmErbLJ6zZuHGGt7RRzG9wULDkg=hLCAw@mail.gmail.com>
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

On Mon, Aug 5, 2019 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 1, 2019 at 12:07 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> > From: Jitendra Sharma <shajit@codeaurora.org>
> >
> > Add the binding for the TLMM pinctrl block found in the SC7180 platform
> >
> > Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > [rnayak: Fix some copy-paste issues, sort and fix functions]
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>
> Patch applied with Bjorn's ACK.

Ooops there is v2 and even v3 coming, OK I wait for v3 and
backed this out.

Yours,
Linus Walleij
