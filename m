Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA424A9042
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355541AbiBCVx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiBCVxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:53:24 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E949C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:53:23 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id x6so3253176ilg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yw/OE+yoqHrGWOsbX30hBDztNYfmuxeKhNyJ4ntdaxg=;
        b=Izi40afZ8OYZSbUSIHRmbNMv2qVTLhFfyqW43yk7xNplNKSKPf5mt2HhkphhkdWcLg
         0ISLToWpdFUEATXPX/rGkJFhnCroXZUPHfEQL0mjnlv0jTPO+QOGix+uF/hpreTdH7ht
         tFQFqJBjk0gHE2hEZ4b1INseWuqrj3T8HxMXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yw/OE+yoqHrGWOsbX30hBDztNYfmuxeKhNyJ4ntdaxg=;
        b=ujoRe6TkK+Iy9RkoKY6Z+3EW3L7B79POYnQqnHhsDRMjvdEzuA8h8AVUZdckUOzokN
         uwGCsqf2cOlCaxwZ+2CqxA8PGExo2NaubU6GLhf5N4y9QAe2FrxcwPJ5yNBt9i2NpHkV
         djoZ7GGf9M1QpInbE2cj7WIthBF3zKJF+CVeYKIVf0IsGNRWu7ofAnkttivD2qJC9tNR
         BtSE00SfOSJ+EN3r2XtsmiVy40IDx/3DkjW4oiITB3RUiS2HGyRuRanbY2WKbPGx9yv9
         1uh8kt41YXEXBXrqFPZxknb0VEhcEvtXF1I1W//z314G+nI9sSp18KBX0VTH5pcFPZhT
         edtg==
X-Gm-Message-State: AOAM531u/ercKywIAhY4CTj8HyDKQK8x4d2FCp5jRHaAdazsRSSgbro8
        n/oCdVZdcOFki6jqQHzM2lfH41pm95m7Cg==
X-Google-Smtp-Source: ABdhPJys++Hb0TRalsgqnNipQDjScJn5GB3QOIH1vsJDgqO+dHV0isv+t+ogVMdUUgCVtp48/K/RXw==
X-Received: by 2002:a05:6e02:1b04:: with SMTP id i4mr41519ilv.270.1643925203051;
        Thu, 03 Feb 2022 13:53:23 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id k1sm24103107iov.6.2022.02.03.13.53.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 13:53:22 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id x6so3253150ilg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:53:22 -0800 (PST)
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr38117ilv.27.1643925201892;
 Thu, 03 Feb 2022 13:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20220202212348.1391534-1-dianders@chromium.org>
 <20220202132301.v3.9.I5f367dcce8107f2186b2aad4aef0dfcfafa034b9@changeid> <CAE-0n51N4wB7aTRbZR3zh3hjz56vdkFNwOSuKjU7n9gd_JDcvA@mail.gmail.com>
In-Reply-To: <CAE-0n51N4wB7aTRbZR3zh3hjz56vdkFNwOSuKjU7n9gd_JDcvA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Feb 2022 13:53:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKKZaHHz3-idahLg-ey3xmSZWKeTVVipzpZNQAkUVKmQ@mail.gmail.com>
Message-ID: <CAD=FV=UKKZaHHz3-idahLg-ey3xmSZWKeTVVipzpZNQAkUVKmQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] arm64: dts: qcom: sc7280: Disable pull from pcie1_clkreq
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 3, 2022 at 1:42 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2022-02-02 13:23:43)
> > I believe that the PCIe clkreq pin is an output. That means we
> > shouldn't have a pull enabled for it. Turn it off.
>
> It sounds like it's a request from the PCI device to the PCI phy that
> the clk should be on. I googled pcie clkreq open drain and this pdf[1]
> says
>
> "The CLKREQ# signal is an open drain, active low signal that is driven
> low by the PCI Express M.2 add-I Card function to request that the PCI
> Express reference clock be available (active clock state) in order to
> allow the PCI Express interface to send/receive data"
>
> so presumably if there isn't an external pull on the signal the open
> drain feature will not work and the PCIe device won't be able to drive
> it low.
>
> [1] https://advdownload.advantech.com/productfile/PIS/96FD80-P512-LIS/Product%20-%20Datasheet/96FD80-P512-LIS_datasheet20180110154919.pdf

Yeah, I had some trouble figuring this out too, so if someone knows
better than me then I'm more than happy to take advice here. I thought
I had found something claiming that "clkreq" was an output and on the
schematic I have from Qualcomm it shows an arrow going out from the
SoC for this signal indicating that it's an output from the SoC. Of
course, those arrows are notoriously wrong but at least it's one piece
of evidence that someone thought this was an output from the SoC.

Hrm, but I just checked the sc7280 "datasheet" which claims that this
is an input. Sigh.

I guess the options are:
* If we're sure this is an input to the SoC then I think we should
remove the drive-strength, right?
* If we don't know then I guess we can leave both?


In any case, for now we can just drop this patch?

-Doug
