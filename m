Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5497D364F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 02:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbhDTANI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 20:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbhDTANH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 20:13:07 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C83C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 17:12:36 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u7so16867070plr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rt8J787jpJUi8pS/4rygI7oi39vcDhX8pZHJCQEjJ2g=;
        b=ETVqjHpaUwEnXm35E2Hbo0RWmN8d5hdAm5Lrd35VphxFcV3UEgEvQzE6CPlXstKI69
         rCrBzMbjQeQ4cqhWUnYYJ/CZyj7Wz0j3H5lzsXAcTN6PSJhnQKvqBscUMYU3rzJGbGHC
         VW9F38yHUjid7vtd8kqUX3i9Q/ArxYd2mcGVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rt8J787jpJUi8pS/4rygI7oi39vcDhX8pZHJCQEjJ2g=;
        b=s8h/LOZJ+p7/6NDyFoSeZf6X8yrRrURIa4Xl9NQXiuJxbLIusM4QbIxlxcF7QnpGDX
         HewmKuQGQGxjiRCr/q/GzImpZi6DvqiZYbK8U//xdxtnWTfTTHKkX4z0RhbL7x+Q7D6B
         B9EAj+f1gmUl5R4RTBHi2citdz+tzUIEc+UdKSCLcq3/19Eyi54niKsHsWd0GriHccFA
         OrtZTbg3aw+rsL6qoYhJkDZdNhamaU7eYtHoh+nD57goqFwdrX4uVvCZhz65thl8ZPH0
         I+iaeAbbnTdkHmRxuToMrJuEPJMgOFwKPXxePkgmFaDka72mEPOFd0Y7Us2F+hwvTPXS
         d87A==
X-Gm-Message-State: AOAM533g1fDvieRznBl/gLuthyG9RWekCdkvlFIXr/dw0nVSzW3PvJ9y
        Mt9hc/7NSExBapTw3bbFsBrhLA==
X-Google-Smtp-Source: ABdhPJzMuxY7Hv1k6MgV5MC92Qz8dG4hDGs5Ol3MQIrCEr5wWn36KvvbFhashY380CnjJvQojUiXWQ==
X-Received: by 2002:a17:90a:f3cf:: with SMTP id ha15mr1783461pjb.214.1618877555791;
        Mon, 19 Apr 2021 17:12:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7401:678f:e510:6700])
        by smtp.gmail.com with UTF8SMTPSA id w189sm12833295pfc.31.2021.04.19.17.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 17:12:35 -0700 (PDT)
Date:   Mon, 19 Apr 2021 17:12:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 5/5] usb: dwc3: qcom: Set genpd active wakeup flag for
 usb gdsc
Message-ID: <YH4ccqivriNnXzqq@google.com>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
 <1618567313-25373-6-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618567313-25373-6-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 16, 2021 at 03:31:53PM +0530, Sandeep Maheswaram wrote:

> Subject: usb: dwc3: qcom: Set genpd active wakeup flag for usb gdsc
>
> Set genpd active wakeup flag for usb gdsc if wakeup capable devices
> are connected so that wake up happens without reenumeration.

Better describe things are a higher level, rather than getting into
the details of how you achieve it. That's what the code is for.

e.g.:

Subject: usb: dwc3: qcom: Keep power domain on to support wakeup

If wakeup capable devices are connected to the controller (directly
or through hubs) at suspend time keep the power domain on in order
to support wakeup from these devices.
