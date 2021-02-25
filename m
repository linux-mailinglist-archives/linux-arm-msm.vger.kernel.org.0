Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47313325A09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 00:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhBYXFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 18:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhBYXFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 18:05:34 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38584C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:04:54 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id g8so3744181otk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U1hhikhUfJgUYoJWHOz5mYG43dgdqvD25NKJhwkGGME=;
        b=W1Lg/r85qkEkqlSzP3K7bUkT8hCe1cymIs3mOxfNemlRXXDK1J99kIUqTtEdKHoD5P
         YrOMdAXcg4Y5Vqz8s0EoLdA6z553GS5BJPSOEyq6PKNcVO0NYEqr2XiIXYjyyIDEArGe
         AoKfPOdmJLAqN4FOF2o0ENH1UB6kPJ7E76H+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U1hhikhUfJgUYoJWHOz5mYG43dgdqvD25NKJhwkGGME=;
        b=cfhMIlNLk6jgRM4Y+vH3Q5RTch6zP/SeMmKRg76/WDD4X8LF1IZDfgTml2ydAG1l06
         9X+4691iU78kG4dCoYSt0UAJmEMtxPYXWv0su3MgmDPM31s/i+nSDmcIZVnoH52XHHRC
         NMnDeiX3I3ZZknRBPwpsTvQ5c0K7yy3c9XNs+8hZTUV3xXiM5+Jn7mj1so0510zJsE29
         YAB8IpIYkI3/sNWscsW3n9lBuCsZswTDSLwi/pIKiLJwY4Ozn2XtmYxqCVZVVPnYArZL
         bDbP/EpkqJ2lmjgMTUESt8+HuMcTrmvgSiomaEHbZSo0s0A3SuefrkTFzZeXOiQNNviW
         nhAg==
X-Gm-Message-State: AOAM531Lmq0d2lK8ie3ZDkNXYPvQn9KYzF0sA/perb3VZoJyFy2Ju03B
        d9gzg5E2i36+v7DORawYKIfhX0L33lBK1g==
X-Google-Smtp-Source: ABdhPJzBvNFuUfkIBM+BL+tPAOJwupOC2obiqwQBUwl0Xr940BSUKrNxWXoBFuxabe3SOgnUqdnSuQ==
X-Received: by 2002:a9d:63d1:: with SMTP id e17mr22247otl.183.1614294293540;
        Thu, 25 Feb 2021 15:04:53 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id s21sm1425228oos.5.2021.02.25.15.04.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 15:04:53 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id e45so7362980ote.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 15:04:53 -0800 (PST)
X-Received: by 2002:a25:4e83:: with SMTP id c125mr201182ybb.343.1614293875603;
 Thu, 25 Feb 2021 14:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20210225221310.1939599-1-dianders@chromium.org>
 <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid> <a4a83576-9d95-80eb-0090-62526eba9095@somainline.org>
In-Reply-To: <a4a83576-9d95-80eb-0090-62526eba9095@somainline.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Feb 2021 14:57:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhjvqUau_Jz9ZLFukGUxRqGJTJN+sUt=yv2Q81FRzUWQ@mail.gmail.com>
Message-ID: <CAD=FV=WhjvqUau_Jz9ZLFukGUxRqGJTJN+sUt=yv2Q81FRzUWQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] arm64: dts: qcom: Move sc7180 MI2S config to board
 files and make pulldown
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
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

On Thu, Feb 25, 2021 at 2:55 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> Hi,
>
>
> >
> > +&pri_mi2s_active {
> > +     pinconf {
> > +             pins = "gpio53", "gpio54", "gpio55", "gpio56";
> > +             drive-strength = <2>;
> > +             bias-pull-down;
> > +     };
> > +};
> > +
>
> You can omit pinconf{}, so the outcome would be:
> &pri_mi2s_active {
>
>     pins = ...
>
>     ...
>
> };
>
>
> This makes the DTs ever so shorter and is the style that's currently used for new submissions.
>
> Same goes for the nodes that are being referenced.

Yes, I agree.  That definitely makes sense going forward, but I think
it'll just add to the confusion to switch a dts for a given SoC
mid-stride.  ...or, if we do switch the style it should be done in a
separate (no-op) patch series.  This series is already giant enough...

-Doug
