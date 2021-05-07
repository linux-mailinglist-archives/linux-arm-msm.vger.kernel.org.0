Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBDC376966
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 19:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhEGRU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 13:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:48620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232056AbhEGRUz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 13:20:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8283761466;
        Fri,  7 May 2021 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620407995;
        bh=81FG1WxptVxgsMjB+7/uSNRBIS/lhGXvBOay2PMOYx8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B6kjP+OA6U8cPRrcMBxSmt1Oqi1xX4uTJi2B12Vls9bmKDb+0W0ZkwhH/IpGXKs59
         nsS+baNLI+ITx0T9uyGZnmINFyv/57chV82JKmQB4v//Ea6fYn5ZS/cFhDgndlaKqX
         tGJ5LU5PNBa0dl64LOMi9Me+Xfs3ndjPtoh0Ig+b9C6bjmdkkeZpZRociM+nnesl1H
         0BKQ3yCeD4G3N74jicVQtiYsnmEzJpcXOpcNnYxk+aGV4NFxnpY6u707G8MJK/dsLb
         +umwswDs8EmsT896o9nojGTGrapWtVWQOfTxDiNJPCGOQuxMf8CS8Y+ZDbbWIVFgYb
         xA3b0aELqFUGw==
Received: by mail-ed1-f48.google.com with SMTP id y26so11085878eds.4;
        Fri, 07 May 2021 10:19:55 -0700 (PDT)
X-Gm-Message-State: AOAM530ADS5+UZYsUlja9Jq7nKWJow7Y3UOuvwzIg8LDWDMXt7PIPB2y
        1nP/3qwIWTg0rFN6TCKFYlJs7pRuHWhu2c79Dg==
X-Google-Smtp-Source: ABdhPJyAy/IFFuj/LBLDoUPBqD97fCZdacKeeOIzjeWoa20BB43dij5t1kT0f5V1KD4L/EszHb502I48/FMaQ8d11a0=
X-Received: by 2002:a05:6402:84b:: with SMTP id b11mr12690887edz.289.1620407993904;
 Fri, 07 May 2021 10:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-5-git-send-email-gubbaven@codeaurora.org>
 <20210507011753.GB1126886@robh.at.kernel.org> <C81968AD-1C0B-4764-9631-FF227D026ED7@holtmann.org>
In-Reply-To: <C81968AD-1C0B-4764-9631-FF227D026ED7@holtmann.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 7 May 2021 12:19:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKy-wyrG8hvg2yTBdB44BgPa11hcTPwKTD-WgVykvpLaw@mail.gmail.com>
Message-ID: <CAL_JsqKy-wyrG8hvg2yTBdB44BgPa11hcTPwKTD-WgVykvpLaw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: net: bluetooth: Convert Qualcomm BT
 binding to DT schema
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 7, 2021 at 1:55 AM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Venkata,
>
> >> Converted Qualcomm Bluetooth binidings to DT schema.
> >>
> >> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> >> ---
> >> .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 -------------
> >> .../bindings/net/qualcomm-bluetooth.yaml           | 111 +++++++++++++++++++++
> >> 2 files changed, 111 insertions(+), 69 deletions(-)
> >> delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> >> create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> >
> >
> >> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> >> new file mode 100644
> >> index 0000000..3f3ec4d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> >> @@ -0,0 +1,111 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Bluetooth Chips
> >> +
> >> +maintainers:
> >> +  - Marcel Holtmann <marcel@holtmann.org>
> >
> > This should be someone who cares about Qcom BT.
>
> yes, please, assign this to someone that knows the hardware.
>
> Rob, can we leave this out for now if there is no dedicated person?

No, it's required. It can be me if it comes to that. However, if no
one can be bothered to step up, then we should just remove it perhaps.
QCom is a big company, I'm sure they can find some name.

Rob
