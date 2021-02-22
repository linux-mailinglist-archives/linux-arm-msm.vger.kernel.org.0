Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E963222B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 00:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhBVXmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 18:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhBVXml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 18:42:41 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8086C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:42:00 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id f8so8728414plg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BZKJznQE94weZw4iwUw158OrXlAL+RE2OSoIVxTDICM=;
        b=BR0HL8iVe6VD1HipsYJCVrZwtZkVbdmnI+D6kbMkVWAN+2ny7r48/SLXRRY9ZGDanW
         1LX+v3gMnRKRreYosSRzChsLRgCNYnHVoNxX3YcMj+rRDvdaO4ucXinLRyAjTiJs1SjR
         ZIaXwompOi80fLK9AB5Ji3caIuOEsSY/YO6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BZKJznQE94weZw4iwUw158OrXlAL+RE2OSoIVxTDICM=;
        b=LXOknF7dZQibJJPg8PJaLtSbxaUWDsq6iqj6cSIimie4/xsU6DlZx71fDnXMh3BI8b
         zKpJYKRIgt3cZ16PNlM5CboRofWtBGNeVhNErP9vz2MgE8HUvPqPMcfb+MKtI9KWaMMF
         w0OjaqbRqk+FBE+pRzaFLc9enFVJ2x2OUFVK7d6xcb80N0OItZe7Mg6KozWULOgFC8A+
         o+48DpGUS6ZR18ljyNMGfmITsmRw/T+MY4YnP95xb9W2FX7ViqoA+5QoUZCS5Ir/QlPT
         5pf+EpBJgxLklcTNYYCKe5mdWMR2pHocRRfeUojhy4NITwewB3mdCktOFQaWllOQzdvZ
         392Q==
X-Gm-Message-State: AOAM533IowyM112hLkqxEQHJ1qAwopQ4G05bhnbpQj1It1b0O2B/kInK
        wj3n7z8ipNbXhWPIvTWYT7pudQ==
X-Google-Smtp-Source: ABdhPJwqpLLm3Mul2J2GDSH4UYTcGSIwwuVN20VBlWdmPbzKx7H1TYq0rLjXejHW4hT91jlQcbY88g==
X-Received: by 2002:a17:902:edcb:b029:df:cce5:1105 with SMTP id q11-20020a170902edcbb02900dfcce51105mr24814421plk.2.1614037320240;
        Mon, 22 Feb 2021 15:42:00 -0800 (PST)
Received: from localhost ([2620:15c:202:1:212d:9fc9:b1d0:a24])
        by smtp.gmail.com with UTF8SMTPSA id x22sm576837pjr.49.2021.02.22.15.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 15:41:59 -0800 (PST)
Date:   Mon, 22 Feb 2021 15:41:58 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add lazor rev4
Message-ID: <YDRBRuUkrxCrLSeX@google.com>
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
 <CAD=FV=Vcsu1JREUgtEH1zXB7Ph8QWWYMVO2ioqqVYj9Dd79JDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vcsu1JREUgtEH1zXB7Ph8QWWYMVO2ioqqVYj9Dd79JDg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 22, 2021 at 03:20:53PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Feb 19, 2021 at 6:11 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Lazor rev3 and older are stuffed with a 47k NTC thermistor for the
> > charger temperature which currently isn't supported by the PM6150 ADC
> > driver. A supported thermistor is used in rev4 and later revisions.
> > Add rev4 .dts files to be able to account for this.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/Makefile             |  3 ++
> >  .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  4 +--
> >  .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  4 +--
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  4 +--
> >  .../dts/qcom/sc7180-trogdor-lazor-r4-kb.dts   | 20 +++++++++++++
> >  .../dts/qcom/sc7180-trogdor-lazor-r4-lte.dts  | 28 +++++++++++++++++++
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r4.dts | 16 +++++++++++
> >  7 files changed, 73 insertions(+), 6 deletions(-)
> 
> From what I can see in the latest discussions -r4 _won't_ get stuffed
> with the 100K resistor.  Thus we can just treat -r4 as the same as all
> the other revisoins now, right?

Yes, looks like there is not need for an explicit -r4 after all.
