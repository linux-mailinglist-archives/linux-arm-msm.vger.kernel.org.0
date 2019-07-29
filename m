Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E211179B13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 23:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbfG2VaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 17:30:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36781 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbfG2VaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 17:30:21 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so60032282ljj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2019 14:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HKkIBvCgiYwjQhYFTYEAh/Mb6txeYN6WDDQ/uj2gFUI=;
        b=OVWD6wHlg/XSy1nOvWhd7RWa8UEN/Oef6ahYwW3GYqAbC3Jb8IYHyZz3Qv7guhv+ke
         ayQu1zm+nihPVb0TxklyfIsxxgs7QLFgrnETgq5hPDxJR+Xq3gHaM8a71PJDigK3Mzas
         KZtfwpERVnDnylTN3Kbty4zkw5EKnSCvzP0E8qgOSh9dABQwlX6tg1RvuR8Le0WyFLJy
         9MtK9kmmj3iapk/x10PWP9721MYBi2Zs1XcGoZH/gyCCpqaQAysmUGeep+ay3jjQDQow
         zm+h113ufbLccs2ZGo6v+zPMlUYQysd+GBvCM4N5JVd7lF/52GK8gDQYSQqHbQKVoasj
         SUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKkIBvCgiYwjQhYFTYEAh/Mb6txeYN6WDDQ/uj2gFUI=;
        b=KI95tV6u2gEHRirhwwQU5H5Fl0ucoEZ04Gqg+W429KrvtxXwik5eVv2EZFW7+E4BEA
         8oImyuf95w3KieCK4HjQLHCQLg0dTK73L/esuaxPInNRzzX6OM+CZtylGC5ZUpcBusuF
         t5lNd2Mg7SECZFELgqZOPfj2D7boPyW3Zz1bj+7rsnV66a28XVBdl7cWJdrTmVUAbbCH
         1uBf1iZklz0qzvJddp9+9FQevKbeqlZ3lOW09GU9GI4CdS2SUGaF2KORZ6C6CbUNVH3Q
         ndGZq8Ln7Uev+/hGh0/E3LI7O3PNiysm7eYA4rwwMdlSmtpaJX1VWecXBDzJUvDtI4tP
         xuCA==
X-Gm-Message-State: APjAAAVbhRhGF2JuHKt9t3RE/wUJfo1JdyLiNpo7XNi4mxudlFRb9cy+
        P7NpszkXR/tQ6hVAnoKVfVY1h7DNaPS5PHdQPCs58A==
X-Google-Smtp-Source: APXvYqwUhL9uJMcJBMf5PD9Q2tJQYMHtg2CF0rvUKzbc9I7QW0dTFe+hQ+z0pJ0FnCmvAz8JSJ5iGwWObU6G3+Peq0E=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr12436136ljg.37.1564435819389;
 Mon, 29 Jul 2019 14:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
In-Reply-To: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:30:08 +0200
Message-ID: <CACRpkdYrrpfGwTVHLbOwOWVxReAnH4q-bf5hTz_xFoM63sJoKA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: msm8998: Squash TSIF pins together
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        gpio <linux-gpio@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 4, 2019 at 10:57 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:

> TSIF is the Transport Stream Interface.
> First, rename tsif1 to tsif0, and tsif2 to tsif1.
> Then squash all 5 tsif0 pins into a single function.
> Same for tsif1.
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Changes from v1:
> - Reword commit message for clarity (hopefully)
> - Drop unrelated change in qcom,msm8998-pinctrl.txt
> - CC DT

Patch applied with the ACKs.

Yours,
Linus Walleij
