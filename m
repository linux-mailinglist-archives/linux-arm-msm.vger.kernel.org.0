Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A13111BAE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 19:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbfLKSAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 13:00:14 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:46208 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730829AbfLKSAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 13:00:14 -0500
Received: by mail-il1-f194.google.com with SMTP id t17so20189351ilm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zw8ToasYb8/laTLFqP1g55dqKVSS0xO4pMqGOs5Lio4=;
        b=muIVQgmKlRQQMPU+Jeeyvy8/9sXC3w7NT5fymLadIwje9b9OnbN5ClDxwE8279dvoE
         spwJu8EmwWQkXCJk50n4AhPIlogG3r7l4JpwoizFRBnCNls6ZL5nRadADjzSUVUQtYOF
         hLfTNe36v0MhAjt+3HNQ9L3QJiSHydvtf2gF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zw8ToasYb8/laTLFqP1g55dqKVSS0xO4pMqGOs5Lio4=;
        b=aoMKpzCfwGZbd5Tna81CLnw4Ew9HLhq9tley9W8rAyZ1nZP9yfv8feeo4t2bw0kngz
         0O9UKDrQrj3O94n8Svja1d2upNu8mdn8Xws9kjcMlkqXvlMMPSWnfsCUa8G6GMmXXWSV
         AinN2ulvvQpr5N4nZHiCmdgbo6b4BbQWMGG/jmLgmti2znHjqYsBNARsdURAT2AUHqZZ
         80C6n5NblkOytq9ecVmGvlitnr8b9gdB9b1FNU1cKCnqCuDRnwlohufVAdv1zLRDXsXH
         9WbkOPQEDGgwXjm7YCwpBLsiBo4jXagAfR4PM/a0W9eL7DyXnMdrFcPICOfzh6pq1b0y
         zTnA==
X-Gm-Message-State: APjAAAVbtqnHoScKf7pahe4X8qol+zrY5tN6lYpXpt/YLWCn4Qihirp3
        zYe8hbyTX+A4tgwZ4qSkqBMEJLd+4BE=
X-Google-Smtp-Source: APXvYqzO8NQfbRR44ISvmV7rJwlA3OjtWNmVgpKQY7Zx0hpsm+7Z3fyIqG/6kvmJB1/jMKM/dcJpLQ==
X-Received: by 2002:a92:ccd0:: with SMTP id u16mr3974006ilq.215.1576087213362;
        Wed, 11 Dec 2019 10:00:13 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id q12sm672394ion.31.2019.12.11.10.00.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:00:12 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id z193so23607445iof.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 10:00:12 -0800 (PST)
X-Received: by 2002:a02:711d:: with SMTP id n29mr4090645jac.114.1576087212191;
 Wed, 11 Dec 2019 10:00:12 -0800 (PST)
MIME-Version: 1.0
References: <0101016ef36a5bbc-82d31857-9d9b-454d-82e4-fed407e17443-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef36a5bbc-82d31857-9d9b-454d-82e4-fed407e17443-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 10:00:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQN4okN8HVrVbwoFA+thagm1w6HkD6WRp_HOenCOBgcw@mail.gmail.com>
Message-ID: <CAD=FV=WQN4okN8HVrVbwoFA+thagm1w6HkD6WRp_HOenCOBgcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions
 for sc7180
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 9:24 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add new qup functions for qup02/04/11 and qup13 wherein multiple
> functions (for i2c and uart) share the same pin. This allows users
> to identify which specific qup function for the instance one needs
> to use for the pin.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
