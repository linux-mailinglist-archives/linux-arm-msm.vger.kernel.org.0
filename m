Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37212AC4C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 20:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgKITS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 14:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbgKITS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 14:18:56 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440BBC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 11:18:55 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id l10so11782165lji.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 11:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bu0ThKEY7iNNAWO1Gs5nfun8XEbY1iHpVPn66H13xho=;
        b=MXu1FiX/P8KsnLg7KwJk3Dr/HoYUiRRYwLCjf1j8Ckk0cbMDjVN32AAjT2KTOKu/1C
         ZsjaDNl2c19oeNtpL5x5MKJpucyMROnOwR9d0EjWq+xjdsWxzl6pyZdjQnZHMP0+6tRz
         eSfz9fClJxrmCocEbBKr62POOEUtZPpu7Jl8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bu0ThKEY7iNNAWO1Gs5nfun8XEbY1iHpVPn66H13xho=;
        b=eXB/p4jWtrgWYx74O5Lm/P6kmO30U52S9DU0lFCoPkCD6vmsaz8Y8wOjlQrdu/BXJr
         QVkz431+L5BhlAO71trBLOKAq873b42SkFUc1VYcDNO1vg5zLj+eWjaiYtw+vDwxP1Mk
         wynafMK24TemUvgQtDR2BbvDIvZ/LPMmyAyZ9eWb8Ppe4jTOVZQzw5ICIwgNDVPbZURN
         9gRcVefdl20/hM0TCLmzwFxpSLE+2NviabZ6QSG//o/WBE+gqYsdOqZ+WbEVRt1ZKAsf
         71bfph/ljy/Jq40ZK9rZySP/+aDnHy8uP5ATfqNYzVPGbOlsSXEmPhEiEcae6raybrch
         ojrw==
X-Gm-Message-State: AOAM533hjFHoS9rg9wX5Zyv0LM6t2s/WtmPaXDLIUUfBgDB5AqLcVJwR
        1XBgyGFUp5VoWpDikYzKTr5fWS8ujOlftQ==
X-Google-Smtp-Source: ABdhPJy81GK6Wez/hnlpeDy4k7RTWpZqgntrJgmG6/of04/DkWlyJxM6ZwU151gcADkAppND3mKvPA==
X-Received: by 2002:a2e:b0f8:: with SMTP id h24mr7040613ljl.2.1604949533158;
        Mon, 09 Nov 2020 11:18:53 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id s17sm1854827lfp.117.2020.11.09.11.18.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 11:18:52 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 11so11772548ljf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 11:18:52 -0800 (PST)
X-Received: by 2002:a05:651c:1074:: with SMTP id y20mr4049301ljm.432.1604949531557;
 Mon, 09 Nov 2020 11:18:51 -0800 (PST)
MIME-Version: 1.0
References: <1602786476-27833-1-git-send-email-sibis@codeaurora.org> <CAE=gft4FrAm_QHKm_dF6G0R8fkfJrYFYPMrRu0nPNrQtZ83skw@mail.gmail.com>
In-Reply-To: <CAE=gft4FrAm_QHKm_dF6G0R8fkfJrYFYPMrRu0nPNrQtZ83skw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 9 Nov 2020 11:18:14 -0800
X-Gmail-Original-Message-ID: <CAE=gft6JKpbcirFn9LAiDYFnM=HMfDQAYfQHAFy6NF+8J4Dmkg@mail.gmail.com>
Message-ID: <CAE=gft6JKpbcirFn9LAiDYFnM=HMfDQAYfQHAFy6NF+8J4Dmkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
To:     Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 11:37 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Thu, Oct 15, 2020 at 11:28 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> >
> > The modem firmware memory requirements vary between 32M/140M on
> > no-lte/lte skus respectively, so fixup the modem memory region
> > to reflect the requirements.
> >
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>
> Reviewed-by: Evan Green <evgreen@chromium.org>

Did this land anywhere?
