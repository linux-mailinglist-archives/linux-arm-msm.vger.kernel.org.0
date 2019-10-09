Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE919D0AD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 11:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfJIJT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 05:19:28 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33589 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfJIJT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 05:19:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so1752028ljd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrtyImwGFfBXfTmX10XBxTMxRS3dOgBhxhOkYorBJio=;
        b=rWE/As9QTJSgcCHZcLIVvg+lCV/orjCblJHb8uOk437G7OsLqIwxuV8L9e50gKWo+T
         h04ygluyUx7Xx3FA+5zXCLKlttHTXUi22brCE7btt4kIFCJmECsz+qmdAQZXaVo6WIxC
         6SKqlM9+M9L1hNmpHpRdXpbqQGkRs5sugYHvH1LIVILS4DwCA2s9w5QrhBSY/nVUyuid
         a9tTWrmFKrT0uf+DXw7Cad3a6ObwMcvuODk8AL/8hPOLIjrPYLA5OuekTZpcRgUh0e/I
         7daRGk/TM/bsvDv9fHcn2OkzlGVE69der5anWpEv5QAPjICdmWtgQ7dyfb4EZBASDvvj
         8tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrtyImwGFfBXfTmX10XBxTMxRS3dOgBhxhOkYorBJio=;
        b=YOTPMzm4jITZbigew2vYAoYr6EupG7xpEaWD0B0B2fUlnMi5njqYrssd2e55Pli/+H
         o6fgqdvNrpnYFELbmf3kP5B7Na6ONQoCJjHnKOb+UbRKWKcl/P0joIA4ccgngMQNEyxc
         D46pkUxJvi3fgI3us3K9qLn7d3M9o+yVKDo9FAD/UaUAy/ql5n8msBWO0Wk/UomTdB2D
         x3iZLO+IJ4rOYD6JxceCBF+DtN2QIEWM58qF/TnEhC0NrjsUt6g7l0gqt7EXIX5A+c5H
         xNqdMX+NrOHDa3jDWAuX557AFmY4ecTG1lFOcz+nhkuJE6H/Mdi3b2tTgt2JioZuE7tM
         FMIA==
X-Gm-Message-State: APjAAAU7meBS36SClFZosWPuAV1357sl+5E44kqzL0zjR2k2Okg/Lk1c
        BOQH8Ng35HaEkVQ4TJAhP1xspjt5GEHZMqlY/NptWg==
X-Google-Smtp-Source: APXvYqz5wZWF3goR+xGn5zfKM9UilScaYCcxjmoHcFVD8Yn8v6dgsuS4bgx4jCa+w9Kdlokc7XIobBnrEKzCVCPNEuw=
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr1663352ljg.118.1570612765058;
 Wed, 09 Oct 2019 02:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
In-Reply-To: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 11:19:13 +0200
Message-ID: <CACRpkda=ce4B1cGfQStxSjXFCR5-GjyBRMRK-mLunbR25PisTg@mail.gmail.com>
Subject: Re: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for pm6150/pm6150l
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 4, 2019 at 1:20 PM Kiran Gunda <kgunda@codeaurora.org> wrote:

> Add support for the PM6150 and PM6150L GPIO support to the
> Qualcomm PMIC GPIO binding.
>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Patch applied.

Yours,
Linus Walleij
