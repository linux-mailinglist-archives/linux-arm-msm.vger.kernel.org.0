Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0A048EB9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 15:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbiANOYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 09:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235288AbiANOYw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 09:24:52 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E4C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 06:24:51 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id c5so2897861pgk.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 06:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+kK5YwD4X+KlkJJ9sy7/5Wbvm6efis2jkyS4KfuvH1M=;
        b=eskFAvJmnTLDaFwlYBQjIYxtLYmAijE6kQEd40yeBmgZCR6ZFM1lgC7JYwNV0qiVSH
         bisxPt84r2TJYVJcGpQZ/ylargfbLuygaQ9RGYaHZYY3MDQN7Q7GhDsqOvyz0PePGgak
         YppO8SFsTxlpY6D0bvXlA2KX81yy+MFmftsUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+kK5YwD4X+KlkJJ9sy7/5Wbvm6efis2jkyS4KfuvH1M=;
        b=mdWJoryQcPM4SRBBSPI2gWcwyx8xLrGBmHvd+VzmXFzAedp5GQHhn4w+raP1KeL058
         fNz9m4LNv+5zlJ9819Iu8nEZD6o7KyOtdNLCKvotcJmvP0SkZbtyjmoOyuOoCwQsdfhR
         JgmCJR0A5kxX0GiJOpGT1JK11CAeBYyq0Kn8aGEL/HX+5losmn8/VyHTc4VBs+thaGB6
         iogM/T8zWFPF4vNvDy9TUAH5PlDpZw1kVWYCJV+98O+ZfjyS43APNFnqvxzHM0aX7gsA
         3fXsAI2JPPeF+36hov/qi4F0RX/fRFex5p7B5N7rOLHxsK9yAkgH4ihF7tKxi/k1HJMc
         iPrg==
X-Gm-Message-State: AOAM533rOdZrisuu/UdRJPrp6LfQC8p0LvzGWFwuSkvG+ZIYhYbgMKIW
        2AOhUs/ItcDeVIKQkJfpyvqv8Q==
X-Google-Smtp-Source: ABdhPJwowuy25u83s4Ys0CVAnNZ0sgafPxHTT3qzJIleNFV5sQXWe1qEeqp2jMrEU/nk7pAYzvnxrQ==
X-Received: by 2002:a63:7415:: with SMTP id p21mr8227558pgc.284.1642170291534;
        Fri, 14 Jan 2022 06:24:51 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d9fc:bf52:3ca:199b])
        by smtp.gmail.com with UTF8SMTPSA id l13sm4874933pgq.34.2022.01.14.06.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 06:24:51 -0800 (PST)
Date:   Fri, 14 Jan 2022 06:24:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, swboyd@chromium.org,
        pmaliset@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7280: Factor out Chrome common
 fragment
Message-ID: <YeGHsTLT/CD8D9rH@google.com>
References: <20220114004303.905808-1-dianders@chromium.org>
 <20220113164233.3.Iac012fa8d727be46448d47027a1813ea716423ce@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113164233.3.Iac012fa8d727be46448d47027a1813ea716423ce@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 13, 2022 at 04:43:02PM -0800, Douglas Anderson wrote:
> This factors out a device tree fragment from some sc7280 device
> trees. It represents the device tree bits that should be included for
> "Chrome" based sc7280 boards. On these boards the bootloader (Coreboot
> + Depthcharge) configures things slightly different than the
> bootloader that Qualcomm provides. The modem firmware on these boards
> also works differently than on other Qulacomm products and thus the
> reserved memory map needs to be adjusted.
> 
> NOTES:
> - This is _not_ quite a no-op change. The "herobrine" and "idp"
>   fragments here were different and it looks like someone simply
>   forgot to update the herobrine version. This updates a few numbers
>   to match IDP. This will also cause the `pmk8350_pon` to be disabled
>   on idp/crd, which I belive is a correct change.
> - At the moment this assumes LTE skus. Once it's clearer how WiFi SKUs
>   will work (how much of the memory map they can reclaim) we may add
>   an extra fragment that will rejigger one way or the other.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
