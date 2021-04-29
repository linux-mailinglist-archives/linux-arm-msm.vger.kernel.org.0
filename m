Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5711436EB69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 15:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237081AbhD2NkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 09:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhD2NkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 09:40:23 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21278C06138C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:37 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id o12so1454753qtx.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IgdBnMydFBzwsG7W3uYP/xp1blAOpZ2iF3BFsqoCBR4=;
        b=D72PPw3JOCL5ArWLKUg1LwdWV4i791yrbbio9+d1fGpbB8TfYgO9ZgsEgt9+WcSW0G
         H0/6BTJkS5OExQWGTmZx9vWat6g65+R7TtSNFJ730vVMQDjLQKbnhd/iKtKqeqMhlhVg
         eMD8gTXifjMb9FPkds4hkkYV5AKQSl5Rj5+SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IgdBnMydFBzwsG7W3uYP/xp1blAOpZ2iF3BFsqoCBR4=;
        b=HJxuYQnJYf2B6DNFY6YzAbqI3prwP7QJIbksb4UTY23vu5xIN6mhaxaTex3XsoOERZ
         zr+71CcEXhg459f+9NQVfBF07OEe8ciy1GY3BhvnLbXEDt0ucqq1mWXaKE1nmOUN3w9q
         VFCoLpDrSIzgY7WV95Mk9V7LR3OF/7YFedVQum9n23RXGIndYBV381d3+BQYQJLXsQwb
         BdRpOSkxUkihRiftmiplHEqPlqb7F4Cp12GtTzm1VGQcErtfXEUg1MgfkOIcAZ7lyAtl
         jbp+egdvZGa5VRJ01skBfKr2YbHxqzR5e482/+DVEN+cDQ2HFZLkmc1vJJ9+FSKHePDM
         7nkA==
X-Gm-Message-State: AOAM533n1PdbBXvY5mTe3PNU9r0wODaElxdvsaI4Y+p00BRUZjfgIoPQ
        QFjoGc6ISORNNB6hHplm7ymRffJBcysbXw==
X-Google-Smtp-Source: ABdhPJwZM4iACGG83h4i+9QY9i+nxovY8kPWwOAg0XO01L9x7fjz+ml3rUhSajatKdoL21llHH/1ZA==
X-Received: by 2002:ac8:5ccb:: with SMTP id s11mr2273923qta.299.1619703575917;
        Thu, 29 Apr 2021 06:39:35 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id a20sm1419937qko.36.2021.04.29.06.39.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 06:39:35 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id j6so10791042ybh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 06:39:34 -0700 (PDT)
X-Received: by 2002:a05:6902:4e2:: with SMTP id w2mr17570245ybs.79.1619703574539;
 Thu, 29 Apr 2021 06:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org> <1619674827-26650-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1619674827-26650-2-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Apr 2021 06:39:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUowpvn_2uPrOQG9hOCdX6GYZDojBdW+w8hg5q6PfvAQ@mail.gmail.com>
Message-ID: <CAD=FV=UUowpvn_2uPrOQG9hOCdX6GYZDojBdW+w8hg5q6PfvAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add "google,senor" to the compatible
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 28, 2021 at 10:40 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> The sc7280 IDP board is also called senor in the Chrome OS builds.
> Add the "google,senor" compatible so coreboot/depthcharge knows what
> device tree blob to pick
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
