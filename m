Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F1233C4B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 18:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhCORl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 13:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbhCORlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 13:41:18 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C48C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 10:41:18 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id l4so32507615qkl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOb+Ef5KMaZtruDbTs1AgXiCk4ITTvmSiF0DYBBW3wg=;
        b=Ufwx795stMYAiTib4EAh7trmxQj5/rNCEqzU91AFy+UTOVhYECw8KNZZJuk3ZRbNiZ
         z3e02HQba2Ad3fyKBQ/K5QnKGm91r4+0mBbQ/M3/buzOt59CnYbWtnfPIjCJnvLRl4in
         WgliiLxn+O9K62kOCJj9nHAJNZgFI1++wtCvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOb+Ef5KMaZtruDbTs1AgXiCk4ITTvmSiF0DYBBW3wg=;
        b=buQkx1vCfbHyE78sfKlLpNYOrs+SIR+08z3tyGoM8wDkYbvvvw/ca9SSNyiFMIVQBw
         /PwiBlfywPNEVXtljjsB+NL0vGDwu34LvCcK/BujWzrgTo5G4vRiqwfqt8XlAGfWOfqu
         qDCKpx0CFDefLefXbH7igomWuUBRxkssGXxE7sFi8nrxTGJuamZyO5o5cBjNilbpYet8
         jOAX4NExy7lNiBhVNkSunexWIJpE24PhGN3Q4hq+jdAdyLSAnE6F7zFevcmdUDGykx/n
         xuLxKAdljNExTT0bjKwYa2RRyq/RMmQIfJ/5btbYtEES9kqVKq4rnByN4xhig54aLt9G
         Qz5A==
X-Gm-Message-State: AOAM531dnYNPMtV/ygZ61ZASwSAET7JhX7NsPk1xrj+gv62VuSjGnWsZ
        47lcofIjgtEMll2FDN4Ntrb7C4TpIvJoRg==
X-Google-Smtp-Source: ABdhPJyn29UDPPm/KCB2sk8po9F8rcUTRZyUkjC5vgj0qcx+egQtm6HptbnssbnjNie3k4dvbINP6A==
X-Received: by 2002:a37:a2c8:: with SMTP id l191mr26408038qke.413.1615830075424;
        Mon, 15 Mar 2021 10:41:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id w5sm13257180qkc.85.2021.03.15.10.40.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 10:40:42 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id k184so2012875ybf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 10:40:41 -0700 (PDT)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr1132079ybf.345.1615830041273;
 Mon, 15 Mar 2021 10:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.1.Iad06142ceb8426ce5492737bf3d9162ed0dd2b55@changeid> <ee5695bb-a603-0dd5-7a7f-695e919b1af1@linaro.org>
In-Reply-To: <ee5695bb-a603-0dd5-7a7f-695e919b1af1@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Mar 2021 10:40:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=pRSP4FkJciYkpHa=A8i_GjGTz64Kzz_h9eGFQeD1cA@mail.gmail.com>
Message-ID: <CAD=FV=V=pRSP4FkJciYkpHa=A8i_GjGTz64Kzz_h9eGFQeD1cA@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm64: dts: qcom: sc7180: Update dts for DP phy
 inside QMP phy
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
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

On Sat, Mar 13, 2021 at 4:28 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> >               usb_1_qmpphy: phy-wrapper@88e9000 {
> > -                     compatible = "qcom,sc7180-qmp-usb3-phy";
> > +                     compatible = "qcom,sc7180-qmp-usb3-dp-phy";
> >                       reg = <0 0x088e9000 0 0x18c>,
> > -                           <0 0x088e8000 0 0x38>;
> > -                     reg-names = "reg-base", "dp_com";
> > +                           <0 0x088e8000 0 0x38>,
>
> Technically this should be 0x3c. Offset 0x38 is USB3_DP_COM_REVISION_ID3
> (not used by the current driver though).
>
> > +                           <0 0x088ea000 0 0x40>;
>
> I think 0x40 is not enough here.
> This is a serdes region and qmp_v3_dp_serdes_tbl contains registers
> 0x148 and 0x154.

OK!

https://lore.kernel.org/r/20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid

-Doug
