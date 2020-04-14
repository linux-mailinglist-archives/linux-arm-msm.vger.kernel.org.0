Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371BB1A8AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 21:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504677AbgDNT0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 15:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504653AbgDNTY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 15:24:56 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567CFC03C1A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 12:06:59 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id j65so671125vsd.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7KrnRzyyOUemPRVsSUSW7supihjD0aQaPjITXcbeLk=;
        b=kepiQP1oWmWQkilPnEBSKatdjUR3EE60+QwIJjoai4XqsbJg4+7PZQWRyq2meKTDqq
         U1NTYx+3Wr89EDUCIm9olKYp1EoY+W4BHV9q7VO8idCaiTP6Lm4E5VmXUoJ2AGRFhriY
         Da+cFwBBH7Nv7E5bfANSfnNH0J8nmp6cQAwVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7KrnRzyyOUemPRVsSUSW7supihjD0aQaPjITXcbeLk=;
        b=gm8/LnBZM3g47WejFsfGFQBAfDJKen2llCvfDMfpw17WFsQJVuvd8ogGXpsc2XGDGc
         4i0SsHRWzToGTMA5rJqeTedM6hPYN68n8ySwNVOP0kXFnVNIZxCTBnlIO/C6sN9q5i6x
         hFo025rHGWGIQIOP68N9MbXzCzjwWlhzbMzkDivFmDOpbgFd3cKEZN5MqLzPyUWmweVF
         Dd/d9nJHZb8Zrlli9gb18BNQQqAkaQcCmK6iQILhT3X/+zhDd3C7Sd05sDc5TaGNkh0p
         Equt1wCv92oOeRkcbe//qZKYodXrGbo2ST1eE+GCecT9CAiyTlp2i4Akn7yPzD2xE7I7
         +tnw==
X-Gm-Message-State: AGi0PubiLguvw6p6/OyUF8hFCIfJGqpF7/HxriB8evMAcEFcpugr+YEY
        57T6JrSePNJeMwZSrJX+c6G9BkNsVKg=
X-Google-Smtp-Source: APiQypKEo7PHX8xLHIAjMr5V/RDa/k2AYSHyfqNkkRQRL+hc4HW9ZKlfFv7JwzU2qPjLuf4Kk6uqBQ==
X-Received: by 2002:a67:2f07:: with SMTP id v7mr1558474vsv.7.1586891218152;
        Tue, 14 Apr 2020 12:06:58 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 201sm4582378vkz.9.2020.04.14.12.06.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 12:06:57 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id a2so724474vsd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 12:06:57 -0700 (PDT)
X-Received: by 2002:a67:8dc8:: with SMTP id p191mr1616800vsd.198.1586891216585;
 Tue, 14 Apr 2020 12:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414185744.84581-1-john.stultz@linaro.org>
In-Reply-To: <20200414185744.84581-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 12:06:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
Message-ID: <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy"
 compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 14, 2020 at 11:57 AM John Stultz <john.stultz@linaro.org> wrote:
>
> This patch fixes a regression in 5.7-rc1.
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Re-adding reviews from:
https://lore.kernel.org/r/158631458374.216820.17829557619378130779@swboyd.mtv.corp.google.com
https://lore.kernel.org/r/CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

...as of an hour ago Bjorn also picked up:

https://lore.kernel.org/r/1583747589-17267-8-git-send-email-sanm@codeaurora.org

...and it's now in the Qualcomm for-next and ci-next.  It's still a
bit of a pain that -rc1 will have the regression since many other
maintainers will base their next branches on that, but not much to be
done about it now.

-Doug
