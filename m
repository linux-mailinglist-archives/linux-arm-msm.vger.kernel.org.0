Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D622C152110
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgBDT3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:29:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38520 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBDT3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:29:36 -0500
Received: by mail-lj1-f195.google.com with SMTP id w1so19889016ljh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/HM5mji7KZVUrQKRnd4ba9jTmfjhkKMlqI2S0xOauPg=;
        b=CT69CGGb/wyhd4i4+dq6rLH5yBuGl1U74TYC4aWMMw3E2cDirvTFSx11Mbkc7dIK3X
         5wlg1QgCKKGrMgtf4sSbBGhnEBQe93FDpoUq8ioeIGSHMW9MD0h0rGTtBHbusNhe+9GJ
         RZS+tP2KF9lWtXM8ETAvthi153nYGqMg6TMfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/HM5mji7KZVUrQKRnd4ba9jTmfjhkKMlqI2S0xOauPg=;
        b=RZFGe9Z48S9zQVk/2EUtEZBHJzM7U2jfr1zyqhIiGlTxmy/Dtb77uhCDySgQwiRQVk
         BoJJMuhQH262vbZ6jnHiDCkWmslfdfa8+/1nh9FLC+TWno00mhzZWjSUZX/r0sTMYosx
         TaPtKqsbxybKDdsd9aFzV0RP3qQG9PWJmwhx5ldQT4l2pUOLhivhdBmwUDC19pUaZU+2
         zOrStRdCUzO7mC7p+j+5A7zeG8g/divwApqbaNZgnmoEgg0BRJ1zVLpSh9sKdoduH8lM
         L8kU5Y1pIwWffNUbBG8dHs3fk1pqp/wMtHhLE5KUhQFYDfDk/7HPIiqV0+gJEJ7SKbVt
         2CZg==
X-Gm-Message-State: APjAAAUJJw6hFufM0jXSuSJntrpI9X8cb3o4QSbitv/8NYkT4qnSsJpi
        FCJGHOAE9zTp313clVfWNu59tf2V7uk=
X-Google-Smtp-Source: APXvYqxjaPa72NVapv+kk0mH3k/7KuaoGc3RC5siu/WMAT8GRaPbzupqNW2HvQ2sM7Gm/z4MTn7b9A==
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr18463148ljh.28.1580844574707;
        Tue, 04 Feb 2020 11:29:34 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 144sm11162617lfi.67.2020.02.04.11.29.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:29:34 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id c23so13036272lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:29:34 -0800 (PST)
X-Received: by 2002:a05:6512:2035:: with SMTP id s21mr14945994lfs.99.1580844572524;
 Tue, 04 Feb 2020 11:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
 <CAE=gft4ZM3H2eODOwdpOC5tBkRV9BBHPnya_rOy3mNmqH2Y3+Q@mail.gmail.com> <20200204191654.GA18972@google.com>
In-Reply-To: <20200204191654.GA18972@google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 11:28:56 -0800
X-Gmail-Original-Message-ID: <CAE=gft6vDvF=+TppK_d1qRixraSwgYJZULaBvRdUJv3jX=5dDA@mail.gmail.com>
Message-ID: <CAE=gft6vDvF=+TppK_d1qRixraSwgYJZULaBvRdUJv3jX=5dDA@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] usb: dwc3: qcom: Add interconnect support in dwc3 driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 11:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Feb 04, 2020 at 11:05:41AM -0800, Evan Green wrote:
> > Hi Chandana,
> > Are you going to spin this series? My comments are below, I see
> > Matthias also has comments. Please CC us both on the next spin.
>
> v4 was actually posted a few days later:
>
> https://patchwork.kernel.org/project/linux-usb/list/?series=176783
>
> I also missed it since neither linux-arm-msm@ nor myself are in cc.

Ah, thanks for the pointer, Matthias.

Yes, please CC linux-arm-msm@ and linux-kernel@ as well as us.
-Evan
