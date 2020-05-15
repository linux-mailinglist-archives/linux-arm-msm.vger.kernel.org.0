Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054091D4433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 05:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgEOD5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 23:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727910AbgEOD5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 23:57:16 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471D9C05BD09
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 20:57:16 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id o5so1156134iow.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 20:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOIJwK9iadOQS8VS9oX0d0eobJTm/S5dRf232DfhV2Q=;
        b=jZGcHekf36InUx+/RT41yJ39LwB4eBQd7vT66ue0xAbo5xTuZa/i0CJGeuQo7uasFj
         KWR4W7zbDPi+yq6TlwQ/zf00VGEQsa9I4hgKLRy95YYxTa/7/vLLZ4zckSK3fiLThmnp
         7APyzonChcoUD6QuyiXT4zmroeoUonhrx7iX00yfVl9XCl3PDxXPwMf1n6VJgz6HgOY+
         A99tLzeweiB5AaZ9lVTuw1dif9/03YSktMiID+xWBMBqbu3KL5JcKrJE0YqaeoLj+OtY
         31xcKDIp1GOlgt95Lo/67hHz6ooA4vlcpH+Xi4ndyRh2QHgKM65UGQ6Ra684eiFjo8Jq
         6sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOIJwK9iadOQS8VS9oX0d0eobJTm/S5dRf232DfhV2Q=;
        b=i8eGKxil4JleiWWZcGKwtFC7mjhuBAkIN1OgckrqX/feHaeTtVlw2qduATXZ0E/lDX
         9S/d7lnSpLcCtrgrSg4JsYuLuyRArrF7X229/+NbMA8v79COeDrVR5RKnyFbZ4wvdGsR
         UWj34S9+cHJ8wR1GBau5rbIFDZx0+oeEqiVdXLcJ8+bE7G7aGlCGmsoBV4JAMo1xizQF
         IL/vJUuwybzyVWSFZyVsE6gyDCdaiO/i5VAyWzbKjW7UoOYdFhZz455fjwPHUrYBqXO3
         nyyqHARd3MONnHNyOqmZxHkQI1VRqK623ZNHAODFuQDqlMM3S5Ujz7RJt+zDKMhjcZjA
         OgNA==
X-Gm-Message-State: AOAM5327E9meG5cekQtrZxNGZYR4h9eABOPRpgv+Y6v7IlS080X0P3zy
        rdk7flhqTjIeZSwGxumQG3PZ6tMoIepcnChJaZFr0A==
X-Google-Smtp-Source: ABdhPJz4yECgbKlvcTa70WHzfNcxbCgYqFO0xfvcC6KgNtx0n8f7dausExrVZi/vmEvOALHEs8Dq89VdSz06od9lItk=
X-Received: by 2002:a6b:e60b:: with SMTP id g11mr1143301ioh.96.1589515035477;
 Thu, 14 May 2020 20:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org> <878shu4uwk.fsf@kernel.org>
 <875zcy4uuj.fsf@kernel.org> <20200514171352.GP4525@google.com> <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
In-Reply-To: <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Fri, 15 May 2020 09:27:03 +0530
Message-ID: <CAKohpon+JBpV3fC7j=rhc1R4gi_mVG6teBDrE8Yryd4QXfw9bw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 May 2020 at 02:33, Georgi Djakov <georgi.djakov@linaro.org> wrote:

> ---8<---
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 206caa0ea1c6..6661788b1a76 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>         tristate "Qualcomm Platform"
>         depends on ARCH_QCOM || COMPILE_TEST
>         depends on EXTCON || !EXTCON
> +       depends on INTERCONNECT || !INTERCONNECT

Again, as I said yesterday. This looks incorrect and may not fix the problem..

With this we will be able to select USB_DWC3_QCOM even when INTERCONNECT=m.

What we perhaps need here is:
depends on INTERCONNECT != m

--
viresh
