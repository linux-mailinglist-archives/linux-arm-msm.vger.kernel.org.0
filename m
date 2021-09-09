Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C059405EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 23:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346597AbhIIVbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 17:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237888AbhIIVbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 17:31:23 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C5BC061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 14:30:13 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 6so4443446oiy.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=r79cmgNDDidxXvaxTI5T8bA/u2eCAhe6oAZULslvRNg=;
        b=Sr7U0TQjASjopEl37t4IJYyJD+TW5mSxY+2fu0BItg/tsM3alK382ZCbCLYEO2YANd
         CstrafRvDeNUHSbOBQAZFa8Qg76MfYcQVa9kkQC64JsOJCoSV/jUF1AzH6v6mjjNLJbQ
         8JgNs0iVDeJSrzXP3AKOAsGIRYnsXsJEw6mVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=r79cmgNDDidxXvaxTI5T8bA/u2eCAhe6oAZULslvRNg=;
        b=YMRKjqPveDvcU89ZtdkINpBVz1VhVyB1rk3jCzXDezfC4qzKcDHw3eEzajYIw0PkcW
         tYqOyxw82p/iBisP9vp8q+U6lvJYrDn52G5RcqRqbuVVxcO6isf4Q9+2EF8W2pFParwU
         kx+8khV4DcJ4fZTtVWT5jmPQGg7eMVE9eMaa7jbcfgZNpV53RSBM8nFDD1RxGf7BaniY
         Ixn8rEe+Au1LUqEkktgGsiBifLF5LlM/8dXiJxTFb3+CDAdCINBt7361JjLKq/q8A/ns
         ojsSak5N3N6BHN5Lxgf/yBsQot8OCpPNjYtwjrDU/TfiNv4kntBKrlCVlnAbCrIoLXvC
         tmjQ==
X-Gm-Message-State: AOAM5325Vu8V8Uj7JJVTQLK26F5sYpOTphFD1BI4jXMPSwQY+lnds8du
        ZTSXRN4vU6f3l4RlMvn0j5l8Z/hoNwfiluFdMk9cdA==
X-Google-Smtp-Source: ABdhPJwCMD1N9F/MFmV5OSnlhCcqSqYaz+by8eltnOy/usqsU4stZm11gxAv2Oo8qN6yrYQ84iAMPseV0RSShDJWq0Y=
X-Received: by 2002:aca:2310:: with SMTP id e16mr1581007oie.64.1631223013219;
 Thu, 09 Sep 2021 14:30:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Sep 2021 17:30:12 -0400
MIME-Version: 1.0
In-Reply-To: <20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid>
References: <20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 9 Sep 2021 17:30:12 -0400
Message-ID: <CAE-0n52kUS9cWh1oWOoAivYQ5TUu-mE2RPqjHZ=-QPN7Y=Y92g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add sc7180-trogdor-homestar
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-09-09 12:21:01)
> Homestar is a trogdor variant. The DT bits are essentially the same as
> in the downstream tree, except for:
>
> - skip -rev0 and rev1 which were early builds and have their issues,
>   it's not very useful to support them upstream
> - don't include the .dtsi for the MIPI cameras, which doesn't exist
>   upstream
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
