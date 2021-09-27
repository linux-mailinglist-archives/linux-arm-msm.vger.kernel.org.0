Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E0D418D34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 02:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhI0AJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 20:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhI0AJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 20:09:01 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8D6C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 17:07:24 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id il14-20020a17090b164e00b0019c7a7c362dso10413583pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TnL3/Du6Wty+HxO0knBzzKlL1BHmQ2erkxGPMnhKrTg=;
        b=vLR0B0cI/pUW6GnIM4PYQP/D0cozOnKs+MoY0CXhQ+rgkRAFxIpUV2tQjAMaM6UC3Q
         O+txzCwIu9EeENUZldLesA4oiFrQ6iVNEarym5WOujKaWczMAPcu49vPU7/GEX4c2CFw
         2kAqAmJGbEHoClOjEf8W7pmTvFtLnkrco0GjFLVf64BhLTF1A8nAk3IQQo2EhDVNK+jt
         6JwP9MtoHLjD/Bd3jnPHmM7QEtdYdbYEvAQfo0CPw+YTxKLW0MC4HqBrlYl3W+SYU0m6
         GQkjM5HdCmHPqTzfBNM6Uz+2cSVqrWf8ehHgbHoMgKIUjfzHVfhaWkFuE8zpTtw13/1c
         UCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TnL3/Du6Wty+HxO0knBzzKlL1BHmQ2erkxGPMnhKrTg=;
        b=x4jpVjo0uk2IQ0inzlkCxW8Xhf7egYEkMIpXA5gzqShwBckp8Te/yZIvcWQy4ZdyQv
         1Ew3PByN0ii51uX60d/lQ6tLhlBcSiQTSololynhKoE8U9ft/9FOzkWrlevfkkZ8QD0I
         q4tD9JtGlem9wR/1iV45hj4rvW8ZgRCfeXcr8bmcyEQkvs/pH/8twxo9VBZbKiPMfNZm
         Z3BXRW+JCP+ajN/d7vzzBKP4YdgH9/mTwWOMFYYf759L5jm7djq+kOWJr4sWHeCMOEJr
         U3jAytNhyAubajvVkJpwd782R40rK/jDLkv8izsPenMGGxT3iiEDh7XBpYRKd8law21n
         8RXg==
X-Gm-Message-State: AOAM530gqchcZjFn+8WxNmJa+NnIad69k25R5nJ07q9vnC3Ex7GAvuWe
        o5ELGuS3HxWh66Gc+SBlgbOPPQ==
X-Google-Smtp-Source: ABdhPJxeBWbyQ4nzQndjCCHFZRi4H8BGcBT0QXk+9L6HtTXd0aHJHRqnSE5c073iH7u311I4vPbDcg==
X-Received: by 2002:a17:90a:928e:: with SMTP id n14mr16221326pjo.129.1632701244039;
        Sun, 26 Sep 2021 17:07:24 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c22sm14005032pja.10.2021.09.26.17.07.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 17:07:23 -0700 (PDT)
Date:   Mon, 27 Sep 2021 08:07:16 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop vdd-supply from qusb2-phy devices
Message-ID: <20210927000715.GD9901@dragon>
References: <20210926075951.28034-1-shawn.guo@linaro.org>
 <c8d61171-225f-ca1c-db9e-7ed3f91365b8@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8d61171-225f-ca1c-db9e-7ed3f91365b8@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 27, 2021 at 12:58:19AM +0200, Konrad Dybcio wrote:
> 
> On 26.09.2021 09:59, Shawn Guo wrote:
> > Looking at qcom,qusb2-phy.yaml bindings and qusb2_phy_vreg_names[] in
> > qusb2-phy driver, vdd-supply is not a supported/valid property.  Drop it
> > from qusb2-phy devices on various boards.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Why not add it to the regulators list instead? It's a valid regulator for this hw.

I do not have enough information to be sure.  Could you cook up a patch to
update bindings and driver, if you think that's the case?  I will be
happy as long as that DTS, bindings and driver are on the same page.

Shawn
