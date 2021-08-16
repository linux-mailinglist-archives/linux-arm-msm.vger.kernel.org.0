Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D053EE093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 01:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhHPXy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 19:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhHPXyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 19:54:55 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B9CC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:54:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso2019092otp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C/+tcWxYcIbJj6nDg1OA6yUYjPHVJrZBuqhcQg7Ah6s=;
        b=tzJb0+FxFuiQBpr+lK5+jBOnv3wL/4natRvzyL0KVnCyd4W30Dl0MtiOyb30nizQIQ
         xe6EF+PpGytDyXHhvsOqSbyZB5t9dhfQfo5qY6yaRMdvGdBb8uY0NlvRteOHmIPoqEtX
         dqmkJdFcMwleJjUhXK+PJnsfT43aJVz+K+0G/GT/X/NhxZhSTV+sJX45XvcWDBUHYT3O
         SsMC6EBSZIwdpqD/Hwr6ra/28kJPl12uesV69IwYgc4DGzUpKLA7tFIi2BSx3a4rhfLB
         Bwy3FaM3ASXasvXMqfRljNWoLdLHrQGsYctYoWZPrY2ESciKLEqpzZgLCQLfERkKIUV7
         5yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C/+tcWxYcIbJj6nDg1OA6yUYjPHVJrZBuqhcQg7Ah6s=;
        b=rXP6fE+QrMjHL8fR3v1Q5ZydMrtJpRz1Ci6BvIEhGTm5h/F1z88BlTufm7wyKBO5tb
         5vkuRiJ1flf+4RoZA/YTFJPsnXLy526zg6m3Twnh/mfwguXj9RdG2hZnYPjoTZkjYTAb
         DZ5yxHBeAAYYIZye7s+v4vQrwlvs6kSlk3JUH9QrKOxs1kaSFVxwCQQqiJ4qBquT2ejt
         Xg5zZPHSsrB+4iCqoxJUjaU2BLCYr7OLqhvoFHrrXr6xAMffpQRoQIwTsW3WrqxkrPi0
         ZhdUYdN7wKWOlLisM7edtp/lY/W9P9IrUhmQQftbyg41yKAwDPOX1CcC+LnPeBuFV/zG
         Lo+g==
X-Gm-Message-State: AOAM531zORzylqLMC6ZNeSrJqsDpAmEYalIPx1LyW7xVv8INpi1WVlWa
        cBIQjjz+2umbTgpaM73jodR34w==
X-Google-Smtp-Source: ABdhPJx9K0ZcVWdYg96uteYKBxPeb5UKmYEvO1kAGGbeqVsZ6BCoMhiWIgX69AX7RO50tkTYlN0H2A==
X-Received: by 2002:a9d:266a:: with SMTP id a97mr516885otb.114.1629158062896;
        Mon, 16 Aug 2021 16:54:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r1sm113739ooi.21.2021.08.16.16.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:54:22 -0700 (PDT)
Date:   Mon, 16 Aug 2021 18:54:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
Message-ID: <YRr6rLXRn0m4KUMx@builder.lan>
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 16 Aug 18:41 CDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Douglas Anderson (1):
> >       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 
> I hope the above patch doesn't cause problems. I had landed it in the
> drm-misc-next tree as per:
> 
> https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/
> 
> Presumably git will magically do the right thing here since nothing
> else on nearby lines is changing, but I at least wanted to point this
> out in case there are any issues. Right now in linuxnext I see both
> changes:
> 
> ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 

Yes, we agreed that you should take it through drm-misc and I must have
forgotten about that as I drained the patchwork queue.

This has been sitting in linux-next for a while now and I've not seen
any reports from Stephen, so I think we're good.

Regards,
Bjorn
