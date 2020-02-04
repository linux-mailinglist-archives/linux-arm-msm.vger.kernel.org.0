Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D21151F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgBDRZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:25:11 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35059 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBDRZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:25:11 -0500
Received: by mail-ua1-f66.google.com with SMTP id y23so7040202ual.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 09:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQ5VpNlkKKb7XdD6t2/fjKBTlJ5xrb0+onSqPevSGn8=;
        b=jjb36hApE2rzA0PwVFrbGceWDgUFBRvIFh1O9GaHdj+09aKzb9Ac6Cy7L3R+0hMsRI
         XeqCYNXjropbpRxsmUZlOV7cfU89VXuPdhvIz1xBZk3yDCMeaUq/gyuuUTM/+NB7C7Zt
         M19FLFrg6K3918rZgxVyaRa/VOoIU/QZ6Ng7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQ5VpNlkKKb7XdD6t2/fjKBTlJ5xrb0+onSqPevSGn8=;
        b=J08UqUrSHGwQJRzXqoCc9MlBlhn4i0KYfkMkgLNhawdL93NRXYDGlEFtAgng1dUuWA
         upjYg6HQYgfw41aSxEn0/Y40wyFhjCW9Sm+035HqIGZwfnUC462rfnm8AhM19viyGM6d
         ABrEtuIlOzO9C4EKNkZxOPvkugsWjNiA2QxmEBnLQYYk5XA51XKT+g9N/t35fFMR8Yn/
         jovj/AaP3NhN+kkdPqgyjbUXC8XzuOSAZcX57KEk7v9RhmjkOvuNacZuK/jLHNfNXOrh
         RRYXFVrHWx/t+xfkJ3o43BwoB6lgDJAcLSJ2fwtX5AgtGGuChfiS9hmZggwRzP49SE2d
         q0Jw==
X-Gm-Message-State: APjAAAVHwWJpWxJiruVoGjXB0u11TdIsIX3Dx8uw5T7/XSurZzIjfSki
        MedF4fPk5ceuYu7Y0revWwKCteCLAK4=
X-Google-Smtp-Source: APXvYqytlH5gd2CEaJgk4zvL+lZ2+ON772XBMtQogMBg4wpBB8bReOmNyouHfiHcpMzvYOY21B7EDg==
X-Received: by 2002:ab0:6902:: with SMTP id b2mr17966572uas.32.1580837109539;
        Tue, 04 Feb 2020 09:25:09 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 41sm6694304uaf.8.2020.02.04.09.25.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 09:25:09 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id t12so11850453vso.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 09:25:08 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr20331801vsd.106.1580837107900;
 Tue, 04 Feb 2020 09:25:07 -0800 (PST)
MIME-Version: 1.0
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-6-git-send-email-sanm@codeaurora.org> <5e38c036.1c69fb81.3da87.c53d@mx.google.com>
In-Reply-To: <5e38c036.1c69fb81.3da87.c53d@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 09:24:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ximzn+WwmDr62sjOsFOQRtQaB34BP7rY-y4x7Pb-zGPg@mail.gmail.com>
Message-ID: <CAD=FV=Ximzn+WwmDr62sjOsFOQRtQaB34BP7rY-y4x7Pb-zGPg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] phy: qcom-qusb2: Add support for overriding tuning
 parameters in QUSB2 V2 PHY
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 4:52 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Also, why not  use of_property_read_u8() and make DT writers have
>
>         /bits/ 8 <0xf0>
>
> properties so that we can keep things smaller. I don't understand why
> they're u32 in DT besides to make it simpler to specify a u32.

As per the other thread, I think it's discouraged to specify /bits/ 8
in DT unless it's really needed.
