Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766CD14A8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 18:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgA0RIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 12:08:05 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46351 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0RIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 12:08:05 -0500
Received: by mail-vk1-f195.google.com with SMTP id u6so2763624vkn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOiV8nj2HZ+JtKcIVA5xQdznkVK/jM8PnqE9J+mRXqQ=;
        b=YrB//b92fTsHkMw3bXM25KI/RYWOU7ymbAeVsjo+vGfk3HbEiKFvFYtASMzcTT0lUM
         dyv2seW78v0VKay+qVrhTS3Jpn7Y7unPJ29rR2HvbrOOrPCQzDq7qdIqyFckjEDe7+Ap
         aFRB4NmCvhUk0h4tMLr2fD0rmlmi8+LY4yxVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOiV8nj2HZ+JtKcIVA5xQdznkVK/jM8PnqE9J+mRXqQ=;
        b=A6FQTWdcQmUDdYxlXhzINWT8TEYwKQ+S3Y9S77yk3tneTpB3w6hfe2+TkNagLBJM28
         tDNKGxKNXCl9A6vnv/G6vwgdgpS6jr6rrBi0PSYCczCdtBnNq1Jj25mj1ilKmhRO3fVV
         jOIulEFUO9dnJSjck2D0P9NCEVmywdCxrh2g9tIMdepxsRXyX9azhSeRcJiQ87xm778+
         MWQyQlD8e+NFqYaa2hHIwyKI78pXw5el4fVpHZwcMOGEZRU25LD+811JNm9CnyXgLCXx
         PZBv/Tc4xetNfRVLz2QjYISts8sWEnUC9H5lxXpnVm/AVaKdiTtRfIb4B4FIiBLC9Fih
         Vgdg==
X-Gm-Message-State: APjAAAXVk84yGTsjMZRt2taysYcP6SKGdUpDFOI/KBvy7/mz/PD921u+
        k4JomHOTHIEouwxYkY1UgYf9wouTsGo=
X-Google-Smtp-Source: APXvYqyqPPruuet2D89Kwd3VpQVP6YzfWnSxkUV6FtUVvJVNQzeVRnOmuPkpZ0/EVL+o9X7VDDiBfA==
X-Received: by 2002:a05:6122:2dc:: with SMTP id k28mr10155323vki.70.1580144883359;
        Mon, 27 Jan 2020 09:08:03 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id w1sm3680879uaj.12.2020.01.27.09.08.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 09:08:02 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id t12so6108306vso.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 09:08:02 -0800 (PST)
X-Received: by 2002:a67:1ec5:: with SMTP id e188mr4925367vse.169.1580144881597;
 Mon, 27 Jan 2020 09:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20200127082331.1.I402470e4a162d69fde47ee2ea708b15bde9751f9@changeid>
 <20200127170457.GK2841@vkoul-mobl>
In-Reply-To: <20200127170457.GK2841@vkoul-mobl>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jan 2020 09:07:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XKHy6FmkeyCNB+vb7Ws=uZWOQ-QpYOKPJZg9PhFcJf5A@mail.gmail.com>
Message-ID: <CAD=FV=XKHy6FmkeyCNB+vb7Ws=uZWOQ-QpYOKPJZg9PhFcJf5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix sdhci compat string
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:05 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 27-01-20, 08:23, Douglas Anderson wrote:
> > As per the bindings, the SDHCI controller should have a SoC-specific
> > compatible string in addition to the generic version-based one.  Add
> > it.
>
> Thanks for spotting it Doug, Btw did some script catch it or manual
> inspection?
>
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

It probably would have been spotted by "make dtbs_check", but I wasn't
running that in this case.  I just happened to notice it while
chatting with someone at Qualcomm about whether
<https://crrev.com/c/2022985> was correct (still waiting for a
response on that).

-Doug
