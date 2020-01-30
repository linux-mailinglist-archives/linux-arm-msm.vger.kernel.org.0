Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002D414E0BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 19:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgA3SZN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 13:25:13 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:40166 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgA3SZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 13:25:12 -0500
Received: by mail-yw1-f68.google.com with SMTP id i126so2450510ywe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJPY+g/XzCm6UWO3D8mKRxGxfTcXSUIYOUXNI4GNTD8=;
        b=BfQG+oTCMVxlg4wY8DUnH37t9rAIzLS4W4kBKdZBWR+QzaPeVDDSBBXOCM5jcqS184
         7z/yo+l0hDOZzpC2ERgZFxmFpmjwHGcZ8UyGlvlgloFIb0V9DTOjRoWcGbjeL6/SP5o6
         5UvCzcjJvRoIprtS7ojhc5t5+b4RMuK+mt/xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJPY+g/XzCm6UWO3D8mKRxGxfTcXSUIYOUXNI4GNTD8=;
        b=dQ5iGeF77sfaHPNdfI3Dge7LTs7bddBRF0OO31SagVoKbmOdRJObWAy25H+dIntDpl
         FkKdJFRNlTx43R+XKK0rbdPyc2B5vhBzkId78+1f2xH9fTxQzND3wrsSFICTsqv+/Fu5
         FbuGjghD0rD9gaIfGkgGQQsBijLLnhD7dPbV5U2XDsx3w6mIyIRrDtACnLtDQc3+punr
         11X1bbYdkk7+IqW70/41SfPwyUrXwVzNi/UKlhBvD3mo1/pMrUotHNpNbKhNN7Da0F2c
         tccijp8+WLEZeCXHYFHKG6HkrW4xuk22WfkUGrcPC4nOWM20+a6pTYJT9qUxD2RDx5Bk
         ZYug==
X-Gm-Message-State: APjAAAXZlat9NZa4+FSeUjyzIFeZL2Y3z6Jv+WZYLZJon5y5AXFPuKI0
        5s9EtG/4/31WZ/GhRgLLvmvM/bGLeYs=
X-Google-Smtp-Source: APXvYqxnDHqhgFZs1Qb41NTCXAuwLG52oDjBWczqDk4I1PfElnbqzmquRmh7ar/X3iYH8/lwsIiTcw==
X-Received: by 2002:a81:6d17:: with SMTP id i23mr4729219ywc.58.1580408711313;
        Thu, 30 Jan 2020 10:25:11 -0800 (PST)
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id r66sm3006361ywh.57.2020.01.30.10.25.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 10:25:11 -0800 (PST)
Received: by mail-yw1-f50.google.com with SMTP id i190so2468693ywc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 10:25:11 -0800 (PST)
X-Received: by 2002:ab0:254e:: with SMTP id l14mr3487338uan.91.1580408268842;
 Thu, 30 Jan 2020 10:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <20200130180404.6771A2083E@mail.kernel.org>
In-Reply-To: <20200130180404.6771A2083E@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Jan 2020 10:17:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xvw+oA70+JG-5wMy+0v5M324idQRJsujVbNnBtEF2gvQ@mail.gmail.com>
Message-ID: <CAD=FV=Xvw+oA70+JG-5wMy+0v5M324idQRJsujVbNnBtEF2gvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: qcom: Fix self-validation, split,
 and clean cruft
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 30, 2020 at 10:04 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> > Misc cleanups as part of this patch:
> > - sm8150 was claimed to be same set of clocks as sc7180, but driver
> >   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
>
> Someone will probably want to change this at some point.

I have no insight into sm8150, but I guess I assumed that since it
wasn't in the driver that maybe sm8150 just doesnt have this hookup?
I'm happy to add it back in.


> > +description:
> > +  Qualcomm global clock control module which supports the clocks, resets and
> > +  power domains on APQ8064.
>
> It would be great if this could also point to the
> include/dt-bindings/clock/qcom,apq8064.h file here. If you don't resend
> this patch then I will try to remember to make this addition to the
> binding docs.

You're saying that the top-level description for all these should
point to the header file?  Seems line a sane idea.  I guess we'd need
to do that for all of them?  I could spin with that if you want, but
we could also do a follow-up patch?

-Doug
