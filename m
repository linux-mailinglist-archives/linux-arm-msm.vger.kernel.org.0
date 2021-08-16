Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754103EE07E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 01:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhHPXmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 19:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhHPXmc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 19:42:32 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD81BC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:42:00 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id g9so7556917ioq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
        b=f3vWQ8hpMBdzUhxwYoB7ZXd1idjeJdSU/Lux1E2ajeWTow8CGkLMmswSwHWv88uIDV
         Z8fwbsMBs1PFxt4DmLYFdezFyRCIlheNU0LiHc0PVzYb1wtUjs1RoWhYdgpQ+WRxv7Ea
         T8uaB68h7hB4RiinpVFaW6htRwRUKytbbxlu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
        b=FfYu1BasxYJnr3OAsAoOZtGemzzw565OMTBvK+tQpneJRIf8nGZPiukK19RSAZRTnE
         LdPcS7NXhi91hsKo+vSLOSz59S9qt82J/imn/GiDT8dLPmnar2ugIpOnR2eChZcUiEub
         MD60hfvAhj6xhkdXZCOqFPDFKdKW7NksAEf0VsUEba0bQXXHpHuqlg6xvw4zY4BaB9P3
         2X+nw0HQcYOTHE3G9Bao+T12LmR1TH8m2NgLvsCMRmldM8IXJ32d5S2e+dAZuJSnkRVa
         nAFqfQKedTkM82NLv56PseQhC+Hk8nrpuadvMkFiSJExjv4IRKd4lr+LbQYJ9XQ7i6qB
         cs6w==
X-Gm-Message-State: AOAM532WHUgZR6ovB8Jh09mTFIa5K5BOHopq03NyK90IilwZBtze+pGE
        iEnQsv5pGVIQdUUmK96CfDyeux5toYHwgQ==
X-Google-Smtp-Source: ABdhPJwtibiUuo0J53Mvlfwt/4OlqYO5J8ZujNgTwGmNhtRmm6UJ9AU5KudfL83OY7HUU4ECutRjVQ==
X-Received: by 2002:a6b:7710:: with SMTP id n16mr138046iom.101.1629157319952;
        Mon, 16 Aug 2021 16:41:59 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id z7sm173263ilz.25.2021.08.16.16.41.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 16:41:59 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id j18so20282668ile.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr341747ili.187.1629157318317;
 Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210816231223.586597-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Aug 2021 16:41:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     arm@kernel.org, SoC Team <soc@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Martin Botka <martin.botka@somainline.org>,
        Robert Marko <robimarko@gmail.com>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Felipe Balbi <felipe.balbi@microsoft.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kathiravan T <kathirav@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Douglas Anderson (1):
>       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

I hope the above patch doesn't cause problems. I had landed it in the
drm-misc-next tree as per:

https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/

Presumably git will magically do the right thing here since nothing
else on nearby lines is changing, but I at least wanted to point this
out in case there are any issues. Right now in linuxnext I see both
changes:

ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip


-Doug
